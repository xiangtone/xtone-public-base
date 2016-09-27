package com.account.dao.impl;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

import com.account.domain.Channel;
import com.account.domain.LogInfo;
import com.account.domain.MyUser;
import com.account.utils.ConForLog;

/**
 * 日志表相关操作
 * 
 */
public class LogDaoImpl {
	private static final Logger LOG = Logger.getLogger(LogDaoImpl.class);
//	private static SqlSessionFactory sqlSessionFactory = null;
//
//	static {
//		String resource = "conf_log.xml";
//		InputStream is = LogDaoImpl.class.getClassLoader().getResourceAsStream(resource);
//		// 构建sqlSession的工厂
//		sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
//	}
//
//	public static SqlSessionFactory getSqlSessionFactory() {
//		return sqlSessionFactory;
//	}
//	
//	public static void main(String[] args) {
//		InputStream is = LogDaoImpl.class.getClassLoader().getResourceAsStream("conf_log.xml");
//	}
//
//	public List<MyUser> findUidByToken(LogInfo info) {
//		SqlSession sqlSession = LogDaoImpl.getSqlSessionFactory().openSession();
//		List<MyUser> results;
//		try {
//			results = sqlSession.selectList("com.account.mapping.logMapper.findUidByToken", info);
//		} finally {
//			sqlSession.close();
//		}
//		return results;
//	}
//	
//	public int insertToken(LogInfo info) {
//		SqlSession sqlSession = LogDaoImpl.getSqlSessionFactory().openSession();
//		int value = 0;
//		try {
//			value=sqlSession.insert("com.account.mapping.logMapper.insertToken", info);
//			sqlSession.commit();
//		} catch (Exception e) {  
//			sqlSession.rollback();  
//		}finally {
//			sqlSession.close();
//		}
//		return value;
//	}
//
//	public int updateTime(LogInfo info) {
//		SqlSession sqlSession = LogDaoImpl.getSqlSessionFactory().openSession();
//		int value = 0;
//		try {
//			value = sqlSession.update("com.account.mapping.logMapper.updateTime", info);
//			sqlSession.commit();
//		} catch (Exception e) {
//			sqlSession.rollback();
//		} finally {
//			sqlSession.close();
//		}
//		return value;
//	}
	
		public List<MyUser> findUidByToken(LogInfo info) {
			List<MyUser> results=new ArrayList<MyUser>();
			MyUser user;
			Connection con = ConForLog.getInstance().getConnectionForLocal();
			String sql = "select para01,para02 from log_async_generals where logId=7 and para01=? and para02=?";
			LOG.debug("findUidByToken:"+sql);
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setString(m++, info.getUid());
				ps.setString(m++, info.getToken());
				ResultSet rs = ps.executeQuery();
				LOG.debug(info.getUid()+","+info.getToken());
				if (rs.next()) {
					user = new MyUser();
					user.setUid(rs.getString("para01"));
					user.setToken(rs.getString("para02"));
					results.add(user);
				}
			} catch (SQLException e) {
				LOG.error(sql, e);
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					LOG.error("", e);
				}
			}
			return results;
		}
		
		public int insertToken(LogInfo info) {
			int value = 0;

			Connection con = ConForLog.getInstance().getConnectionForLocal();
			String sql = "insert into log_async_generals (id,logId,para01,para02) values (?,'7',?,?)";
			LOG.debug("insertToken:"+sql);
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setLong(m++, info.getId());
				ps.setString(m++, info.getUid());
				ps.setString(m++, info.getToken());
				value = ps.executeUpdate();
				LOG.debug(info.getId()+","+info.getUid()+","+info.getToken());
			} catch (SQLException e) {
				LOG.error(sql, e);
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					LOG.error("", e);
				}
			}
			return value;
		}
	
		public int updateTime(LogInfo info) {
			int value = 0;
			Connection con = ConForLog.getInstance().getConnectionForLocal();
			String sql = "update log_async_generals set id=? where logId='7' and para01=? and para02=?";
			LOG.debug("updateTime:"+sql);
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setLong(m++, info.getId());
				ps.setString(m++, info.getUid());
				ps.setString(m++, info.getToken());
				value = ps.executeUpdate();
				LOG.debug(info.getId()+","+info.getUid()+","+info.getToken());
			} catch (SQLException e) {
				LOG.error(sql, e);
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					LOG.error("", e);
				}
			}
			return value;
		}
}
