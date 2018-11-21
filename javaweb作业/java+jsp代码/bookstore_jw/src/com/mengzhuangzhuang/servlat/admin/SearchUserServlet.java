package com.mengzhuangzhuang.servlat.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mengzhuangzhuang.db.UserDao;
import com.mengzhuangzhuang.entity.User;

/**
 * Servlet implementation class SearchUserServlet
 */
public class SearchUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUserServlet() {
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
		String username = request.getParameter("userName");
		//数据库
		ServletContext ctx = this.getServletContext();
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String dbuser = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		UserDao dao = new UserDao();
		List<User> userList = new ArrayList<User>();
		try{
			dao.getConn(server, dbname, dbuser, pwd);
			if(username!=null&&username.length()>0){
				//根据用户名查
				User user=dao.getUserByName(username);
				if(user!=null){
					userList.add(user);
				}
			}else{//返回所有用户列表
			userList = dao.getAllUser();
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dao.closeAll();
		}
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("search.jsp").forward(request, response); //将请求转发到bookManage.jsp这个页面
		}
	}

