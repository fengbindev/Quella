package com.ssrs.util.commom;

import java.util.HashMap;
import java.util.Map;
/**
* @Description:    整个程序中的帮助类
* @Author:         ssrs
* @CreateDate:     2018/8/9 21:54
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/9 21:54
* @Version:        1.0
*/
public class APPUtil {

    public static String RESULT_STATUS = "status";
    public static Integer RESULT_OK = 200;
    public static Integer RESULT_ERROR = 101;

    public static int INSERT_SUCCESS_TYPE = 1;
    public static int INSERT_ERROR_TYPE = 2;
    public static int UPDATE_SUCCESS_TYPE = 3;
    public static int UPDATE_ERROR_TYPE = 4;
    public static int DELEATE_SUCCESS_TYPE = 5;
    public static int DELEATE_ERROR_TYPE = 6;

    public static String RESULT_MESSAGE = "message";
    public static String INSERT_SUCCESS = "添加成功";
    public static String INSERT_FILE = "添加失败，请重试！";
    public static String UPDATE_SUCCESS = "修改成功";
    public static String UPDATE_FILE = "修改失败，请重试！";
    public static String DELEATE_SUCCESS = "删除成功";
    public static String DELEATE_FILE = "删除失败，请重试！";



    public static Map<String ,Object> resultMap(String key,Object value) {
        Map<String ,Object> map = new HashMap<>(16);
        map.put(key,value);
        return map;
    }

    /**
     * 通过所设置的类型来获得对应返回值
     * @param type
     * @return
     */
    public static Map<String,Object> resultMapType(int type){
        return DateResultFactory.resultMapType(type);
    }

}

/**
* @Description:    使用简单工程模式创建contorller需要的数据
* @Author:         ssrs
* @CreateDate:     2018/8/9 17:50
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/9 17:50
* @Version:        1.0
*/
class DateResultFactory{

    public static Map<String,Object> resultMapType(int type){
        Map<String,Object> map = new HashMap<>(16);
        switch (type){
            case 1:{map.put(APPUtil.RESULT_STATUS,APPUtil.RESULT_OK);map.put(APPUtil.RESULT_MESSAGE,APPUtil.INSERT_SUCCESS);}break;
            case 2:{map.put(APPUtil.RESULT_STATUS,APPUtil.RESULT_ERROR);map.put(APPUtil.RESULT_MESSAGE,APPUtil.INSERT_FILE);}break;
            case 3:{map.put(APPUtil.RESULT_STATUS,APPUtil.RESULT_OK);map.put(APPUtil.RESULT_MESSAGE,APPUtil.UPDATE_SUCCESS);}break;
            case 4:{map.put(APPUtil.RESULT_STATUS,APPUtil.RESULT_ERROR);map.put(APPUtil.RESULT_MESSAGE,APPUtil.UPDATE_FILE);}break;
            case 5:{map.put(APPUtil.RESULT_STATUS,APPUtil.RESULT_OK);map.put(APPUtil.RESULT_MESSAGE,APPUtil.DELEATE_SUCCESS);}break;
            case 6:{map.put(APPUtil.RESULT_STATUS,APPUtil.RESULT_ERROR);map.put(APPUtil.RESULT_MESSAGE,APPUtil.DELEATE_FILE);}break;
            default:;
        }
        return map;
    }

}
