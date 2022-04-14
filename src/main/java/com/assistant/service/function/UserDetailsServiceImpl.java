package com.assistant.service.function;

import com.assistant.constant.AssistantContext;
import com.assistant.mapper.AdminMapper;
import com.assistant.mapper.DoctorMapper;
import com.assistant.mapper.PatientMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.intf.AssistantUser;
import com.assistant.model.intf.BaseMapper;
import com.assistant.service.intf.UserService;
import com.assistant.utils.SecurityUtils;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.Manager;
import org.apache.catalina.Session;
import org.apache.catalina.session.StandardSession;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MapUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService, UserService {

    private final AdminMapper adminMapper;
    private final DoctorMapper doctorMapper;
    private final PatientMapper patientMapper;

    private final Map<String, BaseMapper> mapperMap = new HashMap<>() {{
        put(AssistantContext.DOCTOR, doctorMapper);
        put(AssistantContext.PATIENT, patientMapper);
    }};

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDetails details = patientMapper.getByName(username);
        if (details == null) {
            details = doctorMapper.getByName(username);
        }
        if (details == null) {
            details = adminMapper.getByName(username);
        }
        if (details == null) {
            throw new UsernameNotFoundException("用户名或密码错误！");
        }
        return details;
    }

    @Override
    public boolean insertPatient(String username, String password) {
        List<String> list = adminMapper.checkUserName(username);
        if (CollectionUtils.isEmpty(list)) {
            boolean ans = patientMapper.insert(username, new BCryptPasswordEncoder().encode(password));
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

    @Override
    public DataList getActivityUser(HttpServletRequest request, String role) {
        Manager manager = SecurityUtils.getManager(request.getSession());
        if (manager == null) {
            return null;
        }

        List<String> patientNameList = new ArrayList<>();
        Session[] sessions = manager.findSessions();
        for (int i = 0; i < sessions.length; i++) {
            StandardSession sessioni = (StandardSession) sessions[i];
            if (sessioni.isValid()) {
                SecurityContext attribute = (SecurityContext) sessioni.getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
                if (attribute == null) {
                    continue;
                }
                Authentication authentication = attribute.getAuthentication();
                UserDetails principal = (UserDetails) authentication.getPrincipal();
                if (principal != null) {
                    List<? extends GrantedAuthority> authorities = principal.getAuthorities().stream().toList();
                    if (CollectionUtils.isEmpty(authorities)) {
                        continue;
                    }
                    for (GrantedAuthority authority : authorities) {
                        if (StringUtils.equals(authority.getAuthority(), AssistantContext.getRole(role))) {
                            patientNameList.add(principal.getUsername());
                        }
                    }
                }
            }
        }
        DataList dataLists;
        if (CollectionUtils.isNotEmpty(patientNameList) && mapperMap.containsKey(role)) {
            List<AssistantUser> patientList = MapUtils.getObject(mapperMap, role).getUserList(patientNameList);
            dataLists = DataList.builder().data(patientList).count(patientNameList.size()).build();
        } else {
            PageHelper.clearPage();
            dataLists = DataList.builder().data(new ArrayList<>()).count(0).build();
        }
        return dataLists;
    }
}

