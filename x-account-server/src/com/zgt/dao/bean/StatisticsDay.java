package com.zgt.dao.bean;
/**
 * 统计当天的量
 * @author Administrator
 *
 */
public class StatisticsDay {
	
	private int id;
	
	
	private String packageName;
	private String date;
	
	/**
	 * 创建日期
	 */
	private java.sql.Date createDate;
	
	//发送到通知栏的统计次数
	private long SendNotifiCountDay;
	//点击下载的统计
	private long ClickDownCountDay;
	//下载成功的统计
	private long DownSuccessCountDay;
	//安装成功的统计
	private long InstallSuccessCountDay;
	
	
	
	
	public java.sql.Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(java.sql.Date createDate) {
		this.createDate = createDate;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public long getSendNotifiCountDay() {
		return SendNotifiCountDay;
	}
	public void setSendNotifiCountDay(long sendNotifiCountDay) {
		SendNotifiCountDay = sendNotifiCountDay;
	}
	public long getClickDownCountDay() {
		return ClickDownCountDay;
	}
	public void setClickDownCountDay(long clickDownCountDay) {
		ClickDownCountDay = clickDownCountDay;
	}
	public long getDownSuccessCountDay() {
		return DownSuccessCountDay;
	}
	public void setDownSuccessCountDay(long downSuccessCountDay) {
		DownSuccessCountDay = downSuccessCountDay;
	}
	public long getInstallSuccessCountDay() {
		return InstallSuccessCountDay;
	}
	public void setInstallSuccessCountDay(long installSuccessCountDay) {
		InstallSuccessCountDay = installSuccessCountDay;
	}
	
	
	

}
