package com.mengzhuangzhuang.entity;

import java.io.Serializable;

public class User implements Serializable{//如果某个类 后面使用 implements，并指定了相应的接口，那在该类下面就需要实现相应接口的方法。这个是java语法规定，没得解释
	private String username;
	private String userpass;
	private int role;
	private String regtime;
	private int lognum;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getRegtime() {
		return regtime;
	}
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}
	public int getLognum() {
		return lognum;
	}
	public void setLognum(int lognum) {
		this.lognum = lognum;
	}

	
}
