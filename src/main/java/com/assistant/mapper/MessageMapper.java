package com.assistant.mapper;

import com.assistant.model.enity.Message;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {

    boolean insert(Message message);

    Message selectById(String messageId);
}
