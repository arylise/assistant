package com.assistant.controller;

import com.assistant.pojo.Admin;
import com.assistant.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("findAll")
    @ResponseBody
    public List<Admin> findAll() {
        return adminService.findAll();
    }


}
