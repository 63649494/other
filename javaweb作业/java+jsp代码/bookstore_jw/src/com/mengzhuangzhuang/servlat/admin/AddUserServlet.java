package com.mengzhuangzhuang.servlat.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mengzhuangzhuang.db.UserDao;
import com.mengzhuangzhuang.entity.User;

/**
 * Servlet implementation class AddUserServlet
 */
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("userName");
		String userpass = request.getParameter("userPass");
		String role = request.getParameter("role");
		//获取当前注册时间
		Date curTime = new Date();
		//格式化当前时间
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String regtime = dateFormat.format(curTime);
		//封装
		User user = new User();
		user.setUsername(username);
		user.setUserpass(userpass);
		user.setRole(Integer.parseInt(role));
		user.setRegtime(regtime);
		ServletContext ctx = this.getServletContext();
		//通过ServletContext获取web.xml中设置的初始化参数
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String dbuser = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		UserDao dao = new UserDao();
		try {
				//连接数据库
			out.println("<br>这是注册结果页面desu");
			dao.getConn(server,dbname,dbuser,pwd);
			//向userdetail插入一条记录
			if(dao.addUser(user)){//插入成功
					out.println("<br>添加成功");
					out.println("<br><a href='adminLogin.jsp'>请登录</a>");
			}else{
				out.println("<br>注册失败");
				out.println("<br><a href='addUser.html'>请重新注册</a>");		
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			out.println("<br>出错了CNFE");
		}catch(Exception e){
			e.printStackTrace();
			out.println("<br>出错了E");
		}
		}
	}


