package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.constant.AssistantContext;
import com.assistant.service.intf.UserService;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.RequestFacade;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final UserService userService;

    @RequestMapping("/")
    public String voidRequest() {
        return "index";
    }

    @RequestMapping(value = {"/index", "/login", "/signup", "/login_error"})
    public String index(HttpServletRequest request) {
        return request.getRequestURI();
    }


    @RequestMapping(value = "/login_success")
    public String loginSuccess(RequestFacade request, HttpServletResponse response) throws IOException {

        String postData = getPostData(request);
        String[] split = postData.split("&");
        for (String s : split) {
            String[] sp = s.split("=");
            if (StringUtils.equals(sp[0], "username")) {
                Cookie cookie = new Cookie(sp[0], sp[1]);
                response.addCookie(cookie);
            }
        }
        System.out.println(postData);
        return "/index";
    }

    @RequestMapping("/main")
    public String main() {
        String role = userService.checkRole();
        for (String allRole : AssistantContext.ALL_ROLES) {
            if (StringUtils.equals(allRole, role)) {
                return role.toLowerCase().substring(5, role.length()) + "/main";
            }
        }
        return null;
    }

    private String getPostData(RequestFacade request) {
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
        return new String(bytes, 0, length, StandardCharsets.UTF_8);
    }
}
