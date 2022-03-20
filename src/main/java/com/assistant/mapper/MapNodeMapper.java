package com.assistant.mapper;

import com.assistant.model.enity.MapNode;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MapNodeMapper {

    List<MapNode> findAll(); // TEST

    long count();

    boolean insert(MapNode mapNode);

    int insertNodes(List<MapNode> mapNodeList);

    List<MapNode> getNodesByLevel(int level);

//    @MapKey("userId")
//    Map<Integer, MapNode> getMapNodesByLevelToMap(int level);

}
