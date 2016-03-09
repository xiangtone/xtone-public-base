package com.zgt.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.zgt.dao.bean.StatisticsCurrent;

public class StatisticsCurrentImpl extends BasicDaoImpl {

	// 添加一个统计
	public void add(StatisticsCurrent statisticsCurrent) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("insertStatisticsCurrent", statisticsCurrent);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	/**
	 * 根据包名查询
	 * 
	 * @param statisticsCurrent
	 */
	public StatisticsCurrent findByPageName(String packageName) {

		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		StatisticsCurrent statisticsCurrent = null;
		try {
			List<StatisticsCurrent> list = sqlSession.selectList("getStatisticsCurrentByPackageName", packageName);
		    if(list!=null&&list.size()>0){
		    	statisticsCurrent = list.get(0);
		    }
		} finally {
			sqlSession.close();
		}
		return statisticsCurrent;

	}

	/***
	 * 根据包名进行更新
	 * @param user
	 */
	public void update(StatisticsCurrent statisticsCurrent) {
		SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
		try {
			sqlSession.insert("updateStatisticsCurrent", statisticsCurrent);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

}
