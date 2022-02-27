package com.assistant.service.impl;

import com.alibaba.fastjson.JSON;
import com.assistant.constant.Role;
import com.assistant.constant.StaticString;
import com.assistant.mapper.AdminMapper;
import com.assistant.model.dto.UserList;
import com.assistant.model.enity.Admin;
import com.assistant.model.enity.Department;
import com.assistant.model.enity.Doctor;
import com.assistant.model.enity.Patient;
import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.HospitalService;
import com.assistant.service.intf.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private PatientService patientService;

    @Autowired
    private HospitalService hospitalService;

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    @Override
    public String password(String username) {
        return adminMapper.password(username);
    }

    @Override
    public UserList list(String listName) {
        long count;
        List list;
        switch (listName.toUpperCase()) {
            case Role.DOCTOR -> {
                list = doctorService.selectAll();
                count = doctorService.count();
            }

            case Role.PATIENT -> {
                list = patientService.selectAll();
                count = patientService.count();
            }
            case StaticString.DEPARTMENT -> {
                list = hospitalService.departmentList();
                count = hospitalService.countDeps();
            }
            case StaticString.PROJECT -> {
                list = hospitalService.projectList();
                count = hospitalService.countPros();
            }
            default -> {
                return new UserList(-1, "");
            }
        }
        if (list != null) {
            return new UserList(list, count);
        }
        return new UserList(-2, "");
    }


}
