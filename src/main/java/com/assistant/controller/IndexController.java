package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.service.intf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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

    @RequestMapping(value={"/index","/login","/signup","/login_error"})
    public String index(HttpServletRequest request) {
        return request.getRequestURI();
    }

    @RequestMapping("/main")
    public String main() {
        String role = userService.checkRole();
        for (String allRole : ALL_ROLES) {
            if (StringUtils.equals(allRole, role)) {
                return role.toLowerCase().substring(5, role.length()) + "/main";
            }
        }
        return null;
    }
}
