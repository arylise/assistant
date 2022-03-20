package com.assistant.service.impl;

import com.assistant.mapper.MapNodeMapper;
import com.assistant.model.enity.MapNode;
import com.assistant.service.intf.MapNodeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MapNodeServiceImpl implements MapNodeService {

    private final MapNodeMapper mapNodeMapper;

    @Override
    public List<MapNode> findAll() {
        return mapNodeMapper.findAll();
    }

    @Override
    public long count() {
        return mapNodeMapper.count();
    }

    @Override
    public List<MapNode> getMapNodesByLevel(int level) {
        return mapNodeMapper.getNodesByLevel(level);
    }

//    @Override
//    public Map<Integer, MapNode> getMapNodesByLevelToMap(int level) {
//        return mapNodeMapper.getMapNodesByLevelToMap(level);
//    }
}
