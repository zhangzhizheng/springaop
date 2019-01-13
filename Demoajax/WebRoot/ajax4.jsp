<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajax4.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

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
		
		var btn1=document.getElementById("btn1");
		btn1.onclick=function(){
	     	//1.得到异步对象
			var xmlHttp = createXMLHttpRequest();
			//2.打开连接
			//xmlHttp.open("GET", "<c:url value='/CServlet'/>", true);
			xmlHttp.open("GET", "/Demoajax/CServlet", true);
			//3.设置请求
			//4.发送请求
			xmlHttp.send(null);
			//5.给xmlHttp的onreadystatechange事件注册监听
			
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) { //双重判断
					//获取服务器的响应,结果xml
					var doc = xmlHttp.responseXML;
					//查询文档下名为student的所有元素，得到数组，再取下
					var ele=doc.getElementsByTagName("student")[0];
					var number=ele.getAttribute("number");//获取元素名为number的属性值
					var name=ele.getElementsByTagName("name")[0].textContent;//
					var age=ele.getElementsByTagName("age")[0].textContent;
					var sex=ele.getElementsByTagName("sex")[0].textContent;
					var  textString=number+"-"+name+"-"+age+"-"+sex;
					document.getElementById("h1").innerHTML=textString;
				}
			}
		
		}
			
		
	}
</script>
  
  <body>
  <button id="btn1">请点这里</button>
  <h1 id="h1"><h1/>
   
  </body>
</html>
