package com.assistant.constant.enums;

import com.assistant.utils.enums.NameValueEnum;

public enum StrEnum implements NameValueEnum<Integer> {
    password(1,"password"),
    department(2,"department"),
    project(3,"project");

    private final Integer value;
    private final String name;

    StrEnum(int value,String name){
        this.value = value;
        this.name = name;
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public Integer getValue() {
        return this.value;
    }
}
