package com.assistant.service.impl;

import com.assistant.mapper.DoctorMapper;
import com.assistant.mapper.PatientMapper;
import com.assistant.mapper.ProjectMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.dto.QueueCache;
import com.assistant.model.enity.Doctor;
import com.assistant.service.intf.DoctorService;
import com.assistant.utils.CacheUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DoctorServiceImpl implements DoctorService {

    private final DoctorMapper doctorMapper;
    private final CacheUtils cacheUtils;
    private final ProjectMapper projectMapper;
    private final PatientMapper patientMapper;

    @Override
    public String password(String username) {
        return doctorMapper.password(username);
    }

    @Override
    public int insertDocs(List<Doctor> doctorList) {
        return doctorMapper.insertDocs(doctorList);
    }

    @Override
    public List<Doctor> selectAll() {
        return doctorMapper.selectAll();
    }

    @Override
    public long count() {
        return doctorMapper.count();
    }

    @Override
    public boolean delete(String username) {
        return doctorMapper.delete(username);
    }

    @Override
    public DataList findList(String redisName, String name) {
        List list = null;
        switch (redisName){
            case "queue":{
                QueueCache queueCache = cacheUtils.getQueueCache(name);
                list = queueCache.getQueueList();
            }
        }
        if (list != null) {
            return DataList.builder().data(list).count(list.size()).build();
        }
        return DataList.builder().code(-2).build();
    }

    @Override
    public String getProject(String username) {
        return doctorMapper.getProject(username);
    }
}
