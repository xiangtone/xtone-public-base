package com.account.util;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;

import android.util.Log;

public class MACUtil {

	private static MACUtil macUtil = null;

	private MACUtil() {

	}

	public static MACUtil getInstances() {
		if (macUtil == null) {
			macUtil = new MACUtil();
		}
		return macUtil;
	}

	public String getMac() {
		String macSerial = null;
		String str = "";

		try {
			Process pp = Runtime.getRuntime().exec(
					"cat /sys/class/net/wlan0/address ");
			InputStreamReader ir = new InputStreamReader(pp.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);

			for (; null != str;) {
				str = input.readLine();
				if (str != null) {
					macSerial = str.trim();// 去空格
					break;
				}
			}
		} catch (IOException ex) {
			// 赋予默认值
			ex.printStackTrace();
		}
		return macSerial;
	}
}
