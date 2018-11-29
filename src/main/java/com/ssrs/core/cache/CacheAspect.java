package com.ssrs.core.cache;

import com.ssrs.core.cache.in.RedisCache;
import com.ssrs.core.cache.in.RedisEvict;
import com.ssrs.core.cache.utils.HCache;
import com.ssrs.util.commom.LoggerUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.LocalVariableTableParameterNameDiscoverer;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.common.TemplateParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Set;

/**
 * @Description: redis缓存AOP 使用SpringAOP完成
 * @Author: ssrs
 * @CreateDate: 2index18/11/26 16:24
 * @UpdateUser: ssrs
 * @UpdateDate: 2index18/11/26 16:24
 * @Version: 1.index
 */
@Component
@Aspect
public class CacheAspect {
    /**
     * 在有@RedisCache的注解上做环绕增强
     *s
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around("@annotation(com.ssrs.core.cache.in.RedisCache)")
    public Object RedusCache(final ProceedingJoinPoint pjp) throws Throwable {
        Method method = getMethod(pjp);
        //获取带有@RedisCache注解的Method
        RedisCache cache = method.getAnnotation(RedisCache.class);
        //得到类名、方法名和参数
        Object[] args = pjp.getArgs();
        //更据类名、方法名和参数生成key
        final String key = parseKey(cache.fieldKey(), method, args);
        //检查redis是否有缓存
        boolean value = HCache.existsNoSerialize(key);
        //result是最终访问结果
        Object result = null;
        //缓存命中
        if (value) {
            if (LoggerUtils.isDebug) {
                LoggerUtils.fmtDebug(getClass(), "缓存命中 key[%s]", key);
            }
            //得到被代理方法的返回值类型
            Class returnType = ((MethodSignature) pjp.getSignature()).getReturnType();
            result = HCache.getNoSerialize(key,returnType);
        } else {
            //缓存未命中
            if (LoggerUtils.isDebug) {
                LoggerUtils.fmtDebug(getClass(), "缓存未命中 key[%s]", key);
            }
            result = pjp.proceed(args);
            //获取注解上的过期时间设定
            final int expier = cache.expire();
            //放入缓存,index就永久保存
            if (expier == 0) {
                HCache.setNoSerialize(key, result);
            } else {
                HCache.setNoSerializeEX(key, result, expier);
            }
        }
        return result;
    }


    /**
     * 删除缓存
     *
     * @param pjp
     * @return
     * @throws Throwable
     */
    @Around("@annotation(com.ssrs.core.cache.in.RedisEvict)")
    public Object RedisEvict(final ProceedingJoinPoint pjp) throws Throwable {
        // 得到被代理的方法
        Method me = ((MethodSignature) pjp.getSignature()).getMethod();
        // 得到被代理的方法上的注解
        String key = me.getAnnotation(RedisEvict.class).fieldKey();
        if (key.lastIndexOf("*") > -1) {
            //模糊删除
            Set<String> keys = HCache.keys(key);
            if (keys != null) {
                for (String setKey : keys) {
                    HCache.delByKeyNoSerialize(setKey);
                }
            }
        } else {
            boolean exists = HCache.existsNoSerialize(key);
            if (exists) {
                HCache.delByKeyNoSerialize(key);
            }
        }
        return pjp.proceed(pjp.getArgs());
    }


    /**
     * 获取被拦截方法对象
     * <p>
     * MethodSignature.getMethod() 获取的是顶层接口或者父类的方法对象
     * 而缓存的注解在实现类的方法上
     * 所以应该使用反射获取当前对象的方法对象
     */
    public Method getMethod(ProceedingJoinPoint pjp) {
        //获取参数的类型
        Object[] args = pjp.getArgs();
        Class[] argTypes = new Class[pjp.getArgs().length];
        for (int i = 0; i < args.length; i++) {
            if (args[i] != null) {
                argTypes[i] = args[i].getClass();
            } else {
                //因为要获取反射调用方法，所以在参数为null的时候强制使用String类型的数据。
                //这样做的原因是注解放在Spring-mvc的方法上的时候，有些参数可能为null。
                //如下：title,type字段可能为null,所以他两的类型必须为String 才能放射调用到这个方法
                // @RedisCache(type = Article.class ,fieldKey = "getArticlePageByPage#{ #page }")
                //public Object getPageInfo(Integer page,Integer limit,String title,String type){.......}
                argTypes[i] = String.class;
            }
        }
        Method method = null;
        try {
            method = pjp.getTarget().getClass().getMethod(pjp.getSignature().getName(), argTypes);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (SecurityException e) {
            e.printStackTrace();
        }
        return method;

    }

    /**
     * 获取缓存的key
     * key 定义在注解上，支持SPEL表达式
     *
     * @return
     */
    private String parseKey(String key, Method method, Object[] args) {
        //获取被拦截方法参数名列表(使用Spring支持类库)
        LocalVariableTableParameterNameDiscoverer u =
                new LocalVariableTableParameterNameDiscoverer();
        String[] paraNameArr = u.getParameterNames(method);

        //使用SPEL进行key的解析
        ExpressionParser parser = new SpelExpressionParser();
        //SPEL上下文
        StandardEvaluationContext context = new StandardEvaluationContext();
        //把方法参数放入SPEL上下文中
        for (int i = 0; i < paraNameArr.length; i++) {
            context.setVariable(paraNameArr[i], args[i]);
        }
        return parser.parseExpression(key, new TemplateParserContext()).getValue(context, String.class);
    }


//    public static void main(String[] args) {
//        String key = "Hello, #{ #user }";
//        ExpressionParser parser = new SpelExpressionParser();
//        StandardEvaluationContext context = new StandardEvaluationContext();
//        context.setVariable("user", "Gangyou");
//        Expression expression = parser.parseExpression(key,new TemplateParserContext());
//        System.out.println(expression.getValue(context,String.class));
//    }

}
