package com.mengzhuangzhuang.servlat.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mengzhuangzhuang.db.BookDao;
import com.mengzhuangzhuang.entity.Book;

/**
 * Servlet implementation class AddBookServlet
 */
public class AddBookServlet extends HttpServlet {
	
		/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String goodsName = request.getParameter("goodsName");
		String id = request.getParameter("id");
		String goodsType = request.getParameter("goodsType");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		//封装
		Book book = new Book();
		book.setgoodsName(goodsName);
		book.setid(id);
		book.setgoodsType(Integer.parseInt(goodsType));
		book.setPrice(Double.parseDouble(price));
		if(quantity!=null&&!quantity.equals("")){
			book.setquantity(Integer.parseInt(quantity));
		}
		//将图书插入到数据库中
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String dbuser = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		BookDao dao = new BookDao();
		try{
			//连接数据库
			dao.getConn(server, dbname, dbuser, pwd);
			boolean r = dao.addBook(book);
			if(r){
				out.println("新书上架成功");
				out.println("<br><a href=' addBook.html'>返回</a>");
			}else {
				out.println("失败！");
				out.println("<br><a href=' addBook.html'>返回</a>");
			}
			
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
