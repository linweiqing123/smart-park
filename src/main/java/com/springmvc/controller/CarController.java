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
        int num = 2;
        num = num - list.size();
        if (list != null) {
            mv.addObject("num", num);
            mv.setViewName("rusuccess");
        }if(num<0) {
            mv.addObject("msg", "车位已满");
            mv.setViewName("msg");
        }
        return mv;
    }

}