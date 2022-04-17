package com.assistant.service.impl;

import com.alibaba.fastjson.JSON;
import com.assistant.constant.AssistantContext;
import com.assistant.mapper.DoctorMapper;
import com.assistant.mapper.MapNodeMapper;
import com.assistant.mapper.PatientMapper;
import com.assistant.mapper.ProjectMapper;
import com.assistant.model.dto.DataList;
import com.assistant.service.intf.AdminService;
import com.assistant.utils.CacheUtils;
import com.assistant.utils.MapNodeUtils;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final DoctorMapper doctorMapper;
    private final PatientMapper patientMapper;
    private final ProjectMapper projectMapper;
    private final MapNodeMapper mapNodeMapper;
    private final MapNodeUtils mapNodeUtils;
    private final CacheUtils cacheUtils;

    @Override
    public DataList findList(String listName) {
        long count;
        List list;
        switch (listName) {
            case AssistantContext.DOCTOR -> {
                list = doctorMapper.selectAll();
                count = doctorMapper.count();
            }
            case AssistantContext.PATIENT -> {
                list = patientMapper.selectAll();
                count = patientMapper.count();
            }
            case AssistantContext.PROJECT -> {
                list = projectMapper.selectAll();
                count = projectMapper.count();
            }
            case AssistantContext.MAP_NODE -> {
                list = mapNodeMapper.findAll();
                count = mapNodeMapper.count();
            }
            default -> {
                PageHelper.clearPage();
                return DataList.builder().code(-1).build();
            }
        }
        if (list != null) {
            return DataList.builder().data(list).count(count).build();
        }
        return DataList.builder().code(-2).build();
    }

    @Override
    public String getMapNodesByLevel(int level) {
        MapNodeUtils.AdjacencyResult adjacencyResult = cacheUtils.getAdjacencyMatrixByLevel(level);
        return JSON.toJSONString(adjacencyResult);
    }


}
