package com.account.service;

import java.util.List;

import org.common.util.ConfigManager;
import org.common.util.GenerateIdService;

import com.account.dao.impl.LogDaoImpl;
import com.account.domain.LogInfo;
import com.account.domain.MyUser;

public class LogService {
	private static LogService logService;
	private LogDaoImpl logDaoImpl;
	private LogService(){
		logDaoImpl= new LogDaoImpl();
	};
	
	public static LogService getInstance(){
		if(logService==null){
			logService=new LogService();
		}
		return logService;
	}
	
	public List<MyUser> seleteToken(MyUser myUser){
		LogInfo log=new LogInfo();
		log.setToken(myUser.getToken());
		log.setUid(myUser.getUid());
		List<MyUser> result=logDaoImpl.findUidByToken(log);
		return result;
	}
	
	public int updateToken(MyUser myUser){
		LogInfo log=new LogInfo();
		log.setId(GenerateIdService.getInstance().generateNew(Integer.parseInt(ConfigManager.getConfigData("server.id").trim()), "clicks", 1));
		log.setToken(myUser.getToken());
		log.setUid(myUser.getUid());
		int result=logDaoImpl.updateTime(log);
		return result;
	}
	
	public int addToken(MyUser myUser){
		LogInfo log=new LogInfo();
		log.setId(GenerateIdService.getInstance().generateNew(Integer.parseInt(ConfigManager.getConfigData("server.id").trim()), "clicks", 1));
		log.setToken(myUser.getToken());
		log.setUid(myUser.getUid());
		int result=logDaoImpl.insertToken(log);
		return result;
	}
	
	public void checkLog(MyUser myUser){
		//token,没有则插入,已有则更新
		if(logService.seleteToken(myUser)!=null){
			logService.updateToken(myUser);
		}else {
			logService.addToken(myUser);
		}
	}
}
