package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Carson
 * @Date 2019/12/15 23:06
 */
@Controller
public class JSPController {
    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }

    @RequestMapping("/bottomModel")
    public String bottomModel(){
        return "bottomModel";
    }

    @RequestMapping("/carInto")
    public String carInto(){
        return "carInto";
    }
}
