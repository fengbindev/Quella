package com.ssrs.core.timer;

import com.ssrs.core.timer.job.CleanSystemLogTask;
import com.ssrs.util.commom.SpringContextUtil;
import com.ssrs.util.commom.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class TaskUtils {
    public final static Logger log = LoggerFactory.getLogger(TaskUtils.class);

    /**
     * 通过反射调用scheduleJob中定义的方法
     *
     * @param scheduleJob
     */
    public static void invokMethod(ScheduleJob scheduleJob) {
        Object object = null;
        Class clazz = null;
        //springId不为空先按springId查找bean
        if (StringUtils.isNotBlank(scheduleJob.getSpringId())) {
            object = SpringContextUtil.getBean(scheduleJob.getSpringId());
        } else if (StringUtils.isNotBlank(scheduleJob.getBeanClass())) {
            try {
                //根据全类名获取class
                clazz = Class.forName(scheduleJob.getBeanClass());
                //更据类名构建默认的springId（类名首字母小写）
                String name = StringUtils.toLowerCaseFirstOne( clazz.getSimpleName());
                try {
                    object =  SpringContextUtil.getBean(name);
                }catch (Exception e){
                    //如果spring中没用这个bean就new 一个
                    if (object == null){
                        object = clazz.newInstance();
                    }
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
        if (object == null) {
            log.error("任务名称 = [" + scheduleJob.getJobName() + "]---------------未启动成功，请检查是否配置正确！！！");
            return;
        }
        clazz = object.getClass();
        Method method = null;
        try {
            method = clazz.getDeclaredMethod(scheduleJob.getMethodName());
        } catch (NoSuchMethodException e) {
            log.error("任务名称 = [" + scheduleJob.getJobName() + "]---------------未启动成功，方法名设置错误！！！");
        } catch (SecurityException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (method != null) {
            try {
                method.invoke(object);
            } catch (IllegalAccessException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }
}
