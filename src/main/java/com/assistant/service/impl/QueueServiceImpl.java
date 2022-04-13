package com.assistant.service.impl;

import com.assistant.mapper.PatientMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.dto.PatientDTO;
import com.assistant.model.dto.ProjectDTO;
import com.assistant.model.dto.QueueCache;
import com.assistant.model.enity.Patient;
import com.assistant.service.intf.ProjectService;
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
    private final ProjectService projectService;

    @Override
    public boolean push(String project, String username) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            if (!ListUtils.isEmpty(cache.getNameList()) && cache.getNameList().contains(username)) {
                return false;
            }
            if (ListUtils.isEmpty(cache.getNameList())) {
                projectService.updateState(username, project,
                        cache.getNameList().size() == 1 ? ProjectDTO.State.onCall : ProjectDTO.State.checking);
            }
            cache.add(username, System.currentTimeMillis());
            return cacheUtils.putQueueCache(project, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public PatientDTO pop(String project) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            if (ListUtils.isEmpty(cache.getNameList())) {
                return null;
            }
            projectService.updateState(cache.getNameList().get(0), project, ProjectDTO.State.checked);
            cache.del(0);
            boolean result = cacheUtils.putQueueCache(project, cache);

            if (result) {
                if (!ListUtils.isEmpty(cache.getNameList())) {
                    String s = cache.getNameList().get(0);
                    Patient patient = patientMapper.getByName(s);
                    Long time = cache.getTimestamp().get(0);
                    projectService.updateState(s, project, ProjectDTO.State.checking);
                    if (cache.getNameList().size() >= 2) {
                        projectService.updateState(cache.getNameList().get(1), project, ProjectDTO.State.onCall);
                    }
                    return new PatientDTO(patient, time);
                }
            }
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return null;
    }

    @Override
    public boolean delPatient(String project, String username) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            if (ListUtils.isEmpty(cache.getNameList()) || !cache.getNameList().contains(username)) {
                return false;
            }
            cache.del(username);
            return cacheUtils.putQueueCache(project, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public Long getWaitTime(String project) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            return cache.getNameList().size() * cache.getProject().getAvetime();
        } catch (Exception e) {
            return Long.MAX_VALUE;
        }
    }

    @Override
    public DataList check(String project) {
        QueueCache queueCache = cacheUtils.getQueueCache(project);
        List<String> queueList = queueCache.getNameList();
        if (queueList == null || queueList.size() == 0) {
            return DataList.builder().data(null).count(0).build();
        }
        List<Patient> patientList = patientMapper.getPatientList(queueCache.getNameList());
        List<PatientDTO> patientQueues = PatientDTO.trans(patientList, queueCache.getTimestamp());
        return DataList.builder().data(patientQueues).count(patientQueues.size()).build();
    }

    @Override
    public PatientDTO peek(String project) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            if (ListUtils.isEmpty(cache.getNameList())) {
                return null;
            }
            String s = cache.getNameList().get(0);
            Patient patient = patientMapper.getByName(s);
            Long time = cache.getTimestamp().get(0);
            return new PatientDTO(patient, time);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return null;
    }


}
