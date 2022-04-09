package com.assistant.service.impl;

import com.assistant.model.dto.QueueCache;
import com.assistant.service.intf.ProjectService;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.ListUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final CacheUtils cacheUtils;

    @Override
    public boolean regQue(String pro, String username) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(pro);
            if (!ListUtils.isEmpty(cache.getQueueList()) && cache.getQueueList().contains(username)) {
                return false;
            }
            cache.getQueueList().add(username);
            cache.getTimestamp().add(System.currentTimeMillis());
            return cacheUtils.putQueueCache(pro, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public boolean doQue(String pro) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(pro);
            if (ListUtils.isEmpty(cache.getQueueList())) {
                return false;
            }
            cache.getQueueList().remove(0);
            cache.getTimestamp().remove(0);
            return cacheUtils.putQueueCache(pro, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public boolean delFromQue(String pro, String username) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(pro);
            if (ListUtils.isEmpty(cache.getQueueList()) || !cache.getQueueList().contains(username)) {
                return false;
            }
            List<String> queueList = cache.getQueueList();
            int index = queueList.indexOf(username);
            queueList.remove(index);
            cache.getTimestamp().remove(index);
            return cacheUtils.putQueueCache(pro, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public Integer getQueWaitTime(String pro) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(pro);
            return cache.getQueueList().size() * cache.getProject().getAvetime();
        } catch (Exception e) {
            return Integer.MAX_VALUE;
        }
    }

    /**
     * 患者体检清单
     * @param username
     * @param projectList
     * @return
     */
    @Override
    public boolean regProList(String username, List<String> projectList){
        cacheUtils.getProjectList(username);
        return false;
    }
}
