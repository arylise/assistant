package com.assistant.service.impl;

import com.assistant.constant.StaticString;
import com.assistant.mapper.AdminMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.enity.Admin;
import com.assistant.service.intf.*;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private MapNodeService mapNodeService;

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    @Override
    public String password(String username) {
        return adminMapper.password(username);
    }

    @Override
    public DataList list(String listName) {
        long count;
        List list;
        switch (listName) {
            case StaticString.DOCTOR -> {
                list = doctorService.selectAll();
                count = doctorService.count();
            }
            case StaticString.PATIENT -> {
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
            case StaticString.MAP_NODE -> {
                list = mapNodeService.findAll();
                count = mapNodeService.count();
            }
            default -> {
                return new DataList(-1, "");
            }
        }
        if (list != null) {
            return new DataList(list, count);
        }
        return new DataList(-2, "");
    }


}
