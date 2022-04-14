package com.assistant.model.dto;

import com.assistant.constant.AssistantContext;
import com.assistant.model.enity.Patient;
import com.assistant.model.intf.AssistantUser;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class PatientDTO {
    private String username;
    private String name;
    private String sex;
    private Integer age;
    private Integer phone;
    private Integer exception;
    private String msg;
    private String date;

    public PatientDTO(Patient patient, Long date) {
        this.username = patient.getUsername();
        this.name = patient.getName();
        this.sex = patient.getSex();
        this.age = patient.getAge();
        this.phone = patient.getPhone();
        this.exception = patient.getException();
        this.msg = patient.getMsg();
        this.date = AssistantContext.getDateStr(date);
    }

    public static List<PatientDTO> trans(List<AssistantUser> patientList, List<Long> timeList) {
        return new ArrayList<>() {{
            for (int i = 0; i < patientList.size(); i++) {
                add(new PatientDTO((Patient) patientList.get(i), timeList.get(i)));
            }
        }};
    }
}