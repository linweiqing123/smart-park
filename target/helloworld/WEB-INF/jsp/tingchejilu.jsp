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
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
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
<body background="images/6.jpg"  width="100%" height="100%">
    <div style="margin: 60px 0;"></div>
	<c:import url="navbarModel.jsp"></c:import>
	<input class="easyui-searchbox"
		data-options="prompt:'请输入搜索信息',menu:'#mm',searcher:doSearch"
		style="width: 300px">
	<div id="mm">
		<div data-options="name:'chehao'">按车牌号搜索</div>
	</div>
	<%--<div style="margin: 30px 0;"></div>--%>
	<table id="dg" title="车辆列表" class="easyui-datagrid" toolbar="#toolbar"
		style="height: 350px" url="CarController/CarInfoFind"
		toolbar="#toolbar" pagination="true" rownumbers="true"
		fitColumns="true" singleSelect="true">
		<thead>
			<tr>
				<th field="rushijian" width="30">入场时间</th>
				<th field="chehao" width="30">车牌号</th>
				<th field="beizhu" width="30">备注信息</th>
				<th field="chushijian" width="30">出场时间</th>
				<th field="feiyong" width="30">费用</th>
				<th field="action" width="30" formatter="formatAction">操作</th>
			</tr>
		</thead>

	</table>
	<script type="text/javascript">
		function formatAction(value, row, index) {
			var d = '<a href="javascript:void(0)" onclick="destroyCar()"> 删除 </a>';
			return d;
		}

		function destroyCar() {
			var row = $('#dg').datagrid('getSelected');
			if (row) {
				$.messager.confirm('删除', '你确定删除这条信息吗?', function(r) {
					if (r) {
						$.post('CarController/CarInfoDel', {
							id : row.id
						}, function(result) {
							if (result.success) {
								$('#dg').datagrid('reload'); // reload the user data
							} else {
								$.messager.show({ // show error message
									title : 'Error',
									msg : result.errorMsg
								});
							}
						}, 'json');
					}
				});
			}
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