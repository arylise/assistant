package com.assistant.service.function;

import com.assistant.constant.AssistantContext;
import com.assistant.service.intf.AdminService;
import com.assistant.service.intf.DoctorService;
import com.assistant.service.intf.PatientService;
import com.assistant.service.intf.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService, UserService {

    private final AdminService adminService;
    private final DoctorService doctorService;
    private final PatientService patientService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Map<String, String> map = checkUsername(username);
        if (map.isEmpty()) {
            throw new UsernameNotFoundException("用户名或密码错误！");
        }

        return new User(username, map.get(AssistantContext.PASSWORD),
                new ArrayList<>() {{
                    add(new SimpleGrantedAuthority(map.get(AssistantContext.ROLE_)));
                }}
        );
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
            map.put(AssistantContext.PASSWORD, password);
            map.put(AssistantContext.ROLE_, AssistantContext.ROLE_PATIENT);
            return map;
        }
        password = doctorService.password(username);
        if (!StringUtils.isEmptyOrWhitespace(password)) {
            map.put(AssistantContext.PASSWORD, password);
            map.put(AssistantContext.ROLE_, AssistantContext.ROLE_DOCTOR);
            return map;
        }
        password = adminService.password(username);
        if (!StringUtils.isEmptyOrWhitespace(password)) {
            map.put(AssistantContext.PASSWORD, password);
            map.put(AssistantContext.ROLE_, AssistantContext.ROLE_ADMIN);
            return map;
        }
        return map;
    }

    @Override
    public String checkRole() {
        Set<String> roles = AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (String o : roles) {
            if (AssistantContext.ALL_ROLES.containsKey(o)) {
                return AssistantContext.ALL_ROLES.get(o);
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

