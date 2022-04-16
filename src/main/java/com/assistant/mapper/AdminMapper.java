package com.assistant.mapper;

import com.assistant.model.enity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

@Mapper
public interface AdminMapper {

    List<Admin> findAll(); // TEST

    String password(String username);

    Admin getByName(String username);

    List<String> checkUserName(String username);

    boolean deleteByNameAtAll(String username);

    UserDetails getByNameFromtAll(String username);
}
