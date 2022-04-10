package com.assistant.service.intf;

import com.assistant.model.dto.DataList;

import javax.servlet.http.HttpServletRequest;

public interface UserService {
    boolean insertPatient(String username, String password);

    DataList getActivityUser(HttpServletRequest request, String role);
}
