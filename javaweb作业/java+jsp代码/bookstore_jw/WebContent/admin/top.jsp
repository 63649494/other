<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
<head>
<title>网上书店系统</title>
</head>
<body topmargin="0px">
<%
//从Session中提取登录名
String username = (String)session.getAttribute("username");
String logtime = (String)session.getAttribute("logtime");
%>
	<div class="top_header">
	<img src="../images/banner01.jpg" width="80" height="80"  style="cursor:auto"/>
		<div class="headfont" style="position:absolute;right:1px;top:58px;z-index:1000;">
		<span>登录名：<%=username %></span>
		<span>登录时间：<%=logtime %></span>
		</div>
	</div>
</body>
</html>