package com.ssrs.util.result;

import com.ssrs.util.commom.HttpServletUtil;

/**
* @Description:    封装URL地址，自动添加应用上下文路径
* @Author:          ssrs
* @CreateDate:     2018/12/22 19:29
* @UpdateUser:     ssrs
* @UpdateDate:     2018/12/22 19:29
* @Version:        1.0
*/
public class URL {
    private String url;
    public URL(){ }

    /**
     * 封装URL地址，自动添加应用上下文路径
     * @param url URL地址
     */
    public URL(String url){
        this.url = HttpServletUtil.getRequest().getContextPath() + url;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
