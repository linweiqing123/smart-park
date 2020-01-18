package com.springmvc.controller;

import com.springmvc.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
    @RequestMapping("/user")
    public class UserController {

        @Autowired
        private ILoginService loginService;

    @RequestMapping("/userSetting")
        public String usersetting(){
        return "userSetting";
    }

}


