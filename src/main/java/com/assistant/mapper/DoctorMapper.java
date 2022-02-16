package com.assistant.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DoctorMapper {
    String password(String username);
}
