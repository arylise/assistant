package com.assistant.controller;

import com.assistant.pojo.Admin;
import com.assistant.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Admin> findAll() {
        return adminService.findAll();
    }

    @RequestMapping("/whoim")
    @ResponseBody
    public Object whoIm() {
        Set level =  AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        Iterator iter = level.iterator();
        while (iter.hasNext()) {
            return iter.next();
        }
        return null;
    }

}
