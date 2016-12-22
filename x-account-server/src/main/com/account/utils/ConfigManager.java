
package com.account.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class ConfigManager
{
	private static final String CONFIG_PATH = "config.properties";
	private static Properties	prop			= null;
	private static long			lastModifyTime	= 0;
	private static final String FORMAT="UTF-8";
	private ConfigManager()
	{
	}
	
	public static InputStream getResourceAsStream(String resource) throws IOException {
	     InputStream in = null;
	     ClassLoader loader = ConfigManager.class.getClassLoader();
	     if (loader != null) in = loader.getResourceAsStream(resource);
	     if (in == null) in = ClassLoader.getSystemResourceAsStream(resource);
	     if (in == null) throw new IOException("Could not find resource " + resource);
	     return in;
	 }

	private static void init(String filePath)
	{
		prop = new Properties();
		try
		{
			filePath = (filePath == null || filePath.length() == 0) ? CONFIG_PATH
					: filePath;
			if (filePath.indexOf(":") == 2)
				filePath = filePath.substring(1, filePath.length());
			prop.load(getResourceAsStream(filePath));
			File file = new File(CONFIG_PATH);
			lastModifyTime = file.lastModified();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	private static String getProperty(String key)
	{
		String result = "";
		if (prop == null)
		{
			init("");
		}
		try
		{
			File file = new File(CONFIG_PATH);
			long tempTime = file.lastModified();
			if (tempTime > lastModifyTime)
			{
				prop.clear();
				init("");
			}
			if (prop.containsKey(key))
			{
				//先将properties文件转换为默认格式ISO8859-1，否则还是会乱码
				result = new String(prop.getProperty(key).getBytes("ISO8859-1"), FORMAT) ;
			}
		}
		catch (Exception exce)
		{
			exce.printStackTrace();
		}
		return result;
	}

	public static String getConfigData(String key)
	{
		return getProperty(key);
	}

	public static String getConfigData(String key, String defaultValue)
	{
		return getProperty(key).length() == 0 ? defaultValue : getProperty(key);
	}

	public static void main(String[] args){
		//System.out.println(System.getProperty("java.class.path").split(";")[0]);
		System.out.println(ConfigManager.getConfigData("local.url"));
	}
}
