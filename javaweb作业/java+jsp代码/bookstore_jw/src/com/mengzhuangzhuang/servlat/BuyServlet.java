package com.mengzhuangzhuang.servlat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mengzhuangzhuang.db.BookDao;
import com.mengzhuangzhuang.entity.Book;

/**
 * Servlet implementation class BuyServlet
 */
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		response.setContentType("text/html;charset=GBK");
		String id = request.getParameter("id");
		//数据库
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String user = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		HttpSession session = request.getSession();
		//如果session中没有购物车，则创建
		if(session.getAttribute("cart")==null){
			List<Book> cart = new ArrayList<Book>();
			session.setAttribute("cart", cart);
		}
		//从session中取出购物车的内容
		List<Book> cart = (List<Book>)session.getAttribute("cart");
		//查看是否有此书
		boolean find = false;
		for(int i=0;i<cart.size();i++){
			Book book = cart.get(i);
			if(book.getid().equals(id)){
				//已有此书，数量加一
				book.setquantity(book.getquantity()+1);
				find = true;
				break;
			}
		}
		if(find==false){	//购物车中没有此书
			BookDao dao = new BookDao();
			try{
				dao.getConn(server, dbname, user, pwd);
				Book book = dao.getBookByid(id);
				book.setquantity(1);
				cart.add(book);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//更新session
		session.setAttribute("cart", cart);
		response.sendRedirect("cart.jsp");
		}
	}


