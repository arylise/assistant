package com.assistant.service.intf;

import com.assistant.model.enity.MapNode;

import java.util.List;

public interface MapNodeService {
    List<MapNode> findAll();

    long count();

    List<MapNode> getMapNodesByLevel(int level);
}
