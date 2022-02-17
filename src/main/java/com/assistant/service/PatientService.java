package com.assistant.service;

public interface PatientService {
    String password(String username);
    boolean insert(String username, String password);
}
