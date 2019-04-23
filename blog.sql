/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.5.60 : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `cid` mediumint(10) NOT NULL COMMENT '文章所属专栏',
  `aname` varchar(32) NOT NULL COMMENT '文章名称',
  `author` varchar(32) NOT NULL COMMENT '文章作者',
  `click` mediumint(9) DEFAULT '0' COMMENT '文章点击次数',
  `content` text NOT NULL COMMENT '文章内容 MD',
  `html` text COMMENT '文章内容 html',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `article` */

insert  into `article`(`id`,`cid`,`aname`,`author`,`click`,`content`,`html`,`created`,`updated`) values 
(12,13,'测试','杨雨衡',0,'### 测试\r\n\r\n![](http://localhost:8080/static/upload/56df6904-8c8e-4cfc-9a13-29d818008809.jpg)','<h3 id=\"h3-u6D4Bu8BD5\"><a name=\"测试\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>测试</h3><p><img src=\"http://localhost:8080/static/upload/56df6904-8c8e-4cfc-9a13-29d818008809.jpg\" alt=\"\"></p>\r\n','2018-11-20 00:22:31','2018-11-20 00:22:31');

/*Table structure for table `column` */

DROP TABLE IF EXISTS `column`;

CREATE TABLE `column` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) DEFAULT NULL COMMENT '专栏链接地址',
  `cname` varchar(32) DEFAULT NULL COMMENT '专栏名称',
  `describe` varchar(32) DEFAULT NULL COMMENT '专栏描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `column` */

insert  into `column`(`id`,`img`,`cname`,`describe`,`created`,`updated`) values 
(12,'http://localhost:8080/static/upload/fb28b51a-fa51-4e13-97c3-63b6b6e042ee.jpg','Java 面试宝典','除了 “offer” 我和你没什么好谈的','2018-11-16 18:03:54','2018-11-16 18:03:54'),
(13,'http://localhost:8080/static/upload/a41715b5-fab7-436a-a3e7-d03085eb8e77.jpg','Java 单体应用','走向 “单体地狱”','2018-11-16 18:04:01','2018-11-16 18:04:01');

/*Table structure for table `main` */

DROP TABLE IF EXISTS `main`;

CREATE TABLE `main` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `h1` varchar(32) DEFAULT NULL COMMENT '首页标语 1',
  `h2` varchar(32) DEFAULT NULL COMMENT '首页标语 2',
  `h3` varchar(32) DEFAULT NULL COMMENT '首页标语 3',
  `img` varchar(100) DEFAULT NULL COMMENT '首页图片地址',
  `h4` varchar(32) DEFAULT NULL COMMENT '首页标语 4',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `main` */

insert  into `main`(`id`,`h1`,`h2`,`h3`,`img`,`h4`,`created`,`updated`) values 
(1,'Every day to be a little better','	有道无术，术尚可求，有术无道，止于术','	道是思想，术是方法','http://localhost:8080/static/upload/52ae9af1-a90a-4f09-91f5-676204b7db81.png','做真实的自己，用心在 Coding','2018-11-14 12:10:43','2018-11-16 21:55:15');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `phone` varchar(32) DEFAULT NULL COMMENT '手机号',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `manager` */

insert  into `manager`(`id`,`username`,`password`,`phone`,`created`,`updated`) values 
(1,'Yuu','a3aa33efff25d9bb5afc3258cf4550a4','13055206361','2018-11-13 09:25:15','2018-11-13 09:25:19');

/*Table structure for table `tool` */

DROP TABLE IF EXISTS `tool`;

CREATE TABLE `tool` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(10) DEFAULT NULL COMMENT '属于哪个分类的工具',
  `isparent` tinyint(10) DEFAULT '0' COMMENT '是否有子工具',
  `tname` varchar(32) DEFAULT NULL COMMENT '工具名称',
  `link` varchar(100) DEFAULT NULL COMMENT '工具链接',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `tool` */

insert  into `tool`(`id`,`pid`,`isparent`,`tname`,`link`,`created`,`updated`) values 
(1,0,1,'常用工具','#','2018-11-13 11:31:35','2018-11-14 14:16:29'),
(12,1,1,'在线编辑','#','2018-11-14 15:22:32','2018-11-14 15:22:32'),
(13,1,1,'在线服务','#','2018-11-14 15:22:40','2018-11-14 15:22:40'),
(14,1,1,'开源镜像','#','2018-11-14 15:22:51','2018-11-14 15:22:51'),
(15,1,1,'在线文档','#','2018-11-14 15:23:00','2018-11-14 15:23:00'),
(16,1,1,'趋势分析','#','2018-11-14 15:23:07','2018-11-14 15:23:07'),
(17,12,0,'PDF 转换器','https://smallpdf.com/cn/pdf-to-word','2018-11-14 15:23:27','2018-11-15 10:46:24'),
(18,12,0,'JSON 编辑器','https://www.bejson.com/jsoneditoronline','2018-11-14 15:25:59','2018-11-14 15:25:59'),
(19,13,0,'BOOT CDN','https://www.bootcdn.cn/','2018-11-14 15:26:16','2018-11-14 15:26:16'),
(20,13,0,'百度 CDN','http://cdn.code.baidu.com/','2018-11-14 15:26:34','2018-11-14 15:26:34'),
(21,14,0,'OPSX','https://opsx.alibaba.com/','2018-11-14 15:26:48','2018-11-14 15:26:48'),
(22,15,0,'VUE','https://cn.vuejs.org/v2/api/','2018-11-14 15:27:04','2018-11-14 15:27:04'),
(23,16,0,'谷歌趋势','https://trends.google.com/trends/?geo=US','2018-11-14 15:27:20','2018-11-14 15:27:20'),
(24,12,0,'MD 表格生成','https://tool.lu/tables/','2018-11-14 18:11:50','2018-11-14 18:11:50'),
(25,12,0,'CRON 表达式','http://cron.qqe2.com/','2018-11-14 18:12:11','2018-11-14 18:12:11'),
(26,12,0,'代码格式化','http://tool.oschina.net/codeformat/html','2018-11-14 18:12:41','2018-11-14 18:12:41'),
(27,12,0,'公式编辑器','https://zh.numberempire.com/latexequationeditor.php','2018-11-14 18:13:17','2018-11-14 18:13:17'),
(28,12,0,'二维码生成器','https://cli.im/','2018-11-14 18:13:38','2018-11-14 18:13:38'),
(29,12,0,'在线编码转换','http://tool.chinaz.com/tools/native_ascii.aspx','2018-11-14 18:14:57','2018-11-14 18:14:57'),
(30,12,0,'YAML <-> PROPERTIES','http://www.toyaml.com/','2018-11-14 18:15:24','2018-11-14 18:15:24'),
(31,13,0,'微信 CDN ','http://qydev.weixin.qq.com/cdn/cdnjs.html','2018-11-14 18:15:56','2018-11-14 18:15:56'),
(32,13,0,'科大谷歌字体加速','https://servers.ustclug.org/2014/06/blog-googlefonts-speedup/','2018-11-14 18:16:14','2018-11-14 18:16:14'),
(33,14,0,'AZURE','https://mirror.azure.cn/','2018-11-14 18:16:36','2018-11-14 18:16:36'),
(34,14,0,'DOCKER HUB','https://hub.docker.com/','2018-11-14 18:16:57','2018-11-14 18:16:57'),
(35,15,0,'VUEX','https://vuex.vuejs.org/zh/api/#vuex-store','2018-11-14 18:17:14','2018-11-14 18:17:14'),
(36,15,0,'JQUERY','https://www.jquery123.com/','2018-11-14 18:17:27','2018-11-14 18:17:27'),
(37,15,0,'BOOTSTRAP','http://www.runoob.com/bootstrap/bootstrap-tutorial.html','2018-11-14 18:17:42','2018-11-14 18:17:42'),
(38,16,0,'百度指数','http://index.baidu.com/#/','2018-11-14 18:18:00','2018-11-14 18:18:00'),
(39,16,0,'百度流量研究院','https://tongji.baidu.com/data/browser','2018-11-14 18:18:20','2018-11-14 18:18:20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
