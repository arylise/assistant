package com.assistant.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class DataList {
    private int code;
    private String msg;
    private long count;
    private List data;

    @AllArgsConstructor
    @NoArgsConstructor
    @Data
    @Builder
    public static class Patient {
        private String username;
        private String name;
        private String sex;
        private Integer age;
        private Integer phone;
        private Integer exception;
        private String msg;
        private String date;

        public Patient(com.assistant.model.enity.Patient patient, Long date) {
            this.username = patient.getUsername();
            this.name = patient.getName();
            this.sex = patient.getSex();
            this.age = patient.getAge();
            this.phone = patient.getPhone();
            this.exception = patient.getException();
            this.msg = patient.getMsg();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
            this.date = simpleDateFormat.format(new Date(date));
        }
    }

    public static List<Patient> transPatientQueue(List<com.assistant.model.enity.Patient> patientList, List<Long> timeList) {
        return new ArrayList<>() {{
            for (int i = 0; i < patientList.size(); i++) {
                add(new Patient(patientList.get(i), timeList.get(i)));
            }
        }};
    }
}
