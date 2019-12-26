package com.springmvc.controller;

import com.springmvc.entity.User;
import com.springmvc.service.ILoginService;
import com.springmvc.service.impl.LoginServiceImpl;

import net.sf.json.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private ILoginService loginService;

    @ResponseBody
    @RequestMapping(value = "/login")
    public Map<String, String> login(User user) {
        User resultUser = loginService.findUser(user);
        Map<String, String> map = new HashMap<String, String>();
        if(null == resultUser){
            map.put("code","0");
            map.put("msg","登录成功！");
            return map;
        }
        return null;
    }
}
