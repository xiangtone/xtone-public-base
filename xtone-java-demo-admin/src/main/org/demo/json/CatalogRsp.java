package org.demo.json;

import org.demo.info.Catalog;

public class CatalogRsp {
	private String status;
	private Catalog data;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Catalog getData() {
		return data;
	}
	public void setData(Catalog data) {
		this.data = data;
	}
	
}
