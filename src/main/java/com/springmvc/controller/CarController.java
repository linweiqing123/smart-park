package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarController {
    @RequestMapping("/carInto")
    public String CarController(){
        return "carInto";
    }

}