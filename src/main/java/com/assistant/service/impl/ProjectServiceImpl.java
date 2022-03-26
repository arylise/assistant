package com.assistant.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.assistant.constant.AssistantContext;
import com.assistant.model.dto.RegisterContext;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.RedisUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final RedisUtils redisUtils;

    @Override
    public boolean registerList(String dep, String username) {
        try {
            String key = AssistantContext.appendDepartmentPrefix(dep);
            String s = redisUtils.get(key);
            if (StringUtils.isEmpty(s)) {
                return false;
            }
            JSONObject biz = JSONObject.parseObject(s);
            List<RegisterContext> patientList = (List<RegisterContext>) biz.get("patientList");
            if (patientList == null) {
                patientList = new ArrayList<>();
            }
            RegisterContext context = RegisterContext.builder().registerTime(System.currentTimeMillis()).username(username).build();
            patientList.add(context);
            biz.put("patientList", patientList);
            return redisUtils.set(key, biz.toJSONString());
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        } finally {
            return false;
        }
    }
}
