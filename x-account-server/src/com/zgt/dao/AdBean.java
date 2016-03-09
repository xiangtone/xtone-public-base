package com.zgt.dao;

/**
 * 广告对象
 * 
 * @author Administrator
 *
 */
public class AdBean {

	private String title;
	private String apkUrl;
	private String info;
	private String icon;

	private String packageName;

	/**
	 * 下次请求的时间
	 */
	private long nextTime;

	public AdBean() {
		// TODO Auto-generated constructor stub
	}

	public AdBean(String title, String apkUrl, String info, String icon) {
		super();
		this.title = title;
		this.apkUrl = apkUrl;
		this.info = info;
		this.icon = icon;
	}

	public long getNextTime() {
		return nextTime;
	}

	public void setNextTime(long nextTime) {
		this.nextTime = nextTime;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getApkUrl() {
		return apkUrl;
	}

	public void setApkUrl(String apkUrl) {
		this.apkUrl = apkUrl;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

}
