package org.demo.service;

import java.io.IOException;
import java.sql.SQLException;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.EntityBuilder;
import org.apache.http.entity.ContentType;
import org.apache.log4j.Logger;
import org.demo.info.WechatToken;

public class WechatTagService {

	private static final Logger LOG = Logger.getLogger(WechatTagService.class);

	public void createTag(String appId, String tagName)
			throws IllegalArgumentException, IllegalStateException, SQLException, ClientProtocolException, IOException {
		WechatToken token = WechatBaseService.getInstance().getToken(appId);
		String url = "https://api.weixin.qq.com/cgi-bin/tags/create?access_token=" + token.getToken();
		HttpEntity entity = EntityBuilder.create().setContentEncoding("utf-8").setContentType(ContentType.APPLICATION_JSON)
				.setText("{\"tag\" : {\"name\" : \"" + tagName + "\"  }}").build();
		WechatBaseService.getInstance().sendPostWechatInterface(url, entity);
	}

	public void queryTagList(String appId)
			throws IllegalArgumentException, IllegalStateException, SQLException, ClientProtocolException, IOException {
		WechatToken token = WechatBaseService.getInstance().getToken(appId);
		String url = "https://api.weixin.qq.com/cgi-bin/tags/get?access_token=" + token.getToken();
		WechatBaseService.getInstance().sendPostWechatInterface(url, null);
	}

	public static void main(String[] args)
			throws IllegalArgumentException, SQLException, ClientProtocolException, IOException {
		WechatTagService wechatTagService = new WechatTagService();
		// wechatTagService.createTag("wx19ac78d42392068c", "registered");
		wechatTagService.queryTagList("wx19ac78d42392068c");
	}
}
