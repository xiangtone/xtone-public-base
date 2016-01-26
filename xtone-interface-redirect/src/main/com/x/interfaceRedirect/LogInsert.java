package com.x.interfaceRedirect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.common.util.ConfigManager;
import org.common.util.ConnectionService;
import org.common.util.GenerateIdService;

public class LogInsert implements Runnable {
  
  private static final int LOG_ID=1;
  
  private Long id ; 
  private String fromSource ; 
  private String userAgent ; 
  private String toUrl ; 
  private String ip ; 

  public LogInsert(String fromSource, String userAgent, String toUrl, String ip) {
    super();
    this.fromSource = fromSource;
    this.userAgent = userAgent;
    this.toUrl = toUrl;
    this.ip = ip;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getFromSource() {
    return fromSource;
  }

  public void setFromSource(String fromSource) {
    this.fromSource = fromSource;
  }

  public String getUserAgent() {
    return userAgent;
  }

  public void setUserAgent(String userAgent) {
    this.userAgent = userAgent;
  }

  public String getToUrl() {
    return toUrl;
  }

  public void setToUrl(String toUrl) {
    this.toUrl = toUrl;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  @Override
  public void run() {
    setId(GenerateIdService.getInstance().generateNew(Integer.parseInt(ConfigManager.getConfigData("server.id")), "clicks", 1));
    if(this.id > 0){
      PreparedStatement ps = null;
      Connection con = null;
      try{
        con = ConnectionService.getInstance().getConnectionForLocal();
        ps = con.prepareStatement("insert into `log_async_generals` (id,logId,para01,para02,para03,para04) values (?,?,?,?,?,?)");
        int m = 1;
        ps.setLong(m++, this.getId());
        ps.setInt(m++, LOG_ID);
        ps.setString(m++, this.getFromSource());
        ps.setString(m++, this.getUserAgent());
        ps.setString(m++, this.getToUrl());
        ps.setString(m++, this.getIp());
        ps.executeUpdate();
      }catch(Exception e){
        // TODO Auto-generated catch block
        e.printStackTrace();
      }finally{
        if(con != null){
          try{
            con.close();
          }catch(SQLException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
          }
        }
      }
    }
  }

}
