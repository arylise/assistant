package com.assistant.service.intf;

public interface UserService {
    String checkRole();

    boolean insertPatient(String username, String password);
}
