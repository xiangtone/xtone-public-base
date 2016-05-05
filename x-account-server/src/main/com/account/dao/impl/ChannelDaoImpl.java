package com.account.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.account.domain.Channel;

public class ChannelDaoImpl extends BasicDaoImpl{
	// 根据名字模糊查询
		public Channel findByChannelId(String channelId) {
			SqlSession sqlSession = BasicDaoImpl.getSqlSessionFactory().openSession();
			Channel channelInfo;
			try {
				channelInfo = sqlSession.selectOne("com.account.mapping.channelMapper.findByChannelId", channelId);
			} finally {
				sqlSession.close();
			}
			return channelInfo;
		}
}
