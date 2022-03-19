package com.assistant.controller;

import com.assistant.utils.RedisUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("/test")
public class TestController {

    private final RedisUtils redisUtils;

    @RequestMapping("/test_{n}")
    public String test(@PathVariable String n) {
        return "/test/test_" + n + ".html";
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
}
