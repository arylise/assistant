package com.assistant.controller;

import com.alibaba.fastjson.JSON;
import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.UserService;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {

    private final AdminService adminService;
    private final UserService userService;

    @RequestMapping("/list_{name}")
    @ResponseBody
    public String list(@PathVariable String name,
                       @RequestParam(value = "page", defaultValue = "1") int page,
                       @RequestParam(value = "limit", defaultValue = "20") int limit) {
        PageHelper.startPage(page, limit);
        return JSON.toJSONString(adminService.findList(name));
    }

    @RequestMapping("/delete_doctor")
    public boolean deleteDoctor() {
        return false;
    }

    @RequestMapping("/nodes_{level}")
    @ResponseBody
    public String nodesByLevel(@PathVariable String level) {
        return adminService.getMapNodesByLevel(Integer.parseInt(level));
    }

    @RequestMapping("/getActivity_{role}")
    @ResponseBody
    public String getActivityPatient(HttpServletRequest request,
                                     @PathVariable String role,
                                     @RequestParam(value = "page", defaultValue = "1") int page,
                                     @RequestParam(value = "limit", defaultValue = "20") int limit) {
        PageHelper.startPage(page, limit);
        return JSON.toJSONString(userService.getActivityUser(request, role));
    }
}
