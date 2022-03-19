package com.assistant.mapper;

import com.assistant.model.enity.MapNode;
import com.assistant.model.enity.Patient;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MapNodeMapper {

    List<MapNode> findAll(); // TEST

    long count();

    boolean insert(MapNode mapNode);

    int insertNodes(List<MapNode> mapNodeList);

    List<MapNode> getNodesByLevel(int level);

}
