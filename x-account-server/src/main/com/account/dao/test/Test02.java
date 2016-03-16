package com.account.dao.test;

import java.util.UUID;

import com.account.dao.AdBean;
import com.account.dao.impl.MyUserDaoImpl;
import com.account.domain.MyUser;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class Test02 {
	
	public static void main(String[] args) {
		
//		String json = "{\"name\":\"zgt\",\"age\":5}";
//		JSONObject jsonObject = JSON.parseObject(json);
//		String string=jsonObject.getString("name");
//		System.out.println(string);
		
		
//		AdBean bean = new AdBean("今天工作任务","http://192.168.1.153:8080/adTest/app.apk","完成测试接口","http://192.168.1.153:8080/adTest/icon.jpg");
//		bean.setPackageName("com.dpx.jllpk");
//		bean.setNextTime(60*2);
//		String str = JSON.toJSONString(bean);
//		System.out.println(str);
//		
//		System.out.println(UUID.randomUUID().toString().length());
		
		
		
		MyUserDaoImpl daoImpl = new MyUserDaoImpl();
		
//		MyUser user  = new MyUser();
//		user.setEmail("email");
//		user.setName("name");
//		user.setPhone("phone");
//		user.setPwd("pwd");
//		user.setUid("uid");
//		daoImpl.add(user);
		
		MyUser user = daoImpl.login("name", "pwd");
		System.out.println(user.getName());
		
		
		
		
		
		
	}

}
