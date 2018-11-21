<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
<head>
<title>网上购物系统</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script language="javascript">
/**************************************************** 
 函数名称：loginClick 
 功能：验证登录 
 输入参数：无 
 输出参数：无 
 ****************************************************/ 
	 function loginClick(){ 
		//登录用户信息判断 
		var user=document.getElementById("username").value;
		var pass=document.getElementById("password").value;
		if(user==null||user==""){
			alert("请填写登录名");
			document.getElementById("username").focus();
		}else if(pass==null||pass==""){
			alert("请填写密码");
			document.getElementById("password").focus();
		}else
			document.Login.submit();
	}
	function res(){ 
		document.getElementById("username").value=""; 
		document.getElementById("password").value=""; } 
</script> 
<style type="text/css"> 
<!-- 标注页面的css属性
.login_td	{ 
	font-family:宋体; 
	font-size:12px; 
	color:#000066; 
} 
.login_button { 
	padding: 2 4 0 4; 
	font-size:12px; 
	height:18; 
	background:url(./images/button_bk.gif) 
	border-width:1px; 
	cursor: hand; 
	border: 1px solid #003c74; 
	padding-left: 4px; 
	padding-right: 4px; 
	padding-top: 1px; 
	padding-bottom: 1px; 
} 
--> 
</style> 
</HEAD> 
<body bgColor=#ffffff> 
	<table style="background-image:url(./images/login_Page/logPage.jpg); height:100%; width:100%"> 
	<tr align="center" valign="middle"> 
		<td> 
		<TABLE style="height:300;width:492" cellSpacing=0 cellPadding=0 border=0 align="center"> 
		<TBODY> 
			<TR valign="middle"> 
				<TD colSpan=2 
				style="background-image:url(./images/login_Page/loginPage_01.jpg)" height=44><font face="黑体" size="4px" color="#196ed1" style="padding-left:20px; vertical-align:middle">网上购物系统后台系统-用户登录</font>
				</TD> 
			</TR> 
			<TR> 
				<TD width="203">
				<IMG height=200 alt="" src="../images/login_Page/loginPage_02.jpg" width=202>
				</TD> 
				<TD style="background-image:url(../images/login_Page/loginPage_03.jpg)" height=200 width=497> 
				<form method="POST" name="Login" action="AdminLoginServlet">

<%
	Cookie[] cookies=request.getCookies();
	String userName="";
	//如果cookie数组部位null且大于0，读取cookie
	if(cookies!=null&&cookies.length>0){
			for(int i=0;i<cookies.length;i++){
				//取登录名
				if(cookies[i].getName().equals("userName")){
					userName = cookies[i].getValue();
				}
			}
	}
%>				
				
				
				<table>	 
					<tr> 
						<td width="66" height="20" class="login_td">登录名：</td> 
						<td width="115" height="20" class="login_td">
							<input type="text" name="username" value="<%=userName %>" style="WIDTH: 110px"></td> 
					</tr> 
					<tr> 
						<td height="20" class="login_td">密　码：</td> 
						<td height="20" class="login_td"><input type="password" name="password" value="" style="WIDTH: 110px"></td> 
					</tr> 
					<tr> 
						<td height="20" colspan="2" align="center"> 
						<button class="login_button" onClick="res()">重置</button>
						&nbsp; <button class="login_button" onClick="loginClick()">登录</button>
						&nbsp;
						</td>
						<td class="login_td" align="left" width=71><a href="addUser.html">新用户注册</a></td> 
					</tr> 
				</table>
				</form> 
				</TD> 
			</TR> 
			<TR> 
				<TD colSpan=2 style="background-image:url(./images/login_Page/loginPage_04.jpg)" G height=56 align="center" class="login_td">版权所有</TD> 
			</TR> 
		</TBODY> 
		</TABLE> 
		</td> 
	</tr> 
	</table> 
</body>
</html>