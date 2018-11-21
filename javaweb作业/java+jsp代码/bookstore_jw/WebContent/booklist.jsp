<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page import="com.mengzhuangzhuang.entity.Book" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>booklist</title>
<script type="text/javascript">
	function showShop(){
		window.parent.frmMain.location = "cart.jsp";
	}
	function select(){
		document.search.submit();
	}
</script>
</head>
<body>
<c:if test="${bookList==null}">
	<jsp:forward page="SearchBookServlet"></jsp:forward>
</c:if>
<table>
	<tr>
		<td>
			<table>
				<tr>
					<td>ͼ��һ��</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
		
		<form method="post" name="search" action="SearchBookServlet">
			<table>
				<tr>
					<td>&nbsp;ͼ������</td>
					<td>
						<input type="text" name="goodsName">
					</td>
					<td>&nbsp;����</td>
					<td>
						<select name="goodsType" id="goodsType">
							<option value=""></option>
							<option value="1">�����豸</option>
							<option value="2">�ʻ�ϵ��</option>
							<option value="3">ˮ������</option>
						</select>
					</td>
					<td>
						&nbsp;<button onClick="select()" id="btnSearch" name="btnSearch">��ѯ</button>
					</td>
				</tr>
			</table>
			</form>
			
			
			
			<table>
				<tr>
					<td>ͼ���б�</td>
				</tr>
			</table>
			<div style="position:absolute;lef:0px;bottom:1px;z-index:1000;">
			<table>
				<tr>
					<td>
					<button onClick="showShop()" id="btnSave" name="btnSave">�鿴���ﳵ</button>
					</td>
				</tr>
			</table>
			</div>
			<div class="list_div">
				<table>
					<thead>
						<tr>
							<th><span>���</span></th>
							<th><span>����</span></th>
							<th><span>����</span></th>
							<th><span>id</span></th>
							<th><span>�۸�</span></th>
							<th><span>����</span></th>
						</tr>
					</thead>
					<tbody><!-- һ��ʼ����ʾ��������Ϊjavabean�е�һ��Ԫ������ƴ���� -->
						<!-- ʹ��JSP�ű�ѭ����ʾ -->
						<c:forEach var="book" items="${bookList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${book.goodsName }</td>
							<td>
								<c:choose>
									<c:when test="${book.goodsType==1 }">
									�����豸</c:when>
									<c:when test="${book.goodsType==2 }">
									�ʻ�ϵ��</c:when>
									<c:when test="${book.goodsType==3 }">
									ˮ������</c:when>
								</c:choose>
							</td>
							<td>${book.id}</td>
							<td>${book.price}</td>
							<td>
								<a href="book.jsp?id=${book.id}">�鿴����</a>
								<a href="BuyServlet?id=${book.id}">
									<img src="./images/buy.gif" width="40" height="17" style="border:0px"/>
								</a>
							</td>
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