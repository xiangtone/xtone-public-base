package com.account.bean;

import org.json.JSONObject;

import com.account.util.MACUtil;

public class UserInfo {
	private String channelCode;
	private String userID;
	private String username;
	private String token;
	private String productCode;
	private String channelUserId;
	private String channelLabel;
	private String status;
	
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public void setUserByJson(String json){
		try {
			JSONObject jsonObject=new JSONObject(json);
			this.setStatus(jsonObject.getString("status"));
			JSONObject data=new JSONObject(jsonObject.getString("data"));
			this.setUsername(data.getString("name"));
			this.setUserID(data.getString("uid"));
			this.setToken(MACUtil.getInstances().getMac());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
