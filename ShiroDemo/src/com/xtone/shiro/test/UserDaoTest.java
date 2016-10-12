package com.xtone.shiro.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Test;

import com.system.dao.ShiroUserDao;
import com.xtone.shiro.model.User;

public class UserDaoTest {
	@Test
	public void loadUserByUsername(){
		ShiroUserDao dao = new ShiroUserDao();
		Map<String, Object>map = dao.getUserByName("zhang");
		List<User> list = (List<User>) map.get("list");
		for (User user : list) {
			System.out.println(user.getId());
			System.out.println(user.getUsername());
			System.out.println(user.getPasserword());
			System.out.println(user.getStute());
		}
	}
	
	@Test
	public void loadRoles(){
		ShiroUserDao dao = new ShiroUserDao();
		Set<String>role = dao.getRoles("zhang");
		String str = role.toString();
		System.out.println(str);
	}
}
