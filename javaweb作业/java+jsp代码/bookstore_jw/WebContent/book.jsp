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
<title>�������ϵͳ</title>
</head>
<body>
<%
	ServletContext ctx = this.getServletContext();
	String server = ctx.getInitParameter("server");//��ȡ��������ַ
	String dbname = ctx.getInitParameter("dbname");//��ȡ���ݿ���
	String user = ctx.getInitParameter("user");//��ȡ���ݿ��¼��
	String pwd = ctx.getInitParameter("pwd");//��ȡ���ݿ�����
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
		<td>ͼ����Ϣ��ϸ</td>
	</tr>
	<tr >
		<td>ͼƬ<img src="" id="showPic"></td>
		<td>
			<table>
				<tr>
					<td>ͼ������:</td>
					<td><%=book.getgoodsName() %></td>
				</tr>
				<tr>
					<td>id:</td>
					<td><%=book.getid() %></td>
				</tr>
				<tr>
					<td>����:</td>
					<td>
						<%
							if(book.getgoodsType()==1){
						%>�����豸<%
							}else if(book.getgoodsType()==2){
						%>�ʻ�ϵ��<%
							}else if(book.getgoodsType()==3){
						%>ˮ������<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>�۸�:</td>
					<td><%=book.getPrice() %>��</td>
				</tr>
				<tr>
					<td>�����:</td>
					<td><%=book.getquantity() %>(��/��)</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button  type="button" onClick="ret()" style="width:20%">����</button>&nbsp;	<!-- ����дtype="button"��������Զ��ύ -->
			<button  type="button" onClick="buy(<%=book.getid() %>)" style="width:30%">��ӵ����ﳵ</button>&nbsp;
			<input type="hidden" name="id" value="<%=book.getid()%>"/>
		</td>
	</tr>
</table>		
<%
	}
%>
</body>
</html>