package com.assistant.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserList<T> {
    private int code;
    private String msg;
    private long count;
    private List<T> data;
}
