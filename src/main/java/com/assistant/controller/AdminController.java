package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.model.dto.UserList;
import com.assistant.model.enity.Admin;
import com.assistant.model.enity.Doctor;
import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.assistant.utils.TestClass;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
    @Autowired
    private AdminService adminService;


    @RequestMapping("/findAll")
    @ResponseBody
    public List<Admin> findAll() {
        return adminService.findAll();
    }


    @RequestMapping("/doctor_manage")
    public String adminDoctorManage() {
        return "/admin/doctor_manage.html";
    }

    @RequestMapping("/doctor_list")
    @ResponseBody
    public String doctorList(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "20") int limit) {
//        TestClass.showMe("" + page + limit);
        return adminService.doctorList(page, limit);
    }
}
