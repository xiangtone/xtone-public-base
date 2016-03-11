package com.account.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.account.domain.User;

public class UserDaoImpl extends BasicDaoImpl {

	// 添加用户
	public void add(User user) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("insertUser", user);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 删除用户
	public void delete(int id) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("deleteUser", id);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 更新用户
	public void update(User user) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("updateUser", user);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 获取所有用户
	public List<User> getAllStu() {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		List<User> users = null;
		try {
			users = sqlSession.selectList("getAllUser");
		} finally {
			sqlSession.close();
		}
		return users;
	}

	// 根据名字模糊查询
	public List<User> getModelByName(String name) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		List<User> students = null;
		try {
			students = sqlSession.selectList("getModelByName", name);
		} finally {
			sqlSession.close();
		}
		return students;
	}

}
