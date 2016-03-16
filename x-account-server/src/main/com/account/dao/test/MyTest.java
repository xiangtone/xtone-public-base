package com.account.dao.test;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.account.dao.bean.StatisticsCurrent;
import com.account.dao.bean.StatisticsDay;
import com.account.dao.impl.StatisticsCurrentImpl;
import com.account.dao.impl.StatisticsDayImpl;
import com.account.dao.impl.UserDaoImpl;
import com.account.domain.User;
import com.account.utils.TimeUtil;

public class MyTest {
	
	public static void main(String[] args) {
//		
//		//mybatis的配置文件
        String resource = "conf.xml";
        //使用类加载器加载mybatis的配置文件（它也加载关联的映射文件）
        InputStream is = MyTest.class.getClassLoader().getResourceAsStream(resource);
        //构建sqlSession的工厂
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
//        //使用MyBatis提供的Resources类加载mybatis的配置文件（它也加载关联的映射文件）
//        //Reader reader = Resources.getResourceAsReader(resource); 
//        //构建sqlSession的工厂
//        //SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(reader);
//        //创建能执行映射文件中sql的sqlSession
//        SqlSession session = sessionFactory.openSession();
//        /**
//         * 映射sql的标识字符串，
//         * me.gacl.mapping.userMapper是userMapper.xml文件中mapper标签的namespace属性的值，
//         * getUser是select标签的id属性值，通过select标签的id属性值就可以找到要执行的SQL
//         */
//        String statement = "com.zgt.mapping.userMapper";
//        //映射sql的标识字符串
//        //执行查询返回一个唯一user对象的sql
//        User user = session.selectOne("getUser", 2);
//        System.out.println(user);
//        
//        User inserUser = new User();
//        inserUser.setAge(55);
//        inserUser.setName("zgt");
//        inserUser.setId(100);
//        
//        int a = session.insert("insertUser", inserUser);
//        System.out.println(a);
//        
//        session.commit();
//        session.close();
		
		
//		User inserUser = new User();
//      inserUser.setAge(55);
//      inserUser.setName("helloWord");
     
		
		//UserDaoImpl userDaoImpl = new UserDaoImpl();
		//userDaoImpl.add(inserUser);
		
		
		//System.out.println(userDaoImpl.getModelByName("helloWord"));
		
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
//		StatisticsCurrentImpl statisticsCurrentImpl =new StatisticsCurrentImpl();
//		
//		
//		StatisticsCurrent statisticsCurrent = new StatisticsCurrent();
//		statisticsCurrent.setPackageName("com.aa.aaa");
//		statisticsCurrent.setDate(TimeUtil.getCurrentDate());
//		statisticsCurrent.setUpdateDate(new java.sql.Date(new java.util.Date().getTime()));
//		statisticsCurrentImpl.add(statisticsCurrent);
//		
		
		
		
		
		
		
		
		//StatisticsDayImpl day =new StatisticsDayImpl();
		
		//String packageName = "zgt";
		
//		StatisticsCurrent statisticsCurrent = new StatisticsCurrent();
//		statisticsCurrent.setPackageName(packageName);
//		statisticsCurrent.setDate(dateFormat.format(new Date()));
//		statisticsCurrent.setClickDownCount(0);
//		statisticsCurrent.setDownSuccessCount(0);
//		statisticsCurrent.setInstallSuccessCount(0);
//		statisticsCurrent.setSendNotifiCount(0);
//		
//	    statisticsCurrentImpl.add(statisticsCurrent);
		
		
//		StatisticsDay statisticsCurrent = day.findByPageName(packageName);
//		statisticsCurrent.setClickDownCountDay(55);
//		day.update(statisticsCurrent);
		
		
//		StatisticsDay statisticsDay = new StatisticsDay();
//		statisticsDay.setPackageName(packageName);
//		statisticsDay.setDate(dateFormat.format(new Date()));
//		statisticsDay.setClickDownCountDay(0);
//		statisticsDay.setDownSuccessCountDay(0);
//		statisticsDay.setInstallSuccessCountDay(0);
//		statisticsDay.setSendNotifiCountDay(0);
//		statisticsDay.setCreateDate(new java.sql.Date(new java.util.Date().getTime()));
//	    day.add(statisticsDay);
//		
//		
//		System.out.println(TimeUtil.getCurrentDate());
		
        
		
	}

}
