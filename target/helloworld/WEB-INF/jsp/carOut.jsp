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
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css"
          href="css/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <link rel="stylesheet" type="text/css" href="css/color.css">
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body>
<!--导航栏开始-->
<%--<c:import url="navbarModel.jsp"></c:import>--%>

<div style="margin: 40px 0;"></div>
<input class="easyui-searchbox"
       data-options="prompt:'请输入搜索信息',menu:'#mm',searcher:doSearch"
       style="width: 300px">
<div id="mm">
    <div data-options="name:'chehao'">按车牌号搜索</div>
    <div data-options="name:'kahao'">按停车卡号搜索</div>
</div>
<div style="margin: 30px 0;"></div>
<table id="dg" title="车辆列表" class="easyui-datagrid"
       style="height: 350px" url="CarAction/CarInfoFindAll.do"
       toolbar="#toolbar" pagination="true" rownumbers="true"
       fitColumns="true" singleSelect="true" >
    <thead>
    <tr>
        <th field="rushijian" width="30">入场时间</th>
        <th field="chexing" width="30">车型</th>
        <th field="chehao" width="30">车牌号</th>
        <th field="kahao" width="30">停车卡号</th>
        <th field="beizhu" width="30">备注信息</th>
        <th field="action" width="30" formatter="formatAction">设置出场</th>
    </tr>
    </thead>

</table>

<script type="text/javascript">
    function formatAction(value, row, index) {
        var e = '<a href="javascript:void(0)" onclick="che_chuchang()">设置出场</a>';
        return e;
    }

    function che_chuchang() {
        var row = $('#dg').datagrid('getSelected');
        //loginService.jisuanfeiyong(id,rushijian,chushijian,callback);
        var url = "CarAction/CarInfoUpdate.do?id=" + row.id + "&rushijian="
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
</html>