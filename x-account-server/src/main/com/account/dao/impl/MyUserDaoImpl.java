package com.account.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.common.util.ConnectionService;

import com.account.domain.MyUser;

public class MyUserDaoImpl extends BasicDaoImpl{
	private final static Logger LOG=Logger.getLogger(MyUserDaoImpl.class);
	// 添加用户
	public int add(MyUser user) {
		int value=0;
		Connection con=ConnectionService.getInstance().getConnectionForLocal();
		String sql="insert into tbl_base_users (name,phone,email,uid,pwd,lastLoginTime,flagid,channel_id,appkey,status) values (?,?,?,?,Md5(?),?,?,?,?,?)";
		LOG.debug("addUser:"+sql);
	    try {
	    	PreparedStatement ps = con.prepareStatement(sql);
			int m = 1;
		    ps.setString(m++, user.getName());
			ps.setString(m++, user.getPhone());
			ps.setString(m++, user.getEmail());
			ps.setString(m++, user.getUid());
			ps.setString(m++, user.getPwd());
			ps.setLong(m++, user.getLastLoginTime());
			ps.setString(m++, user.getFlagid());
			ps.setString(m++, user.getChannel_id());
			ps.setString(m++, user.getAppkey());
			ps.setInt(m++, user.getStatus());
			LOG.debug(user.getName()+","+ user.getPhone()+","+ user.getEmail()+","+user.getUid()+","+user.getPwd()+","+user.getLastLoginTime()+","+user.getFlagid()+","+user.getChannel_id()+","+user.getAppkey()+","+user.getStatus());
			value= ps.executeUpdate();
		} catch (SQLException e) {
			LOG.error(sql,e);
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				LOG.error("",e);
			}
		}
		return value;
	}

	// 删除用户
	public int delete(int id) {
		return 0;
	}

	// 更新用户
	public int update(MyUser user) {
		return 0;
	}

	// 获取所有用户
	public List<MyUser> getAllUser() {
		return null;
	}

	// 根据名字查询
	public MyUser findByName(String name) {
		MyUser user=null;
		Connection con=ConnectionService.getInstance().getConnectionForLocal();
		String sql="select id,name,phone,email,uid,pwd from tbl_base_users where name =?";
		LOG.debug("findByName:"+sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int m = 1;
		    ps.setString(m++, name);
		    ResultSet rs=ps.executeQuery();
		    LOG.debug(name);
		    if(rs.next()){
		    	user=new MyUser();
		    	user.setName(rs.getString("name"));
		    	user.setPhone(rs.getString("phone"));
		    	user.setEmail(rs.getString("email"));
		    	user.setUid(rs.getString("uid"));
		    	user.setPwd(rs.getString("pwd"));
		    }
		} catch (SQLException e) {
			LOG.error(sql,e);
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				LOG.error("",e);
			}
		}
		return user;
	}

	// 根据手机号查询
	public MyUser findByPhone(String phone) {
		MyUser user=null;
		Connection con=ConnectionService.getInstance().getConnectionForLocal();
		String sql="select id,name,phone,email,uid,pwd from tbl_base_users where phone=?";
		LOG.debug("findByPhone:"+sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int m = 1;
		    ps.setString(m++, phone);
		    ResultSet rs=ps.executeQuery();
		    LOG.debug(phone);
		    if(rs.next()){
		    	user=new MyUser();
		    	user.setName(rs.getString("name"));
		    	user.setPhone(rs.getString("phone"));
		    	user.setEmail(rs.getString("email"));
		    	user.setUid(rs.getString("uid"));
		    	user.setPwd(rs.getString("pwd"));
		    }
		} catch (SQLException e) {
			LOG.error(sql,e);
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				LOG.error("",e);
			}
		}
		return user;
	}

	// 根据邮箱查询
	public MyUser findByEmail(String email) {
		MyUser user=null;
		Connection con=ConnectionService.getInstance().getConnectionForLocal();
		String sql="select id,name,phone,email,uid,pwd from tbl_base_users where email=?";
		LOG.debug("findByEmail:"+sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int m = 1;
		    ps.setString(m++, email);
		    ResultSet rs=ps.executeQuery();
		    LOG.debug(email);
		    if(rs.next()){
		    	user=new MyUser();
		    	user.setName(rs.getString("name"));
		    	user.setPhone(rs.getString("phone"));
		    	user.setEmail(rs.getString("email"));
		    	user.setUid(rs.getString("uid"));
		    	user.setPwd(rs.getString("pwd"));
		    }
		} catch (SQLException e) {
			LOG.error(sql,e);
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				LOG.error("",e);
			}
		}
		return user;
	}
	
	// 修改密码
		public int changePwd(MyUser user) {
			int value=0;
			Connection con=ConnectionService.getInstance().getConnectionForLocal();
			String sql="update tbl_base_users set pwd=Md5(?) where name=?";
			LOG.debug("changePwd:"+sql);
		    try {
		    	PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setString(m++, user.getPwd());
				ps.setString(m++, user.getName());
				LOG.debug(user.getPwd()+","+user.getName());
				value= ps.executeUpdate();
			} catch (SQLException e) {
				LOG.error(sql,e);
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					LOG.error("",e);
				}
			}
			return value;
		}
	
	/**
	 * 登录
	 * @return
	 */
	public MyUser login(MyUser user) {
		MyUser myUser=null;
		Connection con=ConnectionService.getInstance().getConnectionForLocal();
		String sql="select id,name,phone,email,uid,pwd,lastLoginTime,status from tbl_base_users where name = ? and pwd = Md5(?)";
		LOG.debug("login:"+sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int m = 1;
			ps.setString(m++, user.getName());
			ps.setString(m++, user.getPwd());
		    ResultSet rs=ps.executeQuery();
		    LOG.debug(user.getName()+","+user.getPwd());
		    if(rs.next()){
		    	myUser=new MyUser();
		    	myUser.setName(rs.getString("name"));
		    	myUser.setPhone(rs.getString("phone"));
		    	myUser.setEmail(rs.getString("email"));
		    	myUser.setUid(rs.getString("uid"));
		    	myUser.setPwd(rs.getString("pwd"));
		    	myUser.setLastLoginTime(rs.getLong("lastLoginTime"));
		    	myUser.setStatus(rs.getInt("status"));
		    }
		} catch (SQLException e) {
			LOG.error(sql,e);
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				LOG.error("",e);
			}
		}
		return myUser;
	}
	
	/**
	 * 通过uid实现自动登录
	 * @return
	 */
	public MyUser loginByUid(MyUser user) {
		MyUser myUser=null;
		Connection con=ConnectionService.getInstance().getConnectionForLocal();
		String sql="select id,name,phone,email,uid,lastLoginTime,status from tbl_base_users where uid=?";
		LOG.debug("loginByUid:"+sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int m = 1;
			ps.setString(m++, user.getUid());
		    ResultSet rs=ps.executeQuery();
		    LOG.debug(user.getUid());
		    if(rs.next()){
		    	myUser=new MyUser();
		    	myUser.setName(rs.getString("name"));
		    	myUser.setPhone(rs.getString("phone"));
		    	myUser.setEmail(rs.getString("email"));
		    	myUser.setUid(rs.getString("uid"));
		    	myUser.setLastLoginTime(rs.getLong("lastLoginTime"));
		    	myUser.setStatus(rs.getInt("status"));
		    }
		} catch (SQLException e) {
			LOG.error(sql,e);
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				LOG.error("",e);
			}
		}
		return myUser;
	}
	
	// 更新登录时间
			public int updateTime(MyUser user) {
				int value=0;
				Connection con=ConnectionService.getInstance().getConnectionForLocal();
				String sql="update tbl_base_users set lastLoginTime=?,flagid=?,channel_id=?,appkey=? where name=?";
				LOG.debug("updateTime:"+sql);
			    try {
			    	PreparedStatement ps = con.prepareStatement(sql);
					int m = 1;
					ps.setLong(m++, user.getLastLoginTime());
					ps.setString(m++, user.getFlagid());
					ps.setString(m++, user.getChannel_id());
					ps.setString(m++, user.getAppkey());
				    ps.setString(m++, user.getName());
				    LOG.debug(user.getLastLoginTime()+","+ user.getFlagid()+","+ user.getChannel_id()+","+user.getAppkey()+","+user.getName());
					
					value= ps.executeUpdate();
				} catch (SQLException e) {
					LOG.error(sql,e);
				}finally{
					try {
						con.close();
					} catch (SQLException e) {
						LOG.error("",e);
					}
				}
				return value;
			}
			
			// 更新用户状态
			public int updateStatus(MyUser user) {
				int value=0;
				Connection con=ConnectionService.getInstance().getConnectionForLocal();
				String sql="update tbl_base_users set status=1 where email=? and uid=?";
				LOG.debug("updateStatus:"+sql);
			    try {
			    	PreparedStatement ps = con.prepareStatement(sql);
					int m = 1;
					ps.setString(m++, user.getEmail());
					ps.setString(m++, user.getUid());
				    LOG.debug(user.getEmail()+","+user.getUid());
					
					value= ps.executeUpdate();
				} catch (SQLException e) {
					LOG.error(sql,e);
				}finally{
					try {
						con.close();
					} catch (SQLException e) {
						LOG.error("",e);
					}
				}
				return value;
			}

		/**
		 * 通过手机号登录
		 * @return
		 */
		public MyUser loginByPhone(MyUser user) {
			MyUser myUser=null;
			Connection con=ConnectionService.getInstance().getConnectionForLocal();
			String sql="select id,name,phone,email,uid,pwd,lastLoginTime,status from tbl_base_users where phone=? and pwd=Md5(?)";
			LOG.debug("loginByPhone:"+sql);
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setString(m++, user.getPhone());
				ps.setString(m++, user.getPwd());
			    ResultSet rs=ps.executeQuery();
			    LOG.debug(user.getPhone()+","+user.getPwd());
			    if(rs.next()){
			    	myUser=new MyUser();
			    	myUser.setName(rs.getString("name"));
			    	myUser.setPhone(rs.getString("phone"));
			    	myUser.setEmail(rs.getString("email"));
			    	myUser.setUid(rs.getString("uid"));
			    	myUser.setPwd(rs.getString("pwd"));
			    	myUser.setLastLoginTime(rs.getLong("lastLoginTime"));
			    	myUser.setStatus(rs.getInt("status"));
			    }
			} catch (SQLException e) {
				LOG.error(sql,e);
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					LOG.error("",e);
				}
			}
			return myUser;
		}
		
		/**
		 * 通过邮箱登录
		 * @return
		 */
		public MyUser loginByEmail(MyUser user) {
			MyUser myUser=null;
			Connection con=ConnectionService.getInstance().getConnectionForLocal();
			String sql="select id,name,phone,email,uid,pwd,lastLoginTime,status from tbl_base_users where email=? and pwd=Md5(?)";
			LOG.debug("loginByEmail:"+sql);
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				int m = 1;
				ps.setString(m++, user.getEmail());
				ps.setString(m++, user.getPwd());
			    ResultSet rs=ps.executeQuery();
			    LOG.debug(user.getEmail()+","+user.getPwd());
			    if(rs.next()){
			    	myUser=new MyUser();
			    	myUser.setName(rs.getString("name"));
			    	myUser.setPhone(rs.getString("phone"));
			    	myUser.setEmail(rs.getString("email"));
			    	myUser.setUid(rs.getString("uid"));
			    	myUser.setPwd(rs.getString("pwd"));
			    	myUser.setLastLoginTime(rs.getLong("lastLoginTime"));
			    	myUser.setStatus(rs.getInt("status"));
			    }
			} catch (SQLException e) {
				LOG.error(sql,e);
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					LOG.error("",e);
				}
			}
			return myUser;
		}
//
//		public int add(MyUser user) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			int value = 0;
//			try {
//				value=sqlSession.insert("insertMyUser", user);
//				sqlSession.commit();
//			} catch (Exception e) {  
//				LOG.error("insert error",e);
//				sqlSession.rollback();  
//			}finally {
//				sqlSession.close();
//			}
//			return value;
//		}
//
//		// 删除用户
//		public int delete(int id) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			int value = 0;
//			try {
//				value=sqlSession.delete("com.account.mapping.myUserMapper.deleteMyUser", id);
//				sqlSession.commit();
//			} catch (Exception e) {  
//				LOG.error("",e);
//				sqlSession.rollback();  
//			}finally {
//				sqlSession.close();
//			}
//			return value;
//		}
//
//		// 更新用户
//		public int update(MyUser user) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			int value = 0;
//			try {
//				value=sqlSession.update("com.account.mapping.myUserMapper.updateMyUser", user);
//				sqlSession.commit();
//			} catch (Exception e) {  
//				LOG.error("",e);
//				sqlSession.rollback();  
//			}finally {
//				sqlSession.close();
//			}
//			return value;
//		}
//
//		// 获取所有用户
//		public List<MyUser> getAllStu() {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			List<MyUser> MyUsers = null;
//			try {
//				MyUsers = sqlSession.selectList("getAllMyUser");
//			} finally {
//				sqlSession.close();
//			}
//			return MyUsers;
//		}
//
//		// 根据名字查询
//		public MyUser findByName(String name) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			MyUser user;
//			try {
//				user = sqlSession.selectOne("com.account.mapping.myUserMapper.findByName", name);
//			} finally {
//				sqlSession.close();
//			}
//			return user;
//		}
//
//		// 根据手机号查询
//		public MyUser findByPhone(String phone) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			MyUser user;
//			try {
//				user = sqlSession.selectOne("com.account.mapping.myUserMapper.findByPhone", phone);
//			} finally {
//				sqlSession.close();
//			}
//			return user;
//		}
//
//		// 根据邮箱查询
//		public MyUser findByEmail(String email) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			MyUser user;
//			try {
//				user = sqlSession.selectOne("com.account.mapping.myUserMapper.findByEmail", email);
//			} finally {
//				sqlSession.close();
//			}
//			return user;
//		}
//		
//		// 修改密码
//			public int changePwd(MyUser user) {
//				SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//				int value = 0;
//				try {
//					value=sqlSession.update("com.account.mapping.myUserMapper.changePwd", user);
//					sqlSession.commit();
//				} catch (Exception e) {
//					LOG.error("",e);
//					sqlSession.rollback();  
//				}finally {
//					sqlSession.close();
//				}
//				return value;
//			}
//		
//		/**
//		 * 登录
//		 * @return
//		 */
//		public MyUser login(MyUser user) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			MyUser myUser=null;
//			try {
//			     myUser = sqlSession.selectOne("login", user);
//			} finally {
//				sqlSession.close();
//			}
//			return myUser;
//		}
//		
//		/**
//		 * 通过uid实现自动登录
//		 * @return
//		 */
//		public MyUser loginByUid(MyUser user) {
//			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//			MyUser myUser=null;
//			try {
//			    myUser = sqlSession.selectOne("loginByUid", user);
//			} finally {
//				sqlSession.close();
//			}
//			return myUser;
//		}
//		
//		
//		// 更新登录时间
//				public int updateTime(MyUser user) {
//					SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//					int value = 0;
//					try {
//						value=sqlSession.update("com.account.mapping.myUserMapper.updateTime", user);
//						sqlSession.commit();
//					} catch (Exception e) {  
//						LOG.error("",e);
//						sqlSession.rollback();  
//					}finally {
//						sqlSession.close();
//					}
//					return value;
//				}
//				
//				// 更新用户状态
//				public int updateStatus(MyUser user) {
//					SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//					int value = 0;
//					try {
//						value=sqlSession.update("com.account.mapping.myUserMapper.updateStatus", user);
//						sqlSession.commit();
//					} catch (Exception e) {  
//						LOG.error("",e);
//						sqlSession.rollback();  
//					}finally {
//						sqlSession.close();
//					}
//					return value;
//				}
//
//			/**
//			 * 通过手机号登录
//			 * @return
//			 */
//			public MyUser loginByPhone(MyUser user) {
//				// TODO Auto-generated method stub
//				SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//				MyUser myUser=null;
//				try {
//				    myUser = sqlSession.selectOne("loginByPhone", user);
//				} finally {
//					sqlSession.close();
//				}
//				return myUser;
//			}
//			
//			/**
//			 * 通过邮箱登录
//			 * @return
//			 */
//			public MyUser loginByEmail(MyUser user) {
//				// TODO Auto-generated method stub
//				SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
//				MyUser myUser=null;
//				try {
//				    myUser = sqlSession.selectOne("loginByEmail", user);
//				} finally {
//					sqlSession.close();
//				}
//				return myUser;
//			}
}
