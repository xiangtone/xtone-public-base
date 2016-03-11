package com.account.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.account.dao.bean.StatisticsDay;

public class StatisticsDayImpl extends BasicDaoImpl {

	// 添加一个统计
	public void add(StatisticsDay StatisticsDay) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("insertStatisticsDay", StatisticsDay);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	/**
	 * 根据包名查询
	 * 
	 * @param StatisticsDay
	 */
	public StatisticsDay findByPageName(String packageName) {

		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		StatisticsDay StatisticsDay = null;
		try {
			List<StatisticsDay> list = sqlSession.selectList("getStatisticsDayByPackageName", packageName);
		    if(list!=null&&list.size()>0){
		    	StatisticsDay = list.get(0);
		    }
		} finally {
			sqlSession.close();
		}
		return StatisticsDay;

	}

	/***
	 * 根据包名进行更新
	 * @param user
	 */
	public void update(StatisticsDay StatisticsDay) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("updateStatisticsDay", StatisticsDay);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

}
