<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.List" %>
<%@ page import="com.mengzhuangzhuang.entity.Book" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>��Ĺ��ﳵ</title>
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
					<td>�ҵĹ��ﳵ</td>
				</tr>
			</table>
			<div style="position:absolute;left:0px;bottom:1px;z-index:1000;">	<!-- ��ť -->
			<table>
				<tr>
					<td>
						<button type="button" onClick="ret()">��������</button>&nbsp;
						<button type="button" onClick="goOn()">��������</button>
					</td>
				</tr>
			</table>
			</div>
			<div>
				<table>
					<thead>
						<tr>
							<th>���</th>
							<th>����</th>
							<th>�۸�(��)</th>
							<th>����(��/��)</th>
							<th>����</th>
						</tr>
					</thead>
					<tbody>
						<%
							//�����ܼ۸�
							double money = 0;
							//��ȡ���ﳵ�б�
							List<Book> cart = (List<Book>)session.getAttribute("cart");
							if(cart!=null){
								for(int i=0;i<cart.size();i++){
									Book book = cart.get(i);
									money = money + book.getPrice()*book.getquantity();	//�˴������д���
								
						%>
						<tr>
							<td><%=i %></td>
							<td><%=book.getgoodsName() %></td>
							<td><%=book.getPrice() %></td>
							<td><%=book.getquantity() %></td>
							<td>�ӹ��ﳵ��ɾ��</td>
							<!--���</th>
							<th>����</th>
							<th>�۸�(��)</th>
							<th>����(��/��)</th>
							<th>����</th> -->
						</tr>
						<%
								}
							}
						%>
					</tbody>
				</table>
				<table>
					<tr>
						<td>�����۸�(��)��</td>
						<td><%=money %></td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
</body>
</html>