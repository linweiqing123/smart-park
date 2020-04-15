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
	成功入场！<br>
	剩余车位数量：${num}(个)
	<div> </div>
	<a href="javascript:void(0)" class="easyui-linkbutton c6"
	   onclick="fanhui()" >返回</a>
</body>
<script type="text/javascript">
    function fanhui() {
        window.history.back(-1);
    }
</script>
</html>