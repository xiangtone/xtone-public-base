package com.account.domain;

import java.util.Date;

public class MyUser{
	
	public static final int LOGINBYNAME=1;
	public static final int LOGINBYPHONE=2;
	public static final int LOGINBYEMAIL=3;
	public static final int FREEZE=0;
	public static final int ACTIVATION=1;
	//实体类的属性和表的字段名称一一对应
	private int id;
	private String name;
	private String pwd;
	private String email;
	private String phone;
	private String newPwd;
	private String uid;//uuid
	private long lastLoginTime;//最后登录时间
	private String token;
	private String flagid;
	private int loginType;//登录方式：手机号、用户名、邮箱
	private String channel_id;//渠道号
	private String appkey;//应用密钥
	private int status;
	private String sessionId;
		 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public long getLastLoginTime() {
		return lastLoginTime;
	}
	public void setLastLoginTime(long lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getFlagid() {
		return flagid;
	}
	public void setFlagid(String flagid) {
		this.flagid = flagid;
	}
	public int getLoginType() {
		return loginType;
	}
	public void setLoginType(int loginType) {
		this.loginType = loginType;
	}
	public String getChannel_id() {
		return channel_id;
	}
	public void setChannel_id(String channel_id) {
		this.channel_id = channel_id;
	}
	public String getAppkey() {
		return appkey;
	}
	public void setAppkey(String appkey) {
		this.appkey = appkey;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	
	
//	public String getJson(){
//		return "{\"name\":\"" + getName() + "\",\"pwd\":\"" + getPwd() + "\",\"phone\":\"" + getPhone() + "\",\"uid\":\"" + getUid() + "\"}";		
//	}
}
