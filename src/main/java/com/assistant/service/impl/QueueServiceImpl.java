package com.assistant.service.impl;

import com.assistant.mapper.PatientMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.dto.PatientDTO;
import com.assistant.model.dto.QueueCache;
import com.assistant.model.dto.State;
import com.assistant.model.enity.Patient;
import com.assistant.model.intf.AssistantUser;
import com.assistant.service.intf.ProjectService;
import com.assistant.service.intf.QueueService;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.TestClass;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.util.Pair;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.ListUtils;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QueueServiceImpl implements QueueService {

    private final CacheUtils cacheUtils;
    private final PatientMapper patientMapper;
    @Lazy
    @Autowired
    private ProjectService projectService;

    @Override
    public boolean push(String project, String patient) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            if (!ListUtils.isEmpty(cache.getNameList()) && cache.getNameList().contains(patient)) {
                return false;
            }
            projectService.updateState(patient, project,
                    ListUtils.isEmpty(cache.getNameList()) ? State.checking : State.onCall);
            cache.add(patient, System.currentTimeMillis());
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
            projectService.updateState(cache.getNameList().get(0), project, State.checked);
            cache.del(0);
            boolean result = cacheUtils.putQueueCache(project, cache);

            if (result) {
                if (!ListUtils.isEmpty(cache.getNameList())) {
                    String s = cache.getNameList().get(0);
                    Patient patient = (Patient) patientMapper.getByName(s);
                    Long time = cache.getTimestamp().get(0);
                    projectService.updateState(s, project, State.checking);
                    return new PatientDTO(patient, time);
                }
            }
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return null;
    }

    @Override
    public boolean delPatient(String project, String patient) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            if (ListUtils.isEmpty(cache.getNameList()) || !cache.getNameList().contains(patient)) {
                return false;
            }
            cache.del(patient);
            boolean b = projectService.updateState(patient, project, State.uncheck);
            return b && cacheUtils.putQueueCache(project, cache);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return false;
    }

    @Override
    public Pair<Integer, Long> getWaitTime(String project, String patient) {
        try {
            QueueCache cache = cacheUtils.getQueueCache(project);
            int index;
            if (cache.getNameList().contains(patient)) {
                index = cache.indexOf(patient);
            } else {
                index = cache.getNameList().size();
            }
            return Pair.of(index, cache.getProject().getAvetime());
        } catch (Exception e) {
            return Pair.of(0, Long.MAX_VALUE);
        }
    }

    @Override
    public DataList check(String project) {
        QueueCache queueCache = cacheUtils.getQueueCache(project);
        List<String> queueList = queueCache.getNameList();
        if (queueList == null || queueList.size() == 0) {
            return DataList.builder().data(null).count(0).build();
        }
        List<AssistantUser> patientList = patientMapper.getUserList(queueCache.getNameList());
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
            Patient patient = (Patient) patientMapper.getByName(s);
            Long time = cache.getTimestamp().get(0);
            return new PatientDTO(patient, time);
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return null;
    }


}
