package com.accout.util;

import android.content.Context;
import android.widget.Toast;

public class WebJsInterface {
	Context context = null;

	public WebJsInterface(Context context) {
		this.context = context;
	}

	@android.webkit.JavascriptInterface
	public void toastLong(String tip) {

		Toast.makeText(context, tip, Toast.LENGTH_LONG).show();

	}
	
	@android.webkit.JavascriptInterface
	public void toastShort(String tip) {

		Toast.makeText(context, tip, Toast.LENGTH_SHORT).show();

	}
}
