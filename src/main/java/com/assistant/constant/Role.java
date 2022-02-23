package com.assistant.constant;

import java.util.ArrayList;
import java.util.List;

public class Role {

    public static final String ADMIN = "ADMIN";
    public static final String DOCTOR = "DOCTOR";
    public static final String PATIENT = "PATIENT";

    public static final String ROLE_ = "ROLE_";

    public static final String ROLE_ADMIN = ROLE_ + ADMIN;
    public static final String ROLE_DOCTOR = ROLE_ + DOCTOR;
    public static final String ROLE_PATIENT = ROLE_ + PATIENT;

    public static final List<String> ALL_ROLES = new ArrayList<>() {{
        add(ROLE_ADMIN);
        add(ROLE_DOCTOR);
        add(ROLE_PATIENT);
    }};
}
