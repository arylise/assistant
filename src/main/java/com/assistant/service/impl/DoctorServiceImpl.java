package com.assistant.service.impl;

import com.assistant.model.dto.DataList;
import com.assistant.model.dto.QueueCache;
import com.assistant.service.intf.DoctorService;
import com.assistant.utils.CacheUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DoctorServiceImpl implements DoctorService {

    private final CacheUtils cacheUtils;

    @Override
    public DataList findList(String redisName, String name) {
        List list = null;
        switch (redisName) {
            case "queue": {
                QueueCache queueCache = cacheUtils.getQueueCache(name);
                list = queueCache.getNameList();
            }
        }
        if (list != null) {
            return DataList.builder().data(list).count(list.size()).build();
        }
        return DataList.builder().code(-2).build();
    }

}
