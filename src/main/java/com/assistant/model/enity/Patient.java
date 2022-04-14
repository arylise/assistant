package com.assistant.model.enity;

import com.alibaba.fastjson.annotation.JSONField;
import com.assistant.model.intf.AssistantUser;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Patient implements AssistantUser {
    private String username;
    @JSONField(serialize = false)
    private String password;
    private String name;
    private String sex;
    private Integer age;
    private Integer phone;
    private Integer exception;
    private String msg;
}
