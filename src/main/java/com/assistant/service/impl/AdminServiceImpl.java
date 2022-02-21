package com.assistant.service.impl;

import com.alibaba.fastjson.JSON;
import com.assistant.mapper.AdminMapper;
import com.assistant.model.dto.UserList;
import com.assistant.model.enity.Admin;
import com.assistant.model.enity.Doctor;
import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private DoctorService doctorService;

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    @Override
    public String password(String username) {
        return adminMapper.password(username);
    }

    @Override
    public String doctorList(int page, int limit) {
        PageHelper.startPage(page,limit);
        List<Doctor> doctors = doctorService.selectAllDocs();
        UserList<Doctor> doctorList = new UserList<>();
        doctorList.setData(doctors);
        doctorList.setCode(0);
        doctorList.setCount(doctorService.count());
        return JSON.toJSONString(doctorList);
    }


}
