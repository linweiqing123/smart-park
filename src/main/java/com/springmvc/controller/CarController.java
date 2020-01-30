package com.springmvc.controller;

import com.springmvc.entity.CarInfo;
import com.springmvc.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import util.HTMLUtils;
import util.JSONUtils;
import util.Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/CarController")
public class CarController {
    @Autowired
    private ICarService carService;
    int num;
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
        num = 30;
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

    // 查询未出场车辆信息
    @RequestMapping("/CarInfoFindAll")
    public void CarInfoFindAll(String value, String name,
                               HttpServletResponse response) throws IOException {
        List<CarInfo> list = new ArrayList<CarInfo>();
        list = carService.findAll();
        CarInfo carInfo = new CarInfo();
        if ("chehao".equals(name)) {
            carInfo.setChehao(value);
            list = carService.searchchu(carInfo);
        }  else {
            list = carService.findAll();
        }
        String jsonStr = JSONUtils.writeValueAsString(list);
        HTMLUtils.writeJosn(response, jsonStr);
    }

    // 根据停车时间进行车辆计费
    @RequestMapping("/CarInfoUpdate")
    public ModelAndView CarInfoUpdate(int id, String rushijian, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        String chushijian = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")
                .format(new Date()); // 自动获取当前时间做为出场时间

        long feiyong = 5; // 停车初始费用为5元
        Date aa = Util.newDate1(rushijian);
        Date bb = Util.newDate1(chushijian);

        long gg = bb.getTime() - aa.getTime();
        long fenzhong = gg / 1000 / 60;// 计算停车时间

        if (fenzhong <= 60) {
            feiyong = feiyong + 0;
        }
        if (fenzhong > 60 && fenzhong <= 120) {
            feiyong = feiyong * 2;
        }
        if (fenzhong > 120 && fenzhong <= 180) {
            feiyong = feiyong * 3;
        }
        if (fenzhong > 180 && fenzhong <= 240) {
            feiyong = feiyong * 4;
        }
        if (fenzhong > 240 && fenzhong <= 300) {
            feiyong = feiyong * 5;
        }
        if (fenzhong > 300 && fenzhong <= 360) {
            feiyong = feiyong * 6;
        }
        if (fenzhong > 360 && fenzhong <= 420) {
            feiyong = feiyong * 7;
        }
        if (fenzhong > 420 && fenzhong <= 480) {
            feiyong = feiyong * 8;
        }
        if (fenzhong > 480 && fenzhong <= 540) {
            feiyong = feiyong * 9;
        }
        if (fenzhong > 540 && fenzhong <= 600) {
            feiyong = feiyong * 10;
        }
        if (fenzhong > 600) {
            feiyong = 100;
        }

        CarInfo carInfo = new CarInfo();
        carInfo.setId(id);
        carInfo.setRushijian(rushijian);
        carInfo.setChushijian(chushijian);
        carInfo.setFeiyong(feiyong);
        int i=carService.updata(carInfo);
        if(i>0) {
            num = num + 1;
            carInfo=carService.findById(id);
            mv.addObject("num", num);
            mv.addObject("chehao", carInfo.getChehao());
            mv.addObject("rushijian", rushijian);
            mv.addObject("chushijian", chushijian);
            mv.addObject("fenzhong", fenzhong);
            mv.addObject("feiyong", feiyong);
            mv.setViewName("feiyong");
        }
        return mv;
    }
}