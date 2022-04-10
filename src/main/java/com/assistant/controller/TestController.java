package com.assistant.controller;

import com.assistant.utils.RedisUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.MessageFormat;

@Controller
@RequiredArgsConstructor
@RequestMapping("/test")
public class TestController {

    private final RedisUtils redisUtils;

    @RequestMapping("/test_{n}")
    public String test(@PathVariable String n) {
        return MessageFormat.format("/test/test_{0}.html", n);
    }

    @RequestMapping("/redis")
    @ResponseBody
    public String redis_set(@RequestParam("key") String key, @RequestParam("value") String value, @RequestParam("act") String act) {
        return switch (act) {
            case "set" -> String.valueOf(redisUtils.set(key, value));
            case "get" -> redisUtils.get(key);
            case "del" -> String.valueOf(redisUtils.del(key));
            case "update" -> String.valueOf(redisUtils.update(key, value));
            default -> "error act";
        };
    }

    @RequestMapping("/username")
    @ResponseBody
    public String username(@CookieValue("username") String cookieUsername, @SessionAttribute("username") String sessionUsername) {
        return "cookieUsername:" + cookieUsername + " sessionUsername:" + sessionUsername;
    }
}
