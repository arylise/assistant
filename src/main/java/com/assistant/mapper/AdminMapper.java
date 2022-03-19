package com.assistant.mapper;

import com.assistant.model.enity.Admin;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    List<Admin> findAll(); // TEST

    String password(String username);

}
