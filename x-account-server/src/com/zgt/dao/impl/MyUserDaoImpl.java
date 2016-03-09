package com.zgt.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.zgt.domain.MyUser;
import com.zgt.domain.User;

public class MyUserDaoImpl extends BasicDaoImpl {

	// 添加用户
	public void add(MyUser MyUser) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("insertMyUser", MyUser);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 删除用户
	public void delete(int id) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("com.zgt.mapping.myUserMapper.deleteMyUser", id);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 更新用户
	public void update(MyUser MyUser) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("com.zgt.mapping.myUserMapper.updateMyUser", MyUser);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 获取所有用户
	public List<MyUser> getAllStu() {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		List<MyUser> MyUsers = null;
		try {
			MyUsers = sqlSession.selectList("getAllMyUser");
		} finally {
			sqlSession.close();
		}
		return MyUsers;
	}

	// 根据名字模糊查询
	public List<MyUser> findByName(String name) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		List<MyUser> students = null;
		try {
			students = sqlSession.selectList("com.zgt.mapping.myUserMapper.findByName", name);
		} finally {
			sqlSession.close();
		}
		return students;
	}

	
	
	
	
	/**
	 * 登录
	 * @param name
	 * @return
	 */
	public MyUser login(String name,String pwd) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		MyUser user = null;
		try {
			
			Map<String, Object> param=new HashMap<String, Object>();             
		     param.put("name", name);             
		     param.put("pwd", pwd);  
		     
		     
//		     MyUser myUser = new MyUser();
//		     myUser.setName(name);
//		     myUser.setPwd(pwd);
//			
		     user = sqlSession.selectOne("login", param);
		} finally {
			sqlSession.close();
		}
		return user;
	}
	
	

}
