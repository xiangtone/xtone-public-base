package com.x.interfaceRedirect;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import org.apache.log4j.Logger;

public class WebDaoConfig
{
  private static final Logger LOG = Logger.getLogger(DaoConfig.class);

  public TargetInfo getTargetUrlByTitle(String title) {
    TargetInfo result = null;
    PreparedStatement ps = null;
    Connection con = null;
    ResultSet rs = null;
    try {
      con = ConnectionServiceConfig.getInstance().getConnectionForLocal();
      String sql = "SELECT targetUrl FROM tbl_zuoyao_redirect_targets where title=?;";
      ps = con.prepareStatement(sql);
      int m = 1;
      ps.setString(m++, title);
      rs = ps.executeQuery();
      while (rs.next()) {
        result = new TargetInfo();
        result.setTargetUrl(rs.getString("targetUrl"));
      }
    }
    catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (con != null) {
        try {
          con.close();
        }
        catch (Exception e) {
          e.printStackTrace();
        }
      }
    }
    return result;
  }

  public Urlsinfo getUrlByUrlinfo(long redirectId)
  {
    Urlsinfo result = null;
    PreparedStatement ps = null;
    Connection con = null;
    ResultSet rs = null;
    HashMap teMap = null;
    try {
      con = ConnectionServiceConfig.getInstance().getConnectionForLocal();
      String sql = "SELECT redirectType,content FROM tbl_redirects where redirectId=?";
      ps = con.prepareStatement(sql);
      int m = 1;
      ps.setLong(m++, redirectId);

      System.out.println(ps.toString());
      rs = ps.executeQuery();
      teMap = new HashMap();
      result = new Urlsinfo();
      while (rs.next()) {
        teMap.put(rs.getString("redirectType"), rs.getString("content"));
      }

      result.setResult(teMap);
    }
    catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (con != null) {
        try {
          con.close();
        }
        catch (Exception e) {
          e.printStackTrace();
        }
      }
    }
    return result;
  }

  public static long getIdByGamename(String gamename)
  {
    long result = 0L;
    PreparedStatement ps = null;
    Connection con = null;
    ResultSet rs = null;
    try {
      con = ConnectionServiceConfig.getInstance().getConnectionForLocal();
      String sql = "SELECT id FROM tbl_games where gameName=?;";
      ps = con.prepareStatement(sql);
      int m = 1;
      ps.setString(m++, gamename);
      System.out.println(ps.toString());
      rs = ps.executeQuery();
      while (rs.next()) {
        result = rs.getLong("id");
      }
    }
    catch (Exception e)
    {
      e.printStackTrace();
    } finally {
      if (con != null) {
        try {
          con.close();
        }
        catch (Exception e) {
          e.printStackTrace();
        }
      }
    }
    return result;
  }
}