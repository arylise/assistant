package com.assistant.model.enity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Doctor extends AssistantUser {
    private String username;
    private String password;
    private String name;
    private String department;
    private String sex;
    private Integer age;
    private Integer phone;
    private String msg;
}
