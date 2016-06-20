package com.account.dao.impl;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.account.domain.LogInfo;
import com.account.domain.MyUser;

public class LogDaoImpl {

	private static SqlSessionFactory sqlSessionFactory = null;

	static {
		String resource = "conf_log.xml";
		InputStream is = LogDaoImpl.class.getClassLoader().getResourceAsStream(resource);
		// 构建sqlSession的工厂
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
	public static void main(String[] args) {
		InputStream is = LogDaoImpl.class.getClassLoader().getResourceAsStream("conf_log.xml");
	}

	public MyUser findUidByToken(LogInfo info) {
		SqlSession sqlSession = LogDaoImpl.getSqlSessionFactory().openSession();
		MyUser result;
		try {
			result = sqlSession.selectOne("com.account.mapping.logMapper.findUidByToken", info);
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	public int insertToken(LogInfo info) {
		SqlSession sqlSession = LogDaoImpl.getSqlSessionFactory().openSession();
		int value = 0;
		try {
			value=sqlSession.insert("com.account.mapping.logMapper.insertToken", info);
			sqlSession.commit();
		} catch (Exception e) {  
			sqlSession.rollback();  
		}finally {
			sqlSession.close();
		}
		return value;
	}

	public int updateTime(LogInfo info) {
		SqlSession sqlSession = LogDaoImpl.getSqlSessionFactory().openSession();
		int value = 0;
		try {
			value = sqlSession.update("com.account.mapping.logMapper.updateTime", info);
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		return value;
	}
}
