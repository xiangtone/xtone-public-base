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
import com.system.model.MenuHeadModel;
import com.system.util.StringUtil;

public class MenuHeadDao {
	private final static Logger LOG = Logger.getLogger("MenuHeadDao.class");

	@SuppressWarnings("unchecked")
	public List<MenuHeadModel> loadMenuHeadList() {
		String sql = "select * from `tbl_menu_head` order by sort,id asc";

		return (List<MenuHeadModel>) new JdbcControl().query(sql, new QueryCallBack() {
			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {
				List<MenuHeadModel> list = new ArrayList<MenuHeadModel>();

				MenuHeadModel model = null;

				while (rs.next()) {
					model = new MenuHeadModel();
					model.setId(rs.getInt("id"));
					model.setName(rs.getString("name"));
					LOG.info("id:" + rs.getInt("id") + " ;name:" + rs.getString("name"));
					list.add(model);
				}

				return list;
			}
		});
	}

	public Map<String, Object> loadMenuHead(int pageIndex, String menuName, int sort) {
		System.out.println("page:" + pageIndex);
		String limit = " limit " + Constant.PAGE_SIZE * (pageIndex - 1) + "," + Constant.PAGE_SIZE;
		String sqlcount = " count(*) ";
		String sql = "SELECT " + Constant.CONSTANT_REPLACE_STRING + " from `tbl_menu_head` WHERE 1=1 ";

		if (!StringUtil.isNullOrEmpty(menuName)) {
			sql += " AND name LIKE '%" + menuName + "%' ";
		}

		if (sort > 0) {
			sql += " AND sort=" + sort + " ";
		}

		sql += " order by sort,id asc ";

		System.out.println("sql:" + sql);

		Map<String, Object> result = new HashMap<String, Object>();

		JdbcControl control = new JdbcControl();

		int rowcount = (Integer) control.query(sql.replace(Constant.CONSTANT_REPLACE_STRING, " count(*) "),
				new QueryCallBack() {

					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						if (rs.next())
							return rs.getInt(1);
						return 0;
					}
				});

		System.out.println(rowcount);

		result.put("rows", rowcount);

		result.put("list",
				control.query(sql.replace(Constant.CONSTANT_REPLACE_STRING, " * ") + limit, new QueryCallBack() {

					@Override
					public Object onCallBack(ResultSet rs) throws SQLException {
						List<MenuHeadModel> list = new ArrayList<MenuHeadModel>();

						MenuHeadModel model = null;

						while (rs.next()) {
							model = new MenuHeadModel();
							model.setId(rs.getInt("id"));
							model.setName(rs.getString("name"));
							model.setRemark(rs.getString("remark"));
							model.setSort(rs.getShort("sort"));
							list.add(model);
						}

						return list;
					}
				}));

		return result;

	}

	public boolean addMenuHead(MenuHeadModel model) {
		String sql = "INSERT INTO `tbl_menu_head`(name,remark,sort) VALUE('" + model.getName() + "','"
				+ model.getRemark() + "'," + model.getSort() + ")";

		return new JdbcControl().execute(sql);
	}

	public List<String> loadMenuName(int id) {
		String sql = "SELECT name FROM `tbl_menu_head` WHERE 1=1";

		if (id > 0) {
			sql += " AND id<>" + id;
		}

		final List<String> list = new ArrayList<String>();
		new JdbcControl().query(sql, new QueryCallBack() {

			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {

				while (rs.next()) {

					list.add(rs.getString(1));

				}
				System.out.println("list:" + list);
				return list;
			}
		});

		for (String string : list) {
			System.out.println("list:" + list);
		}
		return list;
	}

	public MenuHeadModel loadMenuById(int id) {
		String sql = "SELECT * FROM `tbl_menu_head` WHERE id=" + id;

		final MenuHeadModel model = new MenuHeadModel();

		new JdbcControl().query(sql, new QueryCallBack() {

			@Override
			public Object onCallBack(ResultSet rs) throws SQLException {

				if (rs.next()) {

					model.setId(rs.getInt("id"));
					model.setName(rs.getString("name"));
					model.setRemark(rs.getString("remark"));
					model.setSort(rs.getInt("sort"));

				}
				System.out.println("model:" + model.getName());
				return model;
			}
		});
		return model;
	}

	public boolean deletMenu(int id) {
		String sql = "DELETE FROM `tbl_menu_head` WHERE id=" + id;

		return new JdbcControl().execute(sql);
	}

	public boolean updataMenu(MenuHeadModel model) {
		String sql = "UPDATE `tbl_menu_head` SET " + "name='" + model.getName() + "'," + "remark='" + model.getRemark()
				+ "'," + "sort=" + model.getSort() + " WHERE id=" + model.getId();

		return new JdbcControl().execute(sql);
	}

	public boolean updateMenu(int id, int sort) {
		String sql = "UPDATE `tbl_menu_head` SET " + "sort=" + sort + " WHERE id=" + id;
		System.out.println("sql:" + sql);
		return new JdbcControl().execute(sql);
	}

	public static void main(String[] args) {
		MenuHeadDao dao = new MenuHeadDao();

		List<String> list = dao.loadMenuName(4);

		System.out.println(list);

		for (String string : list) {
			System.out.println(string);
		}
	}

}
