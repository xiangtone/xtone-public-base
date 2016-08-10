package org.common.util;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class ThreadPool {

	static public ThreadPoolExecutor mThreadPool = new ThreadPoolExecutor(3, 30, 60, TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(30000), new ThreadPoolExecutor.DiscardOldestPolicy());
	
	static public ThreadPoolExecutor tpx = new ThreadPoolExecutor(Integer.valueOf(ConfigManager.getConfigData("corePoolSize")), Integer.valueOf(ConfigManager.getConfigData("maximumPoolSize")), Long.valueOf(ConfigManager.getConfigData("keepAliveTime")), TimeUnit.SECONDS, new ArrayBlockingQueue<Runnable>(30000), new ThreadPoolExecutor.DiscardOldestPolicy());

}
