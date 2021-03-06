<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.mengzhuangzhuang.db.BookDao" %>
<%@ page import="com.mengzhuangzhuang.entity.Book" %>
<html>
<head>
<script type="text/javascript">
	function ret(){
		window.location.href="./booklist.jsp";
	}
	function buy(id){
		window.location.href="./BuyServlet?id="+id;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>网上书店系统</title>
</head>
<body>
<%
	ServletContext ctx = this.getServletContext();
	String server = ctx.getInitParameter("server");//获取服务器地址
	String dbname = ctx.getInitParameter("dbname");//获取数据库名
	String user = ctx.getInitParameter("user");//获取数据库登录名
	String pwd = ctx.getInitParameter("pwd");//获取数据库密码
	BookDao dao = new BookDao();
	try{
		dao.getConn(server, dbname, user, pwd);
		String id = request.getParameter("id");
		Book book = dao.getBookByid(id);
		pageContext.setAttribute("book", book);
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<%
	Book book = (Book)pageContext.getAttribute("book");
	if(book!=null){
%>
<table align="center">
			<tr>
		<td>图书信息详细</td>
	</tr>
	<tr >
		<td>图片<img src="" id="showPic"></td>
		<td>
			<table>
				<tr>
					<td>图书名称:</td>
					<td><%=book.getgoodsName() %></td>
				</tr>
				<tr>
					<td>id:</td>
					<td><%=book.getid() %></td>
				</tr>
				<tr>
					<td>类型:</td>
					<td>
						<%
							if(book.getgoodsType()==1){
						%>电子设备<%
							}else if(book.getgoodsType()==2){
						%>鲜花系列<%
							}else if(book.getgoodsType()==3){
						%>水果类型<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>价格:</td>
					<td><%=book.getPrice() %>￥</td>
				</tr>
				<tr>
					<td>库存量:</td>
					<td><%=book.getquantity() %>(本/套)</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button  type="button" onClick="ret()" style="width:20%">返回</button>&nbsp;	<!-- 必须写type="button"，否则会自动提交 -->
			<button  type="button" onClick="buy(<%=book.getid() %>)" style="width:30%">添加到购物车</button>&nbsp;
			<input type="hidden" name="id" value="<%=book.getid()%>"/>
		</td>
	</tr>
</table>		
<%
	}
%>
</body>
</html>