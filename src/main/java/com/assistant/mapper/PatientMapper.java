package com.assistant.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PatientMapper {
    String password(String username);
    boolean insert(String username,String password);
}
