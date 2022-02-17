package com.assistant.controller;

import com.assistant.temp.TestClass;
import org.springframework.security.core.GrantedAuthority;
import static com.assistant.config.Role.*;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Iterator;
import java.util.List;
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
        return null;
    }
//
//    @RequestMapping("/logout")
//    @ResponseBody
//    public String logout() {
//        TestClass.showMe("goodbye");
//        return "logout";
//    }
}
