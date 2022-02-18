package com.assistant.controller;

import static com.assistant.constant.Role.*;

import com.assistant.service.intf.UserService;
import com.assistant.utils.TestClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Set;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/checkRole")
    @ResponseBody
    public Object checkRole() {
        return userService.checkRole();
    }

    @PostMapping("/signup.do")
    public String signupPatient(@RequestParam("username") String username, @RequestParam("password") String password) {
        boolean ans = userService.insertPatient(username, password);
        if(ans){
            return "signup_success";
        }
        return "signup_error";
    }

}
