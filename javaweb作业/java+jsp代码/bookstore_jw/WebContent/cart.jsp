<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mengzhuangzhuang.entity.Book" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>你的购物车</title>
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
					<td>我的购物车</td>
				</tr>
			</table>
			<div style="position:absolute;left:0px;bottom:1px;z-index:1000;">	<!-- 按钮 -->
			<table>
				<tr>
					<td>
						<button type="button" onClick="ret()">放弃购物</button>&nbsp;
						<button type="button" onClick="goOn()">继续购物</button>
					</td>
				</tr>
			</table>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<th>序号</th>
							<th>书名</th>
							<th>价格(￥)</th>
							<th>数量(本/套)</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<%
							//定义总价格
							double money = 0;
							//获取购物车列表
							List<Book> cart = (List<Book>)session.getAttribute("cart");
							if(cart!=null){
								for(int i=0;i<cart.size();i++){
									Book book = cart.get(i);
									money = money + book.getPrice()*book.getquantity();	//此处书上有错误
								
						%>
						<tr>
							<td><%=i %></td>
							<td><%=book.getgoodsName() %></td>
							<td><%=book.getPrice() %></td>
							<td><%=book.getquantity() %></td>
							<td>从购物车中删除</td>
							<!--序号</th>
							<th>书名</th>
							<th>价格(￥)</th>
							<th>数量(本/套)</th>
							<th>操作</th> -->
						</tr>
						<%
								}
							}
						%>
					</tbody>
				</table>
				<table>
					<tr>
						<td>订单价格(￥)：</td>
						<td><%=money %></td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>