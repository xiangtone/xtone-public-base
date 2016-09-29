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
			String sql = "select para02,para03 from log_async_generals where logId=7 and para01=? and para02=? and para03=?";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setString(m++, info.getName());
				ps.setString(m++, info.getUid());
				ps.setString(m++, info.getToken());
				ResultSet rs = ps.executeQuery();
				LOG.debug("findUidByLog:"+sql+"\npara01="+info.getName()+",para02="+info.getUid()+",para03="+info.getToken());
				if (rs.next()) {
					user = new MyUser();
					user.setUid(rs.getString("para02"));
					user.setToken(rs.getString("para03"));
					results.add(user);
				}
			} catch (SQLException e) {
				LOG.error("findUidByLog:"+sql, e);
			} finally {
				try {
					con.close();
				} catch (SQLException e) {
					LOG.error("", e);
				}
			}
			return results;
		}
		
		public int insertLog(LogInfo info) {
			int value = 0;
			Connection con = ConForLog.getInstance().getConnectionForLocal();
			String sql = "insert into log_async_generals (id,logId,para01,para02,para03,para04) values (?,'7',?,?,?,?)";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setLong(m++, info.getId());
				ps.setString(m++, info.getName());
				ps.setString(m++, info.getUid());
				ps.setString(m++, info.getToken());
				ps.setString(m++, info.getTime());
				value = ps.executeUpdate();
				LOG.debug("insertLog:"+sql+"\nid="+info.getId()+",para01="+info.getName()+",para02="+info.getUid()+",para03="+info.getToken()+",para04="+info.getTime());
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
	
		public int updateLog(LogInfo info) {
			int value = 0;
			Connection con = ConForLog.getInstance().getConnectionForLocal();
			String sql = "update log_async_generals set para03=?,para04=? where logId='7' and para01=? and para02=?";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setString(m++, info.getToken());
				ps.setString(m++, info.getTime());
				ps.setString(m++, info.getName());
				ps.setString(m++, info.getUid());
				value = ps.executeUpdate();
				LOG.debug("updateLog:"+sql+"\npara03="+info.getToken()+",para04="+info.getTime()+",para01="+info.getName()+",para02="+info.getUid());
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
