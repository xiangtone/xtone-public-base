package com.account.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.account.domain.MyUser;

public class MyUserDaoImpl extends BasicDaoImpl {

	// 添加用户
	public int add(MyUser user) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		int value = 0;
		try {
			value=sqlSession.insert("insertMyUser", user);
			sqlSession.commit();
		} catch (Exception e) {  
			sqlSession.rollback();  
		}finally {
			sqlSession.close();
		}
		return value;
	}

	// 删除用户
	public int delete(int id) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		int value = 0;
		try {
			value=sqlSession.delete("com.account.mapping.myUserMapper.deleteMyUser", id);
			sqlSession.commit();
		} catch (Exception e) {  
			sqlSession.rollback();  
		}finally {
			sqlSession.close();
		}
		return value;
	}

	// 更新用户
	public int update(MyUser user) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		int value = 0;
		try {
			value=sqlSession.update("com.account.mapping.myUserMapper.updateMyUser", user);
			sqlSession.commit();
		} catch (Exception e) {  
			sqlSession.rollback();  
		}finally {
			sqlSession.close();
		}
		return value;
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
	public MyUser findByName(String name) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		MyUser students;
		try {
			students = sqlSession.selectOne("com.account.mapping.myUserMapper.findByName", name);
		} finally {
			sqlSession.close();
		}
		return students;
	}

	// 修改密码
		public int changePwd(MyUser user) {
			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
			int value = 0;
			try {
				value=sqlSession.update("com.account.mapping.myUserMapper.changePwd", user);
				sqlSession.commit();
			} catch (Exception e) {  
				sqlSession.rollback();  
			}finally {
				sqlSession.close();
			}
			return value;
		}
	
	/**
	 * 登录
	 * @param name
	 * @return
	 */
	public MyUser login(MyUser user) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		MyUser myUser=null;
		try {
		     myUser = sqlSession.selectOne("login", user);
		} finally {
			sqlSession.close();
		}
		return myUser;
	}
	
	// 更新登录时间
		public int updateTime(MyUser user) {
			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
			int value = 0;
			try {
				value=sqlSession.update("com.account.mapping.myUserMapper.updateTime", user);
				sqlSession.commit();
			} catch (Exception e) {  
				sqlSession.rollback();  
			}finally {
				sqlSession.close();
			}
			return value;
		}

}
