΢��token�Ļ�ȡapplication

��ṹ��
DROP TABLE IF EXISTS `tbl_wechat_tokens`;

CREATE TABLE `tbl_wechat_tokens` (
  `appId` VARCHAR(100) NOT NULL,
  `token` VARCHAR(300) DEFAULT NULL,
  `nextTime` BIGINT(20) DEFAULT '0' COMMENT '�´�ȥ��ȡtoken��ʱ��',
  `lastModTime` BIGINT(20) DEFAULT NULL COMMENT '����¼����޸�ʱ��',
  `validTime` BIGINT(20) DEFAULT NULL COMMENT '��ǰtoken��Ч����ʱ��',
  PRIMARY KEY (`appId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_wechat_tokens` */

INSERT  INTO `tbl_wechat_tokens`(`appId`,`token`,`nextTime`,`lastModTime`,`validTime`) VALUES ('xxxxxxxxxxxxxxxxxx',NULL,0,NULL,NULL);