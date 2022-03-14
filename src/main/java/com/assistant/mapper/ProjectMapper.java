package com.assistant.mapper;

import com.assistant.model.enity.Project;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjectMapper {
    List<Project> selectAll();

    long count();
}
