package com.account.domain;

import java.io.Serializable;

public class MyUser{
	
	//实体类的属性和表的字段名称一一对应
	private int id;
	private String name;
	private String pwd;
	private String email;
	private String phone;
	private String newPwd;
	private String uid;
		 
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
//	public String getJson(){
//		return "{\"name\":\"" + getName() + "\",\"pwd\":\"" + getPwd() + "\",\"phone\":\"" + getPhone() + "\",\"uid\":\"" + getUid() + "\"}";		
//	}
}
