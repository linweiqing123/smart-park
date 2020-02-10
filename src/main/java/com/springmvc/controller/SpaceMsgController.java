package com.springmvc.controller;



import com.springmvc.entity.GetApiMsgTest;
import com.springmvc.entity.Spacemsg;
import com.springmvc.service.SpaceMsgService;
import net.sf.json.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import util.HTMLUtils;
import util.JSONUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class SpaceMsgController {
    @Autowired
    private SpaceMsgService spaceMsgService;

    @RequestMapping("/SpaceMsg")
    public void SpaceMsg(HttpServletRequest request, HttpServletResponse response) {
        List<Spacemsg> list=new ArrayList<Spacemsg>();
        Spacemsg spacemsg=new Spacemsg();
        list=spaceMsgService.find();
        System.out.println(list);
        request.getSession().setAttribute("list", list);
        String jsonStr = JSONUtils.writeValueAsString(list);
        HTMLUtils.writeJosn(response, jsonStr);
       /* ModelAndView mv=new ModelAndView();
        mv.addObject("updateAt",updateAt);
        mv.addObject("createTime",createTime);
        mv.addObject("currentValue",currentValue);
        mv.setViewName("cheweixinxi");
        return mv;*/
    }

    @RequestMapping("/GetMsg")
    public  ModelAndView sendGet1() {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString ="http://api.heclouds.com/devices/553149658/datastreams/car_flag"+ "?" +"";
            URL realUrl = new URL(urlNameString);

            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();

            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            //connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.setRequestProperty("content-type", "application/json;charset=utf-8");   //设置返回格式
            connection.setRequestProperty("api-key", "4M7DiU07qTEbRPuSz5oKHtQy=Dw=");   //设置api-key
            // 建立实际的连接
            connection.connect();

            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();

            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }

            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }

        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        JSONObject jsonData = JSONObject.fromObject(result);
        System.out.println(jsonData);
        JSONObject dataJSON = jsonData.getJSONObject("data");
        System.out.println(dataJSON);
        String updateAt=dataJSON.getString("update_at");
        String createTime=dataJSON.getString("create_time");
        String currentValue=dataJSON.getString("current_value");
        System.out.println(updateAt);
        System.out.println(createTime);
        System.out.println(currentValue);
        ModelAndView mv=new ModelAndView();
        mv.addObject("updateAt",updateAt);
        mv.addObject("createTime",createTime);
        mv.addObject("currentValue",currentValue);
        mv.setViewName("cheweixinxi");
        return mv;
    }
}


