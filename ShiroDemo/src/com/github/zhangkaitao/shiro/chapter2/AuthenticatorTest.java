package com.github.zhangkaitao.shiro.chapter2;

import java.util.Scanner;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Assert;
import org.junit.Test;

public class AuthenticatorTest {
	@Test
	public void testAllSuccessfulStrategyWithSuccess() {  
	    login("F:/WorkSpace/GIT_SPACE/xtone-public-base/ShiroDemo/src/shiro-authenticator-all-success.ini");  
	    Subject subject = SecurityUtils.getSubject();  
	  
	    //得到一个身份集合，其包含了Realm验证成功的身份信息  
	    PrincipalCollection principalCollection = subject.getPrincipals();  
	    System.out.println(principalCollection.asList());
	    Assert.assertEquals(1, principalCollection.asList().size());  
	    Assert.assertEquals(true, subject.isAuthenticated()); // 断言用户已经登录
	}  
	
    private void login(String configFile) {  
        //1、获取SecurityManager工厂，此处使用ini配置文件初始化SecurityManager  
        Factory<org.apache.shiro.mgt.SecurityManager> factory =  
                new IniSecurityManagerFactory(configFile);  
      
        //2、得到SecurityManager实例 并绑定给SecurityUtils  
        org.apache.shiro.mgt.SecurityManager securityManager = factory.getInstance();  
        SecurityUtils.setSecurityManager(securityManager);  
      
        //3、得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证）  
        Subject subject = SecurityUtils.getSubject();  
        UsernamePasswordToken token = new UsernamePasswordToken("zhang", "123");  
      
        subject.login(token);  
    }  
}
