package com.assistant.service.impl;

import com.assistant.mapper.MapNodeMapper;
import com.assistant.model.enity.MapNode;
import com.assistant.service.intf.MapNodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MapNodeServiceImpl implements MapNodeService {
    @Autowired
    private MapNodeMapper mapNodeMapper;

    @Override
    public List<MapNode> findAll() {
        return mapNodeMapper.findAll();
    }

    @Override
    public long count() {
        return mapNodeMapper.count();
    }
}
