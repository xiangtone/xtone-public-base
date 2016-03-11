package com.account.dao.bean;
/**
 * 统计当前的量
 */
public class StatisticsCurrent {
	
	private int id;
	
	private String packageName;
	
	//发送到通知栏的统计次数
	private int SendNotifiCount;
	//点击下载的统计
	private int ClickDownCount;
	//下载成功的统计
	private int DownSuccessCount;
	//安装成功的统计
	private int InstallSuccessCount;
	
	//时间
	private String date;
	
	
	/**
	 * 修改日期
	 */
	private java.sql.Date updateDate;
	
	
	

	public java.sql.Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(java.sql.Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public int getSendNotifiCount() {
		return SendNotifiCount;
	}

	public void setSendNotifiCount(int sendNotifiCount) {
		SendNotifiCount = sendNotifiCount;
	}

	public int getClickDownCount() {
		return ClickDownCount;
	}

	public void setClickDownCount(int clickDownCount) {
		ClickDownCount = clickDownCount;
	}

	public int getDownSuccessCount() {
		return DownSuccessCount;
	}

	public void setDownSuccessCount(int downSuccessCount) {
		DownSuccessCount = downSuccessCount;
	}

	public int getInstallSuccessCount() {
		return InstallSuccessCount;
	}

	public void setInstallSuccessCount(int installSuccessCount) {
		InstallSuccessCount = installSuccessCount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	
	
	
	
	

}
