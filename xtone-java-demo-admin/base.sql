/*
SQLyog Community v11.1 (64 bit)
MySQL - 5.6.31-log : Database - cms_vanggame
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cms_vanggame` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cms_vanggame`;

/*Table structure for table `tbl_base_menu_role_relations` */

DROP TABLE IF EXISTS `tbl_base_menu_role_relations`;

CREATE TABLE `tbl_base_menu_role_relations` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `menuId` BIGINT(20) NOT NULL,
  `roleId` BIGINT(20) NOT NULL,
  `createTime` BIGINT(20) DEFAULT NULL,
  `modTime` BIGINT(20) DEFAULT NULL,
  `createBy` VARCHAR(100) DEFAULT NULL,
  `modBy` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_base_menu_role_relations` */

/*Table structure for table `tbl_base_menus` */

DROP TABLE IF EXISTS `tbl_base_menus`;

CREATE TABLE `tbl_base_menus` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `href` VARCHAR(100) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `createTime` BIGINT(100) DEFAULT NULL,
  `modTime` BIGINT(100) DEFAULT NULL,
  `createBy` VARCHAR(100) DEFAULT NULL,
  `modBy` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_base_menus` */

/*Table structure for table `tbl_base_users` */

DROP TABLE IF EXISTS `tbl_base_users`;

CREATE TABLE `tbl_base_users` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) DEFAULT NULL,
  `pwd` VARCHAR(100) DEFAULT NULL COMMENT 'md5����',
  `email` VARCHAR(100) DEFAULT NULL,
  `isAdmin` INT(11) DEFAULT '0' COMMENT '1��ʾΪ����Ա',
  `isAvail` INT(11) DEFAULT '1' COMMENT '1��ʾ��Ч��0��ʾ��Ч���������',
  `lastLogin` BIGINT(20) DEFAULT NULL COMMENT '����¼ʱ��',
  `addTime` BIGINT(20) DEFAULT NULL COMMENT '����ʱ��',
  KEY `id` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_base_users` */

INSERT  INTO `tbl_base_users`(`id`,`username`,`pwd`,`email`,`isAdmin`,`isAvail`,`lastLogin`,`addTime`) VALUES (1,'1@1.cn','c4ca4238a0b923820dcc509a6f75849b','',0,1,1472631450952,NULL),(2,'admin','21232f297a57a5a743894a0e4a801fc3','admin',1,1,1472807821700,NULL),(7,'test','098f6bcd4621d373cade4e832627b4f6','text',1,1,1454222787992,1453959803952),(8,'zxz','0666d3bb926ccae05deb6307995a9a84','',0,1,1454121508804,1453973771749);

/*Table structure for table `tbl_cms_catalogs` */

DROP TABLE IF EXISTS `tbl_cms_catalogs`;

CREATE TABLE `tbl_cms_catalogs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(100) DEFAULT NULL,
  `authorId` BIGINT(20) DEFAULT NULL COMMENT '����userId',
  `addTime` BIGINT(20) DEFAULT NULL COMMENT '��¼���ʱ��',
  `lastModifyId` BIGINT(20) DEFAULT NULL COMMENT '����޸���userId',
  `lastModifyTime` BIGINT(20) DEFAULT NULL COMMENT '����޸�ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cms_catalogs` */

INSERT  INTO `tbl_cms_catalogs`(`id`,`content`,`authorId`,`addTime`,`lastModifyId`,`lastModifyTime`) VALUES (1,'news',NULL,NULL,NULL,NULL),(2,'job',NULL,NULL,NULL,NULL),(3,'link',NULL,NULL,NULL,NULL);

/*Table structure for table `tbl_cms_contents` */

DROP TABLE IF EXISTS `tbl_cms_contents`;

CREATE TABLE `tbl_cms_contents` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `catalog` VARCHAR(100) DEFAULT NULL COMMENT 'Ӣ��Ŀ¼��',
  `title` VARCHAR(200) DEFAULT NULL,
  `content` TEXT,
  `status` INT(11) DEFAULT '1' COMMENT '1������ʾ',
  `authorId` BIGINT(20) DEFAULT NULL COMMENT '����userId',
  `addTime` BIGINT(20) DEFAULT NULL COMMENT '��¼���ʱ��',
  `lastModifyId` BIGINT(20) DEFAULT NULL COMMENT '����޸���userId',
  `lastModifyTime` BIGINT(20) DEFAULT NULL COMMENT '����޸�ʱ��',
  `subTitle` VARCHAR(800) DEFAULT NULL COMMENT '�����⣬HTML���ı���ʽ',
  `priority` INT(11) DEFAULT '10000' COMMENT '���ȼ�����ֵ����',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cms_contents` */

INSERT  INTO `tbl_cms_contents`(`id`,`catalog`,`title`,`content`,`status`,`authorId`,`addTime`,`lastModifyId`,`lastModifyTime`,`subTitle`,`priority`) VALUES (1,'news','ħ��֮�û�����������ħս�衷�����','<p>&nbsp; &nbsp; &nbsp; <span >&nbsp;�������Ϸ����������Ρ���ħս�衷����һ��������ħ��Ϊ��ģ������ᶯ���ںϿ���Ԫ�صĲ��������Ρ�12��17����360��UC���ٶȵ����������������������ԡ���ɫ����ϷƷ���������Ϸ�ڿ��⵱�վͻ��쳣�������糱���������������ʸ��ǳ�����40%���õ��˹����ҵ��Ͽɡ�</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;������������ ����Ч��ը�ѡ�</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;����ħս�衷�������������죬��֤����Ϸ���ߵĻ��ʡ����ա�ά��˹�ȵ�Ӣ�鶼����ʷʫ��Ӧ�е���ɫ���ӳ�������������ս������������Ч�������ɿ�����Ϸ����Ʒ�ʵĲ��ס������Ļ������ʷʫ�ľ��飬����������廯����Ϸ���顣</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.22/1.png\" style=\"height:304px; width:484px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<span >�����ԡ������ں������������</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;�ֻ����η�չ���񣬵�һ���淨���޷�����������������޵�θ�ڡ�������ħս�衷���������Ϸģʽ���ǽ�������Ϸ������Ϊ���ģ�ͬʱ���Ը������͵�PVP�淨������ǿ�������ԣ��Ӷ��ֲ�һ�㿨������Ϸˢˢˢ�Լ����Բ������ݹ��ٵ����Σ�������Ҹ�ǿ�Ĵ�����뻥���ԡ�</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.22/2.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-family:microsoft yahei\">����ȡ��ҽ��飬Ӯ�����������</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;����ħս�衷һֱ�㷺��ȡ��ҽ��飬������������������Ϸ�д��ڵ����⼰ʱ�޸ģ���������ԵĲ��ֱ��������������淨������Ҳ��ֿ�����ҵ�����������ڲ�汾�����ڶ���������ص�PVP���������ֽ��д��£������ж�����3V3�淨ҲӮ������ҵ�һ�º�����ϣ����λ����ܶ��Ϊ���ǵ���Ϸ���������Ա����������������������ħ�ô�½���Ӿ��ʡ�</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.22/3.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<span >����ħս�衷�����ڲⳬ��40%�Ĵ������棬����������������ε�Ʒ�ʡ����ں����¼��������Ϸ������������Ϊ�����Ҵ������ӳ�ɫ����Ϸ���ݡ�</span></p>\n',1,1,1451297484650,2,1454038758766,'�������Ϸ����������Ρ���ħս�衷����һ��������ħ��Ϊ��ģ������ᶯ���ںϿ���Ԫ�صĲ��������Ρ�12��17����360��UC���ٶȵ����������������������ԡ���ɫ����ϷƷ���������Ϸ�ڿ��⵱�վͻ��쳣�������糱���������������ʸ��ǳ�����40%���õ��˹����ҵ��Ͽɡ�',10001),(2,'news','���ڴ���ð�ա��°漴�������� ��»����ǳ�','<p><span >&nbsp; &nbsp; &nbsp; &nbsp;�����Ϸ��Ʒ������3D�����������Ρ��ڴ���ð�ա���Я���°汾�����ࡣ�����ױȵĻ����������ݻ������ļ�����Ч�;���Ψ����Ӣ�۽�ɫ��������������ֵ���ڴ������ξ��ơ���ȼ���ռ��飬����ð��������!</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;����ħ���ķ�ӡ��Ȼ�߽�!ħ�����Ǻ�ɫ�ĺ���Ѹ�����ɴ�ء�������ȵľ����ٻ���Զ�ŵ�ʥսӢ�ۣ���ֹ�ⳡ�ƽ١�</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;<strong>��ʥŮ���</strong> <strong>�������١�</strong></span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;�Ĵ����������������Ů��Ϊ���ػ�������ӽ���</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;���ᡢ���ص�ũ��Ů�����õ�&ldquo;�ϵ۵���ʾ&rdquo;��Ϊ����ս��Ӣ�¾��塣��������Խ��¶����Ӱ���ս���н�ų�����&ldquo;ʥŮ���&rdquo;Ϊԭ��������Ӣ�ۡ���Ϊʥ��ʿ����²�������ʵ���˵ã����ܸ������ѣ�����ս��!��һλ����ʮ�־����ȫ����Ӣ��!</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.21/1.png\" /></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;<strong>���߹�սʿ</strong> <strong>ս�������֡�</strong></span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;��Ϊһ��ǿ���ʥ��ʿ������ڳ�ʼ�׶α�ӵ�кܸߵ�����ֵ�ͷ�������ͬʱҲ��Ψһһλӵ��ǿ������������Ӣ��!�����ܣ�&ldquo;ʥ����&rdquo;���ظ�ȫԱ����;&ldquo;����ף��&rdquo;������ȫԱս��������ɸ������ƣ���¾�����ս���ϵĶ�����!Ҳ���Ŷ����ǿ�ĺ��!</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;��Ϊ�ڶ������������ֵ�Ӣ�ۣ���¼����Լ۱�!�ؼ��еĹؼ�����»��Ǹ���!��!ֽ!</span></p>\n',1,1,1451297484650,1,1452240151024,'null',10002),(3,'news','̽��ħ�ô�½ ����ħս�衷����ȼ���ڲ�','<p>&nbsp; &nbsp; &nbsp; &nbsp;�������Ϸ���Ҵ����ħ���ᶯ�����Ρ���ħս�衷������ҵ��ڴ���ӭ���˰�׿ȫƽ̨��ɾ���ڲ⡣��֮ǰ�ľ�Ӣ����У�����Ƕ�����Ϸ�����������Ϸ������Ψ��ϸ�µ�����ģ�ͣ��Լ�����Ч��ʮ��ļ�����Ч��ʮ�����⡣�����ĵ����йٷ������һϵ�����淨������֮ǰ���������޸Ľ�������Ϸ����������Ӧ�Ż���������12.17��ӭ���˱��β�ɾ���ڲ⡣</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/1.png\" style=\"height:204px; width:484px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��ħ�ô�½ð�� �������������顿</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����ħս�衷����ħ����ģ������һ������ħ���뽣��Ӣ��������ĺ�ΰ��½����Ϸ�д����Ե�����Ӣ��ϵͳ��ħ�û�������ӱ�����ϳɶ�������Ч����Ũī�زʣ����Ѹ�ʮ�㣡��������Ϸ�Ĳ����ԡ���Ϸ�Ը�ǿ��</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/2.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���쵼ʷʫӢ�� ������½��������</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����ħս�衷����Ϥ��ʷʫӢ�������������������»û���ƺ����ά��˹�������ء�Ů洡�����˹������ȫ�������Ա�������������ָ�ӣ�������ս��ͬʱÿһλӢ����Ӣ�۶��ܻ�ó��ܻ����У���ʷ����ǿ��̬ӭս������</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/3.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��Ӣ�۲��۳��� ���������ˬ��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����ħս�衷�ڱ����ڲ��п�չ��ʮ���������»����֤����г������������ʯ�������Դ��ͬʱ���ڸ���������ý�����Ƴ����ֻ���������֤ÿһλð������������������½֮ʱû�к��֮�ǡ�</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/4.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�����ʮ���£����ˡ���ħս�衷������Ǿ�������</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;ɨ�衶��ħս�衷΢�źţ���ȡ������Ѷ����΢�Ź��ںţ�smzhange��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���ڡ���ħս�衷</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����ħս�衷��һ��ħ����ĵĻغ��Ʋ��Կ�����Ϸ����Ϸ���羫�»���������Ϸ�У���ҽ�����λ��֮�������ڶ�Ӣ�۶Կ�������������Ϸ�е�ս�����ð뼴ʱ�غ�ģʽ�����ƴ�ͳ�Ļغ���Ϸ���ս��ʱ����ҿ�ͨ�������Ӣ�ۣ���ʱ�ͷż��ܣ��ƿ�ս�����ƣ������ǿ����ҵĲ������顣</p>\n',1,1,1451297484650,1,1451469362395,NULL,10000),(4,'news','3D����ҫ����Ϯ���ڴ���ð�ա���ȼս������','<p><span>&nbsp; &nbsp; &nbsp; &nbsp; �����Ϸ��Ʒ������3D�����������Ρ��ڴ���ð�ա����������״β��ԡ���Ϊ��ʱ�������������Σ����ڴ���ð�ա�����Ϸ������ȫ����£��������εĻ���Ʒ�ʣ��ḻ�����ĸ���������������ʵʱ�����淨����ȼ���ս�����飬���ζ���ð��������!</span></p>\n\n<p><span><strong>&nbsp; &nbsp; &nbsp; &nbsp; ����Ӣ�۵ǳ� ��Ե��϶���</strong></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;���ڴ���ð�ա�ӵ�зḻ��Ӣ�۽�ɫ��������&ldquo;���������Ρ�����&rdquo;����ഫ�������������Ϸ�о�����ѡ��������ϡ���ɫ��Եϵͳǿ����Ӣ����Ӣ�ۣ�Ӣ����������Ӣ����ս��֮�����ϵ��Ӣ��װ��ר��������ս�������ԵӢ��ͬʱ���󶼿ɼ���ӳ����ԣ�ʹ�Ŷ�ս�����������</span></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.16/1.png\" style=\"height:304px; width:504px\" /></span></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;<strong>ս��ȫ������ ���Ƹ�������</strong></span></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;���ڴ���ð�ա�����ȫ��PVE�淨����Ϸ������������������ؾ�������BOSS�ȸ��������淨��������Բ��������ٿ��﷦ζ����ÿһ����Ϸ���в�ͬ���顣������ؾ��淨������һ�ּ�̽����ս����һ���ȫ��PVEģʽ��ÿ�ν����������ؾ���ͼ�����������ģ���֤��ÿ����Ϸ�����ʸС�</span></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.16/2.png\" style=\"height:304px; width:504px\" /></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;<strong>�������α��� PVPս��ʹ��</strong></span></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;���ȶ��εĶ��⻭����ս�����ӱ��棬�ڡ��ڴ���ð�ա���ӵ�ж��־����淨������λս�����������������ȣ���ʱ�������淨һ���򾡡���3D�����֧���£���Ϸ�Ĵ���кʹ����Ҳ��֮��ø�ǿ����ս��ʱ�����Ľ�����̼������Ȱ�PVP������ǿ������ܵ����������ս�����顣</span></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.16/3.png\" /></p>\n',1,1,1451297484650,1,1451469251195,NULL,10000),(5,'news','����������Ϸ�¼�Ԫ!���ڴ���ð�ա��ײ��ڼ�','<p>&nbsp; &nbsp; &nbsp; &nbsp;&ldquo;����Ϊ�ģ�����Ϊ��&rdquo;�������Ϸ�����Ʒ����3D�����������Ρ��ڴ���ð�ա�(http://dmx.xtonegame.com)����ǿ�Ƶ�½������������!��ȡ��������Ϸ���裬���������ռ���Ȥ;����������Ϸ���⣬������ˬ�����̼��������뾺���������ںϣ����ܶ�������֮�桢Ȥ���桢����ͻ�ƴ�ͳ������Ϸ֮ƽ���ա��ɡ��飬���ڴ���ð�ա���������������Ϸ�¼�Ԫ!</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/1.png\" style=\"height:537px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��&ldquo;����ϵͳ&rdquo;�ܾ�ƽӹ��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��ͻ�ƴ�ͳ�����¿���Ϊ�з�����ġ��ڴ���ð�ա�ӵ�����Ƶľ���ϵͳ��ȫ��ḻ���廯������Ϸ������ģʽ������ʱ����IN��MOBA�淨���̼��ɶ��ɵ���λս�淨���������ε�����BOSS�淨�Լ��������ȵȶ��ֻ����淨һӦ��ȫ��ͬʱ��������������������3D�������������֣��߻��ʻ���ս���Ӿ����飬��ν&ldquo;��������������&rdquo;��</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/2.png\" style=\"height:458px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��&ldquo;����΢��&rdquo;�ͷ����ɡ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���Ʋ��������ɶ�һֱ�ǿ������β�Ʒ���������Ĺؼ������ڴ���ð�ա��ڴ������Ʋ������棬�����������ɶ��ᵽһ��ȫ�¸߶ȣ���ν������ҵ�±�ˡ�&ldquo;һ�����������&rdquo;��������ʽ΢�ٸ�������ڹ�ͣ�����ҿ��ƽ�ɫ�ƶ��󣬿���&ldquo;һ��&rdquo;��Ļ���й�������;����������������ʱ������&ldquo;����&rdquo;��������������Ļ��������;�����ܴ�ɺ󣬿���&ldquo;����&rdquo;�������ˡ�ͬʱ����Ϸ�ڣ��Զ����ֵ���ƣ���������˶���moba�淨��ֲ�������ϵĲ���ȱ�ݣ���΢�ٸ������塣</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/3.png\" style=\"height:537px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��&ldquo;����΢��&rdquo;�ͷ����ɡ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���Ʋ��������ɶ�һֱ�ǿ������β�Ʒ���������Ĺؼ������ڴ���ð�ա��ڴ������Ʋ������棬�����������ɶ��ᵽһ��ȫ�¸߶ȣ���ν������ҵ�±�ˡ�&ldquo;һ�����������&rdquo;��������ʽ΢�ٸ�������ڹ�ͣ�����ҿ��ƽ�ɫ�ƶ��󣬿���&ldquo;һ��&rdquo;��Ļ���й�������;����������������ʱ������&ldquo;����&rdquo;��������������Ļ��������;�����ܴ�ɺ󣬿���&ldquo;����&rdquo;�������ˡ�ͬʱ����Ϸ�ڣ��Զ����ֵ���ƣ���������˶���moba�淨��ֲ�������ϵĲ���ȱ�ݣ���΢�ٸ������塣</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/4.png\" style=\"height:537px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��&ldquo;�罻����&rdquo;ʵʱ��ս��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��Ӵ��?��������?��������?��������ʵ����?���ڴ���ð�ա�ӵ�ж��λ��罻ϵͳ����Щ���������롣����ǿ���罻ϵͳ����������ѽ��ð�յ���Ȥ����Ϊ&ldquo;�罻����&rdquo;���������飬��ƴս��!����ֱ�������ѽ���ʵʱ��ս�����ֵ���һ����ս����������!</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/5.png\" style=\"height:537px; width:304px\" /></p>\n',1,1,1451297484650,1,1451469208763,NULL,10000),(6,'news','����Ļ�ǣ���ſ�������չ�羺����Ϸ�Ļ�IP����','<p>&nbsp; &nbsp; &nbsp; &nbsp;������Ļ�ǣ���ſ�������չ�羺����Ϸ�Ļ�IP����������Ļ�(600576)���µĵ羺��˾���ſ��������ս�Ժ�������չ�羺����Ϸ�Ļ�IP������</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����Ļ�(600576)���µĵ羺��˾���ſ��������ս�Ժ�������չ�羺����Ϸ�Ļ�IP������</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;11��19����䣬����Ļ�����ƣ����������ҵ羺��˾��11��18�����һ<a href=\"http://quote.eastmoney.com/SZ159939.html\" target=\"_blank\">��Ϣ����</a>(����)���޹�˾ǩ��ս�Ժ���Э�飬˫���͹�ͬ������Ӿ�������Ϸ�Ļ�IP(֪ʶ��Ȩ��Ʒ)��Χ�ƹ�ͬ�����IP��չ����ҵ�񡢵�������ҵ���Լ��������ƶ���Ϸ����ҵ��ȴ��ս�Ժ�������ϵ��</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.11.20/1.png\" style=\"height:280px; width:582px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����Э�飬˫������ͬΧ�ƴ��͵��Ӿ��������㡶������Ϸ��IPϵ���Ļ���Ʒ����ͬΧ�ơ�X�ƻ���(�ⶨ��)������͵��Ӿ����������ݳ�Ʒ�Ƽ�ϵ���Ļ���Ʒ����ͬΧ�ơ�������̸��(�ⶨ��)���������Ļ�������ϵ��IP��Ŀ��Ƶ��Ӱ�ӡ��������ƶ���Ϸϵ�в�Ʒ���з�������������ҵ���Լ���������ؾ���ҵ���������ĵ�������ҵ��ȡ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�ݽ��ܣ���һ��ϢΪ�������й�˾�ſ�����(��Ʊ���룺YOKU)�ھ��ڵ�ҵ����Ӫʵ�壬����ӵ���ſ��������������ſ�����������˾����ؾ�Ӫ����Ȩ�档2012��8�£��ſ��������100%���ɵķ�ʽ�ϲ����ϲ������Ϊ�ſ��������ţ�2015��8�£��ſ�����������������Ϊ��һ���š�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����Ļ���ʾ���ſ��������й��������ȵ���Ϸ���ر��ǵ��Ӿ�����ƵUGC����ƽ̨��ռ������г��������Ƶ���ݶ�˴���ҵ羺�ܹ������üҹ��ڶ�����Ƶƽ̨��վ�ڽ�Ŀ���ϳ�Ʒ������ҵ���ƹ㡢�������ƶ���Ϸ�ַ����˵ȷ����ս�Ժ�����֧�֣��Թ�˾��ҵ��ת�ͺ������л������壬�ٽ���˾���������Ļ�����չ��</p>\n',1,1,1451297484650,1,1451469547729,NULL,10000),(7,'news','����Ļ�ת�Ͷ����Ļ��������� ����һ����ͣ','<p>&nbsp; &nbsp; &nbsp; &nbsp;��������Ļ�����һ����ͣ����˾�ʲ������Ļ������ɡ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����11��12 �գ��㽭����Ļ��ɷ����޹�˾(26.25,0.22,0.85%)��Ʊ�������ұ��Ϊ����Ļ�����Ʊ���룺600576����A ���г�����һ֧��������Ϊ������Ļ��ɡ�����������ͨ����100%��������Ļ������������ҵ��Ӿ�����ý���޹�˾��������ҵ羺�����Ԫ�Ļ���ͷ������վ AcFun ����ȫ��ս�Ժ�������ϵ��ϵ�оٴ룬�Լ�����ԭ�з��ز�ҵ����ش��ʲ�����ʵʩ����ս����ͼ�������֣�����Ļ��ߵ�����֤ȯ�г�&ldquo;���Ļ���һ��&rdquo;������</p>\n\n<p style=\"text-align:center\"><strong>��</strong><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.11.03/1.png\" style=\"height:304px; width:549px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>ȫ�沼�����Ļ�</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����9 �� 26 �գ���ͨ����100%����������Ļ���</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���ã�����Ļ����������棬����ԭ GTV ��WCA ������Ӿ���������ί��߹��Ŷ�é٩٩�������齨���ʹ�˾&ldquo;��ҵ羺&rdquo;�� ��һ�ڼ�Ͷ������� 6000 ����Ԫ�������ڵ��Ӿ��������Ԫ�Ļ���ý��Ʒ�Ŀ���������ҵ���뾺�����ƶ���Ϸ��Ʒ�ķ��У���ʽ�������ֵ��Ӿ�����ҵ����Ļ��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;10 �� 17 �գ�����Ļ��ַ������棬������ʹ�˾��ҵ羺�����Ԫ�Ļ���ͷ������վAcFun(�׳� A վ)����ȫ��ս�Ժ�������ϵ��˫������Χ�ƺ�����Ʒ IP �ھ���ҵ�񡢶���Ԫ UGC ������(�׳� UP ��)���������ƶ���Ϸ�ַ��ϵ���������·����������Aվ�ĺ�������Ϊ���� IP �Ŀ���������һ�ξ��Ĳ��֡�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;10 �� 24 �գ�����Ļ��ٴη������棬������ʽ��ɹ��̲��ŶԹ�˾���ơ���Ӫ��Χ�ȱ����&ldquo;�㽭������ʵҵ�ɷ����޹�˾&rdquo;���Ϊ&ldquo;�㽭�������Ļ��ɷ����޹�˾&rdquo;����������Ļ����� A���Ļ����й�˾��ʵ��ȫ��ת�͵����ġ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;10 �� 30 �գ����г������ڴ�����Ļ���һ������ʱ������Ļ�ͻȻ����ͣ�ƣ�ԭ���ǳﻮ�ش��ʲ����ۡ����գ�����Ļ���������ƣ��⽫������100%��Ȩ����ҵ��65%��Ȩ�ֱ���8267��Ԫ��4663��Ԫת�á��˾ټ����伯�о�������Դ�������Ļ�����ת�͵Ĳ�������Ϊ����Ļ�ת���ṩ��Ҫ���ʽ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;11��2�գ�����Ļ����й���������̨����Ӫ��˾���ߴ�ý����ս�Ժ�������ϵ�����ţ�����Ļ��ع��ӹ�˾��ҵ羺�����ֻ��齨��ս�Ժ�������ϵ��һϵ�е��ش�ٴ��������Ļ��������ƽ�����ҵ��Ҳ���г�չ������ȫ��ת�����Ļ�����Ĺ��ǰ����</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���գ�����Ļ���һ�η������棬������ҵ羺���һ����(ԭ�ſ���������)ǩ��ս�Ժ���Э�顣</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>ҵ�񻥶��ٷ�չ</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����Ļ�ǰ������������ͨ������ʵ�ֶԶ��� IP��������Ӫ��������ϵ�����ϣ�������Ļ� 2015���������г��ֵ��ɴ˾ٴ�����Ť��Ϊӯ�����г��ļ������ģ����г������ʹ�˾�����ֵ羺�����Ԫ�Ļ���ҵ�������г��ļ����ڴ������г��ڴ�Դ�ڵ羺��ҵ�ĺ����Ŷӻ��Ժ�����̬����ʱ����ҵ羺����ѡ����AcFun�����ֻ���ĺ�����ʵ�����ڶ���Ԫ����������IP�������ݳ���Դ�����ϡ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�����ٴ빴�ճ�����Ļ���ýҵ��Ļ�������ģʽ&mdash;&mdash;����õ����ϻ�����ϸ��������ͬ���촫ý��Ŀ��IP �Լ��ܱ�������Դ���ڻ������ǿ��������������Դ֧��ʱ��Ҳ������ʵ�����ʵ������� IP ������ͨ�������ֻ����������ҵ羺���ÿ�չ��ȫְ���֡�IP ���ݳ����ݳ��ܱ���Ƶ�����ϵ�����Ȩ����Ϊ����Ԫ����С˵��һƷ�Ƶġ�ȫְ���֡����������������ǵ��Ӿ������˾�ʹ����Ļ�һ������������Ԫ�Ļ��й�������һС˵IP�������С�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����Ļ����ڷ�����ս�Ժ���������ʾ����ҵ羺���������ľ�������Ϸ��Ʒ����ý��Ŀ���ݳ��;���ҵ��Ķ��߿ɼ�һ�ߡ�ͬʱ������Ļ������ߴ�ý(ϵ�й�������ֱ�����й���������̨��Ӫ��˾)������ս�Ի���ϵ��˫��������ŵÿ��Ͷ�벻���� 2000 ��Ԫ������������Ԫ�����Ӿ����Ļ����Ŀ������һ��Լ�������ڽ��������߽�������ĺ������ܡ����ˣ�����Ļ��������ҵ�񲼾��Ͻ�һ����̽���Ļ���Ⱥ���ǣ�ҵ��ռ�ȡ�÷�չ��ͻ�ơ�</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>�ƺӽ�������</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�ݹ�����Ļ�������һϵ�ж�����Ѹ���ƽ����Ļ���ҵ�Ĳ��֣����ٰ��뷿�ز�����ҵ�񣬵�ȴ�����˿������Ļ��޹صĻƺӽ��ڡ���Ϊ�㽭ʡ��Ψһһ�����й�˾�ع���Ӫ�Ļ���������ƽ̨���ƺӽ�����������Ļ����³��׵���2014������ǣͷ���֣���רҵ����ȫ�Ļ�������������ģʽΪ����С����˫���ṩ�Ӽ�����ƽ̨��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�Դˣ��г��²�ƺӽ���������Ļ���һϵ��ת�����ֽ�����ʲô���Ľ�ɫ��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���ߴ�������ͨ���绰�ɷ�������Ļ��Ķ��³��׵�����</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&ldquo;���ڵ� 85 ��90 ��00 �󼴽���Ϊ�й������������Ļ������������ṹ�ı仯Ҳ�𽥳�Ϊ�����ճ�������Ϊ����Ҫ��飬����Ļ����������Ļ���ҵת�ͣ�����۽������Ļ�����Ĳ���&rdquo;��&ldquo;����Ļ���ȻҪ�������Ļ�����Ҫ�ȱ��˸�Ѹ�ٵز��ֵ����Ļ����ѻ�����֧���ϡ������߱��������������������ˣ��ر��� 85��90 ���Լ��Ļ���������Ľ�һ����̽�����벻��������ϵ������˵δ�����벻��������������ϵ��֧�֡������Ա�����è�����ŵ����������������֧�����Ա�����è�ϲ����Ĵ�������ȴ��֧���������Ͻ��ڣ��Ǹ������Ѵ���δ�����꣬�������Żƺӽ��ڵĲ�Ʒ�����Ļ�����֮��Ĺ�ϵ���������ý���һ���õ���֤��&rdquo;�׵����ڵ绰�ɷ��е�����ƽ�����������쳣�ᶨ���ɴ�����Ļ��ڲ�Զ�����������Ļ�ҵ����ƺӽ��ڱض���������Ի���������Ļ����������ѽ������ƺӽ���ҵ��Ŀ��ٷ�չ�����ƺӽ�����Ϊ���Ļ���չ�ṩǿ�������ʽ��ϣ�ҲΪ���Ļ��������ṩ���١���ݵ��ʽ�ƽ̨��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�۹�����������������������ͷԽ��һ��͵����Ƚ�������Ļ�������ͬ���Ե͵����ƵĶ��³��׵����Ĵ����£�������׸�&ldquo;����Ԫ��������羺&rdquo;�ںϹᴩ�����µ����Ļ���һ�ɣ��ؽ��춨����Ļ����й����Ļ���ҵ����������λ������ͬ���ڴ�����Ļ��ڳ�Ϊ�й����Ļ���һ�ɵ�ͬʱ�������硣</p>\n',1,1,1451297484650,1,1451541623083,NULL,10000),(8,'news','�����Ϸ�����Ƴ�������������ͬ������','<p>&nbsp; &nbsp; &nbsp; &nbsp;�����Ϸ���ն�����������ó������µ�Ӱ������������IP�����θı�Ȩ�������Ϸ��Ϊ������������IP������ͬ�����Σ����춥����Ϸʢ�硣</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�������������ǳ����뷶���������Ķ���ð����Ƭ����Ƭ�����������������С�����ı�����˾Talent International��������������Ů�ˡ�������ͳɱ�֡���Ӣ����˾Exclusive Media��ͬ������������Ƭ����2016�����й���½��ӳ��</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�������Ϸ��ʾ�����������������ν�����ʥ�����ڣ���Ϊ�ײ�&ldquo;ʥ������&rdquo;��</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27-2/1.png\" style=\"height:305px; width:504px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;�������Ϸ���ܣ����ΰ桶�������������߶Ȼ�ԭ��Ӱ�к���й����ɹš�����˹�ĳ��������а���&ldquo;�ɹ�ɳĮ&rdquo;��&ldquo;�Ĵ�ɽ��&rdquo;��&ldquo;��������&rdquo;��&ldquo;����Ͽ&rdquo;����ɫ���㣬��Ũ������������������Ϸ�г��ֳ��������⣬��Ӱ�����ʵ�����Ҳ��ֲ�����Ϸ���ö�սPVP����ˬ�졣�ÿ���Ϸ�����õ�Ӱ����Ч���棬����Ϊ��Ҵ����͹ۿ���Ӱʱһ�����Ӿ����顣</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27-2/2.png\" style=\"height:304px; width:504px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��Ϥ���˴Ρ��������������ΰ���Ϸ�ķ�����ѡ��&ldquo;����ʱ��&rdquo;�����Ӱһ������&ldquo;ʥ�����쵵&rdquo;���������Ϸ���и����˽��ܣ�&ldquo;���������������ΰ�ϣ���ô���ܹ��ڿ���Ӱ��ͬʱ�������浽��Ϸ�����û��ӹ�Ӱ�߱�ɲ����ߣ�����һ�������ĵ�Ӱ��Ƭ��&rdquo;</p>\n',1,1,1451297484650,1,1451469857913,NULL,10000),(9,'news','����Žǡ���ħս�衷��׿��Ӣ��ղ��Խ��տ���','<p>&nbsp; &nbsp; &nbsp; &nbsp;�������Ϸ�Ƴ���ħ�ÿ��ƶ������Ρ���ħս�衷��׿�潫��10��27�տ������־�Ӣ��ղ��ԣ���׿���Է�27��10���𺳿�����</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����ħս�衷����������濪���������˴����������Ϸ������Ψ��ϸ�µ�����ģ�ͣ������������ʵ����õ�ǿ���Ӿ���������ƶ�ƽ̨�Ϲ������������λ����ħ�ô�½��</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27/2.png\" style=\"height:373px; width:496px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;����ħ��½����׿�潫������ҽ���һ���̼�Ӣ�µ�ð�����硣������Ӣ�顢����Ӣ��������ڵ����ٻ���������ʮ�أ�����س�����ϣ��������ƻã�һ�ȵ����ߣ����в����ߺ�?�β������ڴ˹�ͬ��ս������Ӣ���ǹ�ͬ�ܽ�����Ϊһ����½�ľ�����!</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27/1.png\" /></p>\n',1,1,1451297484650,1,1451541585361,NULL,10000),(10,'news','���������졶��ħս�衷��������ħ�ô�½','<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>���գ������Ϸ����������3Dħ�ÿ������Ρ���ħս�衷���ڱ����µ����ߡ���Ϊһ����������Σ�����ħս�衷�������������죬��֤�����ɫ���������Ч���Լ���Ϸ���档ͬʱ���淨���Ƴ³��£������˹���սϵͳ����԰ϵͳ�������淨�������������Ϸ�Ŀ����ԡ�</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>����ʱ��������죬�����Ӿ����¡�</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>�������һֱ�Ը�Ʒ�ʻ��桢�����Ĺ�ӰЧ����Ϊ�˳Ƶ�������ħս�衷�����������죬ʹ���仭����ʮ�ֳ�ɫ������ɫ���µ��ʸС�Ѥ���Ĵ�Ч�����ḻ����Ϸ�����ȵȣ�����һ������ĳ��ֳ�����ͬʱ��Ϸ��ɫ����Ϸ�����ħ�÷��Ҳ���ܿɹ��ʮ�����У�ʹ�ó������������ĳ��и��ӳ��ڣ���������Ϸ�����������������⡣</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.16/1.png\" style=\"height:516px; width:516px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>�����ϵͳ���������е�������԰��</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>����ħս�衷�������ϵͳ����ÿһ��Ư�����Ķ����˹��ޣ���ʱ������޾���ƴɱ�ܶ�֮������ֻ�������Լ������֮�У����ڿ󣬴��������ʱ������Ŷ���ص����ɶ���Ȼ���ţ�Ҳ��һ�ֲ��ɶ�����ܡ��������ֻ��������ڲ��ܴ����ϡ�е��ߣ�������������Ӣ���ǽ�Ȼ��ͬ��</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.16/2.png\" style=\"height:374px; width:558px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>��MOBA����ս����ȼȫ����·�񳱡�</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>��������Ҳ����MOBA��!ֻҪ��PK��ϵͳ���Զ����λ����Ĺ���ƥ�乫��ս,Ȼ��Ϳ���ѡ����������·�е�һ·�����ŶԷ��ϳ���ȥ�ˡ���ֿ��Ƕ�ս˼·�����Ƶ���ǲ����չ���㹻��ս��������ȡ�����յ�ʤ������ʧ���߲��ڽ��¡�</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.16/3.png\" style=\"height:373px; width:557px\" /></p>\n',1,1,1451297484650,1,1451468693462,NULL,10003),(11,'news','���ڴ���ð�ա�10��14�տ����λ÷��','<p>&nbsp; &nbsp; &nbsp; &nbsp;ħ����ӡ��Ȼ�߽⣬ħ�����Ǻ�ɫ�ĺ���Ѹ�����ɴ�أ�Ϊ����ֹ��һ���ƽ٣�Զ��ʥսӢ�����ؾ��ڴˣ�����ħ������ײ��Ӣ����ħ��ļ�ս��������Ĵ��������㳨��������һ�����߾��ߵ�ð�հɡ������Ϸ�����׿�����ARPGħ�����Ρ��ڴ���ð�ա�����(10��14��)10ʱ��ʽ�����״�IOSԽ����⣬��຾�������ȡ��</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;Ӣ�۴��Ҷ������춷��ͣ</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;���ڴ���ð�ա�ӵ�ж���ϰ�λ������ɫ��Ӣ�ۻ�飻ÿλ��鶼ӵ�о��������ͣ�Ѥ���ļ��ܣ��ḻ�ľ��飬���صĸ��ԣ�&ldquo;�������ԡ����η�ħ�����֮ս&rdquo;��Щ��������е�Ӣ�����ﶼ��Ϥ���ǳ�����������գ�������˽䣬��ɪ�л��ң�����Ӣ�۴��䣬����ϲ�������䣡</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.14/1.jpg\" style=\"height:300px; width:500px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;���ֲٿأ���������</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;��ӱ�������������һָ��ת��Ϸ���������֣��ƶ�������������������Ҳ����������Ϸ�������ֻ��Ҫһֻ�ּ���ʵ���ƶ������������ܡ����ܵ����ж���,���˴�BOSS������ŰС�֣��������ּ�������������&ldquo;���ֲٿ�&rdquo;�������Ϸ���顣</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.14/2.jpg\" style=\"height:257px; width:504px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;���໥���淨����ʱ��������</strong></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>��Ϸ�ڶ���RPG��Ԫ�ػ����Ͻ���˶���PVE��PVP�����淨����MOBA�Կ�����λ���ȣ���������εĵ���ˢͼģʽ��������������һ�������Ϸ�����м�ʱ�������칦�ܣ�����ҿ��Ժ������һ�������Լ�������һ������Ϸ���磬����ս����������Ȥ��</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.14/3.jpg\" style=\"height:257px; width:504px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>�µ����̣��µ���ս��ð�յ�·����Ҫ�������ǻۣ�����ҪС����ͬ��Э�����Ͽ���Ϻ���һ����̽�����ڴ���ð�ա�����������ɣ����ﻹ�зḻ���ص����ھ����ڡ��ڴ���ð�ա���ħ�������������~</p>\n',1,1,1451297484650,1,1451469065707,NULL,10000),(12,'news','�����Ϸ��Ʒ���ڴ���ð�ա�����ϵͳ����','<p>�����Ϸ��Ʒ���߸���3D�����������Ρ��ڴ���ð�ա�������Ϯ���ḻ�����Ļ����淨��Ϊ��Ϸһ����ɫ������Һ������������Ǿ��������˽�һ�¡��ڴ���ð�ա��ľ���ϵͳ��</p>\n\n<p>����ϵͳ</p>\n\n<p>ð���ŵȼ��ﵽ20�����ɿ�������ϵͳ�������Ϸ�������·�����ͼ����룬��ҿ��Կ���&ldquo;��λս&rdquo;��&ldquo;������&rdquo;��&ldquo;������&rdquo;���־���ģʽ��</p>\n\n<p>��λս</p>\n\n<p>����λս�У���ҿ��Կ����Լ��ĵ�ǰ������Ҳ����ѡ����ս�������Լ���ǰ��������ң�ÿ����5����ս���ᣬ��ս�ɹ���������������Ӯȡ������</p>\n\n<p>��λ��10000������ÿ���н���ÿ��0��ˢ�£�����Խ�߽���Խ�ࡣ</p>\n\n<p>��������� ��ʯ ��������</p>\n\n<p>&nbsp;</p>\n',0,1,1451297484650,1,1451456453093,NULL,10000),(14,'job','����������','<p>н�ʣ�����</p>\n\n<p>1������������Ʒ��Ϸ������չ����Ʒ���룻</p>\n\n<p>2������Ӧ��ƽ̨��store�ĺ����ƹ㣻</p>\n\n<p>3����������������Ʒ��Ϸ�ƹ㣻</p>\n\n<p>ְλҪ��:</p>\n\n<p>1�� ��������ѧ����2��������ع�������;</p>\n\n<p>2�� ��ϤAndroid iphone�ֻ�Ӧ��(apps) ���г�������</p>\n\n<p>3�� ���ƶ����ƽ̨��app store��ҵ����չ���������ȣ�</p>\n\n<p>4�� ����Ϸ���̼���Ϸ�����ߺ�����Դ�����ȣ�</p>\n\n<p>5�� �߱����õ��˼ʽ��������Ա��͹�ͨ�����Լ�һ���Ĺ���������</p>\n\n<p>6�� �߱��߶ȵ������ġ����ŵĹ������硢���㹵ͨ�������ŶӾ���</p>\n\n<p>��ϵ��ʽ</p>\n\n<p>������������hr.@bjxiangtone.com</p>\n\n<p>��ϵ�绰��0755-86665507</p>\n\n<p>��ַ����������ɽ���пƴ���21¥B1��Ԫ</p>\n',1,1,1452221479225,2,1472798610205,'  �����ص㣺�Ϻ��ֶ���????�������ʣ�ȫְ????������1��',10000),(18,'job','����������','<p>н�ʣ�����</p>\n\n<p>1������������Ʒ��Ϸ������չ����Ʒ���룻</p>\n\n<p>2������Ӧ��ƽ̨��store�ĺ����ƹ㣻</p>\n\n<p>3����������������Ʒ��Ϸ�ƹ㣻</p>\n\n<p>ְλҪ��:</p>\n\n<p>1�� ��������ѧ����2��������ع�������;</p>\n\n<p>2�� ��ϤAndroid iphone�ֻ�Ӧ��(apps) ���г�������<br />\n3�� ���ƶ����ƽ̨��app store��ҵ����չ���������ȣ�<br />\n4�� ����Ϸ���̼���Ϸ�����ߺ�����Դ�����ȣ�<br />\n5�� �߱����õ��˼ʽ��������Ա��͹�ͨ�����Լ�һ���Ĺ���������<br />\n6�� �߱��߶ȵ������ġ����ŵĹ������硢���㹵ͨ�������ŶӾ���</p>\n',1,NULL,NULL,2,1472704078952,'  �����ص㣺�Ϻ��ֶ���????�������ʣ�ȫְ????������1��',10000),(19,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(20,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(21,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(22,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(23,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(24,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(25,'job','����������','<p>н�ʣ�����</p>\n\n<p>1������������Ʒ��Ϸ������չ����Ʒ���룻</p>\n\n<p>2������Ӧ��ƽ̨��store�ĺ����ƹ㣻</p>\n\n<p>3����������������Ʒ��Ϸ�ƹ㣻</p>\n\n<p>ְλҪ��:</p>\n\n<p>1�� ��������ѧ����2��������ع�������;</p>\n\n<p>2�� ��ϤAndroid iphone�ֻ�Ӧ��(apps) ���г�������<br />\n3�� ���ƶ����ƽ̨��app store��ҵ����չ���������ȣ�<br />\n4�� ����Ϸ���̼���Ϸ�����ߺ�����Դ�����ȣ�<br />\n5�� �߱����õ��˼ʽ��������Ա��͹�ͨ�����Լ�һ���Ĺ���������<br />\n6�� �߱��߶ȵ������ġ����ŵĹ������硢���㹵ͨ�������ŶӾ���</p>\n',1,2,1472696550104,2,1472710121540,'  �����ص㣺�Ϻ��ֶ���????�������ʣ�ȫְ????������1��',10000),(26,'news','���ǲ�������','<p>�����������</p>\n\n<p>��֪����ôд</p>\n\n<p>�����дһ�°�</p>\n',1,2,1472803469172,2,1472803469172,'������',10008),(27,'link','����ͨ����ؿƼ����޹�˾','',1,2,1472806948784,2,1472807483078,'http://www.alllink.com.cn/',10000),(28,'link','����Ѷ����Ƽ����޹�˾','',1,2,1472807102673,2,1472807564933,'http://www.xtonecomic.com/',10000),(29,'link','�����ζ���ؿƼ����޹�˾','',1,2,1472807119908,2,1472807573956,'http://14643233.czvv.com/',10000),(30,'link','�����д��������Ƽ����޹�˾','',1,2,1472807136221,2,1472807629221,'http://www.pvc123.com/b-pxtonewinnie/',10000),(31,'link','�����к���Ͷ�����޹�˾','',1,2,1472807157269,2,1472807595592,'http://www.m-time.com/',10000),(32,'link','���Ԫ','',1,2,1472807191428,2,1472807637875,'http://www.ljy0.com/',10000),(33,'link','�ڴ���ð��','',1,2,1472807212327,2,1472807645608,'http://dmx.xtonegame.com',10000);

/*Table structure for table `tbl_wechat_menus` */

DROP TABLE IF EXISTS `tbl_wechat_menus`;

CREATE TABLE `tbl_wechat_menus` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `appId` VARCHAR(100) DEFAULT NULL,
  `menuId` VARCHAR(100) DEFAULT 'base',
  `content` TEXT,
  `createTime` BIGINT(20) DEFAULT NULL,
  `modifyTime` BIGINT(20) DEFAULT NULL,
  `createBy` VARCHAR(100) DEFAULT NULL,
  `modifyBy` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_appId_menuId` (`appId`,`menuId`)
) ENGINE=INNODB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_wechat_menus` */

INSERT  INTO `tbl_wechat_menus`(`id`,`appId`,`menuId`,`content`,`createTime`,`modifyTime`,`createBy`,`modifyBy`) VALUES (1,'wx19ac78d42392068c','base',' {\r\n     \"button\":[\r\n     {	\r\n          \"type\":\"click\",\r\n          \"name\":\"���ո���\",\r\n          \"key\":\"V1001_TODAY_MUSIC\"\r\n      },\r\n      {\r\n           \"name\":\"�˵�27\",\r\n           \"sub_button\":[\r\n           {	\r\n               \"type\":\"view\",\r\n               \"name\":\"����27\",\r\n               \"url\":\"http://www.soso.com/\"\r\n            },\r\n            {\r\n               \"type\":\"view\",\r\n               \"name\":\"��Ƶ\",\r\n               \"url\":\"http://v.qq.com/\"\r\n            },\r\n            {\r\n               \"type\":\"click\",\r\n               \"name\":\"��һ������\",\r\n               \"key\":\"V1001_GOOD\"\r\n            }]\r\n       }]\r\n }',NULL,NULL,NULL,NULL);

/*Table structure for table `tbl_wechat_tags` */

DROP TABLE IF EXISTS `tbl_wechat_tags`;

CREATE TABLE `tbl_wechat_tags` (
  `id` BIGINT(20) NOT NULL,
  `appId` VARCHAR(100) DEFAULT NULL,
  `content` TEXT,
  `createTime` BIGINT(20) DEFAULT NULL,
  `modifyTime` BIGINT(20) DEFAULT NULL,
  `createBy` VARCHAR(100) DEFAULT NULL,
  `modifyBy` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_appId_menuId` (`appId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_wechat_tags` */

/*Table structure for table `tbl_wechat_tokens` */

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

INSERT  INTO `tbl_wechat_tokens`(`appId`,`token`,`nextTime`,`lastModTime`,`validTime`) VALUES ('wx19ac78d42392068c','SC2szK_--uKd2-v2WmK4Zu6lmLrNvDxvzhCEk6riD0XYkreWj3MutxZ1b-yHv9xWoIS7sanAjDeq7X0hcp_U2r_Ejv6xMMgURo2qFJZYc6sQTVaAJAGJL',1467161532556,1467161232556,1467168432556);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
