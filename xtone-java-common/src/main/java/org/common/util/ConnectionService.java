package org.common.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;

/**
 */
public class ConnectionService {

	private static ConnectionService instance = new ConnectionService();

	private ConnectionService() {
	}

	static {
		getInstance();
	}

	public static ConnectionService getInstance() {
		return instance;
	}

	// private final static Logger logger =
	// Logger.getLogger(ConnectionService.class);
	// private DataSource ds_islocal =setupDataSource(DbKey.DB_ISLOCAL, 5, 10, 5,
	// 2);
	private DataSource ds_islocal = setupDataSource(DbKey.DB_ISLOCAL);

	// private DataSource ds_islog = setupDataSource(DbKey.DB_ISLOG);

	// public synchronized Connection getConnectionForAccount() {
	// try {
	// return ds_isaccount.getConnection();
	// } catch (SQLException ex) {
	// ex.printStackTrace();
	// }
	// return null;
	// }

	public synchronized Connection getConnectionForLocal() {
		try {
			return ds_islocal.getConnection();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return null;
	}

	// public synchronized Connection getConnectionForLog() {
	// try {
	// return ds_islog.getConnection();
	// } catch (SQLException ex) {
	// ex.printStackTrace();
	// }
	// return null;
	// }

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
		ds.setTestWhileIdle(true);
		ds.setTestOnBorrow(false);
		ds.setTestOnReturn(false);
		ds.setValidationQuery("select 1 from dual");
		ds.setValidationQueryTimeout(1);
		ds.setNumTestsPerEvictionRun(20);
		return ds;
	}

	public static DataSource setupDataSource(String db) {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("com.mysql.jdbc.Driver");
		ds.setUrl(ConfigManager.getConfigData(db + ".url"));
		ds.setUsername(ConfigManager.getConfigData(db + ".user"));
		ds.setPassword(ConfigManager.getConfigData(db + ".password"));
		ds.setInitialSize(Integer.valueOf(ConfigManager.getConfigData(db + ".initialSize") != null
				&& ConfigManager.getConfigData(db + ".initialSize").length() > 0
						? ConfigManager.getConfigData(db + ".initialSize") : "2"));
		ds.setMaxActive(Integer.valueOf(ConfigManager.getConfigData(db + ".maxActive") != null
				&& ConfigManager.getConfigData(db + ".maxActive").length() > 0 ? ConfigManager.getConfigData(db + ".maxActive")
						: "10"));
		ds.setMaxIdle(Integer.valueOf(ConfigManager.getConfigData(db + ".maxIdle") != null
				&& ConfigManager.getConfigData(db + ".maxIdle").length() > 0 ? ConfigManager.getConfigData(db + ".maxIdle")
						: "5"));
		ds.setMinIdle(Integer.valueOf(ConfigManager.getConfigData(db + ".minIdle") != null
				&& ConfigManager.getConfigData(db + "..minIdle").length() > 0 ? ConfigManager.getConfigData(db + "..minIdle")
						: "2"));
		ds.setMaxWait(Long.valueOf(ConfigManager.getConfigData(db + ".maxWait") != null
				&& ConfigManager.getConfigData(db + "..maxWait").length() > 0 ? ConfigManager.getConfigData(db + "..maxWait")
						: "5000"));
		ds.setRemoveAbandoned(true);
		ds.setRemoveAbandonedTimeout(60);
		ds.setLogAbandoned(true);
		ds.setMinEvictableIdleTimeMillis(30 * 1000);
		ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
		ds.setTestWhileIdle(true);
		ds.setTestOnBorrow(false);
		ds.setTestOnReturn(false);
		ds.setValidationQuery("select 1 from dual");
		ds.setValidationQueryTimeout(1);
		ds.setNumTestsPerEvictionRun(20);
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

	public static void main(String[] args) {

	}

}
