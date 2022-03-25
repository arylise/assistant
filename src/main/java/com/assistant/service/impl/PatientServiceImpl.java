package com.assistant.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.assistant.constant.AssistantContext;
import com.assistant.mapper.PatientMapper;
import com.assistant.model.dto.RegisterContext;
import com.assistant.model.enity.Patient;
import com.assistant.service.intf.PatientService;
import com.assistant.utils.RedisUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PatientServiceImpl implements PatientService {

    private final PatientMapper patientMapper;
    private final RedisUtils redisUtils;

    @Override
    public String password(String username) {
        return patientMapper.password(username);
    }

    @Override
    public boolean insertFast(String username, String password) {
        //md5加密
        password = new BCryptPasswordEncoder().encode(password);
        return patientMapper.insert(username, password);
    }

    @Override
    public long count() {
        return patientMapper.count();
    }

    @Override
    public List<Patient> selectAll() {
        return patientMapper.selectAll();
    }

    @Override
    public String register(String dep, String userId) {
        String s = redisUtils.get(AssistantContext.appendDepartmentPrefix(dep));
        if (StringUtils.isEmpty(s)) {
            return null;
        }
        JSONObject biz = JSONObject.parseObject(s);
        List<RegisterContext> patientList = (List<RegisterContext>) biz.get("patientList");
        if (patientList == null) {
            patientList = new ArrayList<>();
        }
        RegisterContext build = RegisterContext.builder().registerTime(System.currentTimeMillis()).username("").build();
        return null;
    }
}
