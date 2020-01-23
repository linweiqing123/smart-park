package com.springmvc.controller;

import com.springmvc.entity.CarInfo;
import com.springmvc.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/CarController")
public class CarController {
    @Autowired
    private ICarService carService;

    @RequestMapping("/CarInto")
    public String CarIntoController(){

        return "carInto";
    }

    @RequestMapping("/CarOut")
    public String CarOutController(){
        return "carOut";
    }

    // 车辆入场
    @RequestMapping("/CarInfoAdd")
    public ModelAndView CarInfoAdd(CarInfo carInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ModelAndView mv = new ModelAndView();
        carInfo.setFeiyong(new Long(0));
        carService.doCreate(carInfo);
        List<CarInfo> list = new ArrayList<CarInfo>();
        list = carService.findAll();
        if (list != null) {
            int num = 100;
            num = num - list.size();
            mv.addObject("num", num);
            mv.setViewName("rusuccess");
        } else {
        mv.addObject("msg", "你输入的停车卡号不存在，请重新输入");
        mv.setViewName("msg");
        }
        return mv;
    }

}