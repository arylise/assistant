package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.service.intf.AdminService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/page")
    public String manageDoctor(@RequestParam("to") String role) {
        return "/admin/page_" + role + ".html";
    }

    @RequestMapping("/list")
    @ResponseBody
    public String list(@RequestParam("name") String name,
                       @RequestParam(value = "page", defaultValue = "1") int page,
                       @RequestParam(value = "limit", defaultValue = "20") int limit) {
        PageHelper.startPage(page, limit);
        return JSON.toJSONString(adminService.list(name));
    }

    @RequestMapping("/delete_doctor")
    public boolean deleteDoctor() {
        return false;
    }
}
