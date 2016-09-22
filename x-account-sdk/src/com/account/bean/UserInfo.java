package com.account.bean;

import org.json.JSONObject;

public class UserInfo {
	private String channelCode;
	private String userID;
	private String userName;
	private String phone;
	private String token;
	private String productCode;
	private String channelUserId;
	private String channelLabel;
	private String status;//服务端返回的账号状态
	private String sessionId;
	
	public String getChannelCode() {
		return channelCode;
	}
	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getChannelUserId() {
		return channelUserId;
	}
	public void setChannelUserId(String channelUserId) {
		this.channelUserId = channelUserId;
	}
	public String getChannelLabel() {
		return channelLabel;
	}
	public void setChannelLabel(String channelLabel) {
		this.channelLabel = channelLabel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public void setUserByJson(String json){
		JSONObject data=null;
		try {
			JSONObject jsonObject=new JSONObject(json);
			this.setStatus(jsonObject.getString("status"));
			data=new JSONObject(jsonObject.getString("data"));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		try {
			this.setUserName(data.getString("name"));
		} catch (Exception e) {
		}
		try {
			this.setPhone(data.getString("phone"));
		} catch (Exception e) {
		}
		try {
			this.setUserID(data.getString("uid"));
		} catch (Exception e) {
		}
//		try {
//			this.setSessionId(data.getString("sessionId"));
//		} catch (Exception e) {
//		}
		try {
			this.setToken(data.getString("token"));
		} catch (Exception e) {
		}
	}
}
