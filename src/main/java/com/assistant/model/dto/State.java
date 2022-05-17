package com.assistant.model.dto;

public enum State {
    uncheck(50,"未检查"),
    checked(100,"已检查"),
    checking(0,"检查中"),
    onCall(25,"排队中");

    public final int weight;
    public final String desc;

    State(int weight,String desc) {
        this.weight = weight;
        this.desc = desc;
    }
}