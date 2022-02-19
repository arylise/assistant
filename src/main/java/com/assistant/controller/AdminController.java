package com.assistant.controller;

import com.assistant.model.enity.Admin;
import com.assistant.service.intf.AdminService;
import com.assistant.utils.TestClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
    @PreAuthorize("hasRole('ROLE_ADMIN')")
//    @ResponseBody
    public String adminDoctorManage(){
        return "/admin/doctor_manage.html";
    }
}
