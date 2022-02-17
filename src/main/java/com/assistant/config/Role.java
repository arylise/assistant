package com.assistant.config;

import java.util.ArrayList;
import java.util.List;

public class Role {

    public static final String ROLE_ADMIIN = "ROLE_ADMIN";
    public static final String ROLE_DOCTOR = "ROLE_DOCTOR";
    public static final String ROLE_PATIENT = "ROLE_PATIENT";

    public static final List<String> ALL_ROLES = new ArrayList<>(){{
        add(ROLE_ADMIIN);
        add(ROLE_DOCTOR);
        add(ROLE_PATIENT);
    }};

}
