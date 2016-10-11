package com.system.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.system.constant.Constant;
import com.system.database.JdbcControl;
import com.system.database.QueryCallBack;
import com.system.model.UserModel;
import com.system.util.StringUtil;

public class UserDao {
	private final static Logger LOG = Logger.getLogger("UserDao.class");

	public Map<String, Object> loadUser(int pageIndex, int groupId) {
		String sql = "select " + Constant.CONSTANT_REPLACE_STRING
				+ " FROM  `tbl_group_user` a LEFT JOIN  tbl_user b ON a.`user_id` = b.`id` where 1=1 ";

		String query = "";

		String sql2 = "select " + Constant.CONSTANT_REPLACE_STRING + " FROM tbl_user";

		if (groupId > 0)
			query = " and group_id =" + groupId;

		String limit = " limit " + Constant.PAGE_SIZE * (pageIndex - 1) + "," + Constant.PAGE_SIZE;

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("rows",
				new JdbcControl().query(
						(groupId > 0 ? sql : sql2).replace(Constant.CONSTANT_REPLACE_STRING, " count(*) ") + query,
						new QueryCallBack() {
							@Override
							public Object onCallBack(ResultSet rs) throws SQLException {
								if (rs.next())
									return rs.getInt(1);
								return 0;
							}
						}));

		String order = " order by id desc ";

		map.put("list",
				new JdbcControl().query(
						(groupId > 0 ? sql : sql2).replace(Constant.CONSTANT_REPLACE_STRING,
								(groupId > 0 ? " a.group_id,b.* " : " * ")) + query + order + limit,
				new QueryCallBack() {
					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						List<UserModel> list = new ArrayList<UserModel>();

						while (rs.next()) {
							UserModel model = new UserModel();

							model.setId(rs.getInt("id"));
							model.setName(StringUtil.getString(rs.getString("name"), ""));
							model.setPassword(StringUtil.getString(rs.getString("pwd"), ""));
							model.setNickName(StringUtil.getString(rs.getString("nick_name"), ""));
							model.setMail(StringUtil.getString(rs.getString("mail"), ""));
							model.setQq(StringUtil.getString(rs.getString("qq"), ""));
							model.setPhone(StringUtil.getString(rs.getString("phone"), ""));
							model.setStatus(rs.getInt("status"));
							// model.setCreateUser(rs.getInt("create_user"));

							if (model.getId() > 0)
								list.add(model);
						}

						return list;
					}
				}));

		return map;
	}

	public Map<String, Object> loadUser(int pageIndex, int groupId, String userName, String nickName) {
		String sql = "select " + Constant.CONSTANT_REPLACE_STRING
				+ " FROM  `tbl_group_user` a LEFT JOIN  tbl_user b ON a.`user_id` = b.`id` where 1=1 ";

		String query = "";

		String sql2 = "select " + Constant.CONSTANT_REPLACE_STRING
				+ " FROM tbl_user a LEFT JOIN `tbl_user` b ON b.`id`=a.`create_user` where 1=1 ";

		if (groupId > 0)
			query = " and group_id =" + groupId;

		if (!StringUtil.isNullOrEmpty(userName)) {
			query += " AND name LIKE '%" + userName + "%' ";
		}

		if (!StringUtil.isNullOrEmpty(nickName)) {
			query += " AND nick_name LIKE '%" + nickName + "%' ";
		}

		String limit = " limit " + Constant.PAGE_SIZE * (pageIndex - 1) + "," + Constant.PAGE_SIZE;

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("rows",
				new JdbcControl().query(
						(groupId > 0 ? sql : sql2).replace(Constant.CONSTANT_REPLACE_STRING, " count(*) ") + query,
						new QueryCallBack() {
							@Override
							public Object onCallBack(ResultSet rs) throws SQLException {
								if (rs.next())
									return rs.getInt(1);
								return 0;
							}
						}));

		String order = " order by a.id desc ";

		map.put("list",
				new JdbcControl().query((groupId > 0 ? sql : sql2).replace(Constant.CONSTANT_REPLACE_STRING,
						(groupId > 0 ? " a.group_id,b.* " : " a.*,b.`nick_name` group_name ")) + query + order + limit,
				new QueryCallBack() {
					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						List<UserModel> list = new ArrayList<UserModel>();

						while (rs.next()) {
							UserModel model = new UserModel();

							model.setId(rs.getInt("id"));
							model.setName(StringUtil.getString(rs.getString("name"), ""));
							model.setPassword(StringUtil.getString(rs.getString("pwd"), ""));
							model.setNickName(StringUtil.getString(rs.getString("nick_name"), ""));
							model.setMail(StringUtil.getString(rs.getString("mail"), ""));
							model.setQq(StringUtil.getString(rs.getString("qq"), ""));
							model.setPhone(StringUtil.getString(rs.getString("phone"), ""));
							model.setStatus(rs.getInt("status"));
							model.setCreateUser(rs.getString("group_name"));

							if (model.getId() > 0)
								list.add(model);
						}

						return list;
					}
				}));

		return map;
	}

	//
	public Map<String, Object> loadUser(int pageIndex, int groupId, String userName, String nickName, int userId) {
		String sql = "select " + Constant.CONSTANT_REPLACE_STRING
				+ " FROM  `tbl_group_user` a LEFT JOIN  tbl_user b ON a.`user_id` = b.`id` where 1=1 ";

		String query = "";

		String sql2 = "select " + Constant.CONSTANT_REPLACE_STRING + " FROM tbl_user where 1=1 ";

		if (groupId > 0)
			query += " and group_id =" + groupId;

		if (userId > 0)
			query += " and create_user = " + userId;

		if (!StringUtil.isNullOrEmpty(userName)) {
			query += " AND name LIKE '%" + userName + "%' ";
		}

		if (!StringUtil.isNullOrEmpty(nickName)) {
			query += " AND nick_name LIKE '%" + nickName + "%' ";
		}

		String limit = " limit " + Constant.PAGE_SIZE * (pageIndex - 1) + "," + Constant.PAGE_SIZE;

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("rows",
				new JdbcControl().query(
						(groupId > 0 ? sql : sql2).replace(Constant.CONSTANT_REPLACE_STRING, " count(*) ") + query,
						new QueryCallBack() {
							@Override
							public Object onCallBack(ResultSet rs) throws SQLException {
								if (rs.next())
									return rs.getInt(1);
								return 0;
							}
						}));

		String order = " order by id desc ";

		map.put("list",
				new JdbcControl().query(
						(groupId > 0 ? sql : sql2).replace(Constant.CONSTANT_REPLACE_STRING,
								(groupId > 0 ? " a.group_id,b.* " : " * ")) + query + order + limit,
				new QueryCallBack() {
					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						List<UserModel> list = new ArrayList<UserModel>();

						while (rs.next()) {
							UserModel model = new UserModel();

							model.setId(rs.getInt("id"));
							model.setName(StringUtil.getString(rs.getString("name"), ""));
							model.setPassword(StringUtil.getString(rs.getString("pwd"), ""));
							model.setNickName(StringUtil.getString(rs.getString("nick_name"), ""));
							model.setMail(StringUtil.getString(rs.getString("mail"), ""));
							model.setQq(StringUtil.getString(rs.getString("qq"), ""));
							model.setPhone(StringUtil.getString(rs.getString("phone"), ""));
							model.setStatus(rs.getInt("status"));

							if (model.getId() > 0)
								list.add(model);
						}

						return list;
					}
				}));

		return map;
	}

	@SuppressWarnings("unchecked")
	public List<UserModel> loadActityUserList() {
		String sql = "select * from tbl_user where status = 1";

		return (List<UserModel>) new JdbcControl().query(sql, new QueryCallBack() {
			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				List<UserModel> list = new ArrayList<UserModel>();
				UserModel model = null;
				while (rs.next()) {
					model = new UserModel();

					model.setId(rs.getInt("id"));
					model.setName(StringUtil.getString(rs.getString("name"), ""));
					model.setPassword(StringUtil.getString(rs.getString("pwd"), ""));
					model.setNickName(StringUtil.getString(rs.getString("nick_name"), ""));
					model.setMail(StringUtil.getString(rs.getString("mail"), ""));
					model.setQq(StringUtil.getString(rs.getString("qq"), ""));
					model.setPhone(StringUtil.getString(rs.getString("phone"), ""));
					LOG.info("id:" + rs.getInt("id") + " ;name:" + rs.getString("name") + " ;pwd:" + rs.getString("pwd")
							+ " ;nick_name:" + rs.getString("nick_name") + " ;mail:" + rs.getString("mail"));
					list.add(model);
				}
				return list;
			}
		});
	}

	public boolean updateUserWithPwd(UserModel model) {
		String sql = "update tbl_user set name = '" + model.getName() + "', pwd = md5('" + model.getPassword()
				+ "') ,nick_name = '" + model.getNickName() + "',mail='" + model.getMail() + "',qq='" + model.getQq()
				+ "',phone='" + model.getPhone() + "' where id =" + model.getId();

		return new JdbcControl().execute(sql);
	}

	public boolean updateUser(UserModel model) {
		String sql = "update tbl_user set name = '" + model.getName() + "', pwd = md5('" + model.getPassword()
				+ "') ,nick_name = '" + model.getNickName() + "',mail='" + model.getMail() + "',qq='" + model.getQq()
				+ "',phone='" + model.getPhone() + "',status=" + model.getStatus() + " where id =" + model.getId();

		return new JdbcControl().execute(sql);
	}

	public boolean updateUserWithoutPwd(UserModel model) {
		String sql = "update tbl_user  set name = '" + model.getName() + "', nick_name = '" + model.getNickName()
				+ "',mail='" + model.getMail() + "',qq='" + model.getQq() + "',phone='" + model.getPhone()
				+ "' where id =" + model.getId();

		return new JdbcControl().execute(sql);
	}

	public UserModel getUserModelById(int id) {
		String sql = "select * from tbl_user where id=" + id;

		return (UserModel) new JdbcControl().query(sql, new QueryCallBack() {
			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				UserModel model = null;
				if (rs.next()) {
					model = new UserModel();

					model.setId(rs.getInt("id"));
					model.setName(StringUtil.getString(rs.getString("name"), ""));
					model.setPassword(StringUtil.getString(rs.getString("pwd"), ""));
					model.setNickName(StringUtil.getString(rs.getString("nick_name"), ""));
					model.setMail(StringUtil.getString(rs.getString("mail"), ""));
					model.setQq(StringUtil.getString(rs.getString("qq"), ""));
					model.setPhone(StringUtil.getString(rs.getString("phone"), ""));
					model.setStatus(rs.getInt("status"));

				}
				return model;
			}
		});
	}

	public void addUser(UserModel model) {
		String sql = "insert into tbl_user(name,pwd,nick_name,mail,qq,phone) value(?,?,?,?,?,?)";

		Map<Integer, Object> param = new HashMap<Integer, Object>();

		param.put(1, model.getName());
		param.put(2, StringUtil.getMd5String(model.getPassword(), 32));
		param.put(3, model.getNickName());
		param.put(4, model.getMail());
		param.put(5, model.getQq());
		param.put(6, model.getPhone());

		new JdbcControl().execute(sql, param);
	}

	public void delUserInGroup(int userId) {
		String sql = "delete from tbl_group_user where user_id =" + userId;
		new JdbcControl().execute(sql);
	}

	public void delUser(int id) {
		String sql = "delete from tbl_user where id = " + id;
		new JdbcControl().execute(sql);
	}

	@SuppressWarnings("unchecked")
	public List<Integer> loadUserGroup(int id) {
		String sql = "select group_id from tbl_group_user where user_id = " + id;
		return (List<Integer>) new JdbcControl().query(sql, new QueryCallBack() {
			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				while (rs.next())
					list.add(rs.getInt(1));
				return list;
			}
		});
	}

	public void updateUserGroup(List<Integer> list, int userId) {
		String sql = "insert into tbl_group_user(user_id,group_id) value(" + userId + ",?)";
		List<Map<Integer, Object>> dataParams = new ArrayList<Map<Integer, Object>>();
		for (int i = 0; i < list.size(); i++) {
			Map<Integer, Object> map = new HashMap<Integer, Object>();
			map.put(1, list.get(i));
			dataParams.add(map);
		}
		new JdbcControl().executeMulData(sql, dataParams);
	}

}
