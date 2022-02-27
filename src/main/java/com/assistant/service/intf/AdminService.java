package com.assistant.service.intf;

import com.assistant.model.dto.UserList;
import com.assistant.model.enity.Admin;
import com.assistant.model.enity.Doctor;
import com.assistant.model.enity.Patient;

import java.util.List;

public interface AdminService {
    List<Admin> findAll();
    String password(String username);
    UserList list(String listName);
}
