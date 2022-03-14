package com.assistant.mapper;

import com.assistant.model.enity.Department;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DepartmentMapper {
    List<Department> selectAll();

    long count();
}
