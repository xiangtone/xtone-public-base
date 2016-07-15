package com.account.util;

import com.account.bean.UserInfo;

public abstract class CallBack {
	public void loginSuccess(UserInfo userInfo){};
	public void loginFailure(String massage){};
	public void registSuccess(UserInfo userInfo){};
	public void registFailure(String massage){};
	public void clickClose(){};
}

