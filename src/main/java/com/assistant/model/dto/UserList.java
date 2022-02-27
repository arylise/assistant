package com.assistant.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserList {
    private int code;
    private String msg;
    private long count;
    private List data;

    public  UserList(List list,long count){
        this.code = 0;
        this.msg = "";
        this.data = list;
        this.count = count;
    }

    public UserList(int code,String msg){
        this.code = code;
        this.msg = msg;
        this.data = null;
        this.count = 0;
    }
}
