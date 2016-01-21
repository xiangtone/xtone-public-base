/*
SQLyog Community v11.1 (64 bit)
MySQL - 5.6.24-log : Database - log_general
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`log_general` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `log_general`;

/*Table structure for table `log_async_generals` */

DROP TABLE IF EXISTS `log_async_generals`;

CREATE TABLE `log_async_generals` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=latin1 INSERT_METHOD=LAST UNION=(`z160120a`,`z160121a`);

/*Table structure for table `log_sync_generals` */

DROP TABLE IF EXISTS `log_sync_generals`;

CREATE TABLE `log_sync_generals` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MRG_MyISAM DEFAULT CHARSET=latin1 INSERT_METHOD=LAST UNION=(`z160120b`,`z160121b`);

/*Table structure for table `z160114a` */

DROP TABLE IF EXISTS `z160114a`;

CREATE TABLE `z160114a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160114b` */

DROP TABLE IF EXISTS `z160114b`;

CREATE TABLE `z160114b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160115a` */

DROP TABLE IF EXISTS `z160115a`;

CREATE TABLE `z160115a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160115b` */

DROP TABLE IF EXISTS `z160115b`;

CREATE TABLE `z160115b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160116a` */

DROP TABLE IF EXISTS `z160116a`;

CREATE TABLE `z160116a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160116b` */

DROP TABLE IF EXISTS `z160116b`;

CREATE TABLE `z160116b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160117a` */

DROP TABLE IF EXISTS `z160117a`;

CREATE TABLE `z160117a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160117b` */

DROP TABLE IF EXISTS `z160117b`;

CREATE TABLE `z160117b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160118a` */

DROP TABLE IF EXISTS `z160118a`;

CREATE TABLE `z160118a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160118b` */

DROP TABLE IF EXISTS `z160118b`;

CREATE TABLE `z160118b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160119a` */

DROP TABLE IF EXISTS `z160119a`;

CREATE TABLE `z160119a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160119b` */

DROP TABLE IF EXISTS `z160119b`;

CREATE TABLE `z160119b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160120a` */

DROP TABLE IF EXISTS `z160120a`;

CREATE TABLE `z160120a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160120b` */

DROP TABLE IF EXISTS `z160120b`;

CREATE TABLE `z160120b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160121a` */

DROP TABLE IF EXISTS `z160121a`;

CREATE TABLE `z160121a` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `z160121b` */

DROP TABLE IF EXISTS `z160121b`;

CREATE TABLE `z160121b` (
  `id` bigint(20) NOT NULL COMMENT '通用日志表',
  `logId` int(11) DEFAULT NULL COMMENT '对应表在配置库中',
  `para01` text,
  `para02` text,
  `para03` text,
  `para04` text,
  `para05` text,
  `para06` text,
  `para07` text,
  `para08` text,
  `para09` text,
  `para10` text,
  `para11` text,
  `para12` text,
  `para13` text,
  `para14` text,
  `para15` text,
  `para16` text,
  `para17` text,
  `para18` text,
  `para19` text,
  `para20` text,
  PRIMARY KEY (`id`),
  KEY `idx_logId` (`logId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `run_add_table` */

/*!50106 DROP EVENT IF EXISTS `run_add_table`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`%` EVENT `run_add_table` ON SCHEDULE EVERY 1 DAY STARTS '2016-01-16 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO call add_table() */$$
DELIMITER ;

/* Procedure structure for procedure `add_table` */

/*!50003 DROP PROCEDURE IF EXISTS  `add_table` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `add_table`()
BEGIN
    set @today = date_format(date(now()),'%y%m%d');
    set @tb_namea = concat('z',@today,'a');
    set @old_tb_namea = concat('z',@today-1,'a');
    set @old_tb_nameb = concat('z',@today-1,'b');
    set @tb_nameb = concat('z',@today,'b'); 
    DROP TABLE IF EXISTS log_general.log_async_generals;
    DROP TABLE IF EXISTS log_general.log_sync_generals;
    
    create table log_general.log_sync_generals(
        `id` BIGINT(20) NOT NULL COMMENT '通用日志表',
        `logId` INT(11) DEFAULT NULL COMMENT '对应表在配置库中',
        `para01` TEXT,
        `para02` TEXT,
        `para03` TEXT,
        `para04` TEXT,
        `para05` TEXT,
        `para06` TEXT,
        `para07` TEXT,
        `para08` TEXT,
        `para09` TEXT,
        `para10` TEXT,
        `para11` TEXT,
        `para12` TEXT,
        `para13` TEXT,
        `para14` TEXT,
        `para15` TEXT,
        `para16` TEXT,
        `para17` TEXT,
        `para18` TEXT,
        `para19` TEXT,
        `para20` TEXT,
        PRIMARY KEY (`id`),
        KEY `idx_logId` (`logId`)) engine=mrg_myisam union=() insert_method=last;
    create table log_general.log_async_generals(
        `id` BIGINT(20) NOT NULL COMMENT '通用日志表',
        `logId` INT(11) DEFAULT NULL COMMENT '对应表在配置库中',
        `para01` TEXT,
        `para02` TEXT,
        `para03` TEXT,
        `para04` TEXT,
        `para05` TEXT,
        `para06` TEXT,
        `para07` TEXT,
        `para08` TEXT,
        `para09` TEXT,
        `para10` TEXT,
        `para11` TEXT,
        `para12` TEXT,
        `para13` TEXT,
        `para14` TEXT,
        `para15` TEXT,
        `para16` TEXT,
        `para17` TEXT,
        `para18` TEXT,
        `para19` TEXT,
        `para20` TEXT,
        PRIMARY KEY (`id`),
        KEY `idx_logId` (`logId`)) engine=mrg_myisam union=() insert_method=last;
        
        
    set @sql_add_tablea_text = concat(
        "CREATE TABLE ",@tb_namea," (
            `id` BIGINT(20) NOT NULL COMMENT '通用日志表',
            `logId` INT(11) DEFAULT NULL COMMENT '对应表在配置库中',
            `para01` TEXT,
            `para02` TEXT,
            `para03` TEXT,
            `para04` TEXT,
            `para05` TEXT,
            `para06` TEXT,
            `para07` TEXT,
            `para08` TEXT,
            `para09` TEXT,
            `para10` TEXT,
            `para11` TEXT,
            `para12` TEXT,
            `para13` TEXT,
            `para14` TEXT,
            `para15` TEXT,
            `para16` TEXT,
            `para17` TEXT,
            `para18` TEXT,
            `para19` TEXT,
            `para20` TEXT,
            PRIMARY KEY (`id`),
            KEY `idx_logId` (`logId`)
        )
        ENGINE=MYISAM DEFAULT CHARSET=utf8;"
    );
    set @sql_add_tableb_text = concat(
        "CREATE TABLE ",@tb_nameb," (
            `id` BIGINT(20) NOT NULL COMMENT '通用日志表',
            `logId` INT(11) DEFAULT NULL COMMENT '对应表在配置库中',
            `para01` TEXT,
            `para02` TEXT,
            `para03` TEXT,
            `para04` TEXT,
            `para05` TEXT,
            `para06` TEXT,
            `para07` TEXT,
            `para08` TEXT,
            `para09` TEXT,
            `para10` TEXT,
            `para11` TEXT,
            `para12` TEXT,
            `para13` TEXT,
            `para14` TEXT,
            `para15` TEXT,
            `para16` TEXT,
            `para17` TEXT,
            `para18` TEXT,
            `para19` TEXT,
            `para20` TEXT,
            PRIMARY KEY (`id`),
            KEY `idx_logId` (`logId`)
        )
        ENGINE=MYISAM DEFAULT CHARSET=utf8;"
    );
    set @sql_alt_mrga_text = concat(
        "ALTER TABLE log_async_generals engine=mrg_myisam union=(",@old_tb_namea,",",@tb_namea,") insert_method=last;"
    );
    set @sql_alt_mrgb_text = concat(
        "ALTER TABLE log_sync_generals engine=mrg_myisam union=(",@old_tb_nameb,",",@tb_nameb,") insert_method=last;"
    );
    
    PREPARE statement_namea FROM @sql_add_tablea_text;
    PREPARE statement_nameb FROM @sql_add_tableb_text;
    EXECUTE statement_namea;
    EXECUTE statement_nameb;
    DEALLOCATE PREPARE statement_namea;
    DEALLOCATE PREPARE statement_nameb;
    
    
    PREPARE alt_mrg_a FROM @sql_alt_mrga_text;
    PREPARE alt_mrg_b FROM @sql_alt_mrgb_text;
    EXECUTE alt_mrg_a;
    EXECUTE alt_mrg_b;
    DEALLOCATE PREPARE alt_mrg_a;
    DEALLOCATE PREPARE alt_mrg_b;
END */$$
DELIMITER ;

/* Procedure structure for procedure `test2` */

/*!50003 DROP PROCEDURE IF EXISTS  `test2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `test2`()
insert into log_async_generals(id,logid) value(date_format(now(),'%i%s'),date_format(now(),'%i%s')) */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
