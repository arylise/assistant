package com.assistant.service.impl;

import com.assistant.mapper.AdminMapper;
import com.assistant.model.enity.Admin;
import com.assistant.service.intf.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    @Override
    public String password(String username) {
        return adminMapper.password(username);
    }
}
