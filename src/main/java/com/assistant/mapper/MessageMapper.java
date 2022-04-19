package com.assistant.mapper;

import com.assistant.model.enity.Message;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageMapper {

    boolean insert(Message message);

    List<Message> select();
}
