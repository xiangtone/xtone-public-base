package org.demo.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.common.util.ConnectionService;
import org.demo.info.WechatToken;

public class WechatBaseService {

	private static final Logger LOG = Logger.getLogger(WechatBaseService.class);
	private static WechatBaseService instance = new WechatBaseService();

	private WechatBaseService() {
	}

	public static WechatBaseService getInstance() {
		return instance;
	}

	public String sendPostWechatInterface(String url, HttpEntity entity) throws ClientProtocolException, IOException {
		String result = "";
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			HttpPost httppost = new HttpPost(url);

			httppost.setEntity(entity);

			LOG.debug("Executing request: " + httppost.getRequestLine());
			CloseableHttpResponse response = httpclient.execute(httppost);
			try {
				LOG.debug("----------------------------------------");
				LOG.debug(response.getStatusLine());
				result = EntityUtils.toString(response.getEntity());
				LOG.debug(result);
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
		return result;
	}

	public String sendGetWechatInterface(String url) throws ClientProtocolException, IOException {
		String result = "";
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			HttpGet httpget = new HttpGet(url);

			LOG.debug("Executing request: " + httpget.getRequestLine());
			CloseableHttpResponse response = httpclient.execute(httpget);
			try {
				LOG.debug("----------------------------------------");
				LOG.debug(response.getStatusLine());
				result = EntityUtils.toString(response.getEntity());
				LOG.debug(result);
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
		return result;
	}

	public WechatToken getToken(String appId) throws SQLException, IllegalArgumentException, IllegalStateException {
		WechatToken result = null;
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT * FROM tbl_wechat_tokens where appId=?;";
			ps = con.prepareStatement(sql);
			int m = 1;
			ps.setString(m++, appId);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = new WechatToken(rs.getString("appId"), rs.getString("token"), rs.getLong("nextTime"),
						rs.getLong("lastModTime"), rs.getLong("validTime"));
				if (!result.isInValidTime()) {
					throw new IllegalStateException("Wechat token expired . appID:" + rs.getString("appId"));
				}
			} else {
				throw new IllegalArgumentException("Can not find token of appId:" + appId);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public List<WechatToken> getAllAppId() {
		List<WechatToken> result = new ArrayList<WechatToken>();
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT * FROM tbl_wechat_tokens;";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			WechatToken wechatToken = null;
			while (rs.next()) {
				wechatToken = new WechatToken(rs.getString("appId"), rs.getString("token"), rs.getLong("nextTime"),
						rs.getLong("lastModTime"), rs.getLong("validTime"));
				result.add(wechatToken);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public static void main(String[] args) throws IllegalArgumentException, SQLException {
		LOG.debug(WechatBaseService.getInstance().getToken(""));
	}
}
