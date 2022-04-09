package com.assistant.controller;

import com.alibaba.druid.util.StringUtils;
import com.assistant.service.intf.UserService;
import com.assistant.utils.CacheUtils;
import lombok.RequiredArgsConstructor;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.RequestFacade;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.text.MessageFormat;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final UserService userService;
    private final CacheUtils cacheUtils;

    @RequestMapping("/")
    public String voidRequest() {
        return "index";
    }

    @RequestMapping(value = {"/index", "/login", "/signup", "/login_error"})
    public String index(HttpServletRequest request) {
        return request.getRequestURI();
    }


    @RequestMapping(value = "/login_success")
    public String loginSuccess(RequestFacade request, HttpServletResponse response) {

        String postData = getPostData(request);
        String[] split = postData.split("&");
        for (String s : split) {
            String[] sp = s.split("=");
            if (StringUtils.equals(sp[0], "username")) {
                Cookie cookie = new Cookie(sp[0], sp[1]);
                response.addCookie(cookie);
                cacheUtils.delProjectList(sp[1]);
            }
        }
        return "redirect:/";
    }

    @RequestMapping("/main")
    public String main() {
        String role = userService.checkRole();
        if (StringUtils.isEmpty(role)) {
            return null;
        }
        return MessageFormat.format("{0}/main", role);
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
