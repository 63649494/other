<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.mengzhuangzhuang.entity.User" %>
<%@ page import="com.mengzhuangzhuang.db.UserDao" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>网上书店后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
<script type="text/javascript">
	function select(){
		document.search.submit();
	}
	function ckbSelect(sta,flag){
		for(var i=0;i<document.getElementsByName(flag).length;i++){
			document.getElementsByName(flag)[i].checked = sta;
		}
	}
	function addIt(){
		window.location.href = "addUser.html";
	}
	function delIt(){
		window.location.href = "DelUserServlet";
	}
</script>
</head>
<body>

<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>用户一览</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		
		<form method="post" name="search" action="SearchUserServlet">
			<table>
				<tr>
					<td>&nbsp;登录名：</td>
					<td>
						<input type="text" name="userName">
					</td>
					<td>
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">查询</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>用户信息列表</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
			<table>
				<tr>
					<td>
					<button onClick="addIt()">新增用户</button>
					<button onClick="delIt()">删除</button>
					<button onClick="editIt()">修改用户信息</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><input type="checkbox" name="checkAll" onClick="onclick=ckbSelect(this.checked,'userId')"></th>
							<th><span>序号</span></th>
							<th><span>用户名</span></th>
							<th><span>密码</span></th>
							<th><span>用户类别</span></th>
							<th><span>注册时间</span></th>
							<th><span>登陆次数</span></th>
						</tr>
					</thead>
					<tbody>
						<%
							if(request.getAttribute("userList")==null){
								ServletContext ctx = this.getServletContext();
								String server = ctx.getInitParameter("server");//获取服务器地址
								String dbname = ctx.getInitParameter("dbname");//获取数据库名
								String user = ctx.getInitParameter("user");//获取数据库登录名
								String pwd = ctx.getInitParameter("pwd");//获取数据库密码
								UserDao dao = new UserDao();
								try{
									dao.getConn(server, dbname, user, pwd);
									List<User> list = dao.getAllUser();
									pageContext.setAttribute("userList", list);
								}catch(ClassNotFoundException e){
									e.printStackTrace();	
								}catch(Exception e){
									e.printStackTrace();
								}
							}
						%>
						<!-- 使用JSP脚本循环显示 -->
						<c:forEach var="user" items="${userList}" varStatus="status">
						<tr>
							<td>
							<input type="checkbox" name="userId" value="${user.username }" calss="input_radio">
							</td>
							<td>${status.count}</td>
							<td>${user.username }</td>
							<td>${user.userpass }</td>
							<td>${(user.role==0)?"普通用户":"管理员"}</td>
							<td>${user.regtime}</td>
							<td>${user.lognum}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>