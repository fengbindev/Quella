package com.ssrs.util.result;

import lombok.Data;

@Data
public class ResultVo<T>  {
    // 状态码
    private Integer code;
    // 提示信息
    private String msg;
    // 响应数据
    private T data;
}
