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
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<!--导航栏开始-->
<div class="container-fluid">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header"
                 style="margin-top: 8px; margin-right: 30px">
                <a href="<%=basePath%>First"><img
                        style="height: 55px; width: 55px" title="点击跳转"
                        src="images/logo-max.png"></a>
            </div>

            <div class="collapse navbar-collapse"
                 id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" style="padding: 10px">
                    <li><a href="<%=basePath%>First">首页</a></li>
                    <li><a href="<%=basePath%>CarController/Record">停车记录</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right" style="padding: 6px">
                    <%--<li><a><img
                            style="width: 30px; height: 30px; border-radius: 50%;"
                            src="<%=userImg%>${USER_LOGIN.headImg}"></a></li>--%>
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                                            data-toggle="dropdown"><img style="height: 20px; width: 20px"
                                                                        src="images/logo-user.png"><strong
                            class="caret"></strong></a>
                        <ul class="dropdown-menu">
                           <%-- <li><a href="<%=basePath%>user/userSetting"><img
                                    class="icon" src="images/setting.png"><span
                                    class="icon-text">个人设置</span></a></li>
                            <li><a href="https://www.baidu.com" target="_Blank"><img
                                    class="icon" src="images/help.png"><span
                                    class="icon-text">帮助</span></a></li>
                            <li class="divider"></li>--%>
                            <li><a href="<%=basePath%>logout"><img
                                    class="icon" src="images/out.png"><span
                                    class="icon-text">退出系统</span></a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>