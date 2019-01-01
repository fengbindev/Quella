package com.ssrs.util.code.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Field {
    private String name;
    private String title;
    private int type;
    private int query;
    private boolean show;
    private List<Integer> verify = new ArrayList<>();

    public Field() {
    }

    public Field(String name, String title, int type, int query, boolean show, List<Integer> verify) {
        this.name = name;
        this.title = title;
        this.type = type;
        this.query = query;
        this.show = show;
        this.verify = verify;
    }
}
