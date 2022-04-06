package com.assistant.constant;

import java.util.ArrayList;
import java.util.List;

public class AssistantContext {

    public static final String UPPER_ADMIN = "ADMIN";
    public static final String UPPER_DOCTOR = "DOCTOR";
    public static final String UPPER_PATIENT = "PATIENT";

    public static final String ROLE_ = "ROLE_";

    public static final String ROLE_ADMIN = ROLE_ + UPPER_ADMIN;
    public static final String ROLE_DOCTOR = ROLE_ + UPPER_DOCTOR;
    public static final String ROLE_PATIENT = ROLE_ + UPPER_PATIENT;

    public static final List<String> ALL_ROLES = new ArrayList<>() {{
        add(ROLE_ADMIN);
        add(ROLE_DOCTOR);
        add(ROLE_PATIENT);
    }};


    public static final String PASSWORD = "password";

    public static final String ADMIN = "admin";
    public static final String DOCTOR = "doctor";
    public static final String PATIENT = "patient";
    public static final String DEPARTMENT = "department";
    public static final String PROJECT = "project";

    public static final String MAP_NODE = "mapnode";

    /**
     * 缓存key
     */
    public static final String FLOYD_MATRIX_ALL = "floydMatrixAll";
    public static final String FLOYD_MATRIX_ALL_WITHOUT_STAIR = "floydMatrixAllWithoutStair";
    public static final String FLOYD_MATRIX_ALL_WITHOUT_ELEVATOR = "floydMatrixAllWithoutElevator";

    public static final String PROJECT_QUEUE_CACHE_KEY = "projectQueue_%s";

    public static final String CONTEXT_LIST = "contextList";
    public static final String NODE_ID = "nodeId";
    public static final String AVETIME = "avetime";

    public static String appendQueuePrefix(String project) {
        return String.format(PROJECT_QUEUE_CACHE_KEY, project);
    }


}