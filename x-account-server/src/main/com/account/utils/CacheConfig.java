package com.account.utils;

import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.account.dao.impl.ChannelDaoImpl;
import com.account.domain.Channel;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.cache.RemovalListener;
import com.google.common.cache.RemovalNotification;

public class CacheConfig {
  
  private final static Logger LOG = Logger.getLogger(CacheConfig.class);
  
  private static CacheConfig instance = new CacheConfig();
  private static LoadingCache<String, Channel> cache ;
  private CacheConfig(){
  }
  static{
    cache = CacheBuilder.newBuilder().maximumSize(20)// 设置大小，条目数
        .expireAfterWrite(10, TimeUnit.SECONDS)// 设置失效时间，创建时间
        .expireAfterAccess(20, TimeUnit.HOURS) // 设置时效时间，最后一次被访问
        .removalListener(new RemovalListener<String, Channel>() { // 移除缓存的监听器
              public void onRemoval(RemovalNotification<String, Channel> notification) {
              }
            }).build(new CacheLoader<String, Channel>() { // 通过回调加载缓存
              @Override
              public Channel load(String channelId) throws Exception {
                ChannelDaoImpl channelDaoImpl = new ChannelDaoImpl();
                return channelDaoImpl.findByChannelId(channelId);
              }
            });
  }
  
  public static CacheConfig getInstance(){
    return instance;
  }
  
  public static void main(String[] args) throws Exception {
    CacheConfig cache = new CacheConfig();
    Channel channel=cache.getNameLoadingCache("baidu");
    System.out.println(channel.getRegisterType());
   
  }

  public Channel getNameLoadingCache(String channelId) throws Exception {
    return cache.get(channelId);
    // cache.invalidateAll();
  }

}
