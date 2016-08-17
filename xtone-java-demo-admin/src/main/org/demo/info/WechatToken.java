package org.demo.info;

public class WechatToken {

	private String appId;
	private String token;
	private Long nextTime;
	private Long lastModTime;
	private Long validTime;

	public boolean isInValidTime() {
		boolean result = true;
		if (this.validTime <= System.currentTimeMillis()) {
			result = false;
		}
		return result;
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId;
	}

	public WechatToken(String appId, String token, Long nextTime, Long lastModTime, Long validTime) {
		super();
		this.appId = appId;
		this.token = token;
		this.nextTime = nextTime;
		this.lastModTime = lastModTime;
		this.validTime = validTime;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Long getNextTime() {
		return nextTime;
	}

	public void setNextTime(Long nextTime) {
		this.nextTime = nextTime;
	}

	public Long getLastModTime() {
		return lastModTime;
	}

	public void setLastModTime(Long lastModTime) {
		this.lastModTime = lastModTime;
	}

	public Long getValidTime() {
		return validTime;
	}

	public void setValidTime(Long validTime) {
		this.validTime = validTime;
	}

}
