package com.account.util;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;

public class MetaUtil {
	private static MetaUtil instances =null;
	private static final String TAG="MetaUtil";
	private Context context=null;
	private MetaUtil(Context context) {
		this.context=context;
	}
	
	public static MetaUtil getInstances(Context context){
		if(instances == null){
			instances = new MetaUtil(context);
		}
		return instances;	
	}
	
	public String getMetaDataValue(String name, String def) {
		 
	    String value = getMetaDataValue(name);
	 
	    return (value == null) ? def : value;
	 
	}
	 
	public String getMetaDataValue(String name) {
	 
	    Object value = null;
	 
	    PackageManager packageManager = context.getPackageManager();
	 
	    ApplicationInfo applicationInfo;
	 
	    try {
	 
	        applicationInfo = packageManager.getApplicationInfo(context
	 
	        .getPackageName(), 128);
	 
	        if (applicationInfo != null && applicationInfo.metaData != null) {
	 
	            value = applicationInfo.metaData.get(name);
	 
	        }
	 
	    } catch (NameNotFoundException e) {
	 
	        throw new RuntimeException(
	 
	        "Could not read the name in the manifest file.", e);
	 
	    }
	 
	    if (value == null) {
	 
	        throw new RuntimeException("The name '" + name
	 
	        + "' is not defined in the manifest file's meta data.");
	 
	    }
	 
	    return value.toString();
	 
	}
}
