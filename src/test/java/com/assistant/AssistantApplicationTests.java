package com.assistant;

import com.assistant.mapper.DoctorMapper;
import com.assistant.mapper.MapNodeMapper;
import com.assistant.mapper.PatientMapper;
import com.assistant.model.enity.Doctor;
import com.assistant.model.enity.MapNode;
import com.assistant.model.enity.Patient;
import com.assistant.utils.MapNodeUtils;
import com.assistant.utils.TestClass;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.annotation.Resource;
import java.util.*;


@SpringBootTest
class AssistantApplicationTests {

    @Resource
    private DoctorMapper doctorMapper;
    @Resource
    private PatientMapper patientMapper;
    @Resource
    private MapNodeMapper mapNodeMapper;

    @Resource
    private MapNodeUtils mapNodeUtils;

    @Test
    void createDocTest() {
        List<Doctor> doctors = new ArrayList<>();
        String username = "doctor";
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        int i = 0;
        while (++i < 100) {
            double random = Math.random();
            doctors.add(new Doctor(username + i, encoder.encode(username + i), username + i, "department0" + (random < 0.33 ? "1" : random < 0.66 ? "2" : "3"), "m", i, i, null));
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
            patients.add(new Patient(username + i, encoder.encode(username + i), username + i, "m", i, i, 0, null));
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
    String[][] eStr = new String[n][n];

    String[] points = {
            "1 5 2 3",
            "3 4 5 1 0 5",
            "0 3 4 5",
            "1 4 5 2 6 3",
            "2 5 5 3 6 4",
            "1 1 3 2 4 3",
            "3 3 4 4"
    };

    @Test
    public void testFloyd() {

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                e[i][j] = i == j ? 0 : inf;
            }
        }

        for (int i = 0; i < points.length; i++) {
            String[] strs = points[i].split(" ");
            for (int j = 0; j < strs.length / 2; j++) {
                int jj = Integer.parseInt(strs[2 * j]);
                e[i][jj] = Integer.parseInt(strs[2 * j + 1]);
                eStr[i][jj] = "" + i + "->" + strs[2 * j];
            }
        }
//        showMeEStr();

        for (int k = 0; k < n; k++) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    if (e[i][k] != inf && e[k][j] != inf && e[i][j] > e[i][k] + e[k][j]) {
                        e[i][j] = e[i][k] + e[k][j];
                        boolean show = eStr[i][j] == null || eStr[i][k] == null || eStr[k][j] == null;
                        if (show)
                            TestClass.showMe(eStr[i][j] + "    ij\n" + eStr[i][k] + "    ik\n" + eStr[k][j] + "    kj");
                        eStr[i][j] = eStr[i][k].substring(0, eStr[i][k].length() - 1) + eStr[k][j];
                    }
                }
            }
        }
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

    public void showMeEStr(int k, int i, int j) {
        System.out.print("_______k = " + k + " i = " + i + " j = " + j);
        showMeEStr();
    }

    public void showMeEStr() {
        System.out.println("__________________________" + showCount++);
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print("" + (e[i][j] == inf ? "inf " : (i == j ? "null " : "(" + i + "," + j + " " + eStr[i][j] + " " + e[i][j] + ") ")));
            }
            System.out.println();
        }
    }


    @Test
    public void insertMapNode() {
        String str1 = "315,230 441,230 567,230 693,230 819,230 819,322 819,414 819,506 693,506 567,506 441,506 315,506 315,414 315,322 315,230";
//        int level1 = 1;
        insertMapNodeFun(str1, 1);
        insertMapNodeFun(str1, 2);
        insertMapNodeFun(str1, 3);
        insertMapNodeFun(str1, 4);
        insertMapNodeFun(str1, 5);

    }

    public void insertMapNodeFun(String str, int level) {
        List<String> strings = Arrays.asList(str.split(" "));
        List<MapNode> list = new ArrayList<>();
        int num = 1;
        int size = strings.size();
        for (String xy : strings) {
            MapNode map = new MapNode();
            System.out.println(xy);

            String[] s = xy.split(",");

            map.setX(Integer.parseInt(s[0]));
            map.setY(Integer.parseInt(s[1]));
            map.setLevel(level);
            int nodeId = level * 10000 + num;
            map.setNodeId(nodeId);

            String nextNode = "";
            if (num == 1) {
                nextNode += (level * 10000 + size) + "," + (nodeId + 1);
            } else if (num == size) {
                nextNode += (nodeId - 1) + "," + (level * 10000 + 1);
            } else {
                nextNode += (nodeId - 1) + "," + (nodeId + 1);
            }
            map.setNextNode(nextNode);

            list.add(map);
            num++;
        }
        System.out.println(mapNodeMapper.insertNodes(list));
    }


//    private static SchedulerFactory schedulerFactory = new StdSchedulerFactory();

    @Test
    public void func() {
        List<MapNode> list = mapNodeMapper.getNodesByLevel(1);
//        JSONObject adjacencyMatrix = mapNodeUtils.getAdjacencyMatrix(list);
//        System.out.println(adjacencyMatrix.index);
//        for (boolean[] an : adjacencyMatrix.matrix) {
//            for (boolean b : an) {
//                System.out.print(b + " ");
//            }
//            System.out.println();
//        }

//        Map<Integer, MapNode> map = mapNodeMapper.getMapNodesByLevelToMap(1);
//        System.out.println(map);
//        List<MapNode> list = mapNodeMapper.getNodesByLevel(1);
    }

    @Test
    public void test01() {
        Map<String, String> map = new HashMap<>() {{
            put("123", "123");
            put("324", "234");
        }};
        System.out.println(map);
    }

    @Test
    public void test02(){
        List<MapNode> list = mapNodeMapper.getNodesByLevel(1);
        mapNodeUtils.floydMatrix(list,null);
    }

    @Test
    public void test03(){
        String[] split = "123,456,789".split(",[\\w]+$");
        for (String s:split){
            System.out.println(s);
        }

        System.out.println("123,456,789".split("(\\w+,)+")[0] + "666,777");
    }
    @Test
    public void test04(){
    }
}
