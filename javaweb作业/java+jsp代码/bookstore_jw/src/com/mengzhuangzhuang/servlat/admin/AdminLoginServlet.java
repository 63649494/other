package com.mengzhuangzhuang.servlat.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mengzhuangzhuang.db.DBOper;

/**
 * Servlet implementation class LoginServlet
 */
public class AdminLoginServlet extends HttpServlet {
    public void destroy() {
        super.destroy();
        // TODO Auto-generated constructor stub
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String userpass = request.getParameter("password");
		ServletContext ctx = this.getServletContext();
		//通过ServletContext获取web.xml中设置的初始化参数
		String server = ctx.getInitParameter("server");//获取服务器地址
		String dbname = ctx.getInitParameter("dbname");//获取数据库名
		String user = ctx.getInitParameter("user");//获取数据库登录名
		String pwd = ctx.getInitParameter("pwd");//获取数据库密码
		DBOper db = new DBOper();
		try{
			//连接数据库
			db.getConn(server, dbname, user, pwd);
			//查询用户
			String sql="SELECT username,userpass,role FROM userdetail WHERE username=?AND userpass=? AND role=1";
			//执行查询
			ResultSet rs=db.executeQuery(sql, new String[]{username,userpass});
			//合法用户
			if(rs!=null&&rs.next()){
				//获取Session
				HttpSession session = request.getSession();
				//讲登录名保存到Session
				session.setAttribute("username",username);
				//讲登录时间保存到Session中
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String logtime=dateFormat.format(new Date());
				session.setAttribute("logtime", logtime);
				//向客户端发送Cookie
				Cookie cookie = new Cookie("userName",username);
				cookie.setMaxAge(60*60*24*30);
				response.addCookie(cookie);
				//跳转到MainServlet
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminMain.jsp");
				dispatcher.forward(request, response);
			}else{//不合法用户
				out.println("login in false");
				out.println("<br><a href='adminLogin.jsp'>重新登录</a>");
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
		public void init() throws ServletException{}
}
