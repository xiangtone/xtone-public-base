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
  `pwd` VARCHAR(100) DEFAULT NULL COMMENT 'md5加密',
  `email` VARCHAR(100) DEFAULT NULL,
  `isAdmin` INT(11) DEFAULT '0' COMMENT '1表示为管理员',
  `isAvail` INT(11) DEFAULT '1' COMMENT '1表示有效，0表示无效，管理界面',
  `lastLogin` BIGINT(20) DEFAULT NULL COMMENT '最后登录时间',
  `addTime` BIGINT(20) DEFAULT NULL COMMENT '新增时间',
  KEY `id` (`id`)
) ENGINE=INNODB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_base_users` */

INSERT  INTO `tbl_base_users`(`id`,`username`,`pwd`,`email`,`isAdmin`,`isAvail`,`lastLogin`,`addTime`) VALUES (1,'1@1.cn','c4ca4238a0b923820dcc509a6f75849b','',0,1,1472631450952,NULL),(2,'admin','21232f297a57a5a743894a0e4a801fc3','admin',1,1,1472807821700,NULL),(7,'test','098f6bcd4621d373cade4e832627b4f6','text',1,1,1454222787992,1453959803952),(8,'zxz','0666d3bb926ccae05deb6307995a9a84','',0,1,1454121508804,1453973771749);

/*Table structure for table `tbl_cms_catalogs` */

DROP TABLE IF EXISTS `tbl_cms_catalogs`;

CREATE TABLE `tbl_cms_catalogs` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(100) DEFAULT NULL,
  `authorId` BIGINT(20) DEFAULT NULL COMMENT '作者userId',
  `addTime` BIGINT(20) DEFAULT NULL COMMENT '记录添加时间',
  `lastModifyId` BIGINT(20) DEFAULT NULL COMMENT '最后修改人userId',
  `lastModifyTime` BIGINT(20) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cms_catalogs` */

INSERT  INTO `tbl_cms_catalogs`(`id`,`content`,`authorId`,`addTime`,`lastModifyId`,`lastModifyTime`) VALUES (1,'news',NULL,NULL,NULL,NULL),(2,'job',NULL,NULL,NULL,NULL),(3,'link',NULL,NULL,NULL,NULL);

/*Table structure for table `tbl_cms_contents` */

DROP TABLE IF EXISTS `tbl_cms_contents`;

CREATE TABLE `tbl_cms_contents` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `catalog` VARCHAR(100) DEFAULT NULL COMMENT '英文目录名',
  `title` VARCHAR(200) DEFAULT NULL,
  `content` TEXT,
  `status` INT(11) DEFAULT '1' COMMENT '1可以显示',
  `authorId` BIGINT(20) DEFAULT NULL COMMENT '作者userId',
  `addTime` BIGINT(20) DEFAULT NULL COMMENT '记录添加时间',
  `lastModifyId` BIGINT(20) DEFAULT NULL COMMENT '最后修改人userId',
  `lastModifyTime` BIGINT(20) DEFAULT NULL COMMENT '最后修改时间',
  `subTitle` VARCHAR(800) DEFAULT NULL COMMENT '副标题，HTML富文本格式',
  `priority` INT(11) DEFAULT '10000' COMMENT '优先级，大值优先',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cms_contents` */

INSERT  INTO `tbl_cms_contents`(`id`,`catalog`,`title`,`content`,`status`,`authorId`,`addTime`,`lastModifyId`,`lastModifyTime`,`subTitle`,`priority`) VALUES (1,'news','魔幻之旅华丽开启《神魔战歌》开测火爆','<p>&nbsp; &nbsp; &nbsp; <span >&nbsp;由万家游戏所打造的手游《神魔战歌》，是一款以西方魔幻为题材，主打轻动作融合卡牌元素的策略类网游。12月17日于360、UC、百度等众主流手游渠道开启测试。出色的游戏品质让这款游戏在开测当日就火爆异常，好评如潮。开服次日留存率更是超过了40%，得到了广大玩家的认可。</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;【虚幻引擎打造 粒子效果炸裂】</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;《神魔战歌》采用虚幻引擎打造，保证了游戏极高的画质。天照、维纳斯等等英灵都有着史诗中应有的特色。从场景到建筑，从战斗动画到技能效果，均可看出游戏画面品质的不俗。精美的画质配合史诗的剧情，带给玩家立体化的游戏体验。</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.22/1.png\" style=\"height:304px; width:484px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<span >【策略、动作融合满足玩家诉求】</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;手机网游发展至今，单一的玩法已无法满足玩家们日益挑剔的胃口。而《神魔战歌》所打造的游戏模式则是将卡牌游戏精髓作为核心，同时辅以各种类型的PVP玩法，更加强调策略性，从而弥补一般卡牌类游戏刷刷刷以及策略部分内容过少的尴尬，带给玩家更强的代入感与互动性。</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.22/2.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"font-family:microsoft yahei\">【听取玩家建议，赢得玩家青睐】</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;《神魔战歌》一直广泛听取玩家建议，尊重玩家意见，对于游戏中存在的问题及时修改，对玩家热衷的部分保留并发扬光大，在玩法创新上也充分考虑玩家的意见，本次内测版本着重于对玩家所看重的PVP竞技场部分进行创新，手游中独创的3V3玩法也赢得了玩家的一致好评。希望各位玩家能多多为我们的游戏提出意见，以便于我们听到你的声音，让魔幻大陆更加精彩。</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.22/3.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<span >《神魔战歌》本次内测超过40%的次日留存，已完美体现这款手游的品质。而在后续事件，万家游戏将继续发力，为广大玩家带来更加出色的游戏内容。</span></p>\n',1,1,1451297484650,2,1454038758766,'由万家游戏所打造的手游《神魔战歌》，是一款以西方魔幻为题材，主打轻动作融合卡牌元素的策略类网游。12月17日于360、UC、百度等众主流手游渠道开启测试。出色的游戏品质让这款游戏在开测当日就火爆异常，好评如潮。开服次日留存率更是超过了40%，得到了广大玩家的认可。',10001),(2,'news','《口袋大冒险》新版即将震撼亮相 贞德华丽登场','<p><span >&nbsp; &nbsp; &nbsp; &nbsp;万家游戏出品，革新3D动作卡牌手游《口袋大冒险》将携最新版本震撼亮相。无与伦比的华丽场景，奢华炫丽的技能特效和精致唯美的英雄角色，组成这个冬天最值得期待的手游巨制。点燃冬日激情，开启冒险新征程!</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;随着魔王的封印悄然瓦解!魔裔像是黑色的洪流迅速吞噬大地。永恒国度的精灵召唤来远古的圣战英雄，阻止这场浩劫。</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;<strong>【圣女贞德</strong> <strong>崇高与光荣】</strong></span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;心存正义和善良的美少女，为了守护规则而挥剑。</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;温柔、朴素的农家女孩，得到&ldquo;上帝的启示&rdquo;后为国而战，英勇就义。贞德正是以将奥尔良从百年战争中解放出来的&ldquo;圣女贞德&rdquo;为原型制作的英雄。作为圣骑士，贞德不仅自身实力了得，更能辅助队友，提升战力!是一位能力十分均衡的全能型英雄!</span></p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.21/1.png\" /></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;<strong>【高贵战士</strong> <strong>战斗多面手】</strong></span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;作为一名强大的圣骑士，贞德在初始阶段便拥有很高的生命值和防御力，同时也是唯一一位拥有强力治愈能力的英雄!两大技能，&ldquo;圣光术&rdquo;，回复全员体力;&ldquo;力量祝福&rdquo;，提升全员战力。可肉可辅可治疗，贞德绝对是战场上的多面手!也是团队最坚强的后盾!</span></p>\n\n<p><span >&nbsp; &nbsp; &nbsp; &nbsp;作为第二天就能免费入手的英雄，贞德极具性价比!关键中的关键，贞德还是个萌!妹!纸!</span></p>\n',1,1,1451297484650,1,1452240151024,'null',10002),(3,'news','探秘魔幻大陆 《神魔战歌》今日燃情内测','<p>&nbsp; &nbsp; &nbsp; &nbsp;由万家游戏独家代理的魔幻轻动作手游《神魔战歌》，在玩家的期待中迎来了安卓全平台不删档内测。在之前的精英封测中，玩家们对于游戏大气磅礴的游戏场景，唯美细致的人物模型，以及粒子效果十足的技能特效均十分满意。在随后的调整中官方添加了一系列新玩法，并对之前玩家提出的修改建议在游戏中做出了相应优化。终于在12.17日迎来了本次不删档内测。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/1.png\" style=\"height:204px; width:484px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;【魔幻大陆冒险 动作卡牌新体验】</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《神魔战歌》采用魔幻题材，创造出一个属于魔法与剑、英灵与巨龙的宏伟大陆。游戏中创新性的引入英灵系统，魔幻画风和离子表现组合成顶尖声光效果，浓墨重彩，爆裂感十足！让整个游戏的策略性、游戏性更强。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/2.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;【领导史诗英灵 古兰大陆救世主】</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《神魔战歌》将熟悉的史诗英灵形象结合自身特征重新幻化设计和演绎，维纳斯、杜兰特、女娲、玛纳斯？这里全部都可以被你征服，听你指挥，随你征战。同时每一位英灵与英雄都能获得超能花大招，以史上最强姿态迎战恶龙！</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/3.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;【英雄不论出身 整场狂欢玩的爽】</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《神魔战歌》在本次内测中开展数十种线上线下活动，保证玩家有充足的体力、钻石、金币来源。同时还在各大渠道、媒体中推出各种活动大礼包，保证每一位冒险者们在拯救整个大陆之时没有后顾之忧。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.17/4.png\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;在这个十二月，有了《神魔战歌》，你就是救世主！</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;扫描《神魔战歌》微信号，获取更多资讯！（微信公众号：smzhange）</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;关于《神魔战歌》</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《神魔战歌》是一款魔幻题材的回合制策略卡牌游戏，游戏画风精致华丽。在游戏中，玩家将扮演位面之子引领众多英雄对抗暗黑势力，游戏中的战斗采用半即时回合模式，打破传统的回合游戏概念，战斗时，玩家可通过巧妙布阵英雄，即时释放技能，掌控战场局势，大大增强了玩家的策略体验。</p>\n',1,1,1451297484650,1,1451469362395,NULL,10000),(4,'news','3D大作耀世来袭《口袋大冒险》点燃战斗激情','<p><span>&nbsp; &nbsp; &nbsp; &nbsp; 万家游戏出品，革新3D动作卡牌手游《口袋大冒险》即将开启首次测试。作为次时代动作卡牌手游，《口袋大冒险》在游戏内容上全面革新，媲美端游的画面品质，丰富多样的副本活动，更增添多种实时竞技玩法，点燃你的战斗激情，畅游动作冒险新世界!</span></p>\n\n<p><span><strong>&nbsp; &nbsp; &nbsp; &nbsp; 海量英雄登场 情缘组合多样</strong></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;《口袋大冒险》拥有丰富的英雄角色，包含了&ldquo;三国、西游、封神&rdquo;等诸多传奇人物，让你在游戏中尽情挑选，自由组合。特色情缘系统强化了英雄与英雄，英雄与武器，英雄与战骑之间的羁绊关系。英雄装备专属武器、战骑，或与情缘英雄同时上阵都可激活加成属性，使团队战力大幅提升。</span></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.16/1.png\" style=\"height:304px; width:504px\" /></span></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;<strong>战斗全面升级 卡牌革新体验</strong></span></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;《口袋大冒险》打造全新PVE玩法，游戏新增勇者试炼、奇幻秘境和世界BOSS等各种新奇玩法。告别无脑操作，不再枯燥乏味，让每一次游戏都有不同体验。如奇幻秘境玩法，这是一种集探索与战斗于一体的全新PVE模式，每次进入活动副本，秘境地图都是随机重组的，保证了每次游戏的新鲜感。</span></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.16/2.png\" style=\"height:304px; width:504px\" /></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;<strong>媲美端游表现 PVP战个痛快</strong></span></p>\n\n<p><span>&nbsp; &nbsp; &nbsp; &nbsp;堪比端游的顶尖画质让战斗更加逼真，在《口袋大冒险》中拥有多种竞技玩法，如排位战、积分赛、竞技场等，将时下热门玩法一网打尽。在3D画面的支撑下，游戏的打击感和代入感也随之变得更强，在战斗时带来的紧张与刺激，让热爱PVP的玩家们可以享受到酣畅淋漓的战斗体验。</span></p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.16/3.png\" /></p>\n',1,1,1451297484650,1,1451469251195,NULL,10000),(5,'news','动作卡牌游戏新纪元!《口袋大冒险》首测在即','<p>&nbsp; &nbsp; &nbsp; &nbsp;&ldquo;卡牌为心，竞技为魂&rdquo;由万家游戏诚意出品革新3D动作卡牌手游《口袋大冒险》(http://dmx.xtonegame.com)即将强势登陆各大手游渠道!汲取卡牌类游戏精髓，饱含完美收集乐趣;力添竞技类游戏精粹，囊括畅爽动作刺激，卡牌与竞技的臻美融合，感受动作卡牌之真、趣、奇、酣，突破传统卡牌游戏之平、空、干、虚，《口袋大冒险》开启动作卡牌游戏新纪元!</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/1.png\" style=\"height:537px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;【&ldquo;竞技系统&rdquo;拒绝平庸】</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;以突破传统，创新卡牌为研发理念的《口袋大冒险》拥有完善的竞技系统，全面丰富立体化卡牌游戏的养成模式，包括时下最IN的MOBA玩法、刺激荷尔蒙的排位战玩法、媲美端游的世界BOSS玩法以及积分赛等等多种互动玩法一应俱全。同时，完美动作体验于自研3D引擎上完美呈现，高画质华丽战斗视觉体验，可谓&ldquo;天生丽质难自弃&rdquo;。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/2.png\" style=\"height:458px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;【&ldquo;三段微操&rdquo;释放自由】</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;手势操作的自由度一直是考量手游产品创新能力的关键。《口袋大冒险》在处理手势操作方面，将操作的自由度提到一个全新高度，可谓手游行业新标杆。&ldquo;一点二滑三放招&rdquo;完美三段式微操概念完美诠释，当玩家控制角色移动后，可以&ldquo;一点&rdquo;屏幕进行攻击操作;当被敌人锁定攻击时，可以&ldquo;二滑&rdquo;连续滑动两次屏幕进行闪避;当闪避达成后，可以&ldquo;放招&rdquo;攻击敌人。同时，游戏内，自动锁怪的设计，完美解决了端游moba玩法移植到手游上的操作缺陷，让微操更有意义。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/3.png\" style=\"height:537px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;【&ldquo;三段微操&rdquo;释放自由】</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;手势操作的自由度一直是考量手游产品创新能力的关键。《口袋大冒险》在处理手势操作方面，将操作的自由度提到一个全新高度，可谓手游行业新标杆。&ldquo;一点二滑三放招&rdquo;完美三段式微操概念完美诠释，当玩家控制角色移动后，可以&ldquo;一点&rdquo;屏幕进行攻击操作;当被敌人锁定攻击时，可以&ldquo;二滑&rdquo;连续滑动两次屏幕进行闪避;当闪避达成后，可以&ldquo;放招&rdquo;攻击敌人。同时，游戏内，自动锁怪的设计，完美解决了端游moba玩法移植到手游上的操作缺陷，让微操更有意义。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/4.png\" style=\"height:537px; width:304px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;【&ldquo;社交达人&rdquo;实时对战】</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;组队打怪?语音聊天?世界聊天?手游中能实现吗?《口袋大冒险》拥有端游化社交系统，这些不再是梦想。运用强大社交系统，享受与好友结伴冒险的乐趣，成为&ldquo;社交达人&rdquo;，呼朋引伴，比拼战绩!更能直接拉好友进入实时对战，让兄弟们一起作战不在是问题!</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.12.08/5.png\" style=\"height:537px; width:304px\" /></p>\n',1,1,1451297484650,1,1451469208763,NULL,10000),(6,'news','万家文化牵手优酷土豆开展电竞与游戏文化IP合作','<p>&nbsp; &nbsp; &nbsp; &nbsp;【万家文化牵手优酷土豆开展电竞与游戏文化IP合作】万家文化(600576)旗下的电竞公司与优酷土豆达成战略合作，开展电竞与游戏文化IP合作。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;万家文化(600576)旗下的电竞公司与优酷土豆达成战略合作，开展电竞与游戏文化IP合作。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;11月19日晚间，万家文化公告称，旗下万好万家电竞公司于11月18日与合一<a href=\"http://quote.eastmoney.com/SZ159939.html\" target=\"_blank\">信息技术</a>(北京)有限公司签订战略合作协议，双方就共同打造电子竞技与游戏文化IP(知识产权产品)，围绕共同打造的IP开展经纪业务、电子商务业务以及竞技类移动游戏发行业务等达成战略合作伙伴关系。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.11.20/1.png\" style=\"height:280px; width:582px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;根据协议，双方将共同围绕大型电子竞技真人秀《铁笼游戏》IP系列文化产品；共同围绕《X计划》(拟定名)打造大型电子竞技与音乐演出品牌及系列文化产品；共同围绕《星座怪谈》(拟定名)打造星座文化背景的系列IP节目视频、影视、竞技类移动游戏系列产品的研发、制作及发行业务，以及衍生的相关经纪业务与衍生的电子商务业务等。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;据介绍，合一信息为美股上市公司优酷土豆(股票代码：YOKU)在境内的业务运营实体，旗下拥有优酷网、土豆网及优酷土豆关联公司的相关经营管理权益。2012年8月，优酷和土豆以100%换股的方式合并，合并后更名为优酷土豆集团；2015年8月，优酷土豆集团宣布更名为合一集团。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;万家文化表示，优酷土豆是中国国内领先的游戏、特别是电子竞技视频UGC内容平台，占据相关市场极大的视频量份额，此次万家电竞能够获得与该家国内顶级视频平台网站在节目联合出品、经纪业务推广、竞技类移动游戏分发联运等方面的战略合作与支持，对公司的业务转型和整合有积极意义，促进公司快速向亚文化方向发展。</p>\n',1,1,1451297484650,1,1451469547729,NULL,10000),(7,'news','万家文化转型动漫文化及互联网 复牌一字涨停','<p>&nbsp; &nbsp; &nbsp; &nbsp;今日万家文化复牌一字涨停，公司资产重组文化动漫股。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;今年11月12 日，浙江万家文化股份有限公司(26.25,0.22,0.85%)股票由万好万家变更为万家文化【股票代码：600576】，A 股市场增添一支以青年人为主体的文化股。随着厦门翔通动漫100%并入万家文化、北京万好万家电子竞技传媒有限公司成立、万家电竞与二次元文化龙头渠道网站 AcFun 建立全面战略合作伙伴关系等系列举措，以及剥离原有房地产业务的重大资产重组实施，其战略蓝图渐渐显现，万家文化高调地向证券市场&ldquo;亚文化第一股&rdquo;迈进。</p>\n\n<p style=\"text-align:center\"><strong>　</strong><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.11.03/1.png\" style=\"height:304px; width:549px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>全面布局亚文化</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;今年9 月 26 日，翔通动漫100%被并入万家文化。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;不久，万家文化即发布公告，称与原 GTV 和WCA 世界电子竞技大赛组委会高管团队茅侃侃等四人组建合资公司&ldquo;万家电竞&rdquo;， 第一期即投入人民币 6000 余万元，致力于电子竞技与二次元文化传媒产品的开发、经纪业务与竞技类移动游戏产品的发行，正式拉开布局电子竞技产业的序幕。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;10 月 17 日，万家文化又发布公告，称其合资公司万家电竞与二次元文化龙头渠道网站AcFun(俗称 A 站)建立全面战略合作伙伴关系。双方已有围绕合作产品 IP 在经纪业务、二次元 UGC 制作人(俗称 UP 主)、竞技类移动游戏分发上的清晰合作路径，而其与A站的合作正是为自有 IP 的开发而作的一次精心布局。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;10 月 24 日，万家文化再次发布公告，宣布正式完成工商部门对公司名称、经营范围等变更，&ldquo;浙江万好万家实业股份有限公司&rdquo;变更为&ldquo;浙江万好万家文化股份有限公司&rdquo;。足显万家文化打造 A股文化上市公司，实现全面转型的雄心。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;10 月 30 日，当市场还在期待万家文化下一步布局时，万家文化突然宣布停牌，原因是筹划重大资产出售。昨日，万家文化发布公告称，拟将房产的100%股权及矿业的65%股权分别以8267万元及4663万元转让。此举既显其集中精力与资源加速向文化领域转型的步伐，又为万家文化转型提供必要的资金。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;11月2日，万家文化与中国教育电视台的运营公司中线传媒建立战略合作伙伴关系。接着，万家文化控股子公司万家电竞与永乐互娱建立战略合作伙伴关系。一系列的重大举措表明万家文化正快速推进各项业务，也向市场展现了其全面转型亚文化领域的光辉前景。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;近日，万家文化又一次发布公告，旗下万家电竞与合一集团(原优酷土豆集团)签署战略合作协议。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>业务互动促发展</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;万家文化前有完整并购翔通动漫，实现对动漫 IP、电信运营商渠道关系的整合，及万家文化 2015年三季报中呈现的由此举带来的扭亏为盈带给市场的极大信心；后有成立合资公司，布局电竞与二次元文化产业，给予市场的极大期待。当市场期待源于电竞行业的核心团队会以何种姿态出现时，万家电竞优先选择与AcFun、永乐互娱的合作，实现了在二次元主流渠道、IP和线下演出资源的整合。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;上述举措勾勒出万家文化传媒业务的基本合作模式&mdash;&mdash;与最好的线上或线下细分渠道共同打造传媒节目、IP 以及周边衍生资源，在获得渠道强有力的流量与资源支持时，也对渠道实现优质的内容与 IP 反哺。通过与永乐互娱合作，万家电竞亦获得开展《全职高手》IP 在演出与演出周边视频内容上的优先权，作为二次元国产小说第一品牌的《全职高手》所讲述的内容正是电子竞技。此举使万家文化一步便跨入与二次元文化中国本土第一小说IP合作行列。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;万家文化近期发布的战略合作公告显示，万家电竞即将发布的竞技类游戏产品、传媒节目、演出和经纪业务的端倪可见一斑。同时，万家文化与中线传媒(系中国教育部直属的中国教育电视台运营公司)建立了战略伙伴关系。双方不但承诺每年投入不低于 2000 万元用于制作二次元及电子竞技文化类节目，更进一步约定了早期教育、在线教育领域的合作可能。至此，万家文化在整体的业务布局上进一步下探亚文化人群覆盖，业务空间取得发展性突破。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;<strong>黄河金融添动力</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;纵观万家文化短期内一系列动作，迅速推进亚文化产业的布局，快速剥离房地产整体业务，但却保留了看似与文化无关的黄河金融。作为浙江省内唯一一家上市公司控股运营的互联网金融平台，黄河金融是由万家文化董事长孔德永2014年亲自牵头布局，以专业、安全的互联网金融运行模式为民间的小额借贷双方提供居间服务的平台。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;对此，市场猜测黄河金融在万家文化的一系列转型中又将扮演什么样的角色？</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;记者带着疑问通过电话采访了万家文化的董事长孔德永。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&ldquo;现在的 85 后、90 后、00 后即将成为中国社会的主流，文化消费随着社会结构的变化也逐渐成为我们日常消费行为的主要板块，万家文化将彻底向文化产业转型，尤其聚焦于亚文化方向的布局&rdquo;、&ldquo;万家文化既然要布局亚文化，就要比别人更迅速地布局到亚文化消费基础的支持上。但凡具备良好消费能力的年轻人，特别是 85、90 后，以及文化消费领域的进一步下探，都离不开金融体系，或者说未来都离不开互联网金融体系的支持。正如淘宝、天猫代表着电子商务的主流，而支持在淘宝、天猫上产生的大量消费却是支付宝、蚂蚁金融，是各种消费贷。未来三年，我们相信黄河金融的产品与亚文化消费之间的关系及核心作用将进一步得到验证。&rdquo;孔德永在电话采访中的语速平缓，但语气异常坚定。由此万家文化在不远将来各项亚文化业务与黄河金融必定会产生良性互动，万家文化主流的消费将带动黄河金融业务的快速发展，而黄河金融又为亚文化发展提供强有力的资金保障，也为亚文化消费者提供快速、便捷的资金平台。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;雄关漫道真如铁，而今迈步从头越。一向低调而稳健的万家文化，正在同样以低调著称的董事长孔德永的带领下，描绘着首个&ldquo;二次元、动漫与电竞&rdquo;融合贯穿背景下的亚文化第一股，必将奠定万家文化在中国亚文化产业中流砥柱地位。我们同样期待万家文化在成为中国亚文化第一股的同时走向世界。</p>\n',1,1,1451297484650,1,1451541623083,NULL,10000),(8,'news','万家游戏即将推出《绝地逃亡》同名手游','<p>&nbsp; &nbsp; &nbsp; &nbsp;万家游戏今日对外宣布，获得成龙最新电影《绝地逃亡》IP的手游改编权，万家游戏将为《绝地逃亡》IP量身定制同名手游，打造顶级游戏盛宴。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《绝地逃亡》是成龙与范冰冰合作的动作冒险新片。该片由曾经制作过《大兵小将》的北京公司Talent International和制作过《黑衣女人》、《总统杀局》的英国公司Exclusive Media共同出资赞助。该片将于2016年在中国大陆上映。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;据万家游戏表示，《绝地逃亡》手游将主打圣诞档期，成为首部&ldquo;圣诞手游&rdquo;。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27-2/1.png\" style=\"height:305px; width:504px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;据万家游戏介绍，手游版《绝地逃亡》将高度还原电影中横跨中国、蒙古、俄罗斯的场景，其中包含&ldquo;蒙古沙漠&rdquo;、&ldquo;四川山壁&rdquo;、&ldquo;龙脊梯田&rdquo;、&ldquo;岩门峡&rdquo;等特色景点，将浓厚的异域风情完整在游戏中呈现出来。此外，电影里的真实武打动作也将植入进游戏，让对战PVP更加爽快。该款游戏将采用电影级特效画面，力求为玩家带来和观看电影时一样的视觉体验。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27-2/2.png\" style=\"height:304px; width:504px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;据悉，此次《绝地逃亡》手游版游戏的发布将选择&ldquo;特殊时间&rdquo;，与电影一起主打&ldquo;圣诞节庆档&rdquo;，据万家游戏发行负责人介绍：&ldquo;《绝地逃亡》手游版希望让大家能够在看电影的同时，还能玩到游戏，让用户从观影者变成参演者，打造一款可以玩的电影大片。&rdquo;</p>\n',1,1,1451297484650,1,1451469857913,NULL,10000),(9,'news','吹响号角《神魔战歌》安卓精英封闭测试今日开启','<p>&nbsp; &nbsp; &nbsp; &nbsp;由万家游戏推出的魔幻卡牌动作手游《神魔战歌》安卓版将于10月27日开启首轮精英封闭测试，安卓测试服27日10点震撼开启。</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《神魔战歌》基于虚幻引擎开发，创造了大气磅礴的游戏场景，唯美细致的人物模型，带个玩家显现实与虚幻的强力视觉冲击。在移动平台上构建出媲美端游画面的魔幻大陆。</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27/2.png\" style=\"height:373px; width:496px\" /></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《神魔大陆》安卓版将带领玩家进入一个刺激英勇的冒险世界。巨龙、英灵、诸神、英雄氏族均在等你召唤。人生五十载，与天地长久相较，如梦又似幻，一度得生者，岂有不灭者乎?何不集结于此共同奋战，与众英灵们共同奋进，成为一个大陆的救世主!</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.27/1.png\" /></p>\n',1,1,1451297484650,1,1451541585361,NULL,10000),(10,'news','虚幻引擎打造《神魔战歌》完美呈现魔幻大陆','<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>近日，万家游戏宣布，旗下3D魔幻卡牌手游《神魔战歌》将于本月月底上线。作为一款动作卡牌手游，《神魔战歌》采用虚幻引擎打造，保证了其出色的人物、技能效果以及游戏画面。同时在玩法上推陈出新，加入了公会战系统、家园系统等特殊玩法，充分增加了游戏的可玩性。</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>【次时代引擎打造，引领视觉极致】</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>虚幻引擎一直以高品质画面、华丽的光影效果等为人称道。《神魔战歌》由虚幻引擎打造，使得其画面变得十分出色，将角色精致的质感、绚丽的打斗效果、丰富的游戏场景等等，可以一览无余的呈现出来。同时游戏配色与游戏整体的魔幻风格也难能可贵的十分贴切，使得场景对整体剧情的衬托更加出众，令整个游戏栩栩如生，令人满意。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.16/1.png\" style=\"height:516px; width:516px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>【领地系统打造你心中的完美家园】</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>《神魔战歌》开创领地系统，让每一颗漂流的心都有了归宿，暂时厌倦了无尽的拼杀奋斗之后，来到只属于你自己的领地之中，挖挖矿，打打铁，让时间伴随着对领地的养成而悄然流逝，也是一种不可多得享受。更有许多只有在领地内才能打造的稀有道具，让你变得与其他英雄们截然不同。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.16/2.png\" style=\"height:374px; width:558px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>【MOBA公会战，引燃全民推路狂潮】</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>动作卡牌也能玩MOBA了!只要想PK，系统将自动帮段位相近的公会匹配公会战,然后就可以选择上中下三路中的一路，向着对方老巢奔去了。充分考虑对战思路，妥善调兵遣将，展现足够的战术，才能取得最终的胜利，将失败者踩于脚下。</p>\n\n<p style=\"text-align: center;\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.16/3.png\" style=\"height:373px; width:557px\" /></p>\n',1,1,1451297484650,1,1451468693462,NULL,10003),(11,'news','《口袋大冒险》10月14日开启梦幻封测','<p>&nbsp; &nbsp; &nbsp; &nbsp;魔王封印悄然瓦解，魔裔像是黑色的洪流迅速吞噬大地，为了阻止这一场浩劫，远古圣战英雄又重聚于此，剑与魔法的碰撞，英雄与魔物的激战，新世界的大门正向你敞开，快来一场所走就走的冒险吧。万家游戏旗下首款竖屏ARPG魔幻手游《口袋大冒险》今日(10月14日)10时正式开启首次IOS越狱封测，诸多壕礼等你领取。</p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;英雄大乱斗，天天斗不停</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《口袋大冒险》拥有多达上百位各具特色的英雄伙伴；每位伙伴都拥有精美的造型，绚丽的技能，丰富的剧情，独特的个性；&ldquo;三国争霸、西游伏魔、五军之战&rdquo;这些传奇故事中的英雄人物都将悉数登场。吕布组悟空，貂蝉配八戒，亚瑟有黄忠，各种英雄搭配，随你喜欢自由配！</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.14/1.jpg\" style=\"height:300px; width:500px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;单手操控，极简体验</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;新颖滑动点击操作，一指玩转游戏，简单易上手，移动攻击更加流畅。单手也能愉快的玩游戏啦。玩家只需要一只手即可实现移动、攻击、闪避、技能等所有动作,无伤打BOSS，随意虐小怪，真正体现技术操作，享受&ldquo;单手操控&rdquo;的最佳游戏体验。</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.14/2.jpg\" style=\"height:257px; width:504px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;超多互动玩法，即时语音聊天</strong></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>游戏在动作RPG的元素基础上结合了多种PVE、PVP互动玩法，如MOBA对抗、排位赛等，告别动作手游的单调刷图模式，让你可以与好友一起进行游戏，更有即时语音聊天功能，让玩家可以和玩端游一样，与自己的朋友一起畅游游戏世界，享受战斗带来的乐趣。</p>\n\n<p style=\"text-align:center\"><img alt=\"\" src=\"http://vanggame-src.xtonegame.com/2015.10.14/3.jpg\" style=\"height:257px; width:504px\" /></p>\n\n<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;</strong>新的征程，新的挑战，冒险的路上需要勇气和智慧，更需要小伙伴的同心协力，赶快叫上好友一起来探索《口袋大冒险》的神秘世界吧，这里还有丰富宝藏等你挖掘，我在《口袋大冒险》的魔幻世界里等你呦~</p>\n',1,1,1451297484650,1,1451469065707,NULL,10000),(12,'news','万家游戏出品《口袋大冒险》竞技系统介绍','<p>万家游戏出品，颠覆性3D动作卡牌手游《口袋大冒险》华丽来袭。丰富多样的互动玩法作为游戏一大特色广受玩家好评，今天我们就来深入了解一下《口袋大冒险》的竞技系统。</p>\n\n<p>竞技系统</p>\n\n<p>冒险团等级达到20级即可开启竞技系统，点击游戏画面最下方竞技图标进入，玩家可以看到&ldquo;排位战&rdquo;、&ldquo;积分赛&rdquo;、&ldquo;竞技场&rdquo;三种竞技模式。</p>\n\n<p>排位战</p>\n\n<p>在排位战中，玩家可以看到自己的当前排名，也可以选择挑战排名比自己靠前的其他玩家，每日有5次挑战机会，挑战成功即可提升排名，赢取奖励。</p>\n\n<p>排位赛10000名以内每日有奖，每天0点刷新，排名越高奖励越多。</p>\n\n<p>奖励：金币 钻石 荣誉奖章</p>\n\n<p>&nbsp;</p>\n',0,1,1451297484650,1,1451456453093,NULL,10000),(14,'job','国内商务经理','<p>薪资：面议</p>\n\n<p>1、线上渠道精品游戏渠道拓展、产品接入；</p>\n\n<p>2、各大应用平台、store的合作推广；</p>\n\n<p>3、其他国内渠道精品游戏推广；</p>\n\n<p>职位要求:</p>\n\n<p>1、 本科以上学历有2年以上相关工作经验;</p>\n\n<p>2、 熟悉Android iphone手机应用(apps) 的市场背景；</p>\n\n<p>3、 有移动广告平台（app store）业务拓展经验者优先；</p>\n\n<p>4、 有游戏厂商及游戏开发者合作资源者优先；</p>\n\n<p>5、 具备良好的人际交往、语言表达和沟通能力以及一定的管理能力；</p>\n\n<p>6、 具备高度的责任心、诚信的工作作风、优秀沟通能力及团队精神。</p>\n\n<p>联系方式</p>\n\n<p>简历发送至：hr.@bjxiangtone.com</p>\n\n<p>联系电话：0755-86665507</p>\n\n<p>地址：深圳市南山区中科大厦21楼B1单元</p>\n',1,1,1452221479225,2,1472798610205,'  工作地点：上海浦东区????工作性质：全职????人数：1人',10000),(18,'job','国内商务经理','<p>薪资：面议</p>\n\n<p>1、线上渠道精品游戏渠道拓展、产品接入；</p>\n\n<p>2、各大应用平台、store的合作推广；</p>\n\n<p>3、其他国内渠道精品游戏推广；</p>\n\n<p>职位要求:</p>\n\n<p>1、 本科以上学历有2年以上相关工作经验;</p>\n\n<p>2、 熟悉Android iphone手机应用(apps) 的市场背景；<br />\n3、 有移动广告平台（app store）业务拓展经验者优先；<br />\n4、 有游戏厂商及游戏开发者合作资源者优先；<br />\n5、 具备良好的人际交往、语言表达和沟通能力以及一定的管理能力；<br />\n6、 具备高度的责任心、诚信的工作作风、优秀沟通能力及团队精神。</p>\n',1,NULL,NULL,2,1472704078952,'  工作地点：上海浦东区????工作性质：全职????人数：1人',10000),(19,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(20,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(21,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(22,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(23,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(24,'job',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,10000),(25,'job','国内商务经理','<p>薪资：面议</p>\n\n<p>1、线上渠道精品游戏渠道拓展、产品接入；</p>\n\n<p>2、各大应用平台、store的合作推广；</p>\n\n<p>3、其他国内渠道精品游戏推广；</p>\n\n<p>职位要求:</p>\n\n<p>1、 本科以上学历有2年以上相关工作经验;</p>\n\n<p>2、 熟悉Android iphone手机应用(apps) 的市场背景；<br />\n3、 有移动广告平台（app store）业务拓展经验者优先；<br />\n4、 有游戏厂商及游戏开发者合作资源者优先；<br />\n5、 具备良好的人际交往、语言表达和沟通能力以及一定的管理能力；<br />\n6、 具备高度的责任心、诚信的工作作风、优秀沟通能力及团队精神。</p>\n',1,2,1472696550104,2,1472710121540,'  工作地点：上海浦东区????工作性质：全职????人数：1人',10000),(26,'news','这是测试文章','<p>这里的是正文</p>\n\n<p>不知道怎么写</p>\n\n<p>就随便写一下吧</p>\n',1,2,1472803469172,2,1472803469172,'副标题',10008),(27,'link','北京通联天地科技有限公司','',1,2,1472806948784,2,1472807483078,'http://www.alllink.com.cn/',10000),(28,'link','北京讯宇创世科技有限公司','',1,2,1472807102673,2,1472807564933,'http://www.xtonecomic.com/',10000),(29,'link','北京游动天地科技有限公司','',1,2,1472807119908,2,1472807573956,'http://14643233.czvv.com/',10000),(30,'link','深圳市创世互动科技有限公司','',1,2,1472807136221,2,1472807629221,'http://www.pvc123.com/b-pxtonewinnie/',10000),(31,'link','深圳市浩天投资有限公司','',1,2,1472807157269,2,1472807595592,'http://www.m-time.com/',10000),(32,'link','零纪元','',1,2,1472807191428,2,1472807637875,'http://www.ljy0.com/',10000),(33,'link','口袋大冒险','',1,2,1472807212327,2,1472807645608,'http://dmx.xtonegame.com',10000);

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

INSERT  INTO `tbl_wechat_menus`(`id`,`appId`,`menuId`,`content`,`createTime`,`modifyTime`,`createBy`,`modifyBy`) VALUES (1,'wx19ac78d42392068c','base',' {\r\n     \"button\":[\r\n     {	\r\n          \"type\":\"click\",\r\n          \"name\":\"今日歌曲\",\r\n          \"key\":\"V1001_TODAY_MUSIC\"\r\n      },\r\n      {\r\n           \"name\":\"菜单27\",\r\n           \"sub_button\":[\r\n           {	\r\n               \"type\":\"view\",\r\n               \"name\":\"搜索27\",\r\n               \"url\":\"http://www.soso.com/\"\r\n            },\r\n            {\r\n               \"type\":\"view\",\r\n               \"name\":\"视频\",\r\n               \"url\":\"http://v.qq.com/\"\r\n            },\r\n            {\r\n               \"type\":\"click\",\r\n               \"name\":\"赞一下我们\",\r\n               \"key\":\"V1001_GOOD\"\r\n            }]\r\n       }]\r\n }',NULL,NULL,NULL,NULL);

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
  `nextTime` BIGINT(20) DEFAULT '0' COMMENT '下次去获取token的时间',
  `lastModTime` BIGINT(20) DEFAULT NULL COMMENT '本记录最后修改时间',
  `validTime` BIGINT(20) DEFAULT NULL COMMENT '当前token有效到期时间',
  PRIMARY KEY (`appId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_wechat_tokens` */

INSERT  INTO `tbl_wechat_tokens`(`appId`,`token`,`nextTime`,`lastModTime`,`validTime`) VALUES ('wx19ac78d42392068c','SC2szK_--uKd2-v2WmK4Zu6lmLrNvDxvzhCEk6riD0XYkreWj3MutxZ1b-yHv9xWoIS7sanAjDeq7X0hcp_U2r_Ejv6xMMgURo2qFJZYc6sQTVaAJAGJL',1467161532556,1467161232556,1467168432556);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
