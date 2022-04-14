package com.assistant.model.enity;

import com.alibaba.fastjson.annotation.JSONField;
import com.assistant.model.intf.AssistantUser;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Admin implements AssistantUser {
    private String username;
    @JSONField(serialize = false)
    private String password;
    private String name;
}
