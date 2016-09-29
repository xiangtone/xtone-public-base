package com.account.domain;

import com.account.utils.TimeUtil;

public class LogInfo {

	private long id;
	private String name;
	private String uid;
	private String token;
	private String time;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(long time) {
		this.time = TimeUtil.longToStr(time);
	}
	
	
}
