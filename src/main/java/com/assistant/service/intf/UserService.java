package com.assistant.service.intf;

import com.assistant.model.dto.DataList;
import org.springframework.data.util.Pair;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserService {
    boolean insertPatient(String username, String password);

    List<Pair<String, String>> getActivityPatientNames(HttpServletRequest request);

    DataList getActivityUser(HttpServletRequest request, String role);
}
