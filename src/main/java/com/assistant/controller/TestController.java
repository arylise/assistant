package com.assistant.controller;

import com.assistant.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    private RedisUtils redisUtils;

    @RequestMapping("/test")
    public String test(@RequestParam("n") String n) {
        return "/test/test_" + n + ".html";
    }

    @RequestMapping("/redis")
    @ResponseBody
    public String redis_set(@RequestParam("key") String key, @RequestParam("value") String value, @RequestParam("act") String act) {
        switch (act) {
            case "set":
                return String.valueOf(redisUtils.set(key, value));
            case "get":
                return redisUtils.get(key);
            case "del":
                return String.valueOf(redisUtils.del(key));
            case "update":
                return String.valueOf(redisUtils.update(key, value));
        }
        return "error act";
    }
}
