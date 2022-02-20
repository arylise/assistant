package com.assistant.service.intf;

public interface PatientService {
    String password(String username);
    boolean insertFast(String username, String password);
}
