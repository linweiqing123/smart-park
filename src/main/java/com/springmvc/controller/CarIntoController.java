package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarIntoController {
    @RequestMapping("/carInto")
    public String CarIntoController(){
        return "carInto";
    }

}