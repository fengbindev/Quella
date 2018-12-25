package com.ssrs.util.code.domain;

import lombok.Data;

import java.util.List;


@Data
public class Generate {
    private Basic basic;
    private List<Field> fields;
    private Template template;
}
