<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String userImg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=0">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link
            href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="js/jquery.validate.min.js"
            type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <link rel="stylesheet" type="text/css" href="css/color.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script
            src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/carInto.css"
          type="text/css">
    <title>车辆入库</title>
    <style type="text/css">
        .orderParkInfo {
            margin-left: 30px;
        }

        .orderParkInfoDiv {
            background: #dff0d8;
            width: 400px;
            height: 100px;
            margin-left: 100px;
            padding-top: 20px;
            border-radius: 10px;
        }

        span.orderFont {
            color: #f40;
        }
    </style>
</head>
<body background="images/6.jpg"  width="100%" height="100%">
<!--导航栏开始-->
<c:import url="navbarModel.jsp"></c:import>
<!--主体信息开始-->
<form  style="display:block;margin-top:80px" action="CarController/CarInfoAdd" name="formAdd" method="post">
    <table width="40%" border="0" cellpadding="2" cellspacing="1"
            align="center" style="margin-top: 8px">
        <tr >
            <td height="14" colspan="3">&nbsp;车辆入场&nbsp;</td>
        </tr>
        <tr align='center' height="22">
            <td width="25%"  align="right">入场时间：</td>
            <td width="75%"  align="left">
            <input name="rushijian" size="20" class="easyui-datetimebox"
                   data-options="required:true,editable:false" />
        </tr>
        <%--<tr align='center' height="22">
            <td width="25%"  align="right">停车卡号：</td>
            <td width="75%"  align="left"><input
                    type="text" name="kahao" size="20" /></td>--%>
        </tr>
        <tr align='center' height="22">
            <td width="25%"  align="right">车牌号：</td>
            <td width="75%"  align="left"><input
                    required="true" type="text" name="chehao" size="20" /></td>
        </tr>
<%--        <tr align='center' height="22">
            <td width="25%"  align="right">车位：</td>
            <td width="75%"  align="left"><input
                    required="true" type="text" name="kahao" size="20" /></td>
        </tr>--%>
        <tr align='center' height="22">
            <td width="25%"  align="right">备注信息：</td>
            <td width="75%"  align="left"><input
                    type="text" name="beizhu" size="20" /></td>
        </tr>
        <tr align='center' height="22">
            <td width="25%"  align="right">&nbsp;</td>
            <td width="75%"  align="left"><input
                    type="button" value="提交" onclick="check()" />&nbsp; <input
                    type="reset" value="重置" />&nbsp;</td>
        </tr>
    </table>
</form>

</body>
</html>