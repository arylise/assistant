package com.assistant.service.intf;

public interface PatientService {
    String password(String username);
    boolean insert(String username, String password);
}
