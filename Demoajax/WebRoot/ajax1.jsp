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

<title>My JSP 'ajax1.jsp' starting page</title>

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
			return ActiveXObject("Msxm12.XMLHTTP");//IE6.0
			} catch (e) {
				try {
				return  ActiveXObject("Microsoft.XMLHTTP");//IE5.5以下版本
				} catch (e) {
				alert("请问你用的是什么浏览器？");
				throw e;
				}
			}
		}
	};
	window.onload = function() { //文档加载完毕后执行
		var btn1 = document.getElementById("btn1");
		btn1.onclick = function() { //按钮事件注册监听
			/*Ajax的四步操作
			        目的得到服务器的响应，把相应结果显示到h1
			*/
			//第一步得到异步对象
			var xmlHttp= createXMLHttpRequest();
			//第二步打开与服务器的连接
			/*参数：指定请求方式，指定请求的url,指定是否为异步请求
			*/
			xmlHttp.open("GET","<c:url value='/AServlet'/>",true);
			//第三步发送请求
			xmlHttp.send(null);//get请求没有请求体，但也要给出null,不然火狐浏览器可能会不能发送
			//第四步给出异步对象onreadystatechange事件注册监听器
			xmlHttp.onreadystatechange=function(){//当xmlHttp的状态码发生改变时执行 
			//双重判断：xmlHttp的状态为4和服务器响应的状态码为200
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
			//获取服务器的响应结束
			var text=xmlHttp.responseText;
			//获取h1元素
			var h1=document.getElementById("h1");
			h1.innerHTML=text;
			}
			
			}
		}
	}
</script>
<body>
	<button id="btn1">你可以点击这里</button>
	<h1 id="h1"></h1>
</body>
</html>
