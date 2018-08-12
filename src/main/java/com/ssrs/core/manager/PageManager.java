package com.ssrs.core.manager;

import com.baomidou.mybatisplus.plugins.Page;

import java.util.HashMap;
import java.util.Map;
/**
* @Description:    分页构建Manager
* @Author:         ssrs
* @CreateDate:     2018/8/10 14:01
* @UpdateUser:     ssrs
* @UpdateDate:     2018/8/10 14:01
* @Version:        1.0
*/
public class PageManager {

    private static final String CODE = "code";
    private static final String MSG = "msg";
    private static final String COUNT = "count";
    private static final String DATA = "data";

    public static Map<String,Object> buildPage(Page page) {
        Map<String,Object> map = new HashMap<>(16);
        map.put(PageManager.CODE,0);
        map.put(PageManager.MSG,"");
        map.put(PageManager.COUNT,page.getTotal());
        map.put(PageManager.DATA,page.getRecords());
        return map;
    }
}
