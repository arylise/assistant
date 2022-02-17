package com.assistant.service.functionService;

import static com.assistant.config.Role.*;
import com.assistant.service.AdminService;
import com.assistant.service.DoctorService;
import com.assistant.service.PatientService;
import com.assistant.temp.TestClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

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
//            TestClass.showMe(ROLE_ADMIIN);
            return new User(username, password,
                    new ArrayList<>() {{
                        add(new SimpleGrantedAuthority(ROLE_ADMIIN));
                    }}
            );
        }

        return null;
    }
}

