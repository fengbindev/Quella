package com.ssrs.core.manager;

import cn.hutool.crypto.digest.DigestUtil;
import com.ssrs.permission.model.Menu;
import com.ssrs.permission.model.User;
import com.ssrs.util.commom.LoggerUtils;
import org.apache.shiro.SecurityUtils;

import java.util.Iterator;
import java.util.List;

public class UserManager {

    /**
     * 加工用户密码
     * @param user
     * @return
     */
    public static User md5Pswd(User user){
        user.setPswd(md5Pwsd(user.getEmail(),user.getPswd()));
        return user;
    }

    /**
     * 字符串返回值
     * @param email
     * @param pswd
     * @return
     */
    public static String md5Pwsd(String email, String pswd) {
        pswd = String.format("%s#%s",email,pswd);
        pswd = DigestUtil.md5Hex(pswd);
        return pswd;
    }


    public static List<Menu> checkMenuPermission(List<Menu> menus) {
        LoggerUtils.debug(UserManager.class,"进行菜单权限过滤");
        Iterator<Menu> iterator = menus.iterator();
        while (iterator.hasNext()){
            Menu menu = iterator.next();
            if (menu.getPermission()!=null){
                //如果没有这个权限就移除
                if (!checkPermission(menu.getPermission().getUrl())){
                    iterator.remove();
                }
            }
            //如果有子菜单就递归
            if (menu.getChildren().size()>0){
                checkMenuPermission(menu.getChildren());
            }
        }
        return menus;
    }

    /**
     * 判断当前登录用户是否拥有这个权限
     * @param url
     * @return
     */
    private static boolean checkPermission(String url) {
        return  SecurityUtils.getSubject().isPermitted(url);
    }


}
