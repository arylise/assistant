package com.assistant.service.intf;

import com.assistant.model.enity.Admin;

import java.util.List;

public interface AdminService {
    List<Admin> findAll();
    String password(String username);
    String doctorList(int page,int limit);
}
