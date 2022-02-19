package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.service.intf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.assistant.constant.Role.*;

import java.util.Iterator;

@Controller
public class IndexController {
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String voidRequest() {
        return "index";
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

    @RequestMapping("/login_error")
    public String loginError() {
        return "login_error";
    }


}
