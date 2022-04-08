package com.assistant.model.enity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Patient {
    private String username;
    private String password;
    private String name;
    private String sex;
    private Integer age;
    private Integer phone;
    private Integer exception;
    private String msg;
}
