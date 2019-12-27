package com.springmvc.controller;

import com.springmvc.entity.User;
import com.springmvc.service.ILoginService;
import com.springmvc.service.impl.LoginServiceImpl;

import net.sf.json.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private ILoginService loginService;

    @ResponseBody
   @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, Model model) {
        String msg=request.getParameter("msg");
        if(msg!=null){
            model.addAttribute("msg",msg);
        }
        /*User resultUser = loginService.findUser(user);
        Map<String, String> map = new HashMap<String, String>();
        if(null == resultUser){
            map.put("code","0");
            map.put("msg","登录成功！");
            return map;
        }*/
        return "login";
    }

    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String login(String username, String password, Model model, HttpSession session){
        User user=loginService.findUser(username,password);
        if(user!=null){
            session.setAttribute("USER_LOGIN",user);
            return "redirect:/admin";
        }
        model.addAttribute("msg","账号或密码错误，请重新输入！");
        return "redirect:/login";
    }
}


