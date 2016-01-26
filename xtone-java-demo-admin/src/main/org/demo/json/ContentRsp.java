package org.demo.json;

import org.demo.info.Content;

public class ContentRsp {
	private String status;
	private Content data;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Content getData() {
		return data;
	}
	public void setData(Content data) {
		this.data = data;
	}
	
}
