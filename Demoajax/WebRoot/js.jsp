<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>异步</title>
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
  window.onload=function(){//在文档加载完成后马上执行
  var btn1=document.getElementById("btn1");
  //给btn1onclick事件注册监听
  btn1.onclick=function(){//在按钮被点击时执行
  //获取h1元素对应的dom对象
   var h1=document.getElementById("h1");
   console.log(h1);
   //给h1添加内容
   h1.innerHTML="hello js!"
  };
  };
  </script>
  <body>
    <button id="btn1">你可以点击这里</button>
    <h1 id="h1"></h1>
  </body>
</html>
