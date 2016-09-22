package com.x.interfaceRedirect;

import java.util.HashMap;
import java.util.Map;

public class Urlsinfo {
private HashMap<String,String> result ;
public boolean isMyapp(){
	boolean i = false;
	if(this.getResult().containsKey("android-myapp")){
		i = true;
	}
	return i;
}
public HashMap<String, String> getResult() {
	return result;
}
public void setResult(HashMap<String, String> result) {
	this.result = result;
}
}
