package com.account.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.common.util.ConnectionService;

import com.account.domain.Channel;

public class ChannelDaoImpl{
	private static final Logger LOG = Logger.getLogger(ChannelDaoImpl.class);

	public Channel findByChannelId(String channelId) {
		Channel channelInfo = null;
		Connection con = ConnectionService.getInstance().getConnectionForLocal();
		String sql = "select * from tbl_account_channel_configs where id=?";
		LOG.debug("findByChannelId:"+sql);
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			int m = 1;
			ps.setString(m++, channelId);
			ResultSet rs = ps.executeQuery();
			LOG.debug(channelId);
			if (rs.next()) {
				channelInfo = new Channel();
				channelInfo.setChannelId(rs.getString("channelId"));
				channelInfo.setRegisterType(rs.getString("setRegisterType"));
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
		return channelInfo;
	}
}
