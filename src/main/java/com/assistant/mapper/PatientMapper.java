package com.assistant.mapper;

import com.assistant.model.intf.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PatientMapper extends BaseMapper {
    boolean insert(String username, String password);
}
