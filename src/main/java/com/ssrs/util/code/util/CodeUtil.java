package com.ssrs.util.code.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

/**
* @Description:    代码拼接工具
* @Author:          ssrs
* @CreateDate:     2018/12/22 19:45
* @UpdateUser:     ssrs
* @UpdateDate:     2018/12/22 19:45
* @Version:        1.0
*/
public class CodeUtil {
    private static StringBuilder builder;
    private static Set<String> imports;
    private static Set<String> javaxImports;
    private static Set<String> javaImports;
    private static Set<String> importAll;
    public static String lineBreak = System.getProperty("line.separator");
    public static String packageName;

    /**
     * 创建一个StringBuilder对象
     */
    public static void create(){
        builder = new StringBuilder();
        imports = new TreeSet<>();
        javaxImports = new TreeSet<>();
        javaImports = new TreeSet<>();
        importAll = new TreeSet<>();
    }

    /**
     * 设置包路径
     */
    public static void setPackageName(String packageName){
        CodeUtil.packageName = packageName;
    }

    /**
     * 向后添加代码
     */
    public static StringBuilder append(String code){
        return builder.append(code);
    }

    /**
     * 向后添加代码
     */
    public static StringBuilder br(){
        return builder.append(lineBreak);
    }

    /**
     * 添加一行代码
     * @param code 代码
     */
    public static StringBuilder line(String code){
        return builder.append(code).append(";").append(lineBreak);
    }

    /**
     * 添加一行代码，不加分号
     * @param code 代码
     */
    public static StringBuilder lineNo(String code){
        return builder.append(code).append(lineBreak);
    }

    /**
     * 添加一行包含制表符代码
     * @param len 添加对个换行符
     * @param code 代码
     */
    public static StringBuilder tabLine(int len, String code){
        for (int i = 0; i < len; i++) { builder.append("\t"); }
        return builder.append(code).append(";").append(lineBreak);
    }

    /**
     * 添加一行包含制表符代码，不加分号
     * @param len 添加对个换行符
     * @param code 代码
     */
    public static StringBuilder tabLineNo(int len, String code){
        for (int i = 0; i < len; i++) { builder.append("\t"); }
        return builder.append(code).append(lineBreak);
    }

    /**
     * 添加一个类代码
     * @param clazz 类
     */
    public static String clazz(Class<?> clazz){
        importLine(clazz);
        return clazz.getSimpleName();
    }

    /**
     * 添加一个注解类代码
     * @param clazz 类
     */
    public static String anno(Class<?> clazz){
        importLine(clazz);
        return "@" + clazz.getSimpleName();
    }

    /**
     * 添加一个注解类代码，且换行
     * @param clazz 类
     */
    public static StringBuilder annoBr(Class<?> clazz){
        builder.append("@").append(clazz.getSimpleName()).append(lineBreak);
        importLine(clazz);
        return builder;
    }

    /**
     * 添加一行包含import代码
     * @param clazz 类
     */
    public static void importLine(Class<?> clazz){
        importLine(clazz.getName());
    }

    /**
     * 添加一行包含import代码
     * @param className 类名称
     */
    public static void importLine(String className){
        String packages = className.substring(0, className.lastIndexOf("."));
        if(importAll.contains(packages)){
            className = packages + ".*";
        }
        if (className.startsWith("java."))
            javaImports.add("import " + className + ";" + lineBreak);
        else if(className.startsWith("javax."))
            javaxImports.add("import " + className + ";" + lineBreak);
        else
            imports.add("import " + className + ";" + lineBreak);
    }

    /**
     * 添加一个包下的全部类
     * @param packages 包名
     */
    public static void addImportAll(String packages){
        importAll.add(packages);
    }

    /**
     * 导入全部包代码
     */
    private static void importPackage(){
        StringBuilder packages = new StringBuilder();
        packages.append(packageName);
        packages.append(lineBreak);
        packages.append(lineBreak);
        imports.forEach(packages::append);
        packages.append(lineBreak);
        javaxImports.forEach(packages::append);
        javaImports.forEach(packages::append);
        packages.append(lineBreak);
        imports = javaxImports = javaImports = importAll = null;
        builder.insert(0, packages);
    }

    /**
     * 提取全部代码，并清空StringBuilder对象
     */
    public static String save(){
        CodeUtil.importPackage();
        String code = builder.toString();
        builder = null;
        return code;
    }

    /**
     * 将枚举转成List集合
     * @param enumClass 枚举类
     */
    public static Map<Long, String> enumToMap(Class<?> enumClass){
        Map<Long, String> map = new TreeMap<>();
        try {
            Object[] objects = enumClass.getEnumConstants();
            Method getCode = enumClass.getMethod("getCode");
            Method getMessage = enumClass.getMethod("getMessage");
            for (Object obj : objects) {
                Object iCode = getCode.invoke(obj);
                Object iMessage = getMessage.invoke(obj);
                map.put(Long.valueOf(String.valueOf(iCode)), String.valueOf(iMessage));
            }
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException ignored) {
        }
        return map;
    }
    /**
     * 将枚举转成List集合
     * @param enumClass 枚举类
     */
    public static Map<String, Long> enumToMapFX(Class<?> enumClass){
        Map<String, Long> map = new TreeMap<>();
        try {
            Object[] objects = enumClass.getEnumConstants();
            Method getCode = enumClass.getMethod("getCode");
            Method getMessage = enumClass.getMethod("getMessage");
            for (Object obj : objects) {
                Object iCode = getCode.invoke(obj);
                Object iMessage = getMessage.invoke(obj);
                map.put(String.valueOf(iMessage), Long.valueOf(String.valueOf(iCode)));
            }
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException ignored) {
        }
        return map;
    }

    /**
     * 根据枚举code获取枚举对象
     * @param enumClass 枚举类
     * @param code code值
     */
    public static Object enumCode(Class<?> enumClass, Object code){
        try {
            Object[] objects = enumClass.getEnumConstants();
            Method getCode = enumClass.getMethod("getCode");
            for (Object obj : objects) {
                Object iCode = getCode.invoke(obj);
                if(iCode.equals(code)){
                    return obj;
                }
            }
        } catch (NoSuchMethodException | IllegalAccessException | InvocationTargetException e) {
        }
        return "";
    }
}
