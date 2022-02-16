package com.assistant.service.impl;

import com.assistant.config.UserLevel;
import com.assistant.service.AdminService;
import com.assistant.service.DoctorService;
import com.assistant.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {
    @Autowired
    private AdminService adminService;
    @Autowired
    private DoctorService doctorService;

    @Override
    public String checkUser(String username, String password) {

        if (StringUtils.equals(doctorService.password(username), password)) {
            return UserLevel.DOCTOR;
        }
        if (StringUtils.equals(adminService.password(username), password)) {
            return UserLevel.ADMIIN;
        }

        return UserLevel.NEITHER;
    }


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        String password;

        password = doctorService.password(username);
        if (!StringUtils.isEmptyOrWhitespace(password)) {
            return new User(username, password, AuthorityUtils.commaSeparatedStringToAuthorityList(UserLevel.DOCTOR));
        }

        password = adminService.password(username);
        if (!StringUtils.isEmptyOrWhitespace(password)) {
            return new User(username, password, AuthorityUtils.commaSeparatedStringToAuthorityList(UserLevel.ADMIIN));
        }

        return null;
    }

}
