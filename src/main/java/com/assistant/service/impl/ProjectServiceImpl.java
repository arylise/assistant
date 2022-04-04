package com.assistant.service.impl;

import com.assistant.model.dto.ProCache;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.ListUtils;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final CacheUtils cacheUtils;

    @Override
    public boolean regPro(String dep, String username) {
        try {
            ProCache cache = cacheUtils.getCache(dep);
            if (!ListUtils.isEmpty(cache.getContextList()) && cache.getContextList().contains(username)) {
                return false;
            }
            cache.getContextList().add(username);
            return cacheUtils.putCache(dep, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public boolean doPro(String dep) {
        try {
            ProCache cache = cacheUtils.getCache(dep);
            if (ListUtils.isEmpty(cache.getContextList())) {
                return false;
            }
            cache.getContextList().remove(0);
            return cacheUtils.putCache(dep, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public boolean delFromPro(String dep, String username) {
        try {
            ProCache cache = cacheUtils.getCache(dep);
            if (!ListUtils.isEmpty(cache.getContextList()) && cache.getContextList().contains(username)) {
                return false;
            }
            cache.getContextList().remove(username);
            return cacheUtils.putCache(dep, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public Integer getWaitTime(String dep) {
        try {
            ProCache cache = cacheUtils.getCache(dep);
            return cache.getContextList().size() * cache.getDepartment().getAvetime();
        } catch (Exception e) {
            return Integer.MAX_VALUE;
        }
    }
}
