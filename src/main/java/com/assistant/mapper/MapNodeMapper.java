package com.assistant.mapper;

import com.assistant.model.enity.MapNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MapNodeMapper {
    List<MapNode> findAll(); // TEST
    long count();
}
