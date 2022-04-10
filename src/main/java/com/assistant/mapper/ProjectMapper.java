package com.assistant.mapper;

import com.assistant.model.enity.Project;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProjectMapper {

    List<Project> selectAll();

    List<Project> selectByDepartment(String department);

    List<Project> selectByProject(String project);

    long count();

    List<Project> selectByIds(List<String> projectList);
}
