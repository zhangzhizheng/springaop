<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'ajax3.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<script type="text/javascript">
	//创建异步对象
	function createXMLHttpRequest() {
		try {
			return new XMLHttpRequest();
		} catch (e) {
			try {
				return ActiveXObject("Msxm12.XMLHTTP"); //IE6.0
			} catch (e) {
				try {
					return ActiveXObject("Microsoft.XMLHTTP"); //IE5.5以下版本
				} catch (e) {
					alert("请问你用的是什么浏览器？");
					throw e;
				}
			}
		}
	}
	;
	window.onload = function() {
		var username = document.getElementById("p1");
		username.onblur = function() {
			//1.得到异步对象
			var xmlHttp = createXMLHttpRequest();
			//2.打开连接
			
			//xmlHttp.open("POST", "/Demoajax/BServlet", true);
			xmlHttp.open("POST", "<c:url value='/BServlet'/>", true);
			//3.设置请求
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			//4.发送请求
			xmlHttp.send("username=" + username.value);
			//5.给xmlHttp的onreadystatechange事件注册监听
			
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) { //双重判断
					//获取服务器的响应
					var text = xmlHttp.responseText;
					var span = document.getElementById("error");
					if (text == 1) {
						span.innerHTML = "用户名已被注册";
					} else {
						span.innerHTML = "";
					}
				}
			}
		}

	}
</script>

<body>

	<form action="/BServlet" method="post">
		用户名： <input type="text" name="username" value="" id="p1" /><span id="error"></span><br/> 
		密 码：<input type="password" name="pwd" value="" id="p2" /><br /> 
		<input type="submit" value="注册" />
	</form>
</body>
</html>
