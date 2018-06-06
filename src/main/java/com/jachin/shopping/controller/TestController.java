package com.jachin.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TestController {

    @RequestMapping("/test")
    public String test(){
        return "test";
    }

    @RequestMapping("/kind/{id}")
    public String kind(@RequestParam("id")Integer id){
        System.out.println(id);
        return "test";
    }
}
