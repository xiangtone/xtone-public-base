package org.demo.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.common.util.ConfigManager;

/**
 */
public class ConnectionServiceMore {

  private static ConnectionServiceMore instance = new ConnectionServiceMore();

  private ConnectionServiceMore() {
  }

  public static ConnectionServiceMore getInstance() {
    return instance;
  }

  // private final static Logger logger =
  // Logger.getLogger(ConnectionService.class);
  // private DataSource ds_islocal =setupDataSource(DbKey.DB_ISLOCAL, 5, 10, 5,
  // 2);

  private DataSource ds_islog = setupDataSource("log");

  // public synchronized Connection getConnectionForAccount() {
  // try {
  // return ds_isaccount.getConnection();
  // } catch (SQLException ex) {
  // ex.printStackTrace();
  // }
  // return null;
  // }

  // public synchronized Connection getConnectionForLocal() {
  // try {
  // return ds_islocal.getConnection();
  // } catch (SQLException ex) {
  // ex.printStackTrace();
  // }
  // return null;
  // }

  public synchronized Connection getConnectionForLog() {
    try {
      return ds_islog.getConnection();
    } catch (SQLException ex) {
      ex.printStackTrace();
    }
    return null;
  }

  /**
   * @param initialSize
   *          TODO
   * @param maxActive
   *          TODO
   * @param maxIdle
   *          TODO
   * @param minIdle
   *          TODO
   * @return DataSource
   */
  public static DataSource setupDataSource(String db, int initialSize, int maxActive, int maxIdle, int minIdle) {
    BasicDataSource ds = new BasicDataSource();
    ds.setDriverClassName("com.mysql.jdbc.Driver");
    ds.setUrl(ConfigManager.getConfigData(db + ".url"));
    ds.setUsername(ConfigManager.getConfigData(db + ".user"));
    ds.setPassword(ConfigManager.getConfigData(db + ".password"));
    ds.setInitialSize(initialSize);
    ds.setMaxActive(maxActive);
    ds.setMaxIdle(maxIdle);
    ds.setMinIdle(minIdle);
    ds.setMaxWait(5000);
    ds.setRemoveAbandoned(true);
    ds.setRemoveAbandonedTimeout(60);
    ds.setLogAbandoned(true);
    ds.setMinEvictableIdleTimeMillis(30 * 1000);
    ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
    return ds;
  }

  public static DataSource setupDataSource(String db) {
    BasicDataSource ds = new BasicDataSource();
    ds.setDriverClassName("com.mysql.jdbc.Driver");
    ds.setUrl(ConfigManager.getConfigData(db + ".url"));
    ds.setUsername(ConfigManager.getConfigData(db + ".user"));
    ds.setPassword(ConfigManager.getConfigData(db + ".password"));
    ds.setInitialSize(Integer.valueOf(ConfigManager.getConfigData(db + ".initialSize")));
    ds.setMaxActive(Integer.valueOf(ConfigManager.getConfigData(db + ".maxActive")));
    ds.setMaxIdle(Integer.valueOf(ConfigManager.getConfigData(db + ".maxIdle")));
    ds.setMinIdle(Integer.valueOf(ConfigManager.getConfigData(db + ".minIdle")));
    ds.setMaxWait(Long.valueOf(ConfigManager.getConfigData(db + ".maxWait")));
    ds.setRemoveAbandoned(true);
    ds.setRemoveAbandonedTimeout(60);
    ds.setLogAbandoned(true);
    ds.setMinEvictableIdleTimeMillis(30 * 1000);
    ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
    return ds;
  }

  public static void printDataSourceStats(DataSource ds) throws SQLException {
    BasicDataSource bds = (BasicDataSource) ds;
    System.out.println("NumActive: " + bds.getNumActive());
    System.out.println("NumIdle: " + bds.getNumIdle());
  }

  public static void shutdownDataSource(DataSource ds) throws SQLException {
    BasicDataSource bds = (BasicDataSource) ds;
    bds.close();
  }

}
