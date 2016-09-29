package com.account.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	
	/**
	 * 获取当前时间eg:2015-12-16
	 * @return
	 */
	public static String getCurrentDate(){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return simpleDateFormat.format(new Date());
	}

	public static String longToStr(long time){
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dt = new Date(time);  
		String sDateTime = sdf.format(dt);
		return sDateTime;
	}
	
}
