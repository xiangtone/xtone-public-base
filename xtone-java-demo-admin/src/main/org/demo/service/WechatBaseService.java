package org.demo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.log4j.Logger;
import org.common.util.ConnectionService;

public class WechatBaseService {

  private static final Logger LOG = Logger.getLogger(WechatBaseService.class);
  private static WechatBaseService instance = new WechatBaseService();

  private WechatBaseService() {
  }

  public static WechatBaseService getInstance() {
    return instance;
  }

  public String getToken(String appId) {
    String result = "";
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
      while (rs.next()) {
        result = rs.getString("token");
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

  public static void main(String[] args) {
    LOG.debug(WechatBaseService.getInstance().getToken(""));
  }
}
