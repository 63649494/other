<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
<head>
<title>网上书店系统</title>
<script language="javascript">
	function userCancel(){
		if(window.confirm("确定注销？")){		//这里是window不要顺手打成windows
			window.parent.location="./DestroyServlet";
		}
	}
	function showCart(){
		window.parent.frmMain.location="cart.jsp";
	}
</script>
</head>
<body topmargin="0px">
<%
//从Session中提取登录名
String username = (String)session.getAttribute("username");
String logtime = (String)session.getAttribute("logtime");
%>
	<div class="top_header">
	<img src="./images/banner01.jpg" width="80" height="80" style="cursor:auto"/>
		<div class="headfont" style="position:absolute;right:1px;top:58px;z-index:1000;">
		<span>登录名：<%=username %></span>
		<span>登录时间：<%=logtime %></span>
		<span onClick="showCart()" style="cursor:hand">[查看购物车]</span>
		<span onClick="userCancel()" style="cursor:hand">[注销]</span>
		</div>
	</div>
</body>
</html>