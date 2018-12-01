package com.ssrs.service.impl;

import cc.openkit.common.KitUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.UserManager;
import com.ssrs.model.Sign;
import com.ssrs.mapper.SignMapper;
import com.ssrs.model.WebSetting;
import com.ssrs.service.ISignService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.service.IWebSettingService;
import com.ssrs.util.sign.SignUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-21
 */
@Service("signService")
public class SignServiceImpl extends ServiceImpl<SignMapper, Sign> implements ISignService {
    /**
     * 发送验证码的时候的验证码，我们需要按照手机号码查找最细的8条的内容
     *
     * 1. 同一个手机号码 1 分钟只能发 1 条
     * 2. 同一个手机号码 1 小时只能发 4 条
     * 2. 同一个手机号码 24 小时只能发 8 条
     *
     * 如果想自己设置，可以在 SignUtil 中自己修改常量
     *
     * @param phone
     * @return
     */
    @Autowired
    private IWebSettingService webSettingService;

    public Map<String, Object> isOk(String phone) {

        // 根据手机号码 按照时间倒叙排序，找到这个手机号码最后发的 8 条短信
        List<Sign> signList = baseMapper.selectPage(new Page<>(0,SignUtil.SIGN_ONE_DAY_SIZE),new EntityWrapper<Sign>().orderBy("sign_time",false));
        // 如果大于 1分钟内容只能发的 条数，比较，当前时间 和 第
        if(signList.size()>=SignUtil.SIGN_ONE_MIN_SIZE){
            // 获取差
            int i = KitUtil.timeDifference(signList.get(SignUtil.SIGN_ONE_MIN_SIZE - 1).getSignTime(), new Date(), 1);
            if (i<60){
                return KitUtil.returnMap("101","1分钟最多只能发送"+SignUtil.SIGN_ONE_MIN_SIZE+"条");
            }
        }
        // 比较小时
        if(signList.size()>=SignUtil.SIGN_ONE_HOUR_SIZE){
            // 获取差
            int i = KitUtil.timeDifference(signList.get(SignUtil.SIGN_ONE_HOUR_SIZE - 1).getSignTime(), new Date(), 2);
            if (i<60){
                return KitUtil.returnMap("101","1小时最多只能发送"+SignUtil.SIGN_ONE_HOUR_SIZE+"条");
            }
        }
        // 比较天
        if(signList.size()>=SignUtil.SIGN_ONE_DAY_SIZE){
            // 获取差
            int i = KitUtil.timeDifference(signList.get(SignUtil.SIGN_ONE_DAY_SIZE - 1).getSignTime(), new Date(), 3);
            if (i<24){
                return KitUtil.returnMap("101","24小时最多只能发送"+SignUtil.SIGN_ONE_DAY_SIZE+"条");
            }
        }

        return KitUtil.returnMap("200","");
    }

    /**
     * 这里是验证码验证
     * @param phone 手机号码
     * @param kst 验证码唯一token
     * @param code 验证码
     * @return
     */

    public Map<String, Object> isSignOk(String phone,String kst,String code){
        Map<String, Object> map = new HashMap<String, Object>();
        // 判断非空
        Map<String, Object> isNullMap = new HashMap<String, Object>();
        isNullMap.put("phone",phone);
        isNullMap.put("kst",kst);
        isNullMap.put("code",code);

        map = KitUtil.isNull(isNullMap);

        if("300".equals(map.get("code"))){
            map.remove("code");
            map.put("code","101");
            return map;
        }

        //查询验证码
        List<Sign> signList = baseMapper.selectList(new EntityWrapper<Sign>().eq("sign_id",kst).eq("sign_phone",phone).eq("sign_code",UserManager.md5Pwsd("ssrs",String.valueOf(code))));
        if(signList.size()==0){
            return KitUtil.returnMap("101","验证码无效");
        }
        Sign s = signList.get(0);
        // 判断是否失效
        if(s.getSignType()!=1){
            return KitUtil.returnMap("101","验证码失效");
        }
        // 获取验证码有效时间
        int mins = KitUtil.timeDifference(s.getSignTime(), new Date(),2);
        WebSetting webSetting = webSettingService.selectById(1);
        Integer signActiceTime = Optional.ofNullable(webSetting.getSignActiveTime()).orElse(SignUtil.SIGN_ACTICE_TIME);
        if(mins > signActiceTime){
            return KitUtil.returnMap("101","验证码已超时");
        }
        //设置为已被使用
        s.setSignType(2);
        baseMapper.updateById(s);
        return KitUtil.returnMap("200","");
    }
}
