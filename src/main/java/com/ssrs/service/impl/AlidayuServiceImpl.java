package com.ssrs.service.impl;

import cc.openkit.kitMessage.alidayu.model.AliDayuModel;
import cc.openkit.kitMessage.alidayu.service.AliDayuService;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.ssrs.model.Alidayu;
import com.ssrs.mapper.AlidayuMapper;
import com.ssrs.service.IAlidayuService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.util.commom.LoggerUtils;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author ssrs
 * @since 2018-08-21
 */
@Service("alidayuService")
public class AlidayuServiceImpl extends ServiceImpl<AlidayuMapper, Alidayu> implements IAlidayuService {

    @Override
    public Map<String, Object> send(String phone, String code) {
        //取出后台阿里大鱼的配置项
        Alidayu alidayu = baseMapper.selectById(1);
        if (alidayu == null) {
            return null;
        }
        Map<String, Object> map = new HashMap<String, Object>(16);
        AliDayuModel aliDayuModel = new AliDayuModel();
        aliDayuModel.setAccessKeyId(alidayu.getKeyId());
        aliDayuModel.setAccessKeySecret(alidayu.getKeySecret());
        aliDayuModel.setPhone(phone);
        aliDayuModel.setSignName(alidayu.getSignName());
        aliDayuModel.setTemplateCode(alidayu.getTemplate());

        // 拼接code
        String[] as = code.split(",");
        StringBuilder code2 = new StringBuilder("{");
        for (int i = 0; i < as.length; i++) {
            i = i + 1;
            code2.append("\"").append(as[i-1]).append("\":").append(as[i]);
            if (i == as.length - 1) {
                code2.append("}");
            } else {
                code2.append(",");
            }
        }
        aliDayuModel.setTemplateParam(code2.toString());
        try {
            SendSmsResponse xin = AliDayuService.xin(aliDayuModel);

            map.put("status", "OK".equals(xin.getCode()) ? "200" : "101");
            map.put("message", "OK".equals(xin.getCode()) ? "短信发送成功" : xin.getMessage());
            System.out.println(xin.getCode());
        } catch (ClientException e) {
            e.printStackTrace();
            LoggerUtils.fmtError(getClass(), "短信发送失败![%s]", code2);
        } catch (InterruptedException e) {
            e.printStackTrace();
            LoggerUtils.fmtError(getClass(), "短信发送失败![%s]", code2);
        }

        return map;
    }
}
