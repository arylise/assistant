package com.assistant.service.impl;

import com.alibaba.fastjson.JSON;
import com.assistant.constant.AssistantContext;
import com.assistant.mapper.AdminMapper;
import com.assistant.model.dto.DataList;
import com.assistant.model.enity.Admin;
import com.assistant.model.enity.MapNode;
import com.assistant.service.intf.*;
import com.assistant.utils.MapNodeUtils;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final AdminMapper adminMapper;
    private final DoctorService doctorService;
    private final PatientService patientService;
    private final HospitalService hospitalService;
    private final MapNodeService mapNodeService;

    private final MapNodeUtils mapNodeUtils;

    @Override
    public List<Admin> findAll() {
        return adminMapper.findAll();
    }

    @Override
    public String password(String username) {
        return adminMapper.password(username);
    }

    @Override
    public DataList findList(String listName) {
        long count;
        List list;
        switch (listName) {
            case AssistantContext.DOCTOR -> {
                list = doctorService.selectAll();
                count = doctorService.count();
            }
            case AssistantContext.PATIENT -> {
                list = patientService.selectAll();
                count = patientService.count();
            }
            case AssistantContext.PROJECT -> {
                list = hospitalService.projectList();
                count = hospitalService.countDeps();
            }
            case AssistantContext.MAP_NODE -> {
                list = mapNodeService.findAll();
                count = mapNodeService.count();
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
        List<MapNode> list = mapNodeService.getMapNodesByLevel(level);

        MapNodeUtils.AdjacencyResult adjacencyResult = mapNodeUtils.adjacencyMatrix(list);
        adjacencyResult.setMapNodes(list);
        return JSON.toJSONString(adjacencyResult);
    }


}
