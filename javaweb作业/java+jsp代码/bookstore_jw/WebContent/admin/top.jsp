<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
<head>
<title>�������ϵͳ</title>
</head>
<body topmargin="0px">
<%
//��Session����ȡ��¼��
String username = (String)session.getAttribute("username");
String logtime = (String)session.getAttribute("logtime");
%>
	<div class="top_header">
	<img src="../images/banner01.jpg" width="80" height="80"  style="cursor:auto"/>
		<div class="headfont" style="position:absolute;right:1px;top:58px;z-index:1000;">
		<span>��¼����<%=username %></span>
		<span>��¼ʱ�䣺<%=logtime %></span>
		</div>
	</div>
</body>
</html>