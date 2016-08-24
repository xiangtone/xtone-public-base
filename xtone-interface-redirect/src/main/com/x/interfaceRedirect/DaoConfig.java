package com.x.interfaceRedirect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

public class DaoConfig {

  private final static Logger LOG = Logger.getLogger(DaoConfig.class);

  public TargetInfo getTargetUrlByTitle(String title) {
    TargetInfo result = null;
    PreparedStatement ps = null;
    Connection con = null;
    ResultSet rs = null;
    try {
      con = ConnectionServiceConfig.getInstance().getConnectionForLocal();
      String sql = "SELECT targetUrl FROM tbl_zuoyao_redirect_targets where title=?;";
      LOG.debug("query");
      ps = con.prepareStatement(sql);
      int m = 1;
      ps.setString(m++, title);
      rs = ps.executeQuery();
      while (rs.next()) {
        result = new TargetInfo();
        result.setTargetUrl(rs.getString("targetUrl"));
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

  public Map getTargetAll(String title) {
    Map<String, TargetInfo> result = new HashMap<String, TargetInfo>();
    PreparedStatement ps = null;
    Connection con = null;
    ResultSet rs = null;
    try {
      con = ConnectionServiceConfig.getInstance().getConnectionForLocal();
      String sql = "SELECT * FROM tbl_zuoyao_redirect_targets ;";
      LOG.debug("query");
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();
      while (rs.next()) {
        TargetInfo row = new TargetInfo();
        row.setTitle(rs.getString("title"));
        row.setTargetUrl(rs.getString("targetUrl"));
        result.put(rs.getString("title"), row);
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
}
