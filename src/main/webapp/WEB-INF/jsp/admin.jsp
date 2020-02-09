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
                <h2><%--${USER_LOGIN.name},--%>欢迎您使用停车场收费系统!</h2>
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
                    <p>搜索停车位和车辆信息</p>
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

    function search() {
        window.location.href='/SpaceMsg'
    }

   /* function searchcaspace() {
        var v = $("#carspacename").val();
        if (v == "" || v == " " || v == null) {
            $("#error").html("<p style='color:red;margin-left:150px'>车位名不能为空</p>");
            return;
        } else {
            $("#error").html("<p id='error'></p>")
        }
        $.ajax({
            async: false,
            url: "http://api.heclouds.com/devices/553149658/datastreams/car_flag",
            data: {
                /!*"carspacename": $("#carspacename").val()*!/
            },
            type: "GET",
            dataType: 'jsonp',  // 请求方式为jsonp
            jsonpCallback: "onBack",
            success: function (data) {
                if (errno==0) {
                    var state;
                    if (data.current_value == 1) {
                        state = "有车";
                    } else {
                        state = "无车";
                    }
                    var la = "<p>创建时间：" + data.create_time
                        + "<br>" + "更新时间：" + data.update_at
                        + "&emsp;&emsp;" + "<br>"
                        + "id：" + data.id
                        + "有无空位：" + data.current_value + "<br>"  + "</p>";
                    $("#spaceInfo").html(la);
                } else {
                    $("#spaceInfo").html("<p style='color:red'>没有查询到该车位</p>");
                }
            },
            fail: function (e) {
                alert("fail");
            },
            error: function (e) {
                alert("error");
            }
        })
    }*/

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
                <form class="form-horizontal" id="searchInfo">
                    <p id="carspaceInfo"></p>
                    <div class="form-group">
                        <div class="panel panel-success"
                             style="display: block; width: 450px; margin-left: 80px">
                            <div class="panel-heading">
                                <p id="orderInfo" style="line-height: 25px"></p>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="carspacename" class="col-sm-3 control-label">车位名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" id="carspacename"
                                   placeholder="输入车位名" name="carspacename"/>
                        </div>
                        <span class="col-sm-3" onclick="searchcaspace()"
                              style="display: block; padding: 0; background: #f40; width: 40px; text-align: center; border-radius: 5px; color: white; margin-top: 5px;">搜索</span>
                    </div>
                    <p id="error"></p>
                    <div class="form-group">
                        <div class="panel panel-success"
                             style="width: 450px; margin-left: 80px">
                            <div class="panel-heading">
                                <p id="spaceInfo" style="line-height: 25px"></p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>

