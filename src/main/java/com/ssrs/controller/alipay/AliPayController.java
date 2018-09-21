package com.ssrs.controller.alipay;

import com.ssrs.core.config.Alipay;
import com.ssrs.model.PaySettingAlipay;
import com.ssrs.model.Trade;
import com.ssrs.service.AlipayService;
import com.ssrs.service.IPaySettingAlipayService;
import com.ssrs.service.TradeService;
import com.ssrs.util.alipay.AliPayStatusEnum;
import com.ssrs.util.alipay.AlipayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * @author zhengjie
 * @date 2018/07/27 13:41:41
 */
@RestController
@RequestMapping("/aliPay")
public class AliPayController {

//    Alipay alipay;

    AlipayUtils alipayUtils;

    @Autowired
    private AlipayService alipayService;

    @Autowired
    private TradeService tradeService;

    @Autowired
    private IPaySettingAlipayService paySettingAlipayService;

    /**
     * PC网页支付
     * @param trade
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "toPayAsPC",method = RequestMethod.POST)
    public ResponseEntity toPayAsPC(@RequestBody Trade trade) throws Exception{
        PaySettingAlipay paySettingAlipay = paySettingAlipayService.selectById(1);
        trade.setOutTradeNo(alipayUtils.getOrderCode());
        Map map = alipayService.toPayAsPC(paySettingAlipay,trade);
        tradeService.createTrade(trade,map);
        return new ResponseEntity(map,HttpStatus.OK);
    }

    /**
     * 手机网页支付
     * @param trade
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "toPayAsWeb",method = RequestMethod.POST)
    public ResponseEntity toPayAsWeb(@RequestBody Trade trade) throws Exception{
        trade.setOutTradeNo(alipayUtils.getOrderCode());
        PaySettingAlipay paySettingAlipay = paySettingAlipayService.selectById(1);
        Map map = alipayService.toPayAsWeb(paySettingAlipay,trade);
        tradeService.createTrade(trade,map);
        return new ResponseEntity(map,HttpStatus.OK);
    }

    /**
     * 支付成功后跳转的url
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/return",method = RequestMethod.GET)
    public ModelAndView returnPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        PaySettingAlipay paySettingAlipay = paySettingAlipayService.selectById(1);
        response.setContentType("text/html;charset=utf-8");
        //内容验签，防止黑客篡改参数
        if(alipayUtils.rsaCheck(request,paySettingAlipay)){
            //商户订单号
            String outTradeNo = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String tradeNo = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
            System.out.println("商户订单号"+outTradeNo+"  "+"第三方交易号"+tradeNo);
            Trade trade = tradeService.findByOutTradeNo(outTradeNo);
            trade.setTradeNo(tradeNo);
            tradeService.updateTrade(trade);
            /**
             * 成功
             */
            return new ModelAndView("");
        }else{
            /**
             * 失败
             */
            return new ModelAndView("");
        }
    }

    /**
     * 支付异步通知(要公网访问)
     * 接收异步通知，检查通知内容app_id、out_trade_no、total_amount是否与请求中的一致
     * 根据trade_status进行后续业务处理
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/notify")
    public String notify(HttpServletRequest request) throws Exception{
        PaySettingAlipay paySettingAlipay = paySettingAlipayService.selectById(1);
        Map<String, String[]> parameterMap = request.getParameterMap();
        StringBuilder notifyBuild = new StringBuilder("/****************************** alipay notify ******************************/\n");
        parameterMap.forEach((key, value) -> notifyBuild.append(key + "=" + value[0] + "\n") );
        //内容验签，防止黑客篡改参数
        if (alipayUtils.rsaCheck(request,paySettingAlipay)) {
            //交易状态
            String tradeStatus = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
            // 商户订单号
            String outTradeNo = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //支付宝交易号
            String tradeNo = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
            //付款金额
            String totalAmount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
            if(tradeStatus.equals(AliPayStatusEnum.SUCCESS.getValue())||tradeStatus.equals(AliPayStatusEnum.FINISHED.getValue())){
                Trade trade = tradeService.findByOutTradeNo(outTradeNo);
                if(trade.check(totalAmount)){
                    trade.setState("已付款");
                    tradeService.updateTrade(trade);
                }
            }
            return "success";
        }
        return "fail";
    }
}
