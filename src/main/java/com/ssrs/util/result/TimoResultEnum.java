package com.ssrs.util.result;

import lombok.Getter;

@Getter
public enum TimoResultEnum {

    SUCCESS(200, "成功"),
    ERROR(400, "错误");

    private Integer code;

    private String message;

    TimoResultEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
