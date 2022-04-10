package com.assistant.service.impl;

import com.assistant.mapper.PatientMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.dto.QueueCache;
import com.assistant.model.enity.Patient;
import com.assistant.service.intf.QueueService;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.ListUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QueueServiceImpl implements QueueService {

    private final CacheUtils cacheUtils;
    private final PatientMapper patientMapper;

    @Override
    public boolean push(String pro, String username) {
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
    public DataList.Patient pop(String pro) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(pro);
            if (ListUtils.isEmpty(cache.getQueueList())) {
                return null;
            }
            cache.getQueueList().remove(0);
            cache.getTimestamp().remove(0);
            boolean result = cacheUtils.putQueueCache(pro, cache);

            if (result && ListUtils.isEmpty(cache.getQueueList())) {
                return null;
            }

            String s = cache.getQueueList().get(0);
            Patient patient = patientMapper.getByName(s);
            Long time = cache.getTimestamp().get(0);
            return new DataList.Patient(patient, time);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return null;
    }

    @Override
    public boolean delPatient(String pro, String username) {
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
    public Integer getWaitTime(String pro) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(pro);
            return cache.getQueueList().size() * cache.getProject().getAvetime();
        } catch (Exception e) {
            return Integer.MAX_VALUE;
        }
    }

    @Override
    public DataList check(String project) {
        QueueCache queueCache = cacheUtils.getQueueCache(project);
        List<String> queueList = queueCache.getQueueList();
        if (queueList == null || queueList.size() == 0) {
            return DataList.builder().data(null).count(0).build();
        }
        List<Patient> patientList = patientMapper.getPatientList(queueCache.getQueueList());
        List<DataList.Patient> patientQueues = DataList.transPatientQueue(patientList, queueCache.getTimestamp());
        return DataList.builder().data(patientQueues).count(patientQueues.size()).build();
    }

    @Override
    public DataList.Patient peek(String pro) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(pro);
            if (ListUtils.isEmpty(cache.getQueueList())) {
                return null;
            }
            String s = cache.getQueueList().get(0);
            Patient patient = patientMapper.getByName(s);
            Long time = cache.getTimestamp().get(0);
            return new DataList.Patient(patient, time);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return null;
    }


}
