<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
    <meta http-equiv="description" content="This is my page" />
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <link rel="stylesheet" type="text/css" href="css/color.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body background="images/6.jpg"  width="100%" height="100%"
      leftmargin="2" topmargin="2">
<!--导航栏开始-->
<c:import url="navbarModel.jsp"></c:import>
<div style="margin: 60px 0;"></div>
<table width="98%" border="0" cellpadding="2" cellspacing="1"
       bgcolor="#D1DDAA" align="center" style="margin-top: 8px">
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="3">&nbsp;车位信息&nbsp;</td>
    </tr>
    <tr align='center' height="22">
        <td width="15%" align="right">创建时间：</td>
        <td width="85%" align="left">
            ${create_time}</td>
    </tr>
    <tr align='center' height="22">
        <td width="15%" align="right">更新时间：</td>
        <td width="85%" align="left">
            ${update_at}</td>
    </tr>
    <%--<tr align='center' height="22">
        <td width="15%" align="right">id：</td>
        <td width="85%" align="left">
            ${id}</td>
    </tr>--%>
    <tr align='center' height="22">
        <td width="15%" align="right">有无空位：</td>
        <td width="85%" align="left">
            ${current_value}（1为有，0为无）</td>
    </tr>
   <%-- <tr align='center' height="22">
        <td width="15%" align="right">产生费用：</td>
        <td width="85%" align="left">
            ${feiyong}(￥)</td>
    </tr>
    <tr align='center' height="22">
        <td width="15%" align="right">剩余车位：</td>
        <td width="85%" align="left">
            ${num}(个)</td>
    </tr>--%>
    <div>
        <a href="javascript:void(0)" class="easyui-linkbutton c6"
           onclick="fanhui()" >返回</a>
    </div>
</table>
</body>
<script type="text/javascript">
    function fanhui() {
        window.history.back(-1);
    }
</script>
</html>
