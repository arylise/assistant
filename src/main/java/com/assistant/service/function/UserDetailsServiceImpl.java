package com.assistant.service.function;

import static com.assistant.constant.Role.*;
import static com.assistant.constant.StaticString.*;

import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.PatientService;
import com.assistant.service.intf.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;


import java.util.*;

@Service
public class UserDetailsServiceImpl implements UserDetailsService, UserService {
    @Autowired
    private AdminService adminService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private PatientService patientService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {
            Map<String, String> map = checkUsername(username);
            if (map.isEmpty()) {
                throw new UsernameNotFoundException("用户名或密码错误！");
            }

            return new User(username, map.get(PASSWORD),
                    new ArrayList<>() {{
                        add(new SimpleGrantedAuthority(map.get(ROLE)));
                    }}
            );

        } catch (UsernameNotFoundException e) {
            throw e;
        }
    }

    /***
     * 检查用户名是否被占用
     * @param username 用户名
     * @return 未被占用，返回空map，已被占用，返回password和role
     */
    public Map<String, String> checkUsername(String username) {
        String password;
        Map<String, String> map = new HashMap<>();

        password = patientService.password(username);
        if (!StringUtils.isEmptyOrWhitespace(password)) {
            map.put(PASSWORD, password);
            map.put(ROLE, ROLE_PATIENT);
            return map;
        }
        password = doctorService.password(username);
        if (!StringUtils.isEmptyOrWhitespace(password)) {
            map.put(PASSWORD, password);
            map.put(ROLE, ROLE_DOCTOR);
            return map;
        }
        password = adminService.password(username);
        if (!StringUtils.isEmptyOrWhitespace(password)) {
            map.put(PASSWORD, password);
            map.put(ROLE, ROLE_ADMIIN);
            return map;
        }
        return map;
    }

    @Override
    public String checkRole() {
        Set roles = AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (Object o : roles) {
            if (ALL_ROLES.contains(o)) {
                return (String) o;
            }
        }
        return null;
    }

    @Override
    public boolean insertPatient(String username, String password) {
        Map<String, String> map = checkUsername(username);
        if (map.isEmpty()) {
            boolean ans = patientService.insertFast(username, password);
            if (ans) {
                return true;
                // TODO 实现注册后立即登录
//                UserDetails user = new User(username, password,
//                        new ArrayList<>() {{
//                            add(new SimpleGrantedAuthority(ROLE_PATIENT));
//                        }}
//                );
//                UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
//                token.setDetails(new WebAuthenticationDetails(request));
//                Authentication authenticatedUser = authenticationManager.authenticate(token);
//                SecurityContextHolder.getContext().setAuthentication(authenticatedUser);
//                request.getSession().setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());
            }
        }
        return false;
    }
}

