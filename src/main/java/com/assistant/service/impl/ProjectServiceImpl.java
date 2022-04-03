package com.assistant.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.assistant.constant.AssistantContext;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.RedisUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.ListUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final RedisUtils redisUtils;

    @Override
    public boolean regPro(String dep, String username) {
        try {
            String key = AssistantContext.appendDepartmentPrefix(dep);
            String s = redisUtils.get(key);
            if (StringUtils.isEmpty(s)) {
                return false;
            }
            JSONObject biz = JSONObject.parseObject(s);
            List<String> contextList = (List<String>) biz.get(AssistantContext.CONTEXT_LIST);
            if (!ListUtils.isEmpty(contextList) && contextList.contains(username)) {
                return false;
            }
            contextList.add(username);

            biz.put(AssistantContext.CONTEXT_LIST, contextList);

            return redisUtils.set(key, biz.toJSONString());
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public boolean doPro(String dep) {
        try {
            String key = AssistantContext.appendDepartmentPrefix(dep);
            String s = redisUtils.get(key);
            if (StringUtils.isEmpty(s)) {
                return false;
            }
            JSONObject biz = JSONObject.parseObject(s);

            List<String> contextList = (List<String>) biz.get(AssistantContext.CONTEXT_LIST);
            if (ListUtils.isEmpty(contextList)) {
                return false;
            }

            contextList.remove(0);

            biz.put(AssistantContext.CONTEXT_LIST, contextList);

            return redisUtils.set(key, biz.toJSONString());
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public boolean delFromPro(String dep, String username) {
        try {
            String key = AssistantContext.appendDepartmentPrefix(dep);
            String s = redisUtils.get(key);
            if (StringUtils.isEmpty(s)) {
                return false;
            }
            JSONObject biz = JSONObject.parseObject(s);

            List<String> contextList = (List<String>) biz.get(AssistantContext.CONTEXT_LIST);
            if (!ListUtils.isEmpty(contextList) && contextList.contains(username)) {
                return false;
            }
            contextList.remove(username);

            biz.put(AssistantContext.CONTEXT_LIST, contextList);
            return redisUtils.set(key, biz.toJSONString());
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public Integer getWaitTime(String dep){
        String key = AssistantContext.appendDepartmentPrefix(dep);
        String s = redisUtils.get(key);
        if (StringUtils.isEmpty(s)) {
            return Integer.MAX_VALUE;
        }
        JSONObject biz = JSONObject.parseObject(s);
//        if(biz.get(AssistantContext.PROJECT))
        return 1;
    }
}
