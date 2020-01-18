package com.springmvc.controller;

import com.springmvc.entity.User;
import com.springmvc.service.ILoginService;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping("/admin")
    public String admin(User user, HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv=new ModelAndView();
        JSONObject json =new JSONObject();
        User user1=loginService.findUser(user);
        if(user1!=null){
            mv.setViewName("admin");//跳转到指定的页面
            json.put("success","成功");
            request.getSession().setAttribute("username",user.getUsername());
        }else{
            mv.setViewName("login");
            json.put("errorMsg","用户名或密码错误");
        }
        //HTMLUtils.writeJosn(response,json.toString());
        return "admin";
    }
    @RequestMapping("/logout")
    public String logout(){
        return "login";
    }
}
