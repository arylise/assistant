package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.service.intf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.assistant.constant.Role.*;

import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String voidRequest() {
        return "index";
    }

    @RequestMapping("/test")
    public String test() {
        return "test";
    }

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping("/main")
    public String main() {
        String role = userService.checkRole();
        Iterator<String> i = ALL_ROLES.iterator();
        while (i.hasNext()){
            if(StringUtils.equals(i.next(),role)){
                return role.toLowerCase().substring(5,role.length())+"/main";
            }
        }
        return null;
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/signup")
    public String signup() {
        return "signup";
    }

    @RequestMapping("/loginError")
    public String loginError() {
        return "loginError";
    }

    @RequestMapping("/doctor_manage")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String adminDoctorManage(){
        return "/admin/doctor_manage";
    }
}
