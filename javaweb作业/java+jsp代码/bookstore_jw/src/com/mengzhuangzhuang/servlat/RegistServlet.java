package com.mengzhuangzhuang.servlat;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mengzhuangzhuang.db.DBOper;

/**
 * Servlet implementation class RegistServlet
 */
public class RegistServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
		try {
				//连接数据库
			out.println("<br>这是注册结果页面desu");
			db.getConn(server,dbname,user,pwd);
			//向userdetail插入一条记录
			String sql = "INSERT INTO userdetail(username,userpass,regtime) values(?,?,?)";
			//获取当前注册时间
			Date curTime = new Date();
			//格式化当前时间
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String regtime = dateFormat.format(curTime);
			//执行插入操作，username和userpass放入数组当参数
			out.println("<br>username="+username+" userpass="+userpass+" regtime="+regtime);
			int rs = db.executeUpdate(sql, new String[]{username,userpass,regtime});
			out.println("<br>"+rs+"是当前rs值\n");
			if(rs>0){//插入成功
					out.println("<br>注册成功");
					out.println("<br><a href='login.jsp'>请登录</a>");
			}else{
				out.println("<br>注册失败");
				out.println("<br><a href='regist.html'>请重新注册</a>");		
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

