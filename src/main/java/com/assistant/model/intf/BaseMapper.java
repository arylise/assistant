package com.assistant.model.intf;

import java.util.List;

public interface BaseMapper {
    String password(String username);

    long count();

    int insertAll(List<AssistantUser> userList);

    AssistantUser getByName(String username);

    List<AssistantUser> selectAll();

    List<AssistantUser> getUserList(List<String> ids);

}
