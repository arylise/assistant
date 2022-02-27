package com.assistant;

import com.assistant.mapper.DoctorMapper;
import com.assistant.mapper.PatientMapper;
import com.assistant.model.enity.Doctor;
import com.assistant.model.enity.Patient;
import com.assistant.utils.TestClass;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
class AssistantApplicationTests {
    @Autowired
    private DoctorMapper doctorMapper;

    @Autowired
    private PatientMapper patientMapper;

    @Test
    void createDocTest() {
        List<Doctor> doctors = new ArrayList<>();
        String username = "doctor";
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        int i = 0;
        while (++i < 100) {
            double random = Math.random();
            doctors.add(new Doctor(username + i, encoder.encode(username + i), username + i, "department0" + (random < 0.33 ? "1" : random < 0.66 ? "2" : "3"), "m", i, i));
        }
        System.out.println(doctorMapper.insertDocs(doctors));
    }

    @Test
    void createPatTest() {
        List<Patient> patients = new ArrayList<>();
        String username = "patient";
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        int i = 0;
        while (++i < 100) {
            double random = Math.random();
            patients.add(new Patient(username + i, encoder.encode(username + i), username + i, "m", i, i, 0));
        }
        System.out.println(patientMapper.insertPats(patients));
    }

    @Test
    void contextLoads() {

        PasswordEncoder encoder = new BCryptPasswordEncoder();

        String str = "123";
        TestClass.showMe(str);
        str = "doctor";
        TestClass.showMe(encoder.encode(str));
        str = "arylise";
        TestClass.showMe(encoder.encode(str));
        str = "admin";
        TestClass.showMe(encoder.encode(str));
    }

    int inf = Integer.MAX_VALUE;
    int n = 7;
    int[][] e = new int[n][n];
    int showCount = 0;

    @Test
    public void testFloyd() {

        String[] points = {
                "1 5 2 3",
                "3 4 5 1 0 5",
                "0 3 4 5",
                "1 4 5 2 6 3",
                "2 5 5 3 6 4",
                "1 1 3 2 4 3",
                "3 3 4 4"
        };
//        for (String point : points) {
//            System.out.println(point);
//        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                e[i][j] = i == j ? 0 : inf;
            }
        }

        for (int i = 0; i < points.length; i++) {
            String[] strs = points[i].split(" ");
//            for (String str : strs) {
//                System.out.println(str);
//            }
            for (int j = 0; j < strs.length / 2; j++) {
//                System.out.println(strs[j] + " " + strs[2 * j + 1]);
//                System.out.println("" + Integer.parseInt(strs[j]) + " " + Integer.parseInt(strs[2 * j + 1]));
                e[i][Integer.parseInt(strs[2 * j])] = Integer.parseInt(strs[2 * j + 1]);
            }
//            for (int ii = 0; ii < n; ii++) {
//                for (int j = 0; j < n; j++) {
//                    System.out.print("" + (e[ii][j] == inf ? " " : e[ii][j]) + " ");
//                }
//                System.out.println("");
//            }
        }

        showMeE();


        //Floyd-Warshall算法核心语句
        for (int k = 0; k < n; k++) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    if (e[i][k] != inf && e[k][j] != inf && e[i][j] > e[i][k] + e[k][j]) {
                        e[i][j] = e[i][k] + e[k][j];
                        System.out.println("k = " + k + "\ni = " + i + "\nj = " + j + "\n");
                        showMeE();
                    }
                }
            }
        }

        showMeE();


    }

    public void showMeE() {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("" + (e[i][j] == inf ? " " : e[i][j]) + " ");
            }
            System.out.println();
        }
        System.out.println("__________________________" + showCount++);
    }

}
