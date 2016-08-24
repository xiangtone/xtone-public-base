package org.common.util;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ThreadPool {

	static public ThreadPoolExecutor mThreadPool = new ThreadPoolExecutor(3, 30, 60, TimeUnit.SECONDS,
			new ArrayBlockingQueue<Runnable>(30000), new ThreadPoolExecutor.DiscardOldestPolicy());

	static public ThreadPoolExecutor tpx = new ThreadPoolExecutor(Integer.valueOf(
			ConfigManager.getConfigData("corePoolSize") != null && ConfigManager.getConfigData("corePoolSize").length() > 0
					? ConfigManager.getConfigData("corePoolSize") : "1"),
			Integer.valueOf(ConfigManager.getConfigData("maximumPoolSize") != null
					&& ConfigManager.getConfigData("maximumPoolSize").length() > 0
							? ConfigManager.getConfigData("maximumPoolSize") : "1"),
			Long.valueOf(ConfigManager.getConfigData("keepAliveTime") != null
					&& ConfigManager.getConfigData("keepAliveTime").length() > 0 ? ConfigManager.getConfigData("keepAliveTime")
							: "60"),
			TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(30000), new ThreadPoolExecutor.DiscardOldestPolicy());
}
