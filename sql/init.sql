/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17-log : Database - xycms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `li_ad_pos` */

DROP TABLE IF EXISTS `li_ad_pos`;

CREATE TABLE `li_ad_pos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_mobile` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:PC/1:MOB',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_ad_pos` */

/*Table structure for table `li_admins` */

DROP TABLE IF EXISTS `li_admins`;

CREATE TABLE `li_admins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `realname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lasttime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `lastip` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_admins` */

insert  into `li_admins`(`id`,`section_id`,`name`,`realname`,`email`,`password`,`crypt`,`phone`,`lasttime`,`lastip`,`status`,`created_at`,`updated_at`) values (1,1,'admin','adminss','fsda@eee.com','e6be23611b06054652a3c43ed1492965','C5bdPRt0ci','13123212345','2018-06-26 09:42:09','127.0.0.1',1,'2016-08-07 10:05:54','2018-06-26 09:42:09'),(2,1,'admins','张三','fsdaa@eee.com','e6be23611b06054652a3c43ed1492965','C5bdPRt0ci','13123212345','2018-08-09 08:40:06','127.0.0.1',1,'2016-08-07 10:05:54','2018-08-09 08:40:06'),(3,1,'admin3','李四','fsd2a@eee.com','e6be23611b06054652a3c43ed1492965','C5bdPRt0ci','13123212345','2018-08-09 08:39:57','127.0.0.1',1,'2016-08-07 10:05:54','2018-08-09 08:39:57'),(8,1,'WWWWW','王磊磊','910776489@qq.com','ba57df469bae76cec771dfb5352e135c','79bzOKXBUx','','2018-08-07 11:07:17','192.168.3.10',1,'2018-08-07 11:07:17','2018-08-07 11:07:17'),(9,1,'wangg','王多余','910776485@qq.com','97ca207ec4a2c7da7b7849fa3bceae7a','a43GqMD2Zz','','2018-08-07 11:09:37','192.168.3.10',1,'2018-08-07 11:09:37','2018-08-07 11:09:37'),(10,1,'wangn','李雷雷','910776588@qq.com','9503ca150788ccc20b8b691afc36da1c','2LAxN8300C','','2018-08-07 11:10:55','192.168.3.10',1,'2018-08-07 11:10:55','2018-08-07 11:10:55');

/*Table structure for table `li_ads` */

DROP TABLE IF EXISTS `li_ads`;

CREATE TABLE `li_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pos_id` int(11) NOT NULL DEFAULT '0' COMMENT '位置ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态，1正常0关闭',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_ads` */

/*Table structure for table `li_articles` */

DROP TABLE IF EXISTS `li_articles`;

CREATE TABLE `li_articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) unsigned NOT NULL COMMENT '栏目ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `thumb` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键字',
  `describe` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `content` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `source` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '来源',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `publish_at` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `push_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1推荐，0不推荐',
  `url` char(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '链接地址',
  `tpl` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show' COMMENT '模板',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核状态，0退稿，1~4审核状态 99通过',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布人，超管能改所有人的',
  `del_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1删除，0正常',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`),
  KEY `cate_id` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_articles` */

insert  into `li_articles`(`id`,`cate_id`,`title`,`thumb`,`keywords`,`describe`,`content`,`source`,`sort`,`publish_at`,`push_flag`,`url`,`tpl`,`status`,`admin_id`,`del_flag`,`created_at`,`updated_at`) values (1,2,'多地住房公积金政策收紧 异地购房提取难度加大',NULL,NULL,NULL,'<p>中新经纬客户端7月25日电 (薛宇飞)为防止提取住房公积金用于炒房投机，近日，广东、内蒙古、广西等省份和一些地级市相继调整公积金提取政策，收紧了异地购房、离婚购房提取公积金等操作，但多地也都强调，支持提取公积金用于购买首套住房或二套改善型住房。</p><p>此外，由于房价普遍上涨，多地的公积金贷款上限已经明显偏低，难以满足购房者的资金需求。专家建议，各地应上调公积金贷款额度。</p><p><strong>异地购房、离婚购房提取公积金受限</strong></p><p><img src=\"/upload/images/20180725/1532503156.jpg\" style=\"border: none; max-width: 100%; display: block; height: auto; margin: 10px auto 20px;\" _src=\"/upload/images/20180725/1532503156.jpg\"/></p><p>楼盘 中新经纬薛宇飞 摄</p><p>早在今年5月，住建部等4部委就发布了关于开展治理违规提取住房公积金工作的通知，称一些机构和个人通过伪造证明材料、虚构住房消费行为等手段违规提取住房公积金，甚至形成骗提套取住房公积金的“黑色产业链”，扰乱了住房公积金管理秩序，要求从多方面规范改进公积金提取政策。</p><p>之后，多地根据上述通知，对住房公积金提取政策进行调整，而重点基本都落在了非户籍地非缴存地购房、多次变更婚姻关系购房等行为上。</p><p><br/></p>',NULL,0,'2018-07-25 15:18:43',0,'f3673e21-e3b8-6f6b-4265-9fd68a0f037a','show',99,0,0,'2018-07-25 15:19:21','2018-08-09 15:14:09'),(2,2,'fds',NULL,'aaaa','ddd','<p>dsasas</p>',NULL,0,'2018-08-07 11:39:56',0,'15c80027-d107-6606-48d5-cf88246a06fa','show',99,0,1,'2018-08-07 11:41:22','2018-08-09 15:44:23'),(3,2,'运20机翼断裂粉碎 为何设计师却喜极而泣？','/upload/20180809/20180809031458835.jpg','运20机翼断裂粉碎 为何设计师却喜极而泣？','运20机翼断裂粉碎 为何设计师却喜极而泣？','<p>如果你是飞行员，飞行过程中最担心的是是什么呢？当然是各种故障！如果是一些传感器、仪表甚至是发动机停车，训练有素的飞行员也许还可以依靠高超的技术实现迫降。但是，如果飞行过程中，机翼突然破碎，你还能有什么补救措施吗？估计这样的情景是每一个飞行员都不愿面对的。但是，就有那么一群设计师为了自家飞机机翼破碎而感到兴奋，甚至喜极而泣。</p><p><img src=\"/upload/images/20180807/1533613151.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533613151.jpeg\"/></p><p>&nbsp; &nbsp; &nbsp; &nbsp;纪录片《大国鲲鹏》是央视中文国际频道（CCTV4）“国家记忆”栏目打造的一档记录运-20研制历程的大型纪实节目，自7月30日开始播出以来，引起了全国人民极大的关注。在最新一集中，一架处于厂房内的运-20机翼出现剧烈震动，随即碎裂为无数的碎片。这样惊险的一幕让所有观看节目的观众都捏了一把汗。但是，接下来想象中的悲伤画面并没有出现，在场的设计师却全都因此喜极而泣。</p><p><img src=\"/upload/images/20180807/1533613151.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533613151.jpeg\"/></p><p>&nbsp; &nbsp; &nbsp; &nbsp;原来，这是一次运-20的加压受力结构强度试验。运-20机翼碎裂出现在施加压力为设计值的110%时。运-20机翼在该压力下碎裂也证明了设计的成功。可能大家会觉得奇怪，为什么机翼碎裂标志着结构设计成功呢？</p><p><img src=\"/upload/images/20180807/1533613151.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533613151.jpeg\"/></p><p>&nbsp; &nbsp; &nbsp; &nbsp;作为一款运输机，运送大批货物是运-20的本职工作。这样的大批量运输需求当然也对飞机的结构强度有着极为苛刻的要求。因此，足够的结构强度是必选的要求。这次加压结构试验验证的就是运-20的结构强度。但是，这是不是意味着运-20的结构强度越大越好呢？当然不是！过多的结构强度则意味着过多的结构死重，这就减小的运输量。</p><p><img src=\"/upload/images/20180807/1533613151.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533613151.jpeg\"/></p><p>&nbsp; &nbsp; &nbsp; &nbsp;因此，运输机的结构强度能够承受最大运输能力的110%是最理想的状态。这样的强度既可以满足运输时的结构强度要求，也不存在过多的死重。运-20的这次试验恰恰证明了我国运-20结构设计的合理性。如果到了这样的加力条件运-20的机翼还没有碎裂，那就要面临复杂的结构减重问题了</p><p><br/></p>','23',0,'2018-08-07 11:39:00',0,'9dc17b20-e68a-9213-0237-eedbe3c27390','show',99,0,0,'2018-08-07 11:48:25','2018-08-09 15:15:02'),(4,3,'钓鱼岛与萨拉热窝之比较：中国拿回属于自家领土','/upload/20180809/20180809031541561.jpg',NULL,NULL,'<p>萨拉热窝事件是在1914年6月28日巴尔干半岛的波斯尼亚发生，此日为塞尔维亚之国庆日，奥匈帝国皇位继承人斐迪南大公(Archduke Franz Ferdinand)夫妇被塞尔维亚族青年普林西普（一名隶属塞尔维亚的恐怖组织“黑手社”的波斯尼亚学生）枪杀。这次事件使7月奥匈帝国向塞尔维亚宣战，成为了第一次世界大战的导火线。（资料图）</p><p>从本质上讲，今天的世界格局和国际规范应该是第二次世界大战战胜国的意志和利益的表现与反映。中国是“二战”大国和主要战胜国，当年，有人常将中国和美国、英国、苏联放在一起，并称“四强”。直到现在，手握否决权的联合国安理会常任理事国共有五个，中国位居其一。</p><p>按常理，具有如此特殊和显赫国际地位的中国，在重大国际事务上有“一言九鼎”的权威才对，但严酷的事实却远非如此。有时，即使中国按国际惯例办事，而且所办之事又涉及到中国的主权和核心利益，也会受到其他国家的批评，甚至是“集体围攻”，这就更令人愤怒了。中国11月23日宣布在东海设立“防空识别区（简称‘空识区’）”这件事，就是最新的例证。</p><p>20世纪50年代以来，美国、加拿大、法国、德国、英国、<a href=\"http://app.travel.ifeng.com/country_76\">澳大利亚</a>、韩国、日本、菲律宾、土耳其和越南等20多个国家设立了自己的“空识区”，在国际都没有闹出大动静。而现在，中国也要依法如此行事，却在国际上引起了轩然大波。美国、日本和韩国，先是表示反对和不承认，进而又故意挑衅似的派战斗机在中国“空识区”飞行。相距遥远的欧盟也跳出来凑热闹，警告中国“要保持低调”，“不要加剧东亚地区的紧张局势”。</p><p>《经济学家》杂志做得更过火。它在最新一期（11月30日～12月6日）上发文说，“中国的行为已经背离了国际规范”。文章还说，中国就像一个处于生长期的少年，荷尔蒙太多，不知自身斤两。文章甚至还有些耸人听闻的分析，说日益崛起的中国要主导东亚地区，可能引发与日本的武装冲突，这种情况犹如20世纪初期的欧洲，尖阁列岛（即我钓鱼岛）扮演着萨拉热窝的角色。如果替《经济学家》把话说明白，那就是钓鱼岛可能引爆新的世界大战。</p><p>萨拉热窝是个什么角色？现在，它是巴尔干小国波斯尼亚和黑塞哥维那（简称“波黑”）的首都。单从世界名气大小的角度看，萨拉热窝远远超过波黑，其中的重要原因之一是，这个地方曾引发了第一次世界大战。</p><p>需要指出的是，萨拉热窝引发“一战”是一个历史过程。萨拉热窝的历史很长，但在塞尔维亚统治时期还是一个不起眼的小镇。1429年，奥斯曼帝国征服该地后，城市取得了快速发展。然而，1878年该城又被奥匈帝国夺占。</p><p>这样，事情就不难理解了——塞尔维亚和奥斯曼帝国都有“收复失地”的想法，特别是塞族人的这一欲望更为强烈。1914年6月28日，奥匈帝国皇太子斐迪南大公夫妇访问萨拉热窝，这一天正好也是塞尔维亚的国庆日，一位名叫普林西普的塞族青年刺杀了这对夫妇。于是，奥匈帝国率先对塞尔维亚开战。很自然，奥斯曼帝国站在了塞尔维亚一边。“一战”就这样爆发了。</p><p>钓鱼岛自古就是中国领土。1582年，明朝正式将其划归中国版图，隶属福建。但1895年，日本在甲午战争中大胜大清国，占据了钓鱼岛。二战后，钓鱼岛又被美军占领。按《开罗宣言》和《波茨坦公告》的规定，美国应将钓鱼岛归还它的真正主人中国。遗憾的是，美国没有这么做，而是在1971年“归还”给了“窃取者”日本。</p><p>历史告诉世人，钓鱼岛原来是中国的，后来被日本通过武力夺得。二战以后，美国违反了自己签署的国际宣言，又错误地将钓鱼岛的管辖权交给了日本。这才是中日目前钓鱼岛争执的“历史逻辑和祸根”。如果非要拿钓鱼岛和萨拉热窝相比，其本质是要把领土“归还原主”，否则就会有大麻烦。</p><p>2014年是第一次世界大战爆发一百周年。一些欧洲国家正积极准备，试图利用这一机会吸引各国游客，发一笔“战争<a href=\"http://travel.ifeng.com/\">旅游</a>财”。这一点，可以理解。</p><p>但11月28日，《<a href=\"http://auto.ifeng.com/news/finance/\">金融</a>时报》却刊登一篇题目为《“防空识别区”的逻辑与风险》的文章说，在世界准备纪念“结束所有战争的战争”（即“一战”）一百周年之际，中国最好先搞清楚那场战争是如何爆发的。</p><p>历史证明，首先应搞清楚“一战”原因的不是中国，而是美英日等在“一战”中赚尽了便宜的国家。因为，中国只想追索本该属于自己的东西，并无称霸东亚之意。</p><p><br/></p>',NULL,0,'2018-08-07 12:01:59',0,'1d11ae73-a460-cad7-19ca-0f4ac0dba51d','show',99,0,0,'2018-08-07 12:02:23','2018-08-09 15:15:43'),(5,3,'“拼团”终于上了支付宝首页，拼多多会颤抖吗？','/upload/20180809/20180809031553160.jpeg',NULL,NULL,'<p>原标题：“拼团”终于上了支付宝首页，拼多多会颤抖吗？</p><p>8月6日下午，36氪从不同用户处获得的支付宝截图显示，支付宝首页界面底部栏已上线备受关注的“拼团”功能。经测试，虽然不是全量推的功能，但灰度的面还是很大。</p><p><img src=\"http://p0.ifengimg.com/pmop/2018/0807/6ED864A71E2F67992BEAA8AE06F53CD0A7EF0203_size125_w800_h504.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p>产品截图显示，“拼团”的栏目名称是“每日必抢”，但会有限时拼团和拼团价格等元素，商品均为热销爆款。“每日必抢”点进去后显示是“淘宝（中国）软件有限公司”主体之下的一款支付宝小程序，“拼团”被作为独立功能安排在第二栏，第三栏仍然是熟悉的“购物车”，第四栏则是“订单”。</p><p><img src=\"http://p0.ifengimg.com/pmop/2018/0807/4091F298A817EE846EEF6E1BC9823F0A7FBC04DF_size146_w800_h713.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p>相比较绝大多数电商App和各平台小程序，“每日必抢”在获得支付宝首页推广的同时，底部栏目去掉了“我的”或者“个人中心”。因此，它至少需要用户已有淘宝账号及其所绑定的支付宝账号才能使用。</p><p>当然，光一个“拼团”功能并非电商决胜的唯一因素。今年5月，淘宝总裁蒋凡接收36氪专访，他在回应“拼团”是否重要的问题时说“至少不是在我关注层面的一个产品”。</p><p>更早之前的3月，淘宝则静悄悄地上线了“淘宝特价版”App。但此后，淘宝或阿里并没有用优质资源来为淘宝特价版做营销推广，而是任其自然生长，更像是一次探路。阿里巴巴CEO张勇在接受《中国企业家》采访时将之称为是“在不同的消费分级里进行消费升级”。</p><p>主打“拼团”的“每日必抢”小程序在支付宝上线并获得优质位置大流量灌入，这意味着，淘宝在阻击拼多多的路上使用了新的策略。淘宝开始利用其所属阿里集团里的优势，联合了支付宝，而不再是孤军奋战。此后也很可能有越来越多的阿里系业务，会直接加入这场抢夺增量用户的战争中来。</p><p>支付宝并未回复36氪的置评请求。</p><p>但此前，张勇回应拼多多在中国市场的崛起时曾说：“你就当成在帮我开拓农村市场，教育用户好了。”但拼多多上市当天，创始人黄峥接受媒体采访时则完全否认了这个说法，称拼多多的用户“绝大部分都是知道淘宝并且用过淘宝”，是被拼多多转化过来的，因为阿里巴巴的宣传能力强大到“中国人民没有不知道马老师，不知道淘宝”。双方在谁先获取下沉用户的问题上产生了截然相反的认知。</p><p>然而，口水战争的另一面，真正的商业竞争还是要回归到产品、资源和用户体验。</p><p>“每日必抢”上线后，可能意味着小程序时代的电商大战正式打响了。“微信+拼多多”战队VS“支付宝+淘宝”战队，你更看好谁？<a href=\"http://www.ifeng.com/\"><img src=\"http://p2.ifengimg.com/a/2016/0810/204c433878d5cf9size1_w16_h16.png\" style=\"border: 0px; vertical-align: top; display: inline; margin: 0px; max-width: 100%; height: auto; padding-top: 3px;\"/></a></p><p><br/></p>',NULL,0,'2018-08-07 14:13:59',0,'3ff56515-529a-d420-a6e6-c4200049fa7d','show',99,0,0,'2018-08-07 14:18:39','2018-08-09 15:15:54'),(6,3,'微信官方：8月8日起剔除机器等非自然阅读数据','/upload/20180809/20180809031603684.jpeg','微信官方：8月8日起剔除机器等非自然阅读数据','微信官方：8月8日起剔除机器等非自然阅读数据','<p>原标题：微信官方：8月8日起剔除机器等非自然阅读数据</p><p>PingWest品玩8月7日讯，微信公众平台近日发公告表示，从8月8日开始，剔除机器等非自然阅读带来的虚假数据。</p><p>此前有媒体揭秘微信公众号上的“刷单”灰色产业，图文阅读量千次15元，转发分享百次40元，吸引有活跃度的微信粉丝500个20元，而付费“刷单”、“关注”虚高，折射出近年来愈演愈烈的自媒体营销乱象</p><p><strong>以下为公告全文：</strong></p><p>为保证平台的健康运营，公众号运营后台的文章阅读数据于8月8日开始，剔除机器等非自然阅读带来的虚假数据。因统计口径切换，新的统计数据与历史数据对比可能会出现一定波动，该变动对运营者流量不产生实际影响，请运营者留意。&nbsp;</p><p><br/></p>',NULL,0,'2018-08-07 14:39:37',0,'d52268e7-7488-80d8-2c93-5802441c1568','show',99,0,0,'2018-08-07 14:40:02','2018-08-09 15:16:06'),(7,3,'马云生命中的贵人，38年前改变他的人生！如今马云报恩方式很特别',NULL,'马云生命中的贵人，38年前改变他的人生！如今马云报恩方式很特别','马云生命中的贵人，38年前改变他的人生！如今马云报恩方式很特别','<p>如今的马云可以说是中国商界最风生水起的人物了，他凭借一己之力创作了电商运营的互联网商业帝国，不仅仅是在国内，在国外也是公众和记者关注的对象，所以说平时大家称呼他为“马爸爸”可不是玩笑的。要说起马云的成功，自然与他本人的努力和人品有着绝大的关系，但是今天要说的他在人生中遇到的贵人，不是孙正义，而是一个外国家庭。</p><p><img src=\"/upload/images/20180807/1533624319.jpeg\" title=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533624319.jpeg\"/></p><p>正如马尔克斯还是个穷作家的时候，只能借宿在酒店里写作，马云在人生中也曾经遇到过很多挫折，很少有人知道，37年前马云还只有16岁，落入低谷经济困难的时候，正是来杭州游玩的David Morley一家人帮助了他。1980年的时候，那时中国刚刚开始进行改革开放，国门大开，因此很多外国人包括David Morley一家就来到了杭州旅游，当他们在西湖边上游玩的时候，就遇到当时年轻的马云，马云用口音和语法都不太标准的英语和他们交流了起来。</p><p><img src=\"/upload/images/20180807/1533624319.jpeg\" title=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533624319.jpeg\"/></p><p>期间马云表达了希望和他们对话来练习口语的愿望，没想到这一家人非常热心，很愉快地和马云聊起了天，在聊天中相处得特别愉快，他们一家人都对这个瘦小的中国男孩喜爱不已。David Morley的父亲Ken非常喜欢这个其貌不扬的中国男子，一再热心地帮助马云学习英语，而且知道马云生活困难，还特意提供了200澳币（折合人民币约1050元）的帮助。这在1980年的中国，已经是很多钱了。Ken的儿子David与马云也非常聊得来，两人也经常谈论一些年轻话题。</p><p><img src=\"/upload/images/20180807/1533624319.jpeg\" title=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533624319.jpeg\"/></p><p>Ken与马云一直保持着联络，此后还成为了异国的忘年交，他深知马云是个有梦想的人，他们邀请马云来澳洲做客游玩，帮助他开拓自己的视野，改变对于世界的固有印象。David Morley一家游玩过后，并没有在杭州多做停留，很快就去回澳洲了，但马云一直保持着与Ken定期通信的习惯，在信中还称呼这个亲切的外国人为“教父”，和他分享自己在中国生活的日常。可以说，马云的英语之所以这么棒，是多亏了Ken的帮助，他也从这个外国人身上学会了“爱人”。他与David Morley一家的关系又像是朋友，也像是亲人。虽然Ken很早就去世了，但他依旧与David Morley一家保持着长久的联系，而且马云也不负Ken的期望，成就了自己的商业帝国。</p><p><img src=\"/upload/images/20180807/1533624319.jpeg\" title=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533624319.jpeg\"/></p><p>马云向来是个懂得感激的人，如今他已经不是从前杭州城里的穷人，而是一个身价227亿美元的大富豪，受到人们的敬仰和羡慕。但他依旧记得昔日David Morley一家的恩情，所以他后来用2600万澳币设立了自己与Ken家族名下的公益奖学金，命名为“MA-Morley奖学金”，希望Ken的善心能够永远延续下去，而那些如同他当前一样困顿的少年，也可以得到资助完成学业和梦想。</p><p><img src=\"/upload/images/20180807/1533624319.jpeg\" title=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533624319.jpeg\"/></p><p>马云的成功绝不是偶然，这与他自己的努力，他的人品是有关系的。还有细心的网友发现在马云没有成功之前，只是一个教师，他那时就很有公德心和勇气，曾经不顾危险，骑着自行车拦住偷井盖的人，还被电视采访了。所以说，这样有善心有责任心的人绝对是“天选之人”，“马爸爸”无论做人做事一向很酷。</p><p><img src=\"/upload/images/20180807/1533624320.jpeg\" title=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533624320.jpeg\"/></p><p>此前疫苗问题弄得人心惶惶的时候，阿里巴巴还特意在支付宝开启了免费查询批次的服务，也难怪马云的生意这样庞大，有着责任感的老板和企业自然能够收获稳定的客源，这才是企业能够长久生存以及发展的关键。<a href=\"http://www.ifeng.com/\"><img src=\"/upload/images/20180807/1533624320.png\" style=\"border: 0px; vertical-align: top; display: inline; margin: 0px; max-width: 100%; height: auto; padding-top: 3px;\" _src=\"/upload/images/20180807/1533624320.png\"/></a></p><p><br/></p>',NULL,0,'2018-08-07 14:44:58',0,'c4fb0be2-a4ef-8cbc-250c-509598a0bab3','show',1,0,1,'2018-08-07 14:45:23','2018-08-07 16:04:17'),(8,3,'路透：阿里巴巴将合并饿了么与口碑等食品配送业务',NULL,'路透：阿里巴巴将合并饿了么与口碑等食品配送业务','路透：阿里巴巴将合并饿了么与口碑等食品配送业务','<p>原标题：路透：阿里巴巴将合并饿了么与口碑等食品配送业务<br/></p><p><img src=\"/upload/images/20180807/1533628469.jpg\" alt=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533628469.jpg\"/></p><p>PingWest品玩8月7日讯，根据路透社消息，阿里巴巴考虑将包括饿了么、口碑、河马生鲜等食品配送业务合并，并将就此募集30-50亿美元，合并后估值或将达到250亿美元。</p>',NULL,0,'2018-08-07 15:53:49',0,'60670358-ab01-f454-f2fd-fc6a407a66cf','show',1,1,1,'2018-08-07 15:54:34','2018-08-07 16:05:41'),(9,3,'亚马逊累计售出5000万台Alexa设备 仅有2%被用于购物','/upload/20180809/20180809031612899.jpg','亚马逊累计售出5000万台Alexa设备 仅有2%被用于购物','亚马逊累计售出5000万台Alexa设备 仅有2%被用于购物','<p><img src=\"http://p2.ifengimg.com/2018_32/EF604AA0763AC5DB8A01C22EEAE87B6526E442BA_w1440_h960.jpg\" alt=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p>亚马逊Echo智能音箱</p><p>凤凰网科技讯 据TheInformation北京时间8月7日报道，语音购物是亚马逊和谷歌智能音箱的主要卖点之一。有分析师甚至预测称，未来数年语音购物市场将达到400亿美元/年。</p><p>然而，似乎只有一小部分用户会使用智能音箱进行购物，且其中大部分都浅尝辄止。</p><p>据The Information获悉，自亚马逊2014年推出内置Alexa助手的智能音箱以来，该公司共售出了约5000万台这种设备。然而在2018年，只有2%的用户曾通过Alexa智能音箱从亚马逊上购物，在这2%的用户中，有90%都不会再次尝试。亚马逊没有立刻回复置评请求。</p><p>这些数字并不令人十分意外。消费咨询公司Activate最近的一项调查显示，大多数人购买智能音箱的目的都不是为了购物。数据显示，播放音乐、询问常见问题、获取天气信息、当做闹钟使用、听新闻、导航以及查看时间是智能音箱最常用的用途。</p><p>不过，Echo智能音箱仍然是亚马逊重度用户的一个标志。2017年的一项调查发现，美国Alexa用户平均每年在亚马逊上花费1700美元，而Prime会员通常一年花费1300美元。对于一般的亚马逊用户，他们平均每年花费1000美元。（编译/扬帆）</p><p>更多一手新闻，欢迎下载凤凰新闻客户端订阅凤凰网科技。想看深度报道，请微信搜索“iFeng科技”。<a href=\"http://www.ifeng.com/\"><img src=\"http://p2.ifengimg.com/a/2016/0810/204c433878d5cf9size1_w16_h16.png\" style=\"border: 0px; vertical-align: top; display: inline; margin: 0px; max-width: 100%; height: auto; padding-top: 3px;\"/></a></p><p><img src=\"http://p2.ifengimg.com/a/2017/0922/004eef6211eae24size3529_w498_h214.gif\" style=\"border: 0px; vertical-align: bottom; height: 214px;\"/><img src=\"http://p3.ifengimg.com/a/2017/0822/ef1f8f1ad492125size20_w160_h214.jpg\" style=\"border: 0px; vertical-align: bottom; height: 214px;\"/><a href=\"https://ids1.deliver.ifeng.com/ids/mnt/cli?args=A8lY7mVNJIuVBFcpLXJLhL61kFeRZ3z9lKokMZ6xCq74wAa2Ad06syCjsE06s4UxJdk8SrCTe92yyl6XunT8bHfNoQU7_MAe4a1MaNWRgQUPgapQL3-1urMLfMV4fHcP9qDRdqDMak4RkERWJZiM0RZJ765TQteIR-4aueT142sg3UYBnxGzs6nfsk3OgG4E9hlgD2NkGy2to9MsyjTZ0PDPSs0kEOOfN0zefv7n8_uF8zGbcrqG7bh31NXROC32noCzx1Tr01Cm7Xh99dg3VwqWRNQO9sBQIkFOZSKhRp0g8IeDATLD7zAXGzfakdMtJfQHaZmU-6PMYMEnGTVtewpl1gvvLOWyV7Tw_bkNIkRI7gfM-LGOrHEt0ehQhnp36jra9TVjSjS0lRDCQgYsHN3nga__h3uMER4vqwzIE86v8CcuF5jwrahpWRYP7c55yXLzuhY29CKjAsmd1Hxs5UBflgD4sns89XXv_SrRy9HWjTzntxsHwnnGYV7RCIcG2zDijJMF9UlhR0mrcAhmnqeQmYZ78WAUvGOO7sS74wZOtukWWVen4BrTAAKd3wmtC-t-XBr3ha5rhIQMQPEXtQdUAn16USH9yjXlJ8ID5zQKcMzXuXQZyx0BYHs4pQqdUzIQIjH5h6O8odIuhn69LoE6YsN0Gxl2nGCvUQ_Crkap1IOawSe-OVWcVus6zfBuohHGH3t7UnIpsboSZqYXnP-tKh9ukBDgFJIWj5ZaGhu8B-YNPVJr8f3yMyDIjeIiBbNpAldEkGEDSyUxLt_jag0Ii_I93nEdziiRftozZWdaBWG9jO7zd09iTp2UzcmAwzF_oAH5Tg6-BL-tEyDhVNhwXSYQsPx2oERx0a9xGj4&jmp=G0FlqPeJuiQs1HsstOp5P8nIqMsgUWkxj46s_3TBrVfdIN-UEUD8HAasFEfLuDXZ5642PEwyT7qY4r6AamDj2A&auctionPrice=DvjYCULRqqfnfF9jBrNAEw\"><img src=\"https://y0.ifengimg.com/34c4a1d78882290c/2012/0528/1x1.gif\" style=\"border: 0px; vertical-align: bottom; line-height: 24px; width: 640px; height: 90px;\"/></a></p><p></p><ul class=\" list-paddingleft-2\"><li><p>0</p><p><img src=\"http://p0.ifengimg.com/fe/news_detail/images/hw_00309b25.png\" width=\"38\" height=\"38\" style=\"border: 0px; vertical-align: bottom;\"/></p><p>好文</p></li><li><p>0</p><p><img src=\"http://p0.ifengimg.com/fe/news_detail/images/qp_235ef6bf.png\" width=\"38\" height=\"38\" style=\"border: 0px; vertical-align: bottom;\"/></p><p>钦佩</p></li><li><p>1</p><p><img src=\"http://p0.ifengimg.com/fe/zx2/images/dc_ff82dee0.png\" width=\"38\" height=\"38\" style=\"border: 0px; vertical-align: bottom;\"/></p><p>喜欢</p></li><li><p>0</p><p><img src=\"http://p0.ifengimg.com/fe/zx2/images/lb_e7323f83.png\" width=\"38\" height=\"38\" style=\"border: 0px; vertical-align: bottom;\"/></p><p>泪奔</p></li><li><p>0</p><p><img src=\"http://p1.ifengimg.com/a/2017/1110/article/cute.png\" width=\"38\" height=\"38\" style=\"border: 0px; vertical-align: bottom;\"/></p><p>可爱</p></li><li><p>0</p><p><img src=\"http://p1.ifengimg.com/a/2017/1110/article/think.png\" width=\"38\" height=\"38\" style=\"border: 0px; vertical-align: bottom;\"/></p><p>思考</p></li></ul><p><iframe src=\"about:blank\"></iframe><img src=\"http://h2.ifengimg.com/0f56ee67a4c375c2/2013/1106/indeccode.png\" class=\"js_wx_qrcod\" style=\"border: 0px; vertical-align: bottom; width: 86px; height: 86px; float: left; margin-right: 14px;\"/></p><p><br/></p><p><a></a><a></a><a></a><a></a><a href=\"https://ids1.deliver.ifeng.com/ids/mnt/cli?args=_0BbIDYci6goIXgLy-ey_DqL5M3zqj_oTfebKiJHnTCJo9xw3j-eDe92bwEgPh-E1dNSIxq4Y5seCu5nuh0jCTcwQSJ6FDteBofMI6YmRLumCq5ZebjOY8j28Ys20qq556e4AszfNkIjYLbN-21EqA8ogQlikLWwZAOebwbacQer9m1OhH_B-hmLn91sA7S87JVmQ0tMEPoLqLlZLIufK8qs2tZ7oBsgAgKmQwEND9JW10yFRBpVDJ3TTtRoWS1uVaYaOKFHCtWdEFbmvWDGjZ4x0wQXaE1jIq2r8LlpNgWS3OO9FUZSIU9oORMdOCGeRvmBhJ0TNTu_-VqWLBDhmckNImjDP4_bx2wYSWKaPzB50hdi92ToU7oEXBCg_OS9gH0YR5LcqUtI9BJTzmRMr3biQfGvF_1aEnxPoEgiVkmrz3biJBwRn2sQJKoXJm_h3Yc7h-chA55qrofPA3sogKHB9m4QVa2jwPUFsPBlnxfU5zOkfT00rqK2czTzRWofgCkx7kH4_Gh8r0MyRs0KXq-1itdYhgztv_rs77Rto-bTHmibS4HVFlhdNIO--sKTOp2HIvCO-0kyvNpDJqRUUrU7rwsqY0t4WepfkU2Bor6MuUJr7Cl79dw8LYV0vqbL_u1DNjTlqpIM7-RIpjCowkXOrGKdFkz-WVhOtbrkCMW2jA4VQxpsXvMF162kVx74TXe5IUna_lnASS2ToK4YlqIjzhc_CVqkx03rtBalMQmEq1-68pXs8xL6SVkLvsjfS34-W8Nv0DVLQN2-FB2byND32l9eQBC9Q-bAcOS2RHCt42HZ3IZOZ0ba4Ri6v1rqc5stpF-LlQ1GuKrK60buSQcocbV1zJhV8BIKYZo9ALw&jmp=qdls74rnrlOJXTVCEc6f4lA8yncNltQOk_wGUIdxu_if_Iw6KV_su50uG48Ov9A7Mv_CJ92oeu9ycboVJw333B0ISOd0XyqbX73yp1UVWJg&auctionPrice=_HV7c8W1f_BWnB3w7VtgCQ\"><img src=\"https://c1.ifengimg.com/feather/images/423/2018/39/24/1524551982681.jpg\" style=\"border: none; vertical-align: bottom; width: 640px; height: 90px;\"/></a><iframe name=\"iframeu2974481_0\" src=\"http://pos.baidu.com/iczm?conwid=638&conhei=183&rdid=2974481&dc=3&di=u2974481&dri=0&dis=0&dai=1&ps=2292x452&enu=encoding&dcb=___adblockplus&dtm=HTML_POST&dvi=0.0&dci=-1&dpt=none&tsr=0&tpr=1533629449946&ti=%E4%BA%9A%E9%A9%AC%E9%80%8A%E7%B4%AF%E8%AE%A1%E5%94%AE%E5%87%BA5000%E4%B8%87%E5%8F%B0Alexa%E8%AE%BE%E5%A4%87%20%E4%BB%85%E6%9C%892%25%E8%A2%AB%E7%94%A8%E4%BA%8E%E8%B4%AD%E7%89%A9_%E5%87%A4%E5%87%B0%E7%BD%91%E7%A7%91%E6%8A%80&ari=2&dbv=2&drs=1&pcs=1903x967&pss=1903x2477&cfv=0&cpl=3&chi=1&cce=true&cec=UTF-8&tlm=1533629449&rw=967&ltu=http%3A%2F%2Ftech.ifeng.com%2Fa%2F20180807%2F45105901_0.shtml&ltr=http%3A%2F%2Ftech.ifeng.com%2F&ecd=1&uc=1920x1040&pis=-1x-1&sr=1920x1080&tcn=1533629450&qn=71a02a70ea0f0e2e&tt=1533629449937.10.10.11\"></iframe><a></a><iframe src=\"http://www.ifeng.com/a_if/taobao/180330/all-content-bannerbt.html\"></iframe><iframe src=\"http://www.ifeng.com/a_if/wanghh/20160126/quanpindao/neiye/tuwen05/ceshi.html?sid=561650&sw=640&sh=90\"></iframe><iframe src=\"http://www.ifeng.com/a_if/wanghh/20160126/quanpindao/neiye/tuwen05/ceshi.html?sid=702973&sw=640&sh=60\"></iframe><img src=\"http://y2.ifengimg.com/ifengimcp/pic/20150902/3677f2773fd79f12b079_size1_w35_h15.png\" style=\"border: 0px; vertical-align: bottom; width: 35px; height: 15px; position: absolute; z-index: 12; top: 35px; left: 605px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; opacity: 1;\"/></p><ul class=\" list-paddingleft-2\"><li><p><a href=\"http://news.ifeng.com/#_doc_rec1?wratingModule=1_ydtj\">社会</a></p></li><li><p><a href=\"http://ent.ifeng.com/#_doc_rec1?wratingModule=1_ydtj\">娱乐</a></p></li><li><p><a href=\"http://fashion.ifeng.com/#_doc_rec1?wratingModule=1_ydtj\">生活</a></p></li><li><p><a href=\"http://tech.ifeng.com/discovery/#_doc_rec1?wratingModule=1_ydtj\">探索</a></p></li><li><p><a href=\"http://news.ifeng.com/history/#_doc_rec1?wratingModule=1_ydtj\">历史</a></p></li><li><p><a href=\"http://news.ifeng.com/#_doc_rec1?wratingModule=1_ydtj\">搜奇</a></p></li></ul><p><a href=\"http://news.ifeng.com/a/20180807/59666708_0.shtml\">杀2警察男子驾车撞派出所</a><a href=\"http://news.ifeng.com/a/20180807/59666708_0.shtml\"><img src=\"http://p2.ifengimg.com/a/2018_32/c5217e71176c86d.jpg\" alt=\"杀2警察男子驾车撞派出所\" width=\"190\" height=\"255\" style=\"border: 0px; vertical-align: bottom; float: left; width: 200px; height: 280px;\"/></a></p><h2><a href=\"http://news.ifeng.com/a/20180807/59670538_0.shtml?_cpb_shehui\">北大清华应届生落户上海可走绿色通道</a></h2><ul class=\" list-paddingleft-2\"><li><p><a href=\"http://news.ifeng.com/a/20180807/59670497_0.shtml?_cpb_shehui\">北大女生在英国超市偷窃 领队导师：是忘记付钱</a></p></li><li><p><a href=\"http://news.ifeng.com/a/20180807/59668009_0.shtml?_cpb_shehui\">双胞胎姐妹悲剧之后，照顾儿童“疏忽”能否入罪？</a></p></li><li><p><a href=\"http://news.ifeng.com/a/20180807/59668570_0.shtml\">扑尔敏一个月涨到23300元/kg 谁在背后炒药？</a></p></li><li><p><a href=\"http://news.ifeng.com/a/20180807/59670908_0.shtml?_cpb_shehui\">中纪委机关报评张馨予嫁军人：慧眼识英雄 为军嫂点</a></p></li><li><p><a href=\"http://news.ifeng.com/a/20180807/59672009_0.shtml?_cpb_shehui\">网红“杀鱼弟”服毒自尽 父亲：农药是一个月前买的</a></p></li><li><p><a href=\"http://news.ifeng.com/a/20180807/59674561_0.shtml?_cpb_shehui\">万里长城变“宾馆”？官方：没听说过，不支持</a></p></li></ul><ul class=\" list-paddingleft-2\"><li><p><a href=\"http://www.xiwuji.com/quanqiutuku/58142.html?fhw805005sh\">60岁大爷娶20岁非洲美女 生下的女儿让人惊讶</a></p></li><li><p><a href=\"http://www.xiwuji.com/quanqiutuku/58160.html?fhw807005sh\">男子误入传销和8名女子同住 最后因这事开除</a></p></li></ul><p>网罗天下</p><ul class=\" list-paddingleft-2\"><li><p><a href=\"http://finance.china.com.cn/hz/sh/photo/ifeng/20180807/2622.shtml\"><img src=\"http://p0.ifengimg.com/a/2018_32/1e6ff00c92ece31.jpg\" alt=\"父母找人谈房屋拆迁 7岁男孩被遗忘车内窒息而亡\" data-src=\"http://p0.ifengimg.com/a/2018_32/1e6ff00c92ece31.jpg\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://finance.china.com.cn/hz/sh/photo/ifeng/20180807/2622.shtml\">父母找人谈房屋拆迁 7岁男孩被遗忘车内窒息而亡</a></p><p></p></li><li><p><a href=\"http://finance.china.com.cn/hz/sh/photo/ifeng/20180807/2621.shtml\"><img src=\"http://p0.ifengimg.com/a/2018_32/c19214347129dce.jpg\" alt=\"上半年居民消费榜:这个城市的人最能挣也最能花\" data-src=\"http://p0.ifengimg.com/a/2018_32/c19214347129dce.jpg\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://finance.china.com.cn/hz/sh/photo/ifeng/20180807/2621.shtml\">上半年居民消费榜:这个城市的人最能挣也最能花</a></p><p></p></li><li><p><a href=\"http://v.ifeng.com/video_20607651.shtml?_cpb_wangluotx3\"><img src=\"http://p0.ifengimg.com/a/2018_32/bd41a425c090049.gif\" alt=\"英国调查显示智能手机上瘾影响人际交流\" data-src=\"http://p0.ifengimg.com/a/2018_32/bd41a425c090049.gif\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://v.ifeng.com/video_20607651.shtml?_cpb_wangluotx3\">英国调查显示智能手机上瘾影响人际交流</a></p><p></p></li><li><p><a href=\"http://v.ifeng.com/video_20606684.shtml?_cpb_wangluotx4\"><img src=\"http://p1.ifengimg.com/a/2018_32/cd7ca6a17e3870a.jpeg\" alt=\"特朗普承认儿子曾会俄女律师：为获希拉里“黑材料”\" data-src=\"http://p1.ifengimg.com/a/2018_32/cd7ca6a17e3870a.jpeg\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://v.ifeng.com/video_20606684.shtml?_cpb_wangluotx4\">特朗普承认儿子曾会俄女律师：为获希拉里“黑材料”</a></p><p></p></li></ul><ul class=\" list-paddingleft-2\"><li><p><a href=\"http://v.ifeng.com/video_20608528.shtml?_cpb_wangluotx5\"><img src=\"http://p0.ifengimg.com/a/2018_32/907a3318b54ed87.jpg\" alt=\"台媒：台军开始部署可破袭福建广东大杀器 无坚不摧\" data-src=\"http://p0.ifengimg.com/a/2018_32/907a3318b54ed87.jpg\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://v.ifeng.com/video_20608528.shtml?_cpb_wangluotx5\">台媒：台军开始部署可破袭福建广东大杀器 无坚不摧</a></p><p></p></li><li><p><a href=\"http://finance.china.com.cn/hz/sh/photo/ifeng/20180807/2620.shtml\"><img src=\"http://p2.ifengimg.com/a/2018_32/f6ac9ced90d8c15.jpg\" alt=\"大学生持刀闯女子家中抢劫:想被劫财还是想被劫色?\" data-src=\"http://p2.ifengimg.com/a/2018_32/f6ac9ced90d8c15.jpg\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://finance.china.com.cn/hz/sh/photo/ifeng/20180807/2620.shtml\">大学生持刀闯女子家中抢劫:想被劫财还是想被劫色?</a></p><p></p></li><li><p><a href=\"http://v.ifeng.com/video_20608523.shtml?_cpb_wangluotx7\"><img src=\"http://p1.ifengimg.com/a/2018_32/03ea34895a13ec7.jpg\" alt=\"操作失误？俄罗斯国防部社交账号现不雅图\" data-src=\"http://p1.ifengimg.com/a/2018_32/03ea34895a13ec7.jpg\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://v.ifeng.com/video_20608523.shtml?_cpb_wangluotx7\">操作失误？俄罗斯国防部社交账号现不雅图</a></p><p></p></li><li><p><a href=\"http://v.ifeng.com/video_20605808.shtml\"><img src=\"http://p1.ifengimg.com/a/2018_32/4abf03962938b45.gif\" alt=\"中国20元人民币，能在印度买到多少东西？网友：说出来你都不信\" data-src=\"http://p1.ifengimg.com/a/2018_32/4abf03962938b45.gif\" class=\"\" width=\"145\" height=\"80\" style=\"border: 0px; vertical-align: bottom; float: left; margin-right: 15px;\"/></a></p><p><a href=\"http://v.ifeng.com/video_20605808.shtml\">中国20元人民币，能在印度买到多少东西？网友：说出来你都不信</a></p><p></p></li></ul><h3>热门游戏</h3><ul class=\" list-paddingleft-2\"><li><p><a href=\"http://games.ifeng.com/webgame/zcy/zcy10004.shtml?af=3755119157\"><img src=\"http://p0.ifengimg.com/a/2018/0206/sslj0206.jpg\" height=\"120\" width=\"202\" title=\"三十六记\" style=\"border: 0px; vertical-align: bottom; border-radius: 4px 4px 0px 0px; transition: all 0.2s ease 0s;\"/></a></p><p><a href=\"http://games.ifeng.com/webgame/sslj/\">官网</a><a href=\"http://play.ifeng.com/?_a=cardshow&bookid=15014933249571\">礼包</a><a href=\"http://games.ifeng.com/webgame/zcy/zcy10004.shtml?af=3755119157\">开始游戏</a></p></li><li><p><a href=\"http://games.ifeng.com/webgame/zcy/zcy10007.shtml?af=999594071\"><img src=\"http://p0.ifengimg.com/a/2018/0206/jzcq0206.jpg\" height=\"120\" width=\"202\" title=\"金装传奇\" style=\"border: 0px; vertical-align: bottom; border-radius: 4px 4px 0px 0px; transition: all 0.2s ease 0s;\"/></a></p><p><a href=\"http://games.ifeng.com/webgame/jzcq/\">官网</a><a href=\"http://play.ifeng.com/?_a=cardshow&bookid=101004277102\">礼包</a><a href=\"http://games.ifeng.com/webgame/zcy/zcy10007.shtml?af=999594071\">开始游戏</a></p></li><li><p><a href=\"http://games.ifeng.com/webgame/zcy/zcy10011.shtml?af=3745511302\"><img src=\"http://p0.ifengimg.com/a/2018/0206/cqbt0206.jpg\" height=\"120\" width=\"202\" title=\"传奇霸业\" style=\"border: 0px; vertical-align: bottom; border-radius: 4px 4px 0px 0px; transition: all 0.2s ease 0s;\"/></a></p><p><a href=\"http://games.ifeng.com/webgame/cqby/\">官网</a><a href=\"http://play.ifeng.com/?_a=cardshow&bookid=101000307866\">礼包</a><a href=\"http://games.ifeng.com/webgame/zcy/zcy10011.shtml?af=3745511302\">开始游戏</a></p></li></ul><p><iframe name=\"iframeu3120305_0\" src=\"http://pos.baidu.com/iczm?conwid=640&conhei=250&rdid=3120305&dc=3&di=u3120305&dri=0&dis=0&dai=8&ps=3807x452&enu=encoding&dcb=___adblockplus&dtm=HTML_POST&dvi=0.0&dci=-1&dpt=none&tsr=0&tpr=1533629449946&ti=%E4%BA%9A%E9%A9%AC%E9%80%8A%E7%B4%AF%E8%AE%A1%E5%94%AE%E5%87%BA5000%E4%B8%87%E5%8F%B0Alexa%E8%AE%BE%E5%A4%87%20%E4%BB%85%E6%9C%892%25%E8%A2%AB%E7%94%A8%E4%BA%8E%E8%B4%AD%E7%89%A9_%E5%87%A4%E5%87%B0%E7%BD%91%E7%A7%91%E6%8A%80&ari=2&dbv=2&drs=1&pcs=1903x967&pss=1903x3811&cfv=0&cpl=3&chi=1&cce=true&cec=UTF-8&tlm=1533629450&rw=967&ltu=http%3A%2F%2Ftech.ifeng.com%2Fa%2F20180807%2F45105901_0.shtml&ltr=http%3A%2F%2Ftech.ifeng.com%2F&ecd=1&uc=1920x1040&pis=-1x-1&sr=1920x1080&tcn=1533629451&qn=170a694a558b5385&tt=1533629449937.967.967.968\"></iframe><iframe src=\"https://news.163.com/special/gh_hzh08/?mid=izZvJZ_1047864&w=300&h=250\"></iframe><iframe src=\"https://news.163.com/special/gh_hzh08/?mid=UeuW3k_1047863&w=300&h=250\"></iframe><a></a><a href=\"http://dpn.deliver.ifeng.com/c?0bc363935MluuVuLEVCrlk7CiF1N5piUjVsuTNmWaw1nose1ZFIyWktcJ90BKjeoIci5U2m90XPVatz5I5L6I16zp3lt8ZHx7bOtQgqhI3aDq2cX5caUVYZwyT-3W4Jm0RAxWbSQ\"><img src=\"https://c1.ifengimg.com/iamsImg/2018/07/09/44f6b303d5902e8d24fe07d485cab24b_w300_h250.jpg\" style=\"border: none; vertical-align: bottom; width: 300px; height: 250px;\"/></a></p><h4>频道推荐</h4><p><a href=\"http://gongyi.ifeng.com/hot/special/fhwytjh/\"><img src=\"http://p1.ifengimg.com/a/2017/0817/donate_4.jpg\" width=\"145\" height=\"20\" alt=\"凤凰网公益基金救助直达\" style=\"border: 0px; vertical-align: bottom;\"/></a></p><h2><a href=\"http://tech.ifeng.com/a/20180806/45105852_0.shtml?_cpb_pindaotj1\">马云生命中的贵人，38年前改变他的人生</a></h2><h4><a href=\"http://gentie.ifeng.com/view.html?docUrl=sub_72439823&docName=%E9%A9%AC%E4%BA%91%E7%94%9F%E5%91%BD%E4%B8%AD%E7%9A%84%E8%B4%B5%E4%BA%BA%EF%BC%8C38%E5%B9%B4%E5%89%8D%E6%94%B9%E5%8F%98%E4%BB%96%E7%9A%84%E4%BA%BA%E7%94%9F%EF%BC%81&skey=d46ae5&&pcUrl=http://tech.ifeng.com/a/20180806/45105852_0.shtml\">0条评论</a>2018-08-07 07:41:23</h4><ul class=\" list-paddingleft-2\"><li><p><a href=\"http://tech.ifeng.com/a/20180807/45105839_0.shtml?_cpb_pindaotj2\">台积电复盘病毒事件：勒索病毒传染，没内鬼没黑客</a></p></li><li><p><a href=\"http://tech.ifeng.com/a/20180807/45105793_0.shtml?_cpb_pindaotj3\">印度拟2022年部署5G服务 落后于中日韩</a></p></li><li><p><br/></p></li></ul><p><br/></p>',NULL,0,'2018-08-07 16:10:36',0,'9e814365-9da2-4521-a946-1e026997d2ea','show',99,1,0,'2018-08-07 16:11:18','2018-08-09 15:16:13'),(10,3,'“拼多多效应”来袭？支付宝、京东、网易纷纷推出拼团平台','/upload/20180809/20180809031629418.jpg','“拼多多效应”来袭？支付宝、京东、网易纷纷推出拼团平台','“拼多多效应”来袭？支付宝、京东、网易纷纷推出拼团平台','<p>继网易推出“网易一起拼”平台，京东上线“京东拼购”小程序后，近日，支付宝app内也出现了“拼团”窗口，拼团的商品全都来自淘宝店家，拼团价会比淘宝价格更低。</p><p>本文来自全天候科技，阅读更多请登陆www.awtmt.com或华尔街见闻APP。</p><p>作者|张少华</p><p>拼多多快速成为国内电商的重要一极后，阿里巴巴旗下支付宝、京东、网易等也纷纷开始效仿拼团模式。</p><p>近日，支付宝app内出现“5折拼团”窗口，与拼多多类似，支付宝的拼团也有时间限制，在每日9点、14点、19点“开拼”。据悉，支付宝的拼团窗口是与淘宝合作推出，商品全都来自不同的淘宝店家，涵盖了日用、食品、服饰等十多个品类。但拼团价会比淘宝价格更低，很多甚至都是再打5折的降价幅度。</p><p><img alt=\"“拼多多效应”来袭？支付宝、京东、网易纷纷推出拼团平台\" src=\"/upload/images/20180807/1533630493.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533630493.jpeg\"/></p><p>这已不是淘宝第一次发力拼团电商，今年3月淘宝曾推出特价版，宣布要做“消费分级”。阿里巴巴最近一份财报显示，支付宝的国内用户已达5.5亿，而第三方统计的淘宝月活用户数超过4.3亿。此次这两大平台展开合作，给了外界很大的想象空间。</p><p>今年6月，京东上线了一款名为“京东拼购”的小程序，官方介绍称，“京东拼购”是基于京东商家，利用拼购营销工具，通过拼购价及社交玩法，刺激用户多级分享裂变，实现商家低成本引流及用户转化的一个工具，主打“低价不低质”概念。“京东拼购”小程序内不仅开设了9.9元包邮的窗口，更有一些商品拼购价低至1元。</p><p><img alt=\"“拼多多效应”来袭？支付宝、京东、网易纷纷推出拼团平台\" src=\"/upload/images/20180807/1533630493.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533630493.jpeg\"/></p><p>比支付宝、京东更早，网易在2017年就推出了“网易一起拼”、“严选一起拼”平台。目前，网易的拼购平台包含数码、服装、鞋包、居家等商品品类。</p><p><img alt=\"“拼多多效应”来袭？支付宝、京东、网易纷纷推出拼团平台\" src=\"/upload/images/20180807/1533630493.jpeg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533630493.jpeg\"/></p><p>有业内人士认为，对于阿里、京东等电商巨头来说，上线开展拼团业务并非难事，只是新增一条业务线。预计阿里、京东等巨头不会把拼团购物作为主要的业务来经营，目的主要是对拼多多进行战略防御。阿里巴巴和京东已相继提出了新零售、无界零售概念，未来在转型过程中目标明确，重点关注的是线下与线上融合的广阔市场空间。<a href=\"http://www.ifeng.com/\"><img src=\"/upload/images/20180807/1533630493.png\" style=\"border: 0px; vertical-align: top; display: inline; margin: 0px; max-width: 100%; height: auto; padding-top: 3px;\" _src=\"/upload/images/20180807/1533630493.png\"/></a></p><p><br/></p>',NULL,0,'2018-08-07 16:27:29',0,'b6a9f328-df71-f852-f6fb-28136b5e15cc','show',99,8,0,'2018-08-07 16:28:15','2018-08-09 15:16:31'),(11,3,'SpaceX新猎鹰9首次重复使用成功 并海上回收一级','/upload/20180809/20180809031648537.jpg','SpaceX新猎鹰9首次重复使用成功 并海上回收一级','SpaceX新猎鹰9首次重复使用成功 并海上回收一级','<p>新型Block 5版猎鹰9号火箭</p><p>凤凰网科技讯 据彭博社北京时间8月7日报道，美国当地时间周二凌晨，美国太空探索技术公司(SpaceX)成功将一颗印尼卫星送入轨道，在今年的第15次发射任务中取得了快速重复使用火箭的又一个里程碑。</p><p>在不到三个月时间内，SpaceX再次把回收的“猎鹰9号”一级火箭用于第二次发射任务中。这一次，SpaceX需要将印尼电信公司PT Telkom Indonesia的通信卫星送入轨道。这是SpaceX首次重复使用新型Block 5版猎鹰9号火箭，后者可以在无需重大整修情况下发射10次。</p><p>美国当地时间周二1:18分，猎鹰9号从卡纳维拉尔角空军基地的Launch Complex 40发射台发射升空。大约8分钟后，猎鹰9号一级火箭在大西洋上的海上无人船“当然，我依旧爱你”上回收。</p><p><img src=\"/upload/images/20180807/1533632046.jpg\" alt=\"\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\" _src=\"/upload/images/20180807/1533632046.jpg\"/></p><p>猎鹰9号一级火箭回收</p><p>大约32分钟后，猎鹰9号把地球同步轨道通信卫星Merah Putih送入轨道。Merah Putih将为印尼、南亚以及东南亚的其他地区提供服务。</p><p>SpaceX的目标是在今年执行大约30次发射任务，高于去年创纪录的18次。SpaceX CEO埃隆·马斯克(Elon Musk)在今年5月份Block 5版猎鹰9号首飞前表示，他希望在24小时内让一枚火箭发射两次。</p><p>重新使用一级火箭并减少两次发射间的整修，有望大幅降低发射成本。SpaceX在这一方面上取得的进步推动其成为美国估值最高的由风投支持的创业公司之一。(编译/箫雨)</p><p>更多一手新闻，欢迎下载凤凰新闻客户端订阅凤凰网科技。想看深度报道，请微信搜索“iFeng科技”。<a href=\"http://www.ifeng.com/\"><img src=\"/upload/images/20180807/1533632046.png\" style=\"border: 0px; vertical-align: top; display: inline; margin: 0px; max-width: 100%; height: auto; padding-top: 3px;\" _src=\"/upload/images/20180807/1533632046.png\"/></a></p><p><br/></p>',NULL,0,'2018-08-07 16:53:18',1,'d26d2ca4-701f-5f6d-6145-a16f5443783e','show',1,1,0,'2018-08-07 16:54:10','2018-08-09 15:18:52'),(12,2,'时代记忆d',NULL,NULL,'d','<p>dd</p>',NULL,0,'2018-08-09 15:20:17',0,'4f5da7db-72fe-37f0-b46c-8fd2f3a42958','show',1,1,0,'2018-08-09 15:20:25','2018-08-09 15:20:50');

/*Table structure for table `li_attrs` */

DROP TABLE IF EXISTS `li_attrs`;

CREATE TABLE `li_attrs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_attrs` */

insert  into `li_attrs`(`id`,`filename`,`url`,`created_at`,`updated_at`) values (1,'1532503156.jpg','/upload/images/20180725/1532503156.jpg',NULL,NULL),(2,'1533611863.jpeg','/upload/images/20180807/1533611863.jpeg',NULL,NULL),(3,'1533611863.jpeg','/upload/images/20180807/1533611863.jpeg',NULL,NULL),(4,'1533611864.jpeg','/upload/images/20180807/1533611864.jpeg',NULL,NULL),(5,'1533611864.jpeg','/upload/images/20180807/1533611864.jpeg',NULL,NULL),(6,'1533612495.jpeg','/upload/images/20180807/1533612495.jpeg',NULL,NULL),(7,'1533612495.jpeg','/upload/images/20180807/1533612495.jpeg',NULL,NULL),(8,'1533612495.jpeg','/upload/images/20180807/1533612495.jpeg',NULL,NULL),(9,'1533612495.jpeg','/upload/images/20180807/1533612495.jpeg',NULL,NULL),(10,'壁纸.jpg','/upload/20180807/20180807113545711.jpg','2018-08-07 11:35:45','2018-08-07 11:35:45'),(11,'1533613033.jpeg','/upload/images/20180807/1533613033.jpeg',NULL,NULL),(12,'1533613033.jpeg','/upload/images/20180807/1533613033.jpeg',NULL,NULL),(13,'1533613033.jpeg','/upload/images/20180807/1533613033.jpeg',NULL,NULL),(14,'1533613033.jpeg','/upload/images/20180807/1533613033.jpeg',NULL,NULL),(15,'壁纸.jpg','/upload/20180807/20180807113733137.jpg','2018-08-07 11:37:33','2018-08-07 11:37:33'),(16,'1533613151.jpeg','/upload/images/20180807/1533613151.jpeg',NULL,NULL),(17,'1533613151.jpeg','/upload/images/20180807/1533613151.jpeg',NULL,NULL),(18,'1533613151.jpeg','/upload/images/20180807/1533613151.jpeg',NULL,NULL),(19,'1533613151.jpeg','/upload/images/20180807/1533613151.jpeg',NULL,NULL),(20,'1533622607.jpeg','/upload/images/20180807/1533622607.jpeg',NULL,NULL),(21,'1533622718.jpeg','/upload/images/20180807/1533622718.jpeg',NULL,NULL),(22,'1533622718.png','/upload/images/20180807/1533622718.png',NULL,NULL),(23,'1533624319.jpeg','/upload/images/20180807/1533624319.jpeg',NULL,NULL),(24,'1533624319.jpeg','/upload/images/20180807/1533624319.jpeg',NULL,NULL),(25,'1533624319.jpeg','/upload/images/20180807/1533624319.jpeg',NULL,NULL),(26,'1533624319.jpeg','/upload/images/20180807/1533624319.jpeg',NULL,NULL),(27,'1533624319.jpeg','/upload/images/20180807/1533624319.jpeg',NULL,NULL),(28,'1533624320.jpeg','/upload/images/20180807/1533624320.jpeg',NULL,NULL),(29,'1533624320.png','/upload/images/20180807/1533624320.png',NULL,NULL),(30,'1533628469.jpg','/upload/images/20180807/1533628469.jpg',NULL,NULL),(31,'1533629468.jpg','/upload/images/20180807/1533629468.jpg',NULL,NULL),(32,'1533629468.png','/upload/images/20180807/1533629468.png',NULL,NULL),(33,'1533629469.gif','/upload/images/20180807/1533629469.gif',NULL,NULL),(34,'1533629469.jpg','/upload/images/20180807/1533629469.jpg',NULL,NULL),(35,'1533629474.gif','/upload/images/20180807/1533629474.gif',NULL,NULL),(36,'1533629474.png','/upload/images/20180807/1533629474.png',NULL,NULL),(37,'1533629474.png','/upload/images/20180807/1533629474.png',NULL,NULL),(38,'1533629474.png','/upload/images/20180807/1533629474.png',NULL,NULL),(39,'1533629475.png','/upload/images/20180807/1533629475.png',NULL,NULL),(40,'1533629475.png','/upload/images/20180807/1533629475.png',NULL,NULL),(41,'1533629475.png','/upload/images/20180807/1533629475.png',NULL,NULL),(42,'1533629475.png','/upload/images/20180807/1533629475.png',NULL,NULL),(43,'1533629475.jpg','/upload/images/20180807/1533629475.jpg',NULL,NULL),(44,'1533629475.png','/upload/images/20180807/1533629475.png',NULL,NULL),(45,'1533629476.jpg','/upload/images/20180807/1533629476.jpg',NULL,NULL),(46,'1533629476.jpg','/upload/images/20180807/1533629476.jpg',NULL,NULL),(47,'1533629476.jpg','/upload/images/20180807/1533629476.jpg',NULL,NULL),(48,'1533629476.gif','/upload/images/20180807/1533629476.gif',NULL,NULL),(49,'1533629476.jpeg','/upload/images/20180807/1533629476.jpeg',NULL,NULL),(50,'1533629476.jpg','/upload/images/20180807/1533629476.jpg',NULL,NULL),(51,'1533629477.jpg','/upload/images/20180807/1533629477.jpg',NULL,NULL),(52,'1533629477.jpg','/upload/images/20180807/1533629477.jpg',NULL,NULL),(53,'1533629477.gif','/upload/images/20180807/1533629477.gif',NULL,NULL),(54,'1533629477.jpg','/upload/images/20180807/1533629477.jpg',NULL,NULL),(55,'1533629477.jpg','/upload/images/20180807/1533629477.jpg',NULL,NULL),(56,'1533629478.jpg','/upload/images/20180807/1533629478.jpg',NULL,NULL),(57,'1533629478.jpg','/upload/images/20180807/1533629478.jpg',NULL,NULL),(58,'1533629478.jpg','/upload/images/20180807/1533629478.jpg',NULL,NULL),(59,'1533630493.jpeg','/upload/images/20180807/1533630493.jpeg',NULL,NULL),(60,'1533630493.jpeg','/upload/images/20180807/1533630493.jpeg',NULL,NULL),(61,'1533630493.jpeg','/upload/images/20180807/1533630493.jpeg',NULL,NULL),(62,'1533630493.png','/upload/images/20180807/1533630493.png',NULL,NULL),(63,'1533632046.jpg','/upload/images/20180807/1533632046.jpg',NULL,NULL),(64,'1533632046.png','/upload/images/20180807/1533632046.png',NULL,NULL),(65,'1.jpg','/upload/20180809/20180809031400675.jpg','2018-08-09 15:14:00','2018-08-09 15:14:00'),(66,'2.jpeg','/upload/20180809/20180809031408299.jpeg','2018-08-09 15:14:08','2018-08-09 15:14:08'),(67,'3.jpg','/upload/20180809/20180809031416562.jpg','2018-08-09 15:14:16','2018-08-09 15:14:16'),(68,'4.jpg','/upload/20180809/20180809031458835.jpg','2018-08-09 15:14:58','2018-08-09 15:14:58'),(69,'4.jpg','/upload/20180809/20180809031541561.jpg','2018-08-09 15:15:41','2018-08-09 15:15:41'),(70,'5.jpeg','/upload/20180809/20180809031553160.jpeg','2018-08-09 15:15:53','2018-08-09 15:15:53'),(71,'6.jpeg','/upload/20180809/20180809031603684.jpeg','2018-08-09 15:16:03','2018-08-09 15:16:03'),(72,'7.jpg','/upload/20180809/20180809031612899.jpg','2018-08-09 15:16:12','2018-08-09 15:16:12'),(73,'3.jpg','/upload/20180809/20180809031629418.jpg','2018-08-09 15:16:29','2018-08-09 15:16:29'),(74,'3.jpg','/upload/20180809/20180809031645558.jpg','2018-08-09 15:16:45','2018-08-09 15:16:45'),(75,'4.jpg','/upload/20180809/20180809031648537.jpg','2018-08-09 15:16:48','2018-08-09 15:16:48');

/*Table structure for table `li_categorys` */

DROP TABLE IF EXISTS `li_categorys`;

CREATE TABLE `li_categorys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) unsigned NOT NULL,
  `arrparentid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `child` tinyint(4) NOT NULL,
  `arrchildid` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键字',
  `describe` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `cate_tpl` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list' COMMENT '模板',
  `art_tpl` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show' COMMENT '文章模板',
  `display` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1显示，0不显示',
  `workflow_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核级别，0不需要审核',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `url` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `url` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_categorys` */

insert  into `li_categorys`(`id`,`parentid`,`arrparentid`,`child`,`arrchildid`,`name`,`thumb`,`title`,`keyword`,`describe`,`content`,`cate_tpl`,`art_tpl`,`display`,`workflow_id`,`type`,`sort`,`url`,`created_at`,`updated_at`) values (1,0,'0',0,'1','关于我们','/upload/20180809/20180809031400675.jpg','CoinCms','CoinCms','dd','<p>CoinCms</p>','page','show',1,0,0,0,'e03c8316-b072-e2e8-e512-0553f1eb36a8','2018-06-26 14:24:00','2018-08-09 15:14:02'),(2,0,'0',0,'2','新闻中心','/upload/20180809/20180809031408299.jpeg','新闻中心','新闻中心',NULL,'<p>新闻中心</p>','list','show',1,10,1,0,'9a3dc7e0-a117-b554-7dac-259fef518bbc','2018-07-25 15:18:26','2018-08-09 15:20:40'),(3,0,'0',0,'3','产品中心','/upload/20180809/20180809031416562.jpg','产品中心','产品中心','产品中心',NULL,'list_pro','show',1,10,1,0,'4d434995-b6ae-5a4f-5206-37fba7ba31ef','2018-08-07 11:27:14','2018-08-09 15:14:18');

/*Table structure for table `li_config` */

DROP TABLE IF EXISTS `li_config`;

CREATE TABLE `li_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sitename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '站点名称',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'SEO标题',
  `keyword` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关键字',
  `describe` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `theme` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'default' COMMENT '主题',
  `person` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系人',
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地址',
  `content` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '介绍',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_config` */

insert  into `li_config`(`id`,`sitename`,`title`,`keyword`,`describe`,`theme`,`person`,`phone`,`email`,`address`,`content`,`created_at`,`updated_at`) values (1,'CoinCms','CoinCms',NULL,NULL,'home','李','18932813211','coincms@163.com','北京市首都街156号19号楼2001','CoinCms，是一款以Laravel5.6为基础，结合了市场上众多CMS优点而自主开发的CMS系统。',NULL,'2018-08-09 15:31:13');

/*Table structure for table `li_hits` */

DROP TABLE IF EXISTS `li_hits`;

CREATE TABLE `li_hits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `art_id` int(11) NOT NULL DEFAULT '0' COMMENT '内容ID',
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2018' COMMENT '年',
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '01' COMMENT '月',
  `day` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '01' COMMENT '日',
  `hour` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00' COMMENT '时',
  `minute` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00' COMMENT '分',
  `ip` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00:00:00:00' COMMENT '来源IP',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_hits` */

insert  into `li_hits`(`id`,`cate_id`,`art_id`,`year`,`month`,`day`,`hour`,`minute`,`ip`,`created_at`,`updated_at`) values (1,0,0,'2018','08','09','15','49','192.168.3.103','2018-08-09 15:49:45','2018-08-09 15:49:45'),(2,0,0,'2018','8','9','15','55','192.168.3.103','2018-08-09 15:55:59','2018-08-09 15:55:59'),(3,1,0,'2018','8','9','16','4','192.168.3.103','2018-08-09 16:04:25','2018-08-09 16:04:25'),(4,3,10,'2018','8','9','16','4','192.168.3.103','2018-08-09 16:04:27','2018-08-09 16:04:27');

/*Table structure for table `li_link_types` */

DROP TABLE IF EXISTS `li_link_types`;

CREATE TABLE `li_link_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `li_link_types` */

/*Table structure for table `li_links` */

DROP TABLE IF EXISTS `li_links`;

CREATE TABLE `li_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_type_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类',
  `sitename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '站点名',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `linkurl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_links` */

/*Table structure for table `li_logs` */

DROP TABLE IF EXISTS `li_logs`;

CREATE TABLE `li_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_logs` */

insert  into `li_logs`(`id`,`admin_id`,`user`,`method`,`url`,`data`,`created_at`) values (1,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:00:05'),(2,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:00:23'),(3,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:00:38'),(4,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:01:19'),(5,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:01:31'),(6,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:04:33'),(7,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:04:36'),(8,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:05:40'),(9,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:05:51'),(10,1,'admin','GET','http://www.coincms.com/console/cate/index','[]','2018-08-09 16:06:28'),(11,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:06:29'),(12,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:06:34'),(13,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:06:54'),(14,1,'admin','GET','http://www.coincms.com/console/art/add','[]','2018-08-09 16:13:53'),(15,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:14:01'),(16,1,'admin','GET','http://www.coincms.com/console/cate/index','[]','2018-08-09 16:14:10'),(17,1,'admin','GET','http://www.coincms.com/console/art/index','[]','2018-08-09 16:14:10');

/*Table structure for table `li_menus` */

DROP TABLE IF EXISTS `li_menus`;

CREATE TABLE `li_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `arrparentid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `child` tinyint(1) NOT NULL DEFAULT '0',
  `arrchildid` mediumtext COLLATE utf8mb4_unicode_ci,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_menus` */

insert  into `li_menus`(`id`,`parentid`,`arrparentid`,`child`,`arrchildid`,`name`,`url`,`label`,`icon`,`display`,`sort`,`created_at`,`updated_at`) values (1,0,'0',1,'1,5,6,7,8,9,67,68,74,148,149,150,10,11,12,13,14,15,16,17,18,19,140,170,171,172,173,20,21','系统','index/index','index-index',NULL,1,99,'2016-03-18 15:46:02','2018-06-26 11:31:13'),(2,0,'0',1,'2,22,23,24,25,26,27,28,75,30,31,32,33,34,121,136,342,357,358,151,152,153,154,242,243,244,245,246,247,300,301,302,303,348,344,345,346,347,349,350,351,352,143,144,145,299,205,353,354,355,356','内容','content/index','content-index',NULL,1,0,'2016-03-18 15:46:21','2018-08-07 09:22:04'),(5,1,'0,1',1,'5,6,7,8,9,67,68,74,148,149,150','系统设置','sys/index','sys-index','glyphicon glyphicon-cog',1,0,'2016-03-18 15:47:40','2018-06-26 11:31:13'),(6,5,'0,1,5',1,'6,7,8,9','菜单管理','menu/index','menu-index',NULL,1,1,'2016-03-18 15:48:07','2017-04-25 21:49:25'),(7,6,'0,1,5,6',0,'7','添加菜单','menu/add','menu-add',NULL,1,0,'2016-03-18 15:49:03','2016-03-23 08:25:50'),(8,6,'0,1,5,6',0,'8','修改菜单','menu/edit','menu-edit',NULL,0,0,'2016-03-18 15:51:08','2016-03-23 14:23:43'),(9,6,'0,1,5,6',0,'9','删除菜单','menu/del','menu-del',NULL,0,0,'2016-03-18 15:51:30','2016-03-23 08:25:50'),(10,1,'0,1',1,'10,11,12,13,14,15,16,17,18,19,140,170,171,172,173','用户中心','admin/manage','admin-manage','glyphicon glyphicon-user',1,0,'2016-03-18 16:04:01','2017-06-30 13:01:01'),(11,10,'0,1,10',1,'11,12,13,14,15','用户管理','admin/index','admin-index',NULL,1,0,'2016-03-18 16:04:38','2016-03-24 11:31:08'),(12,11,'0,1,10,11',0,'12','添加用户','admin/add','admin-add',NULL,1,0,'2016-03-18 16:05:14','2016-03-24 11:31:16'),(13,11,'0,1,10,11',0,'13','修改用户','admin/edit','admin-edit',NULL,0,0,'2016-03-18 16:06:10','2016-03-24 11:31:24'),(14,11,'0,1,10,11',0,'14','删除用户','admin/del','admin-del',NULL,0,0,'2016-03-18 16:06:31','2016-03-24 11:31:32'),(15,11,'0,1,10,11',0,'15','修改密码','admin/pwd','admin-pwd',NULL,0,0,'2016-03-18 16:07:07','2016-03-24 11:31:44'),(16,10,'0,1,10',1,'16,17,18,19,140','角色管理','role/index','role-index',NULL,1,0,'2016-03-18 16:07:58','2016-12-02 09:41:15'),(17,16,'0,1,10,16',0,'17','添加角色','role/add','role-add',NULL,1,0,'2016-03-18 16:08:23','2016-03-23 08:25:50'),(18,16,'0,1,10,16',0,'18','修改角色','role/edit','role-edit',NULL,0,0,'2016-03-18 16:08:50','2016-03-23 08:25:50'),(19,16,'0,1,10,16',0,'19','删除角色','role/del','role-del',NULL,0,0,'2016-03-18 16:09:10','2016-03-23 08:25:50'),(20,1,'0,1',1,'20,21','系统信息','index/main','index-main',NULL,0,0,'2016-03-24 15:42:14','2017-07-21 19:06:04'),(21,20,'0,1,20',0,'21','左侧菜单','index/left','index-left',NULL,0,0,'2016-03-25 10:34:44','2016-03-25 10:35:27'),(22,2,'0,2',1,'22,23,24,25,26,27,28,75,30,31,32,33,34,121,136,342,357,358,151,152,153,154,242,243,244,245,246,247,300,301,302,303,348,344,345,346,347,349,350,351,352','内容管理','content/manage','content-manage','glyphicon glyphicon-book',1,0,'2016-03-29 08:39:52','2018-08-07 09:22:04'),(23,22,'0,2,22',1,'23,24,25,26,27','栏目管理','cate/index','cate-index',NULL,1,0,'2016-03-29 08:40:08','2016-03-29 08:41:30'),(24,23,'0,2,22,23',0,'24','添加栏目','cate/add','cate-add',NULL,1,0,'2016-03-29 08:40:25','2016-03-29 08:40:25'),(25,23,'0,2,22,23',0,'25','修改栏目','cate/edit','cate-edit',NULL,0,0,'2016-03-29 08:40:42','2016-03-29 08:41:00'),(26,23,'0,2,22,23',0,'26','删除栏目','cate/del','cate-del',NULL,0,0,'2016-03-29 08:40:54','2016-03-29 08:41:07'),(27,23,'0,2,22,23',0,'27','更新栏目缓存','cate/cache','cate-cache',NULL,0,0,'2016-03-29 08:41:30','2016-03-29 08:41:30'),(28,22,'0,2,22',1,'28,75','附件管理','attr/index','attr-index',NULL,0,5,'2016-03-31 08:23:28','2017-08-04 14:56:05'),(30,22,'0,2,22',1,'30,31,32,33,34,121,136,342,357,358','文章管理','art/index','art-index',NULL,1,0,'2016-03-31 08:25:22','2018-08-07 09:22:04'),(31,30,'0,2,22,30',0,'31','添加文章','art/add','art-add',NULL,1,0,'2016-03-31 08:25:40','2016-07-23 17:39:54'),(32,30,'0,2,22,30',0,'32','修改文章','art/edit','art-edit',NULL,0,0,'2016-03-31 08:25:59','2016-03-31 08:25:59'),(33,30,'0,2,22,30',0,'33','删除文章','art/del','art-del',NULL,0,0,'2016-03-31 08:26:15','2016-03-31 08:26:15'),(34,30,'0,2,22,30',0,'34','查看文章','art/show','art-show',NULL,0,0,'2016-03-31 08:26:35','2016-03-31 08:26:36'),(67,5,'0,1,5',1,'67,68','操作日志','log/index','log-index',NULL,1,4,'2016-04-11 10:38:34','2017-04-25 21:50:09'),(68,67,'0,1,5,67',0,'68','清除7天前日志','log/del','log-del',NULL,0,0,'2016-04-11 10:38:53','2016-05-11 17:37:46'),(74,5,'0,1,5',0,'74','更新缓存','index/cache','index-cache',NULL,1,5,'2016-04-11 16:00:30','2016-05-15 08:25:53'),(75,28,'0,2,22,28',0,'75','删除附件','attr/delfile','attr-delfile',NULL,0,0,'2016-05-09 19:29:09','2016-05-09 19:29:09'),(121,30,'0,2,22,30',0,'121','批量删除','art/alldel','art-alldel',NULL,0,0,'2016-06-15 08:52:32','2016-06-15 08:52:32'),(136,30,'0,2,22,30',0,'136','批量排序','art/listorder','art-listorder',NULL,0,0,'2016-07-25 08:35:42','2016-07-25 08:35:42'),(140,16,'0,1,10,16',0,'140','角色权限','role/priv','role-priv',NULL,0,0,'2016-07-25 11:34:39','2016-07-25 11:34:40'),(143,2,'0,2',1,'143,144,145','资料','admin/info','admin-info','glyphicon glyphicon-education',1,99,'2016-07-28 14:01:45','2018-06-26 09:41:39'),(144,143,'0,2,143',0,'144','修改个人资料','admin/myedit','admin-myedit',NULL,1,0,'2016-07-28 14:02:12','2018-06-26 09:40:27'),(145,143,'0,2,143',0,'145','修改个人密码','admin/mypwd','admin-mypwd',NULL,1,0,'2016-07-28 14:02:37','2018-06-26 09:40:27'),(148,5,'0,1,5',1,'148,149,150','数据管理','database/export','database-export',NULL,1,3,'2016-12-02 10:21:37','2017-04-25 21:50:02'),(149,148,'0,1,5,148',0,'149','恢复数据','database/import','database-import',NULL,0,0,'2016-12-02 10:22:16','2016-12-02 10:22:23'),(150,148,'0,1,5,148',0,'150','删除备份文件','database/delfile','database-delfile',NULL,0,0,'2016-12-02 10:22:47','2016-12-02 10:22:48'),(151,22,'0,2,22',1,'151,152,153,154','分类管理','type/index','type-index',NULL,1,2,'2016-12-14 09:56:01','2018-06-26 09:39:50'),(152,151,'0,2,22,151',0,'152','添加分类','type/add','type-add',NULL,1,0,'2016-12-14 09:56:23','2018-06-26 09:39:50'),(153,151,'0,2,22,151',0,'153','修改分类','type/edit','type-edit',NULL,0,0,'2016-12-14 09:56:42','2018-06-26 09:39:50'),(154,151,'0,2,22,151',0,'154','删除分类','type/del','type-del',NULL,0,0,'2016-12-14 09:56:57','2018-06-26 09:39:50'),(170,10,'0,1,10',1,'170,171,172,173','部门管理','section/index','section-index',NULL,1,0,'2016-12-15 08:31:39','2016-12-15 08:32:44'),(171,170,'0,1,10,170',0,'171','添加部门','section/add','section-add',NULL,1,0,'2016-12-15 08:32:01','2016-12-15 08:32:02'),(172,170,'0,1,10,170',0,'172','修改部门','section/edit','section-edit',NULL,0,0,'2016-12-15 08:32:23','2016-12-15 08:32:23'),(173,170,'0,1,10,170',0,'173','删除部门','section/del','section-del',NULL,0,0,'2016-12-15 08:32:44','2016-12-15 08:32:44'),(205,299,'0,2,299',0,'205','系统配置','config/index','config-index',NULL,1,0,'2017-04-25 21:49:13','2018-06-26 09:39:24'),(242,22,'0,2,22',1,'242,243,244,245,246,247','广告管理','ad/index','ad-index',NULL,1,0,'2017-05-16 06:34:07','2018-06-26 09:38:52'),(243,242,'0,2,22,242',0,'243','添加广告','ad/add','ad-add',NULL,1,0,'2017-05-16 06:34:25','2018-06-26 09:38:52'),(244,242,'0,2,22,242',0,'244','修改广告','ad/edit','ad-edit',NULL,0,0,'2017-05-16 06:34:40','2018-06-26 09:38:52'),(245,242,'0,2,22,242',0,'245','删除广告','ad/del','ad-del',NULL,0,0,'2017-05-16 06:34:55','2018-06-26 09:38:52'),(246,242,'0,2,22,242',0,'246','广告排序','ad/sort','ad-sort',NULL,0,0,'2017-05-16 06:35:11','2018-06-26 09:38:52'),(247,242,'0,2,22,242',0,'247','批量删除广告','ad/alldel','ad-alldel',NULL,0,0,'2017-05-16 06:35:35','2018-06-26 09:38:53'),(299,2,'0,2',1,'299,205,353,354,355,356','设置','sys/set','sys-set','glyphicon glyphicon-blackboard',1,98,'2017-07-01 09:18:39','2018-08-06 15:42:50'),(300,22,'0,2,22',1,'300,301,302,303,348','广告位管理','adpos/index','adpos-index',NULL,1,0,'2017-07-01 09:19:12','2018-06-26 11:35:49'),(301,300,'0,2,22,300',0,'301','添加广告位','adpos/add','adpos-add',NULL,1,0,'2017-07-01 09:19:37','2018-06-26 09:39:04'),(302,300,'0,2,22,300',0,'302','修改广告位','adpos/edit','adpos-edit',NULL,0,0,'2017-07-01 09:19:59','2018-06-26 09:39:04'),(303,300,'0,2,22,300',0,'303','删除广告位','adpos/del','adpos-del',NULL,0,0,'2017-07-01 09:20:21','2018-06-26 09:39:04'),(342,30,'0,2,22,30',0,'342','文章选择','art/select','art-select',NULL,0,0,'2017-08-18 11:51:16','2017-11-07 09:46:42'),(344,22,'0,2,22',1,'344,345,346,347','友情链接','link/index','link-index',NULL,1,0,'2018-06-26 11:34:44','2018-06-26 11:35:30'),(345,344,'0,2,22,344',0,'345','添加友情链接','link/add','link-add',NULL,1,0,'2018-06-26 11:35:00','2018-06-26 11:35:01'),(346,344,'0,2,22,344',0,'346','修改友情链接','link/edit','link-edit',NULL,0,0,'2018-06-26 11:35:14','2018-06-26 11:35:14'),(347,344,'0,2,22,344',0,'347','删除友情链接','link/del','link-del',NULL,0,0,'2018-06-26 11:35:30','2018-06-26 11:35:30'),(348,300,'0,2,22,300',0,'348','友情链接排序','link/sort','link-sort',NULL,0,0,'2018-06-26 11:35:48','2018-06-26 11:35:49'),(349,22,'0,2,22',1,'349,350,351,352','友情链接分类','linktype/index','linktype-index',NULL,1,0,'2018-06-26 11:36:07','2018-06-26 11:36:51'),(350,349,'0,2,22,349',0,'350','添加分类','linktype/add','linktype-add',NULL,1,0,'2018-06-26 11:36:21','2018-06-26 11:36:21'),(351,349,'0,2,22,349',0,'351','修改分类','linktype/edit','linktype-edit',NULL,0,0,'2018-06-26 11:36:34','2018-06-26 11:36:34'),(352,349,'0,2,22,349',0,'352','删除分类','linktype/del','linktype-del',NULL,0,0,'2018-06-26 11:36:51','2018-06-26 11:36:51'),(353,299,'0,2,299',1,'353,354,355,356','工作流','workflow/index','workflow-index',NULL,1,0,'2018-08-06 15:41:58','2018-08-06 15:42:50'),(354,353,'0,2,299,353',0,'354','添加工作流','workflow/add','workflow-add',NULL,1,0,'2018-08-06 15:42:15','2018-08-06 15:42:16'),(355,353,'0,2,299,353',0,'355','修改工作流','workflow/edit','workflow-edit',NULL,0,0,'2018-08-06 15:42:34','2018-08-06 15:42:56'),(356,353,'0,2,299,353',0,'356','删除工作流','workflow/del','workflow-del',NULL,0,0,'2018-08-06 15:42:50','2018-08-06 15:42:50'),(357,30,'0,2,22,30',0,'357','文章审核','art/status','art-status',NULL,0,0,'2018-08-07 09:21:18','2018-08-07 09:21:18'),(358,30,'0,2,22,30',0,'358','批量审核','art/allstatus','art-allstatus',NULL,0,0,'2018-08-07 09:22:04','2018-08-07 09:22:04');

/*Table structure for table `li_migrations` */

DROP TABLE IF EXISTS `li_migrations`;

CREATE TABLE `li_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_migrations` */

/*Table structure for table `li_role_privs` */

DROP TABLE IF EXISTS `li_role_privs`;

CREATE TABLE `li_role_privs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_privs_roleid_index` (`role_id`),
  KEY `role_privs_url_index` (`url`),
  KEY `role_privs_label_index` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_role_privs` */

insert  into `li_role_privs`(`id`,`menu_id`,`role_id`,`url`,`label`,`created_at`,`updated_at`) values (1,1,2,'index/index','index-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(2,2,2,'content/index','content-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(3,5,2,'sys/index','sys-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(4,6,2,'menu/index','menu-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(5,7,2,'menu/add','menu-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(6,8,2,'menu/edit','menu-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(7,9,2,'menu/del','menu-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(8,10,2,'admin/manage','admin-manage','2018-08-09 08:39:32','2018-08-09 08:39:32'),(9,11,2,'admin/index','admin-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(10,12,2,'admin/add','admin-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(11,13,2,'admin/edit','admin-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(12,14,2,'admin/del','admin-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(13,15,2,'admin/pwd','admin-pwd','2018-08-09 08:39:32','2018-08-09 08:39:32'),(14,16,2,'role/index','role-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(15,17,2,'role/add','role-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(16,18,2,'role/edit','role-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(17,19,2,'role/del','role-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(18,20,2,'index/main','index-main','2018-08-09 08:39:32','2018-08-09 08:39:32'),(19,21,2,'index/left','index-left','2018-08-09 08:39:32','2018-08-09 08:39:32'),(20,22,2,'content/manage','content-manage','2018-08-09 08:39:32','2018-08-09 08:39:32'),(21,23,2,'cate/index','cate-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(22,24,2,'cate/add','cate-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(23,25,2,'cate/edit','cate-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(24,26,2,'cate/del','cate-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(25,27,2,'cate/cache','cate-cache','2018-08-09 08:39:32','2018-08-09 08:39:32'),(26,28,2,'attr/index','attr-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(27,30,2,'art/index','art-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(28,31,2,'art/add','art-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(29,32,2,'art/edit','art-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(30,34,2,'art/show','art-show','2018-08-09 08:39:32','2018-08-09 08:39:32'),(31,67,2,'log/index','log-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(32,68,2,'log/del','log-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(33,74,2,'index/cache','index-cache','2018-08-09 08:39:32','2018-08-09 08:39:32'),(34,75,2,'attr/delfile','attr-delfile','2018-08-09 08:39:32','2018-08-09 08:39:32'),(35,121,2,'art/alldel','art-alldel','2018-08-09 08:39:32','2018-08-09 08:39:32'),(36,136,2,'art/listorder','art-listorder','2018-08-09 08:39:32','2018-08-09 08:39:32'),(37,140,2,'role/priv','role-priv','2018-08-09 08:39:32','2018-08-09 08:39:32'),(38,143,2,'admin/info','admin-info','2018-08-09 08:39:32','2018-08-09 08:39:32'),(39,144,2,'admin/myedit','admin-myedit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(40,145,2,'admin/mypwd','admin-mypwd','2018-08-09 08:39:32','2018-08-09 08:39:32'),(41,148,2,'database/export','database-export','2018-08-09 08:39:32','2018-08-09 08:39:32'),(42,149,2,'database/import','database-import','2018-08-09 08:39:32','2018-08-09 08:39:32'),(43,150,2,'database/delfile','database-delfile','2018-08-09 08:39:32','2018-08-09 08:39:32'),(44,151,2,'type/index','type-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(45,152,2,'type/add','type-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(46,153,2,'type/edit','type-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(47,154,2,'type/del','type-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(48,170,2,'section/index','section-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(49,171,2,'section/add','section-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(50,172,2,'section/edit','section-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(51,173,2,'section/del','section-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(52,205,2,'config/index','config-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(53,242,2,'ad/index','ad-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(54,243,2,'ad/add','ad-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(55,244,2,'ad/edit','ad-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(56,245,2,'ad/del','ad-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(57,246,2,'ad/sort','ad-sort','2018-08-09 08:39:32','2018-08-09 08:39:32'),(58,247,2,'ad/alldel','ad-alldel','2018-08-09 08:39:32','2018-08-09 08:39:32'),(59,299,2,'sys/set','sys-set','2018-08-09 08:39:32','2018-08-09 08:39:32'),(60,300,2,'adpos/index','adpos-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(61,301,2,'adpos/add','adpos-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(62,302,2,'adpos/edit','adpos-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(63,303,2,'adpos/del','adpos-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(64,342,2,'art/select','art-select','2018-08-09 08:39:32','2018-08-09 08:39:32'),(65,344,2,'link/index','link-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(66,345,2,'link/add','link-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(67,346,2,'link/edit','link-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(68,347,2,'link/del','link-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(69,348,2,'link/sort','link-sort','2018-08-09 08:39:32','2018-08-09 08:39:32'),(70,349,2,'linktype/index','linktype-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(71,350,2,'linktype/add','linktype-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(72,351,2,'linktype/edit','linktype-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(73,352,2,'linktype/del','linktype-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(74,353,2,'workflow/index','workflow-index','2018-08-09 08:39:32','2018-08-09 08:39:32'),(75,354,2,'workflow/add','workflow-add','2018-08-09 08:39:32','2018-08-09 08:39:32'),(76,355,2,'workflow/edit','workflow-edit','2018-08-09 08:39:32','2018-08-09 08:39:32'),(77,356,2,'workflow/del','workflow-del','2018-08-09 08:39:32','2018-08-09 08:39:32'),(78,357,2,'art/status','art-status','2018-08-09 08:39:32','2018-08-09 08:39:32'),(79,358,2,'art/allstatus','art-allstatus','2018-08-09 08:39:32','2018-08-09 08:39:32');

/*Table structure for table `li_role_users` */

DROP TABLE IF EXISTS `li_role_users`;

CREATE TABLE `li_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_role_users` */

insert  into `li_role_users`(`role_id`,`user_id`) values (1,1),(1,8),(1,9),(1,10),(2,3),(2,2);

/*Table structure for table `li_roles` */

DROP TABLE IF EXISTS `li_roles`;

CREATE TABLE `li_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_roles` */

insert  into `li_roles`(`id`,`name`,`status`,`created_at`,`updated_at`) values (1,'超级管理员',1,'2016-03-18 16:42:51','2017-07-22 09:42:39'),(2,'编辑人员',1,'2018-08-09 08:39:13','2018-08-09 08:39:13');

/*Table structure for table `li_sections` */

DROP TABLE IF EXISTS `li_sections`;

CREATE TABLE `li_sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_sections` */

insert  into `li_sections`(`id`,`name`,`status`,`created_at`,`updated_at`) values (1,'市场',1,'2016-12-15 08:43:05','2017-07-22 09:42:44');

/*Table structure for table `li_types` */

DROP TABLE IF EXISTS `li_types`;

CREATE TABLE `li_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned NOT NULL,
  `arrparentid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `child` tinyint(4) DEFAULT NULL,
  `arrchildid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `li_types` */

/*Table structure for table `li_workflow_admin` */

DROP TABLE IF EXISTS `li_workflow_admin`;

CREATE TABLE `li_workflow_admin` (
  `workflow_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '工作流ID',
  `steps` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '级别',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_workflow_admin` */

insert  into `li_workflow_admin`(`workflow_id`,`steps`,`admin_id`) values (10,1,1),(10,2,10);

/*Table structure for table `li_workflow_logs` */

DROP TABLE IF EXISTS `li_workflow_logs`;

CREATE TABLE `li_workflow_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `art_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `steps` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '哪一级',
  `result` tinyint(4) NOT NULL DEFAULT '1' COMMENT '处理结果：0退稿，1通过',
  `mark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_workflow_logs` */

insert  into `li_workflow_logs`(`id`,`art_id`,`admin_id`,`steps`,`result`,`mark`,`created_at`,`updated_at`) values (1,2,8,99,1,'发布新文章成功！','2018-08-07 11:41:23','2018-08-07 11:41:23'),(2,3,10,99,1,'发布新文章成功！','2018-08-07 11:48:26','2018-08-07 11:48:26'),(3,3,8,1,0,'第一级审核结果：退稿！','2018-08-07 11:50:24','2018-08-07 11:50:24'),(4,3,10,0,1,'重新发布文章成功！','2018-08-07 12:00:15','2018-08-07 12:00:15'),(5,3,8,1,1,'第一级审核结果：通过！','2018-08-07 12:00:29','2018-08-07 12:00:29'),(6,4,10,99,1,'发布新文章成功！','2018-08-07 12:02:24','2018-08-07 12:02:24'),(7,5,1,99,1,'发布新文章成功！','2018-08-07 14:18:40','2018-08-07 14:18:40'),(8,5,8,1,0,'第一级审核结果：退稿！','2018-08-07 14:36:22','2018-08-07 14:36:22'),(9,4,8,1,0,'第一级审核结果：退稿！','2018-08-07 14:36:37','2018-08-07 14:36:37'),(10,2,1,1,1,NULL,'2018-08-07 14:38:19','2018-08-07 14:38:19'),(11,3,1,1,1,NULL,'2018-08-07 14:38:19','2018-08-07 14:38:19'),(12,4,1,1,1,NULL,'2018-08-07 14:38:19','2018-08-07 14:38:19'),(13,5,1,1,1,NULL,'2018-08-07 14:38:19','2018-08-07 14:38:19'),(14,6,1,99,1,'发布新文章成功！','2018-08-07 14:40:02','2018-08-07 14:40:02'),(15,6,8,1,0,'第一级审核结果：退稿！','2018-08-07 14:40:37','2018-08-07 14:40:37'),(16,2,1,1,1,NULL,'2018-08-07 14:43:25','2018-08-07 14:43:25'),(17,3,1,1,1,NULL,'2018-08-07 14:43:25','2018-08-07 14:43:25'),(18,4,1,1,1,NULL,'2018-08-07 14:43:25','2018-08-07 14:43:25'),(19,5,1,1,1,NULL,'2018-08-07 14:43:25','2018-08-07 14:43:25'),(20,6,1,1,1,NULL,'2018-08-07 14:43:25','2018-08-07 14:43:25'),(21,7,1,99,1,'发布新文章成功！','2018-08-07 14:45:23','2018-08-07 14:45:23'),(22,7,10,1,1,'第一级审核结果：通过！','2018-08-07 14:45:37','2018-08-07 14:45:37'),(23,7,8,2,0,'第二级审核结果：退稿！','2018-08-07 14:46:04','2018-08-07 14:46:04'),(24,7,1,0,1,'重新发布文章成功！','2018-08-07 14:46:47','2018-08-07 14:46:47'),(25,8,1,99,1,'发布新文章成功！','2018-08-07 15:54:35','2018-08-07 15:54:35'),(26,8,10,1,0,'第一级审核结果：退稿！','2018-08-07 16:03:42','2018-08-07 16:03:42'),(27,8,1,0,1,'重新发布文章成功！','2018-08-07 16:04:03','2018-08-07 16:04:03'),(28,9,1,99,1,'发布新文章成功！','2018-08-07 16:11:19','2018-08-07 16:11:19'),(29,9,10,1,1,'第一级审核结果：通过！','2018-08-07 16:11:49','2018-08-07 16:11:49'),(30,9,8,2,1,'第二级审核结果：通过！','2018-08-07 16:12:53','2018-08-07 16:12:53'),(31,9,9,3,0,'第三级审核结果：退稿！','2018-08-07 16:13:19','2018-08-07 16:13:19'),(32,9,1,0,1,'重新发布文章成功！','2018-08-07 16:19:03','2018-08-07 16:19:03'),(33,9,10,1,1,'第一级审核结果：通过！','2018-08-07 16:23:44','2018-08-07 16:23:44'),(34,9,8,2,1,'第二级审核结果：通过！','2018-08-07 16:24:35','2018-08-07 16:24:35'),(35,9,9,3,1,'第三级审核结果：通过！','2018-08-07 16:25:22','2018-08-07 16:25:22'),(36,10,8,99,1,'发布新文章成功！','2018-08-07 16:28:16','2018-08-07 16:28:16'),(37,10,1,1,1,'第一级审核结果：通过！','2018-08-07 16:28:57','2018-08-07 16:28:57'),(38,10,10,2,0,'第二级审核结果：退稿！','2018-08-07 16:29:23','2018-08-07 16:29:23'),(39,10,8,0,1,'重新发布文章成功！','2018-08-07 16:30:40','2018-08-07 16:30:40'),(40,10,1,1,1,'第一级审核结果：通过！','2018-08-07 16:30:52','2018-08-07 16:30:52'),(41,10,10,2,1,'第二级审核结果：通过！','2018-08-07 16:31:12','2018-08-07 16:31:12'),(42,11,1,99,1,'发布新文章成功！','2018-08-07 16:54:11','2018-08-07 16:54:11'),(43,11,1,1,1,'第一级审核结果：通过！','2018-08-07 16:54:45','2018-08-07 16:54:45'),(44,11,10,2,1,'第二级审核结果：通过！','2018-08-07 16:55:16','2018-08-07 16:55:16'),(45,2,1,0,1,'重新发布文章成功！','2018-08-09 10:10:16','2018-08-09 10:10:16'),(46,3,1,0,1,'重新发布文章成功！','2018-08-09 10:10:25','2018-08-09 10:10:25'),(47,3,1,0,1,'重新发布文章成功！','2018-08-09 15:15:02','2018-08-09 15:15:02'),(48,11,1,0,1,'修改后重新发布文章成功！','2018-08-09 15:18:52','2018-08-09 15:18:52'),(49,12,1,99,1,'发布新文章成功！','2018-08-09 15:20:25','2018-08-09 15:20:25'),(50,12,1,0,1,'修改后重新发布文章成功！','2018-08-09 15:20:50','2018-08-09 15:20:50');

/*Table structure for table `li_workflows` */

DROP TABLE IF EXISTS `li_workflows`;

CREATE TABLE `li_workflows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `steps` tinyint(4) NOT NULL COMMENT '所需级数',
  `workname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `li_workflows` */

insert  into `li_workflows`(`id`,`steps`,`workname`,`description`,`created_at`,`updated_at`) values (10,2,'三级审核',NULL,'2018-08-07 14:44:11','2018-08-07 16:26:34');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
