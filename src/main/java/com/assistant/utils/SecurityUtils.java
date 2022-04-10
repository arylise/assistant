package com.assistant.utils;

import com.assistant.constant.AssistantContext;
import org.apache.catalina.Manager;
import org.apache.catalina.Session;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.RequestFacade;
import org.apache.catalina.session.StandardSession;
import org.apache.catalina.session.StandardSessionFacade;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class SecurityUtils {
    public static String getUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

    public static String getRole() {
        try {
            Set<String> roles = AuthorityUtils.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
            for (String o : roles) {
                if (AssistantContext.ALL_ROLES.containsKey(o)) {
                    return AssistantContext.ALL_ROLES.get(o);
                }
            }
            throw new Exception("未知角色");
        } catch (Exception e) {
            TestClass.showMe(e.toString());
        }
        return null;
    }

    public static Map<String, String> getPostData(RequestFacade request) {
        int length = 0;
        byte[] bytes = new byte[0];
        try {
            Field innerReq = RequestFacade.class.getDeclaredField("request");
            innerReq.setAccessible(true);
            Request req = (Request) innerReq.get(request);
            Field postData = Request.class.getDeclaredField("postData");
            postData.setAccessible(true);
            Object o = postData.get(req);
            bytes = (byte[]) o;

            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] == 0) {
                    length = i;
                    break;
                }
            }
        } catch (NoSuchFieldException | IllegalAccessException e) {
            e.printStackTrace();
        }
        Map<String, String> postData = new HashMap<>();
        String string = new String(bytes, 0, length, StandardCharsets.UTF_8);
        String[] split = string.split("&");
        for (String s : split) {
            String[] sp = s.split("=");
            postData.put(sp[0], sp[1]);
        }
        return postData;
    }


    public static Map<String, Object> dissectRequest(HttpServletRequest request) {
        Manager manager = getManager(request.getSession());
        if (manager == null) {
            return null;
        }

        Map<String, Object> map = new HashMap<>();
        long sessionSum = manager.getActiveSessions();
        System.out.println("活跃的session数：" + sessionSum);
        map.put("用户在线数", sessionSum);
        Session[] sessions = manager.findSessions();
        printAllUser(sessions, map);
        return map;
    }

    public static void printAllUser(Session[] sessions, Map<String, Object> map) {
        for (int i = 0; i < sessions.length; i++) {
            Session sessioni = sessions[i];
            //session创建时间
            long createTime = sessioni.getCreationTime();
            //session的最后一次访问时间
            long lastAccessedTime = sessioni.getLastAccessedTime();
            Date lastAccessedDate = new Date(lastAccessedTime);
            //距离最后一次访问，已经过去的时长
            long length = 1800000L - (System.currentTimeMillis() - lastAccessedTime);

            HttpSession session1 = sessioni.getSession();
            String username = (String) session1.getAttribute("username");
            String role = (String) session1.getAttribute("role");
            String detail = "sessionID：" + sessioni.getId() + " username:" + username + " role:" + role + " 创建时间--" + new Date(createTime) + "--上次登录时间--" + lastAccessedDate + " -距离掉线时长：" + length / 1000 + "秒";
            System.out.println(detail);
            map.put("第" + (i + 1) + "位用户", detail);
        }
    }

    public static Manager getManager(HttpSession session) {
        try {
            if (session instanceof StandardSessionFacade) {
                Field sessionFacadeField = session.getClass().getDeclaredField("session");
                sessionFacadeField.setAccessible(true);
                HttpSession httpSession = (HttpSession) sessionFacadeField.get(session);
                if (httpSession instanceof StandardSession) {
                    Field managerFiled = StandardSession.class.getDeclaredField("manager");
                    managerFiled.setAccessible(true);
                    return (Manager) managerFiled.get(httpSession);
                }
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
}
