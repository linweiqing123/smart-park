package com.springmvc.entity;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import java.util.Map;

public class GetApiMsgTest {
    public static void main(String[] args) {

        //发送 GET 请求，第一个参数为url，第二个参数为请求参数
        String s = GetApiMsgTest.sendGet1("http://api.heclouds.com/devices/553157946/datastreams", "");
        System.out.println(s);

    }

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url：发送请求的URL
     * @param param：请求参数，请求参数应该是 name1=value1&name2=value2&name3=value3 的形式。
     * @return String[result]：所代表远程资源的响应结果
     */
    public static String sendGet1(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);

            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();

            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            //connection.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            connection.setRequestProperty("content-type", "application/json;charset=utf-8");   //设置返回格式
            connection.setRequestProperty("api-key", "zzNrFTV=f5hC9Zw6LqPChar1TGE=");   //设置api-key
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
        JSONArray dataJSON = jsonData.getJSONArray("data");
        System.out.println(dataJSON);
        /*String updateAt=dataJSON.getString("update_at");
        String createTime=dataJSON.getString("create_time");
        String currentValue=dataJSON.getString("current_value");
        System.out.println(updateAt);
        System.out.println(createTime);
        System.out.println(currentValue);*/

                return result;
            }

        }

