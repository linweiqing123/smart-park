package com.springmvc.controller;

import com.springmvc.entity.User;
import com.springmvc.service.ILoginService;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import util.HTMLUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
    @Autowired
    private ILoginService loginService;
    @RequestMapping("/login")
    public String login()
    {
        return "login";
    }

    @RequestMapping("/First")
    public String First(){
        return "admin";
    }

    @RequestMapping("/admin")
    public ModelAndView admin(User user){
        ModelAndView mv=new ModelAndView();
        //JSONObject json =new JSONObject();
        User user1=loginService.findUser(user);
        if(user1!=null){
            mv.setViewName("admin");//跳转到指定的页面
           // mv.addObject("msg","成功");
           // request.getSession().setAttribute("username",user.getUsername());
        }else{
            mv.setViewName("login");
            mv.addObject("msg","用户名或密码错误");
    }
        //HTMLUtils.writeJson(response,json.toString());
        return mv;
    }

    @RequestMapping("/logout")
    public String logout(){
        return "login";
    }
}
