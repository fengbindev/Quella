package com.ssrs.util.code.enums;

import lombok.Getter;

import java.util.Date;


@Getter
public enum FieldType {
    String(1, String.class.getSimpleName()),
    Byte(2, Byte.class.getSimpleName()),
    Short(3, Short.class.getSimpleName()),
    Integer(4, Integer.class.getSimpleName()),
    Long(5, Long.class.getSimpleName()),
    Float(6, Float.class.getSimpleName()),
    Double(7, Double.class.getSimpleName()),
    Boolean(8, Boolean.class.getSimpleName()),
    Character(9, Character.class.getSimpleName()),
    Text(10, "Text"),
    Date(11, Date.class.getSimpleName());

    private Integer code;

    private String message;

    FieldType(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}


