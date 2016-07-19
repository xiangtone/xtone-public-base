package com.account.dao.impl;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.account.domain.LogInfo;
import com.account.domain.MyUser;

/**
 * 日志表相关操作
 * 
 */
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

	public List<MyUser> findUidByToken(LogInfo info) {
		SqlSession sqlSession = LogDaoImpl.getSqlSessionFactory().openSession();
		List<MyUser> results;
		try {
			results = sqlSession.selectList("com.account.mapping.logMapper.findUidByToken", info);
		} finally {
			sqlSession.close();
		}
		return results;
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
