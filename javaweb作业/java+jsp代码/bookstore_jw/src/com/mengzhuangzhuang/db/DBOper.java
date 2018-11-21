package com.mengzhuangzhuang.db;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class DBOper {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//得到数据库链接
	public Connection getConn(String server,String dbname,String user,String pwd)throws ClassNotFoundException,SQLException,InstantiationException,IllegalAccessException{
		String DRIVER = "com.mysql.jdbc.Driver";
		String URL = "jdbc:mysql://"+server+":3306/"+dbname+"?user="+user+"&password="+pwd+"&useUnicode=true&characterEncoding=utf8";
		//注册驱动
		Class.forName(DRIVER);
		//获得数据库连接
		conn = (Connection) DriverManager.getConnection(URL);
		//返回连接
		return conn;
	}
	//释放资源
	public void closeAll(){
		try{
			//如果rs不为空，关闭rs
			if(rs!=null){
				rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					//如果pstmt不空，关闭
					if(pstmt!=null){
						pstmt.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
								try {
										conn.close();
									} catch (SQLException e){
										e.printStackTrace();
								}
							}
					}			
				}
	//执行SQL语句，可以进行查询
	public ResultSet executeQuery(String preparedSql,String[] param){
		//处理SQL，执行SQL
		try{
			//得到PreparedStatement对象
			pstmt = (PreparedStatement) conn.prepareStatement(preparedSql);
			if(param!=null){
				for(int i=0;i<param.length;i++){
					//为预编译sql设置参数
					pstmt.setString(i+1, param[i]);
				}
			}
			rs = pstmt.executeQuery();
		} catch (SQLException e){
			//处理异常
			e.printStackTrace();
		}
		return rs;
	}
	//执行SQL语句，进行增删改操作，不能查询
	public int executeUpdate(String preparedSql,String[] param){
		int num = 0;
		//处理SQL，执行SQL
		try{
			pstmt = (PreparedStatement) conn.prepareStatement(preparedSql);
			if(param!=null){
				for(int i=0;i<param.length;i++){
					pstmt.setString(i+1, param[i]);
				}
			}
			num = pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
			}
		return num;
	}
	
}
	
	

