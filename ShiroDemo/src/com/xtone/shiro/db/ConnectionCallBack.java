package com.xtone.shiro.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public interface ConnectionCallBack {
	void onConnectionCallBack(Statement stmt, ResultSet rs) throws SQLException;
}
