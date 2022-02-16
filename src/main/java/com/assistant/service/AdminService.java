package com.assistant.service;

import com.assistant.pojo.Admin;

import java.util.List;

public interface AdminService {
    List<Admin> findAll();
    String password(String username);
}
