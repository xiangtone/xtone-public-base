package com.x.interfaceRedirect;

import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.cache.RemovalListener;
import com.google.common.cache.RemovalNotification;

public class DownSkipCacheConfig {
  
  private final static Logger LOG = Logger.getLogger(DownSkipCacheConfig.class);
  
  private static DownSkipCacheConfig instance = new DownSkipCacheConfig();
  private static LoadingCache<String, Urlsinfo> cache ;
  private DownSkipCacheConfig(){
  }
  static{  
    cache = CacheBuilder.newBuilder().maximumSize(20)// 设置大小，条目数
        .expireAfterWrite(10, TimeUnit.SECONDS)// 设置失效时间，创建时间
        .expireAfterAccess(20, TimeUnit.HOURS) // 设置时效时间，最后一次被访问
        .removalListener(new RemovalListener<String, Urlsinfo>() { // 移除缓存的监听器
              public void onRemoval(RemovalNotification<String, Urlsinfo> notification) {
              }
            }).build(new CacheLoader<String, Urlsinfo>() { // 通过回调加载缓存
              @Override
              public Urlsinfo load(String strRedirectId) throws Exception {
                WebDaoConfig daoConfig = new WebDaoConfig();
              Long l = Long.valueOf(strRedirectId);
              long redirectId = l.longValue();
               
                return daoConfig.getUrlByUrlinfo(redirectId);
              }
            });
  }
  
  public static DownSkipCacheConfig getInstance(){
    return instance;
  }
  
  public static void main(String[] args) throws Exception {
    DownSkipCacheConfig cache = new DownSkipCacheConfig();
    Urlsinfo urlsinfo = new Urlsinfo();
//    urlsinfo.setRedirectId(1);
//    urlsinfo.setRedirectType("apple");
    
//    Urlsinfo test = cache.getInstance().getNameLoadingCache(urlsinfo);
    
//    System.out.println(test.getContent());
  }

  public Urlsinfo getNameLoadingCache(String strRedirectId) throws Exception {
    return cache.get(strRedirectId);
    // cache.invalidateAll();
  }

}
