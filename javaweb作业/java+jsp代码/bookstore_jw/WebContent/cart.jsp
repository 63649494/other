<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mengzhuangzhuang.entity.Book" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ÄãµÄ¹ºÎï³µ</title>
<script type="text/javascript">
	function goOn(){
		window.location.href="./booklist.jsp";
	}
	function ret(){}
</script>
</head>
<body>
<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>ÎÒµÄ¹ºÎï³µ</td>
				</tr>
			</table>
			<div style="position:absolute;left:0px;bottom:1px;z-index:1000;">	<!-- °´Å¥ -->
			<table>
				<tr>
					<td>
						<button type="button" onClick="ret()">·ÅÆú¹ºÎï</button>&nbsp;
						<button type="button" onClick="goOn()">¼ÌÐø¹ºÎï</button>
					</td>
				</tr>
			</table>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<th>ÐòºÅ</th>
							<th>ÊéÃû</th>
							<th>¼Û¸ñ(£¤)</th>
							<th>ÊýÁ¿(±¾/Ì×)</th>
							<th>²Ù×÷</th>
						</tr>
					</thead>
					<tbody>
						<%
							//¶¨Òå×Ü¼Û¸ñ
							double money = 0;
							//»ñÈ¡¹ºÎï³µÁÐ±í
							List<Book> cart = (List<Book>)session.getAttribute("cart");
							if(cart!=null){
								for(int i=0;i<cart.size();i++){
									Book book = cart.get(i);
									money = money + book.getPrice()*book.getquantity();	//´Ë´¦ÊéÉÏÓÐ´íÎó
								
						%>
						<tr>
							<td><%=i %></td>
							<td><%=book.getgoodsName() %></td>
							<td><%=book.getPrice() %></td>
							<td><%=book.getquantity() %></td>
							<td>´Ó¹ºÎï³µÖÐÉ¾³ý</td>
							<!--ÐòºÅ</th>
							<th>ÊéÃû</th>
							<th>¼Û¸ñ(£¤)</th>
							<th>ÊýÁ¿(±¾/Ì×)</th>
							<th>²Ù×÷</th> -->
						</tr>
						<%
								}
							}
						%>
					</tbody>
				</table>
				<table>
					<tr>
						<td>¶©µ¥¼Û¸ñ(£¤)£º</td>
						<td><%=money %></td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>