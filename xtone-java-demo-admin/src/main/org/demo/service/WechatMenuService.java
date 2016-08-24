package org.demo.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.EntityBuilder;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.common.util.ConnectionService;
import org.demo.info.WechatToken;

public class WechatMenuService {

	private static final Logger LOG = Logger.getLogger(WechatMenuService.class);

	public String createOrUpdateBaseMenu(String appId)
			throws SQLException, IllegalArgumentException, ClientProtocolException, IOException {
		String result = "";
		WechatToken token = WechatBaseService.getInstance().getToken(appId);
		String menu = this.getBaseMenu(appId);
		sendWechatInterface(menu, token);
		return result;
	}

	private void sendWechatInterface(String menu, WechatToken token) throws ClientProtocolException, IOException {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		try {
			HttpPost httppost = new HttpPost(
					"https://api.weixin.qq.com/cgi-bin/menu/create?access_token=" + token.getToken());

			HttpEntity entity = EntityBuilder.create().setContentEncoding("utf-8")
					.setContentType(ContentType.APPLICATION_JSON).setText(menu).build();
			httppost.setEntity(entity);

			LOG.debug("Executing request: " + httppost.getRequestLine());
			CloseableHttpResponse response = httpclient.execute(httppost);
			try {
				LOG.debug("----------------------------------------");
				LOG.debug(response.getStatusLine());
				LOG.debug(EntityUtils.toString(response.getEntity()));
			} finally {
				response.close();
			}
		} finally {
			httpclient.close();
		}
	}

	private String getBaseMenu(String appId) throws SQLException, IllegalArgumentException {
		String result = "";
		PreparedStatement ps = null;
		Connection con = null;
		ResultSet rs = null;
		try {
			con = ConnectionService.getInstance().getConnectionForLocal();
			String sql = "SELECT content FROM tbl_wechat_menus where appId=? and `menuId`='base';";
			ps = con.prepareStatement(sql);
			int m = 1;
			ps.setString(m++, appId);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = rs.getString("content");
			} else {
				throw new IllegalArgumentException("Can not find token for appId:" + appId);
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

	public String queryMenuFromWechat(String appId)
			throws IllegalArgumentException, IllegalStateException, SQLException, ClientProtocolException, IOException {
		String result = "";
		WechatToken token = WechatBaseService.getInstance().getToken(appId);
		String url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=" + token.getToken();
		result = WechatBaseService.getInstance().sendGetWechatInterface(url);
		return result;
	}

	public static void main(String[] args)
			throws IllegalArgumentException, SQLException, ClientProtocolException, IOException {
		WechatMenuService wechatMenuService = new WechatMenuService();
		wechatMenuService.createOrUpdateBaseMenu("wx19ac78d42392068c");
	}
}
