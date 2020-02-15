<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=0">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link
            href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="<%=basePath%>js/jquery.validate.min.js"
            type="text/javascript"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>首页</title>
    <link rel="stylesheet" href="<%=basePath%>css/admin.css" type="text/css">
</head>
<body>

<c:import url="navbarModel.jsp"></c:import>

<!--主体信息开始-->
<!--欢迎语-->
<div class="container">
    <div class="row">
        <div class="col-md-12 column">
            <div class="welcome">
                <h2>欢迎您使用停车场收费系统!</h2>
                <p> 拥有车库：1个&emsp;&emsp;&emsp;拥有车位：8个</p>
            </div>
        </div>
    </div>
</div>
<!--功能模块-->
<div class="container two">
    <div class="row">
        <div class="col-md-11 column">

            <div class="col-md-1 column"></div>
            <!--进入模块-->
            <div class="col-md-3 column" style="background: #f40;"
                 onclick="carInto()">
                <img src="images/logo-one.png">
                <h2>车辆入库</h2>
                <p>录入车辆信息，分配停车位置</p>
            </div>


            <div class="col-md-1 column"></div>

            <!--出去模块-->
            <div class="col-md-3 column" style="background: #00B51D"
                 onclick="carOut()">
                <img src="images/logo-two.png">
                <h2>车辆出库</h2>
                <p>车辆出库，计算停车费用</p>
            </div>

            <div class="col-md-1 column"></div>

            <!--车位查询模块-->
            <form action="<%=basePath%>GetMsg">
                <div class="col-md-3 column" style="background: #30A080"
                     onclick="search()">
                    <img src="images/logo-three.png">
                    <h2>搜索一下</h2>
                    <p>搜索停车位信息</p>
                </div>
            </form>

        </div>
    </div>
</div>

<script type="text/javascript">

    function carInto() {
        window.location.href='/CarController/CarInto';
    }

    function carOut() {
        window.location.href='/CarController/CarOut';
    }

    function one() {
        window.location.href='/GetMsg1'
    }

    function two() {
        window.location.href='/GetMsg2'
    }

   function search() {
       $("#myModalSearch").modal('show');
   }

</script>

<!--搜索模态框-->
<div class="modal fade" id="myModalSearch" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">搜索</h4>
            </div>
            <div class="modal-body">
                <form class="form-group" onclick="one()" >车位1</form>
                <form class="form-group" onclick="two()" >车位2</form>
            </div>

        </div>
    </div>
</div>

</body>
</html>

