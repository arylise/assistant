package com.assistant.model.enity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Doctor implements Serializable {
    private String username;
    private String password;
    private String name;
    private String department;
    private String sex;
    private int age;
    private int phone;
    private String msg;
}
