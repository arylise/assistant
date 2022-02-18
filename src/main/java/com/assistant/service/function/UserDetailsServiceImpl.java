package com.assistant.service.function;

import static com.assistant.constant.Role.*;

import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import java.util.ArrayList;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private AdminService adminService;
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private PatientService patientService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try {

            String password;

            password = patientService.password(username);
            if (!StringUtils.isEmptyOrWhitespace(password)) {
                return new User(username, password,
                        new ArrayList<>() {{
                            add(new SimpleGrantedAuthority(ROLE_PATIENT));
                        }}
                );
            }
            password = doctorService.password(username);
            if (!StringUtils.isEmptyOrWhitespace(password)) {
                return new User(username, password,
                        new ArrayList<>() {{
                            add(new SimpleGrantedAuthority(ROLE_DOCTOR));
                        }}
                );
            }
            password = adminService.password(username);
            if (!StringUtils.isEmptyOrWhitespace(password)) {
                return new User(username, password,
                        new ArrayList<>() {{
                            add(new SimpleGrantedAuthority(ROLE_ADMIIN));
                        }}
                );
            }

            if (StringUtils.isEmpty(password)) {
                throw new UsernameNotFoundException("用户名或密码错误！");
            }

        } catch (UsernameNotFoundException e) {
            throw e;
        }
        return null;
    }
}

