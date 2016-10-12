package com.system.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.system.constant.Constant;
import com.system.database.JdbcControl;
import com.system.database.QueryCallBack;
import com.system.model.GroupModel;
import com.system.util.StringUtil;

public class GroupDao {
	@SuppressWarnings("unchecked")
	public List<GroupModel> loadAllGroup() {
		String sql = "select * from tbl_group";

		return (List<GroupModel>) new JdbcControl().query(sql, new QueryCallBack() {
			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				List<GroupModel> list = new ArrayList<GroupModel>();

				while (rs.next()) {
					GroupModel model = new GroupModel();
					model.setId(rs.getInt("id"));
					model.setName(StringUtil.getString(rs.getString("name"), ""));
					model.setRemark(StringUtil.getString(rs.getString("remark"), ""));
					list.add(model);
				}

				return list;
			}
		});

	}

	public Map<String, Object> loadGroup(int pageIndex) {
		String sql = "select " + Constant.CONSTANT_REPLACE_STRING + " from tbl_group";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", new JdbcControl().query(sql.replace(Constant.CONSTANT_REPLACE_STRING, " count(*) "),
				new QueryCallBack() {
					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						if (rs.next())
							return rs.getInt(1);
						return 0;
					}
				}));

		String limit = " limit " + Constant.PAGE_SIZE * (pageIndex - 1) + "," + Constant.PAGE_SIZE;

		map.put("list", new JdbcControl().query(sql.replace(Constant.CONSTANT_REPLACE_STRING, " * ") + limit,
				new QueryCallBack() {
					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						List<GroupModel> list = new ArrayList<GroupModel>();

						while (rs.next()) {
							GroupModel model = new GroupModel();
							model.setId(rs.getInt("id"));
							model.setName(StringUtil.getString(rs.getString("name"), ""));
							model.setRemark(StringUtil.getString(rs.getString("remark"), ""));
							list.add(model);
						}

						return list;
					}
				}));

		return map;
	}

	public Map<String, Object> loadGroup(int pageIndex, String name) {
		String sql = "select " + Constant.CONSTANT_REPLACE_STRING + " from tbl_group WHERE 1=1 ";

		if (!StringUtil.isNullOrEmpty(name)) {
			sql += " AND name LIKE '%" + name + "%' ";
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", new JdbcControl().query(sql.replace(Constant.CONSTANT_REPLACE_STRING, " count(*) "),
				new QueryCallBack() {
					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						if (rs.next())
							return rs.getInt(1);
						return 0;
					}
				}));

		String limit = " limit " + Constant.PAGE_SIZE * (pageIndex - 1) + "," + Constant.PAGE_SIZE;

		map.put("list", new JdbcControl().query(sql.replace(Constant.CONSTANT_REPLACE_STRING, " * ") + limit,
				new QueryCallBack() {
					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						List<GroupModel> list = new ArrayList<GroupModel>();

						while (rs.next()) {
							GroupModel model = new GroupModel();
							model.setId(rs.getInt("id"));
							model.setName(StringUtil.getString(rs.getString("name"), ""));
							model.setRemark(StringUtil.getString(rs.getString("remark"), ""));
							list.add(model);
						}

						return list;
					}
				}));

		return map;
	}

	public GroupModel loadGroupById(int id) {
		String sql = "select * from tbl_group where id =" + id;
		return (GroupModel) new JdbcControl().query(sql, new QueryCallBack() {
			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				if (rs.next()) {
					GroupModel model = new GroupModel();
					model.setId(rs.getInt("id"));
					model.setName(StringUtil.getString(rs.getString("name"), ""));
					model.setRemark(StringUtil.getString(rs.getString("remark"), ""));
					return model;
				}
				return null;
			}
		});
	}

	public boolean updateGroup(GroupModel model) {
		String sql = "update tbl_group set name = '" + model.getName() + "',remark = '" + model.getRemark()
				+ "' where id =" + model.getId();

		return new JdbcControl().execute(sql);
	}

	public boolean addGroup(GroupModel model) {
		String sql = "insert into tbl_group (name,remark) value('" + model.getName() + "','" + model.getRemark() + "')";
		return new JdbcControl().execute(sql);
	}

	// 暂时还没使用，等以后再来看看这个系统
	@SuppressWarnings("unchecked")
	public Map<Integer, Integer> loadUserByGroupId(int id) {
		String sql = "select user_id,group_id from tbl_group_user where group_id =" + id;
		return (Map<Integer, Integer>) new JdbcControl().query(sql, new QueryCallBack() {

			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				Map<Integer, Integer> map = new HashMap<Integer, Integer>();

				while (rs.next()) {
					map.put(rs.getInt("user_id"), rs.getInt("group_id"));
				}

				return map;
			}
		});
	}

	@SuppressWarnings("unchecked")
	public List<Integer> loadRightByGroupId(int id) {
		String sql = "SELECT menu_2_id FROM `tbl_group_right` WHERE group_id = " + id;
		return (List<Integer>) new JdbcControl().query(sql, new QueryCallBack() {
			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				while (rs.next()) {
					list.add(rs.getInt(1));
				}
				return list;
			}
		});
	}

	public void delGroupRightById(int id) {
		String sql = "delete from tbl_group_right where group_id = " + id;
		new JdbcControl().execute(sql);
	}

	public void addGroupRight(int groupId, List<Integer> list) {
		String sql = "insert into tbl_group_right(group_id,menu_2_id) value(" + groupId + ",?)";
		List<Map<Integer, Object>> dataParams = new ArrayList<Map<Integer, Object>>();
		for (int i = 0; i < list.size(); i++) {
			Map<Integer, Object> map = new HashMap<Integer, Object>();
			map.put(1, list.get(i));
			dataParams.add(map);
		}
		new JdbcControl().executeMulData(sql, dataParams);
	}

}
