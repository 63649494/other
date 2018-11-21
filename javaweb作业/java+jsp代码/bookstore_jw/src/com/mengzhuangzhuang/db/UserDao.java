package com.mengzhuangzhuang.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mengzhuangzhuang.entity.User;

public class UserDao extends DBOper{
	//返回所有用户
	public List<User> getAllUser(){
		List<User> userList = new ArrayList<User>();
		String sql = "SELECT * FROM userdetail";
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
				User user = new User();
				user.setUsername(rs.getString("username"));
				user.setUserpass(rs.getString("userpass"));
				user.setRole(rs.getInt("role"));
				user.setRegtime(rs.getString("regtime"));
				user.setLognum(rs.getInt("lognum"));
				userList.add(user);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return userList;
		
	}
	//用登录名查找用户
		public User getUserByName(String name){
			User user = null;
			String sql = "SELECT * FROM userdetail WHERE username=?";
			try{
				ResultSet rs = this.executeQuery(sql, new String[] {name});
				if(rs.next()){
					user = new User();
					user.setUsername(rs.getString("username"));
					user.setUserpass(rs.getString("userpass"));
					user.setRole(rs.getInt("role"));
					user.setRegtime(rs.getString("regtime"));
					user.setLognum(rs.getInt("lognum"));
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
			return user;
			
		}
		public boolean addUser(User user){
			boolean r= false;
			try{
				String sql = "INSERT INTO userdetail(username,userpass,role,regtime) values(?,?,?,?)";
				int rs = this.executeUpdate(sql, new String[] {user.getUsername(),user.getUserpass(),""+user.getRole(),user.getRegtime()});
			if(rs>0){
				r=true;
			}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
			return r;
		}
		//修改用户信息
		public boolean editUser(User user){
			boolean r= false;
			try{
				String sql = "UPDATE userdetail SET userpass=?,role=?,regtime=? WHERE username=?";
				int rs = this.executeUpdate(sql, new String[] {user.getUserpass(),""+user.getRole(),user.getRegtime(),user.getUsername()});
			if(rs>0){
				r=true;
			}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
			return r;
		}
		//删除指定用户
		public boolean delUser(String name){
			boolean r= false;
			try{
				String sql = "DELETE FROM userdetail WHERE username=?";
				int rs = this.executeUpdate(sql, new String[] {name});
			if(rs>0){
				r=true;
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			return r;
		}
}
