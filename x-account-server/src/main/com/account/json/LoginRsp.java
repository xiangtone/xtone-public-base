package com.account.json;

import com.account.domain.MyUser;

public class LoginRsp {
	private String status;
	private MyUser data;	
	public MyUser getData() {
		return data;
	}
	public void setData(MyUser data) {
		this.data = data;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
