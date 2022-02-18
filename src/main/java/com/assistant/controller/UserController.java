package com.assistant.controller;

import static com.assistant.constant.Role.*;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/checkRole")
    @ResponseBody
    public Object checkRole() {
        Set roles =  AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for(Object o : roles){
            if(ALL_ROLES.contains(o)){
                return o;
            }
        }
        return "null";
    }
//   TODO 继续完成注册
//    @PostMapping("/signup")
//    public String signupPatient(HttpServletRequest request, HttpServletResponse response){
//        request.getContextPath();
//    }

}
