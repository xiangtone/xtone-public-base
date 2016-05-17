微信token的获取application

表结构。
DROP TABLE IF EXISTS `tbl_wechat_tokens`;

CREATE TABLE `tbl_wechat_tokens` (
  `appId` VARCHAR(100) NOT NULL,
  `token` VARCHAR(300) DEFAULT NULL,
  `nextTime` BIGINT(20) DEFAULT '0' COMMENT '下次去获取token的时间',
  `lastModTime` BIGINT(20) DEFAULT NULL COMMENT '本记录最后修改时间',
  `validTime` BIGINT(20) DEFAULT NULL COMMENT '当前token有效到期时间',
  PRIMARY KEY (`appId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_wechat_tokens` */

INSERT  INTO `tbl_wechat_tokens`(`appId`,`token`,`nextTime`,`lastModTime`,`validTime`) VALUES ('xxxxxxxxxxxxxxxxxx',NULL,0,NULL,NULL);