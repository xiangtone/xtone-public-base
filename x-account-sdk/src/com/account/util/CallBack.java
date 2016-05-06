package com.account.util;

import com.account.bean.UserInfo;

public abstract class CallBack {
	public void loginSuccess(UserInfo userInfo){};
	public void registSuccess(UserInfo userInfo){};
}

