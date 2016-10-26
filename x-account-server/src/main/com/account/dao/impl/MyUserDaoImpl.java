package com.account.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import com.account.domain.MyUser;

public class MyUserDaoImpl extends BasicDaoImpl {
	private final static Logger LOG=Logger.getLogger(MyUserDaoImpl.class);
	// 添加用户
	public int add(MyUser user) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		int value = 0;
		try {
			value=sqlSession.insert("insertMyUser", user);
			sqlSession.commit();
		} catch (Exception e) {  
			LOG.error("insert error",e);
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
			LOG.error("",e);
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
			LOG.error("",e);
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

	// 根据名字查询
	public MyUser findByName(String name) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		MyUser user;
		try {
			user = sqlSession.selectOne("com.account.mapping.myUserMapper.findByName", name);
		} finally {
			sqlSession.close();
		}
		return user;
	}

	// 根据手机号查询
	public MyUser findByPhone(String phone) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		MyUser user;
		try {
			user = sqlSession.selectOne("com.account.mapping.myUserMapper.findByPhone", phone);
		} finally {
			sqlSession.close();
		}
		return user;
	}

	// 根据邮箱查询
	public MyUser findByEmail(String email) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		MyUser user;
		try {
			user = sqlSession.selectOne("com.account.mapping.myUserMapper.findByEmail", email);
		} finally {
			sqlSession.close();
		}
		return user;
	}
	
	// 修改密码
		public int changePwd(MyUser user) {
			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
			int value = 0;
			try {
				value=sqlSession.update("com.account.mapping.myUserMapper.changePwd", user);
				sqlSession.commit();
			} catch (Exception e) {
				LOG.error("",e);
				sqlSession.rollback();  
			}finally {
				sqlSession.close();
			}
			return value;
		}
	
	/**
	 * 登录
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
	
	/**
	 * 通过uid实现自动登录
	 * @return
	 */
	public MyUser loginByUid(MyUser user) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		MyUser myUser=null;
		try {
		    myUser = sqlSession.selectOne("loginByUid", user);
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
					LOG.error("",e);
					sqlSession.rollback();  
				}finally {
					sqlSession.close();
				}
				return value;
			}
			
			// 更新用户状态
			public int updateStatus(MyUser user) {
				SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
				int value = 0;
				try {
					value=sqlSession.update("com.account.mapping.myUserMapper.updateStatus", user);
					sqlSession.commit();
				} catch (Exception e) {  
					LOG.error("",e);
					sqlSession.rollback();  
				}finally {
					sqlSession.close();
				}
				return value;
			}

		/**
		 * 通过手机号登录
		 * @return
		 */
		public MyUser loginByPhone(MyUser user) {
			// TODO Auto-generated method stub
			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
			MyUser myUser=null;
			try {
			    myUser = sqlSession.selectOne("loginByPhone", user);
			} finally {
				sqlSession.close();
			}
			return myUser;
		}
		
		/**
		 * 通过邮箱登录
		 * @return
		 */
		public MyUser loginByEmail(MyUser user) {
			// TODO Auto-generated method stub
			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
			MyUser myUser=null;
			try {
			    myUser = sqlSession.selectOne("loginByEmail", user);
			} finally {
				sqlSession.close();
			}
			return myUser;
		}

}
