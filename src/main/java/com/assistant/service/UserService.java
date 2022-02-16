package com.assistant.service;

import com.assistant.config.UserLevel;
import org.springframework.security.core.userdetails.User;

public interface UserService {
    UserLevel checkUser(String username, String password);
}
