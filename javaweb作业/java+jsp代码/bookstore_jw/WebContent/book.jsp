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
<title>ÍøÉÏÊéµêÏµÍ³</title>
</head>
<body>
<%
	ServletContext ctx = this.getServletContext();
	String server = ctx.getInitParameter("server");//»ñÈ¡·þÎñÆ÷µØÖ·
	String dbname = ctx.getInitParameter("dbname");//»ñÈ¡Êý¾Ý¿âÃû
	String user = ctx.getInitParameter("user");//»ñÈ¡Êý¾Ý¿âµÇÂ¼Ãû
	String pwd = ctx.getInitParameter("pwd");//»ñÈ¡Êý¾Ý¿âÃÜÂë
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
		<td>Í¼ÊéÐÅÏ¢ÏêÏ¸</td>
	</tr>
	<tr >
		<td>Í¼Æ¬<img src="" id="showPic"></td>
		<td>
			<table>
				<tr>
					<td>Í¼ÊéÃû³Æ:</td>
					<td><%=book.getgoodsName() %></td>
				</tr>
				<tr>
					<td>id:</td>
					<td><%=book.getid() %></td>
				</tr>
				<tr>
					<td>ÀàÐÍ:</td>
					<td>
						<%
							if(book.getgoodsType()==1){
						%>µç×ÓÉè±¸<%
							}else if(book.getgoodsType()==2){
						%>ÏÊ»¨ÏµÁÐ<%
							}else if(book.getgoodsType()==3){
						%>Ë®¹ûÀàÐÍ<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>¼Û¸ñ:</td>
					<td><%=book.getPrice() %>£¤</td>
				</tr>
				<tr>
					<td>¿â´æÁ¿:</td>
					<td><%=book.getquantity() %>(±¾/Ì×)</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button  type="button" onClick="ret()" style="width:20%">·µ»Ø</button>&nbsp;	<!-- ±ØÐëÐ´type="button"£¬·ñÔò»á×Ô¶¯Ìá½» -->
			<button  type="button" onClick="buy(<%=book.getid() %>)" style="width:30%">Ìí¼Óµ½¹ºÎï³µ</button>&nbsp;
			<input type="hidden" name="id" value="<%=book.getid()%>"/>
		</td>
	</tr>
</table>		
<%
	}
%>
</body>
</html>