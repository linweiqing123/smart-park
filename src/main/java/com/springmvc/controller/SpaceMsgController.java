package com.springmvc.controller;


import com.springmvc.entity.Spacemsg;
import com.springmvc.service.SpaceMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import util.HTMLUtils;
import util.JSONUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class SpaceMsgController {
    @Autowired
    private SpaceMsgService spaceMsgService;

    @RequestMapping("/SpaceMsg")
    public void SpaceMsg(HttpServletRequest request, HttpServletResponse response) {
        List<Spacemsg> list=new ArrayList<Spacemsg>();
        //Spacemsg spacemsg=new Spacemsg();
        list=spaceMsgService.find();
        request.getSession().setAttribute("list", list);
        String jsonStr = JSONUtils.writeValueAsString(list);
        HTMLUtils.writeJosn(response, jsonStr);

    }
}

