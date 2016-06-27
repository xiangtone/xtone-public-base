package org.demo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

  public WechatToken getToken(String appId) throws SQLException, IllegalArgumentException, IllegalStateException {
    WechatToken result = new WechatToken();
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
        result.setAppId(rs.getString("appId"));
        result.setToken(rs.getString("token"));
        result.setNextTime(rs.getLong("nextTime"));
        result.setLastModTime(rs.getLong("lastModTime"));
        result.setValidTime(rs.getLong("validTime"));
        if (!result.isInValidTime()) {
          throw new IllegalStateException("Wechat token expired .appID:" + appId);
        }
      } else {
        throw new IllegalArgumentException("Can not find token of  appId:" + appId);
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
