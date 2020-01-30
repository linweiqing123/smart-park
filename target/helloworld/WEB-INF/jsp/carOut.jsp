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
    <meta name="viewport" content="width=device-width, initial-scale=0">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="js/jquery.validate.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <link rel="stylesheet" type="text/css" href="css/color.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet"  type="text/css">
    <title>车辆出库</title>
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
    <div style="margin: 60px 0;"></div>
    <input class="easyui-searchbox"
           data-options="prompt:'请输入搜索信息',menu:'#mm',searcher:doSearch"
           style="width: 300px"></input>
    <div id="mm">
        <div data-options="name:'chehao'">按车牌号搜索</div>
    </div>
    <div style="margin: 30px 0;"></div>
    <table id="dg" title="车辆列表" class="easyui-datagrid"
           style="height: 350px" url="CarController/CarInfoFindAll"
           toolbar="#toolbar" pagination="true" rownumbers="true"
           fitColumns="true" singleSelect="true">
        <thead>
        <tr>
            <th field="rushijian" width="30">入场时间</th>
            <th field="chehao" width="30">车牌号</th>
            <th field="beizhu" width="30">备注信息</th>
            <th field="action" width="30" formatter="formatAction">设置出场</th>
        </tr>
        </thead>

    </table>
    <style type="text/css">
        #fm {
            margin: 0;
            padding: 10px 30px;
        }

        .ftitle {
            font-size: 14px;
            font-weight: bold;
            padding: 5px 0;
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        .fitem {
            margin-bottom: 5px;
        }

        .fitem label {
            display: inline-block;
            width: 80px;
        }

        .fitem input {
            width: 160px;
        }
    </style>
</body>
<script type="text/javascript">
    function formatAction(value, row, index) {
        var e = '<a href="javascript:void(0)" onclick="che_chuchang()">设置出场</a>';
        return e;
    }

    function che_chuchang() {
        var row = $('#dg').datagrid('getSelected');
        var url = "CarController/CarInfoUpdate?id=" + row.id + "&rushijian="
            + row.rushijian;
        window.location.href = url;
    }

    function doSearch(value, name) {
        if (value == "") {
            $("#dg").datagrid("load", {
                "name" : null,
                "value" : value
            });
        } else {
            $("#dg").datagrid("load", {
                "name" : name,
                "value" : value
            });
        }
        document.formSearch.submit();
    }
</script>
</html>