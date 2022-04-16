package com.assistant.model.dto;
public enum State {
    uncheck(50),
    checked(100),
    checking(0),
    onCall(25);

    final int weight;

    State(int weight){
        this.weight = weight;
    }
}