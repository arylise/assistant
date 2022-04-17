package com.assistant.constant;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class AssistantContext {

    public static int level = 3;
    public static int pathWeight = 1;
    public static int timeWeight = 1;

    public static final String UPPER_ADMIN = "ADMIN";
    public static final String UPPER_DOCTOR = "DOCTOR";
    public static final String UPPER_PATIENT = "PATIENT";

    public static final String ROLE_ = "ROLE_";

    public static final String ROLE_ADMIN = ROLE_ + UPPER_ADMIN;
    public static final String ROLE_DOCTOR = ROLE_ + UPPER_DOCTOR;
    public static final String ROLE_PATIENT = ROLE_ + UPPER_PATIENT;

    public static String getRole(String user) {
        if (ALL_ROLES.containsValue(user)) {
            return ROLE_ + user.toUpperCase();
        }
        return null;
    }

    public static final Map<String, String> ALL_ROLES = new HashMap<>() {{
        put(ROLE_ADMIN, ADMIN);
        put(ROLE_DOCTOR, DOCTOR);
        put(ROLE_PATIENT, PATIENT);
    }};
    public static final String ROLE = "role";
    public static final String USERNAME = "username";
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
    public static final String PROJECT_LIST_CACHE_KEY = "projectList_%s";
    public static final String PATIENT_PATH_KEY = "patientPath_%s";

    public static final String CONTEXT_LIST = "contextList";
    public static final String NODE_ID = "nodeId";
    public static final String AVETIME = "avetime";
    public static final String ELEVATOR_MAP = "elevatorMap";

    public static String appendQueuePrefix(String project) {
        return String.format(PROJECT_QUEUE_CACHE_KEY, project);
    }

    public static String appendProjectPrefix(String username) {
        return String.format(PROJECT_LIST_CACHE_KEY, username);
    }


    private static final SimpleDateFormat yyyyMMdd = new SimpleDateFormat();
    private static final SimpleDateFormat HHmmss = new SimpleDateFormat("mm分");

    public static String getDateStr(Long time) {
        return yyyyMMdd.format(new Date(time));
    }

    public static String getMinStr(Long time) {
        return String.format("%d分钟", time / 1000 / 60);
    }

    public static String appendPatientPathPrefix(String patient) {
        return String.format(PATIENT_PATH_KEY, patient);
    }
}
