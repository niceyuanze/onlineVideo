-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.1.17-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 nutzwk 的数据库结构
CREATE DATABASE IF NOT EXISTS `nutzwk` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nutzwk`;


-- 导出  表 nutzwk.cms_article 结构
CREATE TABLE IF NOT EXISTS `cms_article` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `shopid` varchar(32) DEFAULT NULL COMMENT '预留商城ID',
  `title` varchar(120) DEFAULT NULL COMMENT '文章标题',
  `info` varchar(500) DEFAULT NULL COMMENT '文章简介',
  `author` varchar(50) DEFAULT NULL COMMENT '文章作者',
  `picurl` varchar(255) DEFAULT NULL COMMENT '标题图',
  `content` text COMMENT '文章内容',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `publishAt` int(32) DEFAULT NULL COMMENT '发布时间',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `channelId` varchar(32) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.cms_article 的数据：~0 rows (大约)
DELETE FROM `cms_article`;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;


-- 导出  表 nutzwk.cms_channel 结构
CREATE TABLE IF NOT EXISTS `cms_channel` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `shopid` varchar(32) DEFAULT NULL COMMENT '预留商城ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `type` varchar(20) DEFAULT NULL COMMENT '栏目类型',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `isShow` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.cms_channel 的数据：~0 rows (大约)
DELETE FROM `cms_channel`;
/*!40000 ALTER TABLE `cms_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_channel` ENABLE KEYS */;


-- 导出  表 nutzwk.cms_class_link 结构
CREATE TABLE IF NOT EXISTS `cms_class_link` (
  `classId` varchar(32) DEFAULT NULL,
  `linkId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.cms_class_link 的数据：~0 rows (大约)
DELETE FROM `cms_class_link`;
/*!40000 ALTER TABLE `cms_class_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_class_link` ENABLE KEYS */;


-- 导出  表 nutzwk.cms_link 结构
CREATE TABLE IF NOT EXISTS `cms_link` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(120) DEFAULT NULL COMMENT '链接名称',
  `type` varchar(20) DEFAULT NULL COMMENT '链接类型',
  `picurl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `target` varchar(20) DEFAULT NULL COMMENT '打开方式',
  `classId` varchar(32) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.cms_link 的数据：~0 rows (大约)
DELETE FROM `cms_link`;
/*!40000 ALTER TABLE `cms_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_link` ENABLE KEYS */;


-- 导出  表 nutzwk.cms_link_class 结构
CREATE TABLE IF NOT EXISTS `cms_link_class` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(120) DEFAULT NULL COMMENT '分类名称',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.cms_link_class 的数据：~0 rows (大约)
DELETE FROM `cms_link_class`;
/*!40000 ALTER TABLE `cms_link_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_link_class` ENABLE KEYS */;


-- 导出  表 nutzwk.cms_site 结构
CREATE TABLE IF NOT EXISTS `cms_site` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `shopid` varchar(32) DEFAULT NULL COMMENT '预留商城ID',
  `site_name` varchar(120) DEFAULT NULL COMMENT '名称',
  `site_domain` varchar(120) DEFAULT NULL COMMENT '域名',
  `site_icp` varchar(120) DEFAULT NULL COMMENT 'ICP',
  `site_logo` varchar(255) DEFAULT NULL COMMENT 'LOGO',
  `site_wap_logo` varchar(255) DEFAULT NULL COMMENT 'WAPLOGO',
  `site_qq` varchar(20) DEFAULT NULL COMMENT '客服QQ',
  `site_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `site_tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `weibo_name` varchar(50) DEFAULT NULL COMMENT '微博',
  `weibo_url` varchar(255) DEFAULT NULL COMMENT '微博地址',
  `weibo_qrcode` varchar(255) DEFAULT NULL COMMENT '微博二维码',
  `wechat_name` varchar(50) DEFAULT NULL COMMENT '微信名称',
  `wechat_id` varchar(50) DEFAULT NULL COMMENT '微信ID',
  `wechat_qrcode` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `seo_keywords` varchar(255) DEFAULT NULL COMMENT '关键词',
  `seo_description` varchar(255) DEFAULT NULL COMMENT '描述',
  `footer_content` text COMMENT '底部版权',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.cms_site 的数据：~1 rows (大约)
DELETE FROM `cms_site`;
/*!40000 ALTER TABLE `cms_site` DISABLE KEYS */;
INSERT INTO `cms_site` (`id`, `shopid`, `site_name`, `site_domain`, `site_icp`, `site_logo`, `site_wap_logo`, `site_qq`, `site_email`, `site_tel`, `weibo_name`, `weibo_url`, `weibo_qrcode`, `wechat_name`, `wechat_id`, `wechat_qrcode`, `seo_keywords`, `seo_description`, `footer_content`, `opBy`, `opAt`, `delFlag`) VALUES
	('site', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '295da53a22ec43f980a80135b0fe9cf7', 1492247629, 0);
/*!40000 ALTER TABLE `cms_site` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_api 结构
CREATE TABLE IF NOT EXISTS `sys_api` (
  `id` varchar(32) NOT NULL,
  `appName` varchar(20) DEFAULT NULL COMMENT 'appName',
  `appId` varchar(255) DEFAULT NULL COMMENT 'appId',
  `appSecret` varchar(255) DEFAULT NULL COMMENT 'appSecret',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_api 的数据：~0 rows (大约)
DELETE FROM `sys_api`;
/*!40000 ALTER TABLE `sys_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_api` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_config 结构
CREATE TABLE IF NOT EXISTS `sys_config` (
  `configKey` varchar(100) NOT NULL,
  `configValue` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`configKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_config 的数据：~4 rows (大约)
DELETE FROM `sys_config`;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`configKey`, `configValue`, `note`, `opBy`, `opAt`, `delFlag`) VALUES
	('AppDomain', '127.0.0.1', '系统域名', '', 1492247370, 0),
	('AppName', 'Nutz 开发框架', '系统名称', '', 1492247370, 0),
	('AppShrotName', 'NutzWk', '系统短名称', '', 1492247370, 0),
	('AppUploadPath', '/upload', '文件上传文件夹', '', 1492247370, 0);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_dict 结构
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `code` varchar(20) DEFAULT NULL COMMENT '机构编码',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_DICT_PATH` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_dict 的数据：~0 rows (大约)
DELETE FROM `sys_dict`;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_log 结构
CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL COMMENT '创建昵称',
  `type` varchar(20) DEFAULT NULL COMMENT '日志类型',
  `tag` varchar(50) DEFAULT NULL COMMENT '日志标识',
  `src` varchar(255) DEFAULT NULL COMMENT '执行类',
  `ip` varchar(255) DEFAULT NULL COMMENT '来源IP',
  `msg` text COMMENT '日志内容',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_log 的数据：~14 rows (大约)
DELETE FROM `sys_log`;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `username`, `type`, `tag`, `src`, `ip`, `msg`, `opBy`, `opAt`, `delFlag`) VALUES
	(1, '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '127.0.0.1', '成功登录系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492247392, NULL),
	(2, '超级管理员', 'info', '用户登出', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#logout', '127.0.0.1', '成功退出系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492247560, NULL),
	(3, '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '127.0.0.1', '成功登录系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492247611, NULL),
	(4, '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '127.0.0.1', '成功登录系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492411812, NULL),
	(5, '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '127.0.0.1', '成功登录系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492412850, NULL),
	(6, '超级管理员', 'aop.after', '修改参数', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysConfController#editDo', '127.0.0.1', 'AppName:Nutz 开发框架', '295da53a22ec43f980a80135b0fe9cf7', 1492412879, NULL),
	(7, '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '127.0.0.1', '成功登录系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492419713, NULL),
	(8, '超级管理员', 'aop.after', '新建字典', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysDictController#addDo', '127.0.0.1', '字典名称:12', '295da53a22ec43f980a80135b0fe9cf7', 1492420048, NULL),
	(9, '超级管理员', 'aop.after', '删除字典', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysDictController#delete', '127.0.0.1', '字典名称:12', '295da53a22ec43f980a80135b0fe9cf7', 1492420078, NULL),
	(10, '超级管理员', 'aop.after', '修改任务', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysTaskController#editDo', '127.0.0.1', '任务名:测试任务', '295da53a22ec43f980a80135b0fe9cf7', 1492420188, NULL),
	(11, '超级管理员', 'aop.after', '启用任务', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysTaskController#enable', '127.0.0.1', '任务名:测试任务', '295da53a22ec43f980a80135b0fe9cf7', 1492420194, NULL),
	(12, '超级管理员', 'aop.after', '禁用任务', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysTaskController#disable', '127.0.0.1', '任务名:测试任务', '295da53a22ec43f980a80135b0fe9cf7', 1492420207, NULL),
	(13, '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '127.0.0.1', '成功登录系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492426278, NULL),
	(14, '超级管理员', 'info', '用户登陆', 'cn.wizzer.app.web.modules.controllers.platform.sys.SysLoginController#doLogin', '127.0.0.1', '成功登录系统！', '295da53a22ec43f980a80135b0fe9cf7', 1492431586, NULL);
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `aliasName` varchar(100) DEFAULT NULL COMMENT '菜单别名',
  `type` varchar(10) DEFAULT NULL COMMENT '资源类型',
  `href` varchar(255) DEFAULT NULL COMMENT '菜单链接',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `isShow` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `note` varchar(255) DEFAULT NULL COMMENT '菜单介绍',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_MENU_PATH` (`path`),
  UNIQUE KEY `INDEX_SYS_MENU_PREM` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_menu 的数据：~115 rows (大约)
DELETE FROM `sys_menu`;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`id`, `parentId`, `path`, `name`, `aliasName`, `type`, `href`, `target`, `icon`, `isShow`, `disabled`, `permission`, `note`, `location`, `hasChildren`, `opBy`, `opAt`, `delFlag`) VALUES
	('00f3f2e3751b4fb88af61cd277ca0e09', 'c3e334fd0e914ac5a3758ba73f1dbd42', '0001000100030002', '修改角色', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.role.edit', NULL, 13, 0, '', 1492247371, 0),
	('02e86a61e99746bea34236ea73dd52a5', '', '0003', 'CMS', 'CMS', 'menu', '', '', '', 1, 0, 'cms', NULL, 9, 1, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468895671, 0),
	('044295e4f08b48f0a52626eca77f601f', 'c3e334fd0e914ac5a3758ba73f1dbd42', '0001000100030005', '分配用户', 'SetUser', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.role.user', NULL, 16, 0, '', 1492247371, 0),
	('0537de043955423d89266fb7ef316772', 'c3e334fd0e914ac5a3758ba73f1dbd42', '0001000100030001', '添加角色', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.role.add', NULL, 12, 0, '', 1492247371, 0),
	('0706112ff5dc46e388064a99bcdb0561', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030004', '关键词回复', 'Keyword', 'menu', '/platform/wx/reply/conf/keyword', 'data-pjax', '', 1, 0, 'wx.reply.keyword', NULL, 10, 0, '', 1467472362, 0),
	('075ef02abdac47feb9ca99f8c4ad6ebf', 'd004f9cc77c340b8a49bf7822a7bfaca', '0001000100020001', '添加用户', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.user.add', NULL, 8, 0, '', 1492247371, 0),
	('077cb6be4c7c41cc8955ee045a4f0286', '68cdbf694f71445c8587a20234d6fe31', '0003000300020001', '添加链接', 'Add', 'data', '', '', '', 0, 0, 'cms.link.link.add', NULL, 47, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468897043, 0),
	('0a43d291e0c94ad88c8b690009279e34', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020004', '保存排序', 'Save', 'data', '', '', '', 0, 0, 'wx.conf.menu.sort', NULL, 0, 0, '', 1467474314, 0),
	('0a972ce655cb4c84809d58668b655900', '17e1ee23ca1443f1bc886c2f5eb7c24b', '0002000300020002', '修改图文', 'Edit', 'data', '', '', '', 0, 0, 'wx.reply.news.edit', NULL, 0, 0, '', 1467473596, 0),
	('0ac80042f1644efabb98f2a1224ac3eb', 'bcdf814768d647198606aa7df3e10514', '0001000100050001', '添加参数', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.conf.add', NULL, 22, 0, '', 1492247371, 0),
	('1385ae887e5c4b8aa33fbf228be7f907', '6afc5075913d4df4b44a6476080e35a0', '000200050001', '模板编号', 'Id', 'menu', '/platform/wx/tpl/id', 'data-pjax', '', 1, 0, 'wx.tpl.id', NULL, 51, 0, '', 1470406854, 0),
	('1734e586e96941268a4c5248b593cef9', 'f426468abf714b1599729f8c36ebbb0d', '0002000200010001', '回复消息', 'Reply', 'data', '', '', '', 0, 0, 'wx.msg.user.reply', NULL, 0, 0, '', 1467473127, 0),
	('17500ef3a9e44b4fabb240162a164fcb', '6075fc0cf0ef441b9d93cc3cab3445bf', '0003000200020003', '删除文章', 'Delete', 'data', '', '', '', 0, 0, 'cms.content.article.delete', NULL, 40, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896170, 0),
	('17e1ee23ca1443f1bc886c2f5eb7c24b', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030002', '图文内容', 'News', 'menu', '/platform/wx/reply/news', 'data-pjax', '', 1, 0, 'wx.reply.news', NULL, 8, 0, '', 1467471926, 0),
	('2133e7c90058468b8ca87e2bd5fe3696', 'cd095cf27e084b27affd0e07365569b6', '0001000100090002', '修改应用', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.api.edit', NULL, 37, 0, '', 1492247372, 0),
	('2275cb125710414e91b617dd7c62f12c', '17e1ee23ca1443f1bc886c2f5eb7c24b', '0002000300020001', '添加图文', 'add', 'data', '', '', '', 0, 0, 'wx.reply.news.add', NULL, 0, 0, '', 1467473585, 0),
	('234f8ec3c2bc42bf9f6202aecae36fd6', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030001', '文本内容', 'Txt', 'menu', '/platform/wx/reply/txt', 'data-pjax', '', 1, 0, 'wx.reply.txt', NULL, 7, 0, '', 1467471884, 0),
	('2424d4f79e0943a7bb98e5a27795f815', '47743de901ee48928b368e31689c543b', '000100010006', '日志管理', 'Log', 'menu', '/platform/sys/log', 'data-pjax', NULL, 1, 0, 'sys.manager.log', NULL, 25, 0, '', 1492247372, 0),
	('2701b76cffcd4666a01202e7cb956b07', '58c2f302bd544692ad358e42db2681ea', '0001000100110001', '添加插件', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.plugin.add', NULL, 44, 0, '', 1492247372, 0),
	('279e976477d84e5c821d583e5077006a', '47743de901ee48928b368e31689c543b', '000100010010', '数据字典', 'Dict', 'menu', '/platform/sys/dict', 'data-pjax', NULL, 1, 0, 'sys.manager.dict', NULL, 39, 0, '', 1492247372, 0),
	('2a4c100f80f84ca6905889894813ebc4', 'd004f9cc77c340b8a49bf7822a7bfaca', '0001000100020002', '修改用户', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.user.edit', NULL, 9, 0, '', 1492247371, 0),
	('2a63040409094f1e9dc535dd78ce15b7', '2cb327ad59b140828fd26eb2a46cb948', '0002000300030003', '删除绑定', 'Delete', 'data', '', '', '', 0, 0, 'wx.reply.follow.delete', NULL, 0, 0, '', 1467474080, 0),
	('2cb327ad59b140828fd26eb2a46cb948', '4cd8e4e9519e4cff95465194fdcc8d88', '000200030003', '关注自动回复', 'Follow', 'menu', '/platform/wx/reply/conf/follow', 'data-pjax', '', 1, 0, 'wx.reply.follow', NULL, 9, 0, '', 1467472280, 0),
	('2d4d9466412d482599ffdd6a2d42f22f', 'f20de1d806c14d838a66a7ca8060d7aa', '0001000100070001', '添加任务', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.task.add', NULL, 28, 0, '', 1492247372, 0),
	('2e164dc8aaed4a91938d1a092c7c4bd7', 'f20de1d806c14d838a66a7ca8060d7aa', '0001000100070003', '删除任务', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.task.delete', NULL, 30, 0, '', 1492247372, 0),
	('2fab774f8b6d40cb9d7e187babab2d91', 'bcf64d623fdd4519ae345b7a08c071a1', '000200040002', '菜单配置', 'Menu', 'menu', '/platform/wx/conf/menu', 'data-pjax', '', 1, 0, 'wx.conf.menu', NULL, 13, 0, '', 1467472649, 0),
	('3021b4a8129041d88787021f11ff92a0', 'bcdf814768d647198606aa7df3e10514', '0001000100050002', '修改参数', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.conf.edit', NULL, 23, 0, '', 1492247372, 0),
	('3099f497480c4b1987bce3f3a26c3fb4', '6bb17a41f6394ed0a8a6faf5ff781354', '0002000200020003', '群发消息', 'Push', 'data', '', '', '', 0, 0, 'wx.msg.mass.pushNews', NULL, 0, 0, '', 1467473400, 0),
	('309dc29ad3c34408a68df8f867a5c9ff', '66cc21d7ce104dd6877cbce114c59fb3', '0002000400010001', '添加帐号', 'Add', 'data', '', '', '', 0, 0, 'wx.conf.account.add', NULL, 0, 0, '', 1467474187, 0),
	('30a5e70a1456447ebf90b5546e9bc321', '2cb327ad59b140828fd26eb2a46cb948', '0002000300030002', '修改绑定', 'Edit', 'data', '', '', '', 0, 0, 'wx.reply.follow.edit', NULL, 0, 0, '', 1467474056, 0),
	('31ed2243077c44448cce26abfd5ae574', '9822bafbe3454dfd8e8b974ebc304d03', '0003000300010002', '修改分类', 'Edit', 'data', '', '', '', 0, 0, 'cms.link.class.edit', NULL, 44, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896957, 0),
	('32fc7454be8c4900bee7311fee9df414', 'd004f9cc77c340b8a49bf7822a7bfaca', '0001000100020003', '删除用户', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.user.delete', NULL, 10, 0, '', 1492247371, 0),
	('33aed9298643424783116e0cf0f7fcbe', '6075fc0cf0ef441b9d93cc3cab3445bf', '0003000200020001', '添加文章', 'Add', 'data', '', '', '', 0, 0, 'cms.content.article.add', NULL, 38, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896151, 0),
	('36e0faf5062b4f6b95d4167cbb1f8fea', '68cdbf694f71445c8587a20234d6fe31', '0003000300020002', '修改链接', 'Edit', 'data', '', '', '', 0, 0, 'cms.link.link.edit', NULL, 48, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468897051, 0),
	('3888f05aa4064f788ba7ec51c495ce7c', '1385ae887e5c4b8aa33fbf228be7f907', '0002000500010002', '删除编号', 'Delete', 'data', '', '', '', 0, 0, 'wx.tpl.id.delete', NULL, 55, 0, '', 1470407068, 0),
	('3c24111091ad4a70ad2d9cc361311d2f', '68cdbf694f71445c8587a20234d6fe31', '0003000300020003', '删除链接', 'Delete', 'data', '', '', '', 0, 0, 'cms.link.link.delete', NULL, 49, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468897060, 0),
	('3e816d778b5e433484b1d1948d0d09b5', '5dcb405834c54dafb3eeb22efdcd9655', '0001000100040003', '删除菜单', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.menu.delete', NULL, 20, 0, '', 1492247371, 0),
	('3f330d729ca34dc9825c46122be1bfae', '02e86a61e99746bea34236ea73dd52a5', '00030003', '广告链接', 'AD', 'menu', '', '', 'ti-link', 1, 0, 'cms.link', NULL, 41, 1, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896230, 0),
	('44da90bc76a5419a841f4924333f7a66', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020002', '修改菜单', 'Edit', 'data', '', '', '', 0, 0, 'wx.conf.menu.edit', NULL, 0, 0, '', 1467474294, 0),
	('45d958ca78304f25b51f6c71cf66f6d8', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020001', '添加菜单', 'Add', 'data', '', '', '', 0, 0, 'wx.conf.menu.add', NULL, 0, 0, '', 1467474283, 0),
	('47743de901ee48928b368e31689c543b', '90e91c91bd4b41bd9635d4079b71a4ea', '00010001', '系统管理', 'Manager', 'menu', '', '', 'ti-settings', 1, 0, 'sys.manager', '系统管理', 2, 1, '', 1492247371, 0),
	('4781372b00bb4d52b429b58e72b80c68', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010001', '添加栏目', 'Add', 'data', '', '', '', 0, 0, 'cms.content.channel.add', NULL, 33, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896049, 0),
	('4c1f4dd9887543d498ed23ac46646a15', 'cd095cf27e084b27affd0e07365569b6', '0001000100090001', '添加应用', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.api.add', NULL, 36, 0, '', 1492247372, 0),
	('4cd8e4e9519e4cff95465194fdcc8d88', 'b0edc6861a494b79b97990dc05f0a524', '00020003', '自动回复', 'AutoReply', 'menu', '', '', 'ti-back-left', 1, 0, 'wx.reply', NULL, 6, 1, '', 1467471610, 0),
	('4dc997fef71e4862b9db22de8e99a618', 'b19b23b0459a4754bf1fb8cb234450f2', '0002000100010001', '同步会员信息', 'Sync', 'data', '', '', '', 0, 0, 'wx.user.list.sync', NULL, 0, 0, '', 1467473044, 0),
	('4f3ec553c37546609c80d85a652955fb', '5dcb405834c54dafb3eeb22efdcd9655', '0001000100040002', '修改菜单', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.menu.edit', NULL, 19, 0, '', 1492247371, 0),
	('50ba60ee650e4c739e6abc3ab71e4960', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010004', '栏目排序', 'Sort', 'data', '', '', '', 0, 0, 'cms.content.channel.sort', NULL, 36, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896092, 0),
	('5244f5c38eb24b918e9ad64d456daa38', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020005', '推送到微信', 'Push', 'data', '', '', '', 0, 0, 'wx.conf.menu.push', NULL, 0, 0, '', 1467474330, 0),
	('56d0658c5a8848818ac05e8ffa5c0570', '6bb17a41f6394ed0a8a6faf5ff781354', '0002000200020001', '添加图文', 'Add', 'data', '', '', '', 0, 0, 'wx.msg.mass.addNews', NULL, 0, 0, '', 1467473338, 0),
	('58c2f302bd544692ad358e42db2681ea', '47743de901ee48928b368e31689c543b', '000100010011', '插件管理', 'Plugin', 'menu', '/platform/sys/plugin', 'data-pjax', NULL, 1, 0, 'sys.manager.plugin', NULL, 43, 0, '', 1492247372, 0),
	('58e7d7deb40941c6ad1f44d9b3059d37', '678ab9703ca049cda7166ae2ecd4657e', '0001000100080003', '删除路由', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.route.delete', NULL, 34, 0, '', 1492247372, 0),
	('5d4e83249fd648d698ed5f3551b23942', '5dcb405834c54dafb3eeb22efdcd9655', '0001000100040001', '添加菜单', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.menu.add', NULL, 18, 0, '', 1492247371, 0),
	('5dcb405834c54dafb3eeb22efdcd9655', '47743de901ee48928b368e31689c543b', '000100010004', '菜单管理', 'Menu', 'menu', '/platform/sys/menu', 'data-pjax', NULL, 1, 0, 'sys.manager.menu', NULL, 17, 0, '', 1492247371, 0),
	('5e1c4a1aca134768adeff3fc430109bf', '678ab9703ca049cda7166ae2ecd4657e', '0001000100080001', '添加路由', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.route.add', NULL, 32, 0, '', 1492247372, 0),
	('6075fc0cf0ef441b9d93cc3cab3445bf', '6b6de8c720c645a1808e1c3e9ccbfc90', '000300020002', '文章管理', 'Article', 'menu', '/platform/cms/article', 'data-pjax', '', 1, 0, 'cms.content.article', NULL, 37, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896141, 0),
	('60baa3a5a8d44d15b91b7236b6a5190e', 'cd095cf27e084b27affd0e07365569b6', '0001000100090003', '删除应用', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.api.delete', NULL, 38, 0, '', 1492247372, 0),
	('66cc21d7ce104dd6877cbce114c59fb3', 'bcf64d623fdd4519ae345b7a08c071a1', '000200040001', '帐号配置', 'Account', 'menu', '/platform/wx/conf/account', 'data-pjax', '', 1, 0, 'wx.conf.account', NULL, 12, 0, '', 1467472624, 0),
	('678ab9703ca049cda7166ae2ecd4657e', '47743de901ee48928b368e31689c543b', '000100010008', '自定义路由', 'Route', 'menu', '/platform/sys/route', 'data-pjax', NULL, 1, 0, 'sys.manager.route', NULL, 31, 0, '', 1492247372, 0),
	('68cdbf694f71445c8587a20234d6fe31', '3f330d729ca34dc9825c46122be1bfae', '000300030002', '链接管理', 'Link', 'menu', '/platform/cms/link/link', 'data-pjax', '', 1, 0, 'cms.link.link', NULL, 46, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468897031, 0),
	('6afc5075913d4df4b44a6476080e35a0', 'b0edc6861a494b79b97990dc05f0a524', '00020005', '模板消息', 'Template', 'menu', '', '', 'ti-notepad', 1, 0, 'wx.tpl', NULL, 50, 1, '', 1470406797, 0),
	('6b6de8c720c645a1808e1c3e9ccbfc90', '02e86a61e99746bea34236ea73dd52a5', '00030002', '内容管理', 'Content', 'menu', '', '', 'ti-pencil-alt', 1, 0, 'cms.content', NULL, 31, 1, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468895990, 0),
	('6bb17a41f6394ed0a8a6faf5ff781354', '9f20a757a6bc40ddbb650c70debbf660', '000200020002', '群发消息', 'Mass', 'menu', '/platform/wx/msg/mass', 'data-pjax', '', 1, 0, 'wx.msg.mass', NULL, 5, 0, '', 1467471561, 0),
	('7125a72beee34b21ab3df9bf01b7bce6', '9822bafbe3454dfd8e8b974ebc304d03', '0003000300010003', '删除分类', 'Delete', 'data', '', '', '', 0, 0, 'cms.link.class.delete', NULL, 45, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896968, 0),
	('720ff8368c4545b1b69b6925ee489b6f', '2424d4f79e0943a7bb98e5a27795f815', '0001000100060001', '清除日志', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.log.delete', NULL, 26, 0, '', 1492247372, 0),
	('733d3f35d49f45af99ca9220048583ba', '0706112ff5dc46e388064a99bcdb0561', '0002000300040003', '删除绑定', 'Delete', 'data', '', '', '', 0, 0, 'wx.reply.keyword.delete', NULL, 0, 0, '', 1467474136, 0),
	('73a29d3f99224426b5a87c92da122275', 'd1e991ad38a8424daf9f7eb000ee27f4', '0003000100010001', '保存配置', 'Save', 'data', '', '', '', 0, 0, 'cms.site.settings.save', NULL, 30, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468895899, 0),
	('7c040dfd8db347e5956a3bc1764653dc', '234f8ec3c2bc42bf9f6202aecae36fd6', '0002000300010003', '删除文本', 'Delete', 'data', '', '', '', 0, 0, 'wx.reply.txt.delete', NULL, 0, 0, '', 1467473540, 0),
	('7db6207d0dab4d6e95a7eee4f2efe875', '9822bafbe3454dfd8e8b974ebc304d03', '0003000300010001', '添加分类', 'Add', 'data', '', '', '', 0, 0, 'cms.link.class.add', NULL, 43, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896947, 0),
	('83b43334c29b4cf5af7c2c00ce95cc82', 'bcdf814768d647198606aa7df3e10514', '0001000100050003', '删除参数', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.conf.delete', NULL, 24, 0, '', 1492247372, 0),
	('8be21bd53e224f39a7560f3012a8f841', '678ab9703ca049cda7166ae2ecd4657e', '0001000100080002', '修改路由', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.route.edit', NULL, 33, 0, '', 1492247372, 0),
	('90e91c91bd4b41bd9635d4079b71a4ea', '', '0001', '系统', 'System', 'menu', '', '', '', 1, 0, 'sys', '系统', 10, 1, '', 1492247371, 0),
	('94af4a5ed1cc4b5f9516c2b52734dee8', 'bea35ec8ec8f44518949903ccc0beaf6', '0001000100010003', '删除单位', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.unit.delete', NULL, 6, 0, '', 1492247371, 0),
	('954fa87e032e406aabb94d10e011a5d5', '279e976477d84e5c821d583e5077006a', '0001000100100001', '添加字典', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.dict.add', NULL, 40, 0, '', 1492247372, 0),
	('96554b09a2dd4f82bab7546fa59acd35', '66cc21d7ce104dd6877cbce114c59fb3', '0002000400010002', '修改帐号', 'Edit', 'data', '', '', '', 0, 0, 'wx.conf.account.edit', NULL, 0, 0, '', 1467474197, 0),
	('9822bafbe3454dfd8e8b974ebc304d03', '3f330d729ca34dc9825c46122be1bfae', '000300030001', '链接分类', 'Class', 'menu', '/platform/cms/link/class', 'data-pjax', '', 1, 0, 'cms.link.class', NULL, 42, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896932, 0),
	('99709d4af1d5428dbd50572019e1be77', 'c3e334fd0e914ac5a3758ba73f1dbd42', '0001000100030004', '分配菜单', 'SetMenu', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.role.menu', NULL, 15, 0, '', 1492247371, 0),
	('9a9557177d334c209cf73c3817fe3b63', '2fab774f8b6d40cb9d7e187babab2d91', '0002000400020003', '删除菜单', 'Delete', 'data', '', '', '', 0, 0, 'wx.conf.menu.delete', NULL, 0, 0, '', 1467474304, 0),
	('9f20a757a6bc40ddbb650c70debbf660', 'b0edc6861a494b79b97990dc05f0a524', '00020002', '消息管理', 'Message', 'menu', '', '', 'ti-pencil-alt', 1, 0, 'wx.msg', NULL, 3, 1, '', 1467471415, 0),
	('a11163584dfe456cbfd6fb2d4b74391b', 'cabbe834a7474675b899e8442b5c2604', '0002000500020001', '获取列表', 'Get', 'data', '', '', '', 0, 0, 'wx.tpl.list.get', NULL, 56, 0, '', 1470407390, 0),
	('b0edc6861a494b79b97990dc05f0a524', '', '0002', '微信', 'Wechat', 'menu', '', '', '', 1, 0, 'wx', NULL, 8, 1, '', 1467471229, 0),
	('b19b23b0459a4754bf1fb8cb234450f2', 'e4256d7b0ffc4a02906cf900322b6213', '000200010001', '会员列表', 'List', 'menu', '/platform/wx/user/index', 'data-pjax', '', 1, 0, 'wx.user.list', NULL, 2, 0, '', 1467471357, 0),
	('b2631bbdbf824cc4b74d819c87962c0d', '6b6de8c720c645a1808e1c3e9ccbfc90', '000300020001', '栏目管理', 'Channel', 'menu', '/platform/cms/channel', 'data-pjax', '', 1, 0, 'cms.content.channel', NULL, 32, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896018, 0),
	('b56b5b283983423db744f62928d81a0a', 'bea35ec8ec8f44518949903ccc0beaf6', '0001000100010001', '添加单位', 'Add', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.unit.add', NULL, 4, 0, '', 1492247371, 0),
	('b9bafac1d09945c881a27a22dc71a708', 'bea35ec8ec8f44518949903ccc0beaf6', '0001000100010002', '修改单位', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.unit.edit', NULL, 5, 0, '', 1492247371, 0),
	('bcdf814768d647198606aa7df3e10514', '47743de901ee48928b368e31689c543b', '000100010005', '系统参数', 'Param', 'menu', '/platform/sys/conf', 'data-pjax', NULL, 1, 0, 'sys.manager.conf', NULL, 21, 0, '', 1492247371, 0),
	('bcf64d623fdd4519ae345b7a08c071a1', 'b0edc6861a494b79b97990dc05f0a524', '00020004', '微信配置', 'Config', 'menu', '', '', 'fa fa-weixin', 1, 0, 'wx.conf', NULL, 11, 1, '', 1467472498, 0),
	('be69e35d77a94a8a8dd734f4d8749858', '58c2f302bd544692ad358e42db2681ea', '0001000100110002', '启用禁用', 'Update', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.plugin.update', NULL, 45, 0, '', 1492247372, 0),
	('bea35ec8ec8f44518949903ccc0beaf6', '47743de901ee48928b368e31689c543b', '000100010001', '单位管理', 'Unit', 'menu', '/platform/sys/unit', 'data-pjax', NULL, 1, 0, 'sys.manager.unit', NULL, 3, 0, '', 1492247371, 0),
	('bf327299a19b4209a5d58bdefc087a01', 'c3e334fd0e914ac5a3758ba73f1dbd42', '0001000100030003', '删除角色', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.role.delete', NULL, 14, 0, '', 1492247371, 0),
	('c12326e3c7a64675aa23046ce6061bf9', '279e976477d84e5c821d583e5077006a', '0001000100100003', '删除字典', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.dict.delete', NULL, 42, 0, '', 1492247372, 0),
	('c22f873be5734a0abfde921eedac506a', '279e976477d84e5c821d583e5077006a', '0001000100100002', '修改字典', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.dict.edit', NULL, 41, 0, '', 1492247372, 0),
	('c3a44b478d3241b899b9c3f4611bc2b6', '234f8ec3c2bc42bf9f6202aecae36fd6', '0002000300010001', '添加文本', 'Add', 'data', '', '', '', 0, 0, 'wx.reply.txt.add', NULL, 0, 0, '', 1467473460, 0),
	('c3e334fd0e914ac5a3758ba73f1dbd42', '47743de901ee48928b368e31689c543b', '000100010003', '角色管理', 'Role', 'menu', '/platform/sys/role', 'data-pjax', NULL, 1, 0, 'sys.manager.role', NULL, 11, 0, '', 1492247371, 0),
	('c76a84f871d047db955dd1465c845ac1', '6afc5075913d4df4b44a6476080e35a0', '000200050003', '发送记录', 'Log', 'menu', '/platform/wx/tpl/log', 'data-pjax', '', 1, 0, 'wx.tpl.log', NULL, 53, 0, '', 1470406926, 0),
	('ca27ed10540b4d43b08daf574be53607', 'f20de1d806c14d838a66a7ca8060d7aa', '0001000100070002', '修改任务', 'Edit', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.task.edit', NULL, 29, 0, '', 1492247372, 0),
	('cabbe834a7474675b899e8442b5c2604', '6afc5075913d4df4b44a6476080e35a0', '000200050002', '模板列表', 'List', 'menu', '/platform/wx/tpl/list', 'data-pjax', '', 1, 0, 'wx.tpl.list', NULL, 52, 0, '', 1470406883, 0),
	('cd095cf27e084b27affd0e07365569b6', '47743de901ee48928b368e31689c543b', '000100010009', '应用管理', 'App', 'menu', '/platform/sys/api', 'data-pjax', NULL, 1, 0, 'sys.manager.api', NULL, 35, 0, '', 1492247372, 0),
	('ce709456e867425297955b3c40406d7e', '6bb17a41f6394ed0a8a6faf5ff781354', '0002000200020002', '删除图文', 'Delete', 'data', '', '', '', 0, 0, 'wx.msg.mass.delNews', NULL, 0, 0, '', 1467473363, 0),
	('d004f9cc77c340b8a49bf7822a7bfaca', '47743de901ee48928b368e31689c543b', '000100010002', '用户管理', 'User', 'menu', '/platform/sys/user', 'data-pjax', NULL, 1, 0, 'sys.manager.user', NULL, 7, 0, '', 1492247371, 0),
	('d1e991ad38a8424daf9f7eb000ee27f4', 'd920314e925c451da6d881e7a29743b7', '000300010001', '网站配置', 'Settings', 'menu', '/platform/cms/site', 'data-pjax', '', 1, 0, 'cms.site.settings', NULL, 29, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468895881, 0),
	('d568f4c2b687404e8aec7b9edcae5767', '66cc21d7ce104dd6877cbce114c59fb3', '0002000400010003', '删除帐号', 'Delete', 'data', '', '', '', 0, 0, 'wx.conf.account.delete', NULL, 0, 0, '', 1467474209, 0),
	('d920314e925c451da6d881e7a29743b7', '02e86a61e99746bea34236ea73dd52a5', '00030001', '站点管理', 'Site', 'menu', '', '', 'ti-world', 1, 0, 'cms.site', NULL, 28, 1, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468895821, 0),
	('dd965b2c1dfd493fb5efc7e4bcac99d4', '2cb327ad59b140828fd26eb2a46cb948', '0002000300030001', '添加绑定', 'Add', 'data', '', '', '', 0, 0, 'wx.reply.follow.add', NULL, 0, 0, '', 1467474026, 0),
	('e4256d7b0ffc4a02906cf900322b6213', 'b0edc6861a494b79b97990dc05f0a524', '00020001', '微信会员', 'Member', 'menu', '', '', 'fa fa-user', 1, 0, 'wx.user', NULL, 1, 1, '', 1467471292, 0),
	('e461c62a1d5441619cd35612f3b40691', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010002', '修改栏目', 'Edit', 'data', '', '', '', 0, 0, 'cms.content.channel.edit', NULL, 34, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896060, 0),
	('e6b6224617b04090a76e46a4b048fb96', '1385ae887e5c4b8aa33fbf228be7f907', '0002000500010001', '添加编号', 'Add', 'data', '', '', '', 0, 0, 'wx.tpl.id.add', NULL, 54, 0, '', 1470407055, 0),
	('e864c78aba63448892cbcb6a3a7f4da7', '0706112ff5dc46e388064a99bcdb0561', '0002000300040001', '添加绑定', 'Add', 'data', '', '', '', 0, 0, 'wx.reply.keyword.add', NULL, 0, 0, '', 1467474113, 0),
	('ea47ce333f9b445a96b4b5877a1f6b79', '58c2f302bd544692ad358e42db2681ea', '0001000100110003', '删除插件', 'Delete', 'data', NULL, NULL, NULL, 0, 0, 'sys.manager.plugin.delete', NULL, 46, 0, '', 1492247373, 0),
	('ef9f436c61654ec09efbfa79a40061cf', '6075fc0cf0ef441b9d93cc3cab3445bf', '0003000200020002', '修改文章', 'Edit', 'data', '', '', '', 0, 0, 'cms.content.article.edit', NULL, 39, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896159, 0),
	('f20de1d806c14d838a66a7ca8060d7aa', '47743de901ee48928b368e31689c543b', '000100010007', '定时任务', 'Task', 'menu', '/platform/sys/task', 'data-pjax', NULL, 1, 0, 'sys.manager.task', NULL, 27, 0, '', 1492247372, 0),
	('f426468abf714b1599729f8c36ebbb0d', '9f20a757a6bc40ddbb650c70debbf660', '000200020001', '会员消息', 'Msg', 'menu', '/platform/wx/msg/user', 'data-pjax', '', 1, 0, 'wx.msg.user', NULL, 4, 1, '', 1467471478, 0),
	('f6fba69c3b704d79834b8bd2cc753729', 'b2631bbdbf824cc4b74d819c87962c0d', '0003000200010003', '删除栏目', 'Delete', 'data', '', '', '', 0, 0, 'cms.content.channel.delete', NULL, 35, 0, '1a19ef09b12344b4a797d6e6dfe7fb29', 1468896072, 0),
	('fc52d5284b8f4522802383c1ef732242', '17e1ee23ca1443f1bc886c2f5eb7c24b', '0002000300020003', '删除图文', 'Delete', 'data', '', '', '', 0, 0, 'wx.reply.news.delete', NULL, 0, 0, '', 1467473606, 0),
	('fd63a8e389e04ff3a86c3cea53a3b9d5', '234f8ec3c2bc42bf9f6202aecae36fd6', '0002000300010002', '修改文本', 'Edit', 'data', '', '', '', 0, 0, 'wx.reply.txt.edit', NULL, 0, 0, '', 1467473519, 0),
	('ff6cd243a77c4ae98dacf6149c816c75', '0706112ff5dc46e388064a99bcdb0561', '0002000300040002', '修改绑定', 'Edit', 'data', '', '', '', 0, 0, 'wx.reply.keyword.edit', NULL, 0, 0, '', 1467474125, 0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_plugin 结构
CREATE TABLE IF NOT EXISTS `sys_plugin` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `code` varchar(255) DEFAULT NULL COMMENT '唯一标识',
  `className` varchar(255) DEFAULT NULL COMMENT '类名',
  `args` varchar(255) DEFAULT NULL COMMENT '执行参数',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_PLUGIN` (`code`),
  UNIQUE KEY `INDEX_SYS_CLASSNAME` (`className`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_plugin 的数据：~0 rows (大约)
DELETE FROM `sys_plugin`;
/*!40000 ALTER TABLE `sys_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_plugin` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_blob_triggers 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `sys_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_blob_triggers 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_blob_triggers`;
/*!40000 ALTER TABLE `sys_qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_blob_triggers` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_calendars 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_calendars 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_calendars`;
/*!40000 ALTER TABLE `sys_qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_calendars` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_cron_triggers 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `sys_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_cron_triggers 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_cron_triggers`;
/*!40000 ALTER TABLE `sys_qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_cron_triggers` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_fired_triggers 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_SYS_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_SYS_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_SYS_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_SYS_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_fired_triggers 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_fired_triggers`;
/*!40000 ALTER TABLE `sys_qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_fired_triggers` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_job_details 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_SYS_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_job_details 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_job_details`;
/*!40000 ALTER TABLE `sys_qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_job_details` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_locks 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_locks 的数据：~2 rows (大约)
DELETE FROM `sys_qrtz_locks`;
/*!40000 ALTER TABLE `sys_qrtz_locks` DISABLE KEYS */;
INSERT INTO `sys_qrtz_locks` (`SCHED_NAME`, `LOCK_NAME`) VALUES
	('defaultScheduler', 'STATE_ACCESS'),
	('defaultScheduler', 'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `sys_qrtz_locks` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_paused_trigger_grps 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_paused_trigger_grps 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_paused_trigger_grps`;
/*!40000 ALTER TABLE `sys_qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_paused_trigger_grps` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_scheduler_state 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_scheduler_state 的数据：~1 rows (大约)
DELETE FROM `sys_qrtz_scheduler_state`;
/*!40000 ALTER TABLE `sys_qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `sys_qrtz_scheduler_state` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES
	('defaultScheduler', 'ZJH1492431575985', 1492434316729, 20000);
/*!40000 ALTER TABLE `sys_qrtz_scheduler_state` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_simple_triggers 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `sys_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_simple_triggers 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_simple_triggers`;
/*!40000 ALTER TABLE `sys_qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_simple_triggers` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_simprop_triggers 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `sys_qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `sys_qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_simprop_triggers 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_simprop_triggers`;
/*!40000 ALTER TABLE `sys_qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_simprop_triggers` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_qrtz_triggers 结构
CREATE TABLE IF NOT EXISTS `sys_qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_SYS_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_SYS_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_SYS_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_SYS_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_SYS_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_SYS_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_SYS_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_SYS_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `sys_qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `sys_qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_qrtz_triggers 的数据：~0 rows (大约)
DELETE FROM `sys_qrtz_triggers`;
/*!40000 ALTER TABLE `sys_qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_qrtz_triggers` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `aliasName` varchar(50) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `unitid` varchar(32) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_ROLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_role 的数据：~2 rows (大约)
DELETE FROM `sys_role`;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`id`, `name`, `code`, `aliasName`, `disabled`, `unitid`, `note`, `opBy`, `opAt`, `delFlag`) VALUES
	('1c4e326622aa489eb3019480a57df4aa', '系统管理员', 'sysadmin', 'Sysadmin', 0, '', 'System Admin', '', 1492247373, 0),
	('2b2eff981bd84cfe80b1f107830ae392', '公共角色', 'public', 'Public', 0, '', 'All user has role', '', 1492247373, 0);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `roleId` varchar(32) DEFAULT NULL,
  `menuId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_role_menu 的数据：~115 rows (大约)
DELETE FROM `sys_role_menu`;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`roleId`, `menuId`) VALUES
	('1c4e326622aa489eb3019480a57df4aa', '90e91c91bd4b41bd9635d4079b71a4ea'),
	('1c4e326622aa489eb3019480a57df4aa', '47743de901ee48928b368e31689c543b'),
	('1c4e326622aa489eb3019480a57df4aa', 'bea35ec8ec8f44518949903ccc0beaf6'),
	('1c4e326622aa489eb3019480a57df4aa', 'b56b5b283983423db744f62928d81a0a'),
	('1c4e326622aa489eb3019480a57df4aa', 'b9bafac1d09945c881a27a22dc71a708'),
	('1c4e326622aa489eb3019480a57df4aa', '94af4a5ed1cc4b5f9516c2b52734dee8'),
	('1c4e326622aa489eb3019480a57df4aa', 'd004f9cc77c340b8a49bf7822a7bfaca'),
	('1c4e326622aa489eb3019480a57df4aa', '075ef02abdac47feb9ca99f8c4ad6ebf'),
	('1c4e326622aa489eb3019480a57df4aa', '2a4c100f80f84ca6905889894813ebc4'),
	('1c4e326622aa489eb3019480a57df4aa', '32fc7454be8c4900bee7311fee9df414'),
	('1c4e326622aa489eb3019480a57df4aa', 'c3e334fd0e914ac5a3758ba73f1dbd42'),
	('1c4e326622aa489eb3019480a57df4aa', '0537de043955423d89266fb7ef316772'),
	('1c4e326622aa489eb3019480a57df4aa', '00f3f2e3751b4fb88af61cd277ca0e09'),
	('1c4e326622aa489eb3019480a57df4aa', 'bf327299a19b4209a5d58bdefc087a01'),
	('1c4e326622aa489eb3019480a57df4aa', '99709d4af1d5428dbd50572019e1be77'),
	('1c4e326622aa489eb3019480a57df4aa', '044295e4f08b48f0a52626eca77f601f'),
	('1c4e326622aa489eb3019480a57df4aa', '5dcb405834c54dafb3eeb22efdcd9655'),
	('1c4e326622aa489eb3019480a57df4aa', '5d4e83249fd648d698ed5f3551b23942'),
	('1c4e326622aa489eb3019480a57df4aa', '4f3ec553c37546609c80d85a652955fb'),
	('1c4e326622aa489eb3019480a57df4aa', '3e816d778b5e433484b1d1948d0d09b5'),
	('1c4e326622aa489eb3019480a57df4aa', 'bcdf814768d647198606aa7df3e10514'),
	('1c4e326622aa489eb3019480a57df4aa', '0ac80042f1644efabb98f2a1224ac3eb'),
	('1c4e326622aa489eb3019480a57df4aa', '3021b4a8129041d88787021f11ff92a0'),
	('1c4e326622aa489eb3019480a57df4aa', '83b43334c29b4cf5af7c2c00ce95cc82'),
	('1c4e326622aa489eb3019480a57df4aa', '2424d4f79e0943a7bb98e5a27795f815'),
	('1c4e326622aa489eb3019480a57df4aa', '720ff8368c4545b1b69b6925ee489b6f'),
	('1c4e326622aa489eb3019480a57df4aa', 'f20de1d806c14d838a66a7ca8060d7aa'),
	('1c4e326622aa489eb3019480a57df4aa', '2d4d9466412d482599ffdd6a2d42f22f'),
	('1c4e326622aa489eb3019480a57df4aa', 'ca27ed10540b4d43b08daf574be53607'),
	('1c4e326622aa489eb3019480a57df4aa', '2e164dc8aaed4a91938d1a092c7c4bd7'),
	('1c4e326622aa489eb3019480a57df4aa', '678ab9703ca049cda7166ae2ecd4657e'),
	('1c4e326622aa489eb3019480a57df4aa', '5e1c4a1aca134768adeff3fc430109bf'),
	('1c4e326622aa489eb3019480a57df4aa', '8be21bd53e224f39a7560f3012a8f841'),
	('1c4e326622aa489eb3019480a57df4aa', '58e7d7deb40941c6ad1f44d9b3059d37'),
	('1c4e326622aa489eb3019480a57df4aa', 'cd095cf27e084b27affd0e07365569b6'),
	('1c4e326622aa489eb3019480a57df4aa', '4c1f4dd9887543d498ed23ac46646a15'),
	('1c4e326622aa489eb3019480a57df4aa', '2133e7c90058468b8ca87e2bd5fe3696'),
	('1c4e326622aa489eb3019480a57df4aa', '60baa3a5a8d44d15b91b7236b6a5190e'),
	('1c4e326622aa489eb3019480a57df4aa', '279e976477d84e5c821d583e5077006a'),
	('1c4e326622aa489eb3019480a57df4aa', '954fa87e032e406aabb94d10e011a5d5'),
	('1c4e326622aa489eb3019480a57df4aa', 'c22f873be5734a0abfde921eedac506a'),
	('1c4e326622aa489eb3019480a57df4aa', 'c12326e3c7a64675aa23046ce6061bf9'),
	('1c4e326622aa489eb3019480a57df4aa', '58c2f302bd544692ad358e42db2681ea'),
	('1c4e326622aa489eb3019480a57df4aa', '2701b76cffcd4666a01202e7cb956b07'),
	('1c4e326622aa489eb3019480a57df4aa', 'be69e35d77a94a8a8dd734f4d8749858'),
	('1c4e326622aa489eb3019480a57df4aa', 'ea47ce333f9b445a96b4b5877a1f6b79'),
	('1c4e326622aa489eb3019480a57df4aa', 'b0edc6861a494b79b97990dc05f0a524'),
	('1c4e326622aa489eb3019480a57df4aa', 'e4256d7b0ffc4a02906cf900322b6213'),
	('1c4e326622aa489eb3019480a57df4aa', 'b19b23b0459a4754bf1fb8cb234450f2'),
	('1c4e326622aa489eb3019480a57df4aa', '4dc997fef71e4862b9db22de8e99a618'),
	('1c4e326622aa489eb3019480a57df4aa', '9f20a757a6bc40ddbb650c70debbf660'),
	('1c4e326622aa489eb3019480a57df4aa', 'f426468abf714b1599729f8c36ebbb0d'),
	('1c4e326622aa489eb3019480a57df4aa', '1734e586e96941268a4c5248b593cef9'),
	('1c4e326622aa489eb3019480a57df4aa', '6bb17a41f6394ed0a8a6faf5ff781354'),
	('1c4e326622aa489eb3019480a57df4aa', '56d0658c5a8848818ac05e8ffa5c0570'),
	('1c4e326622aa489eb3019480a57df4aa', 'ce709456e867425297955b3c40406d7e'),
	('1c4e326622aa489eb3019480a57df4aa', '3099f497480c4b1987bce3f3a26c3fb4'),
	('1c4e326622aa489eb3019480a57df4aa', '4cd8e4e9519e4cff95465194fdcc8d88'),
	('1c4e326622aa489eb3019480a57df4aa', '234f8ec3c2bc42bf9f6202aecae36fd6'),
	('1c4e326622aa489eb3019480a57df4aa', 'c3a44b478d3241b899b9c3f4611bc2b6'),
	('1c4e326622aa489eb3019480a57df4aa', 'fd63a8e389e04ff3a86c3cea53a3b9d5'),
	('1c4e326622aa489eb3019480a57df4aa', '7c040dfd8db347e5956a3bc1764653dc'),
	('1c4e326622aa489eb3019480a57df4aa', '17e1ee23ca1443f1bc886c2f5eb7c24b'),
	('1c4e326622aa489eb3019480a57df4aa', '2275cb125710414e91b617dd7c62f12c'),
	('1c4e326622aa489eb3019480a57df4aa', '0a972ce655cb4c84809d58668b655900'),
	('1c4e326622aa489eb3019480a57df4aa', 'fc52d5284b8f4522802383c1ef732242'),
	('1c4e326622aa489eb3019480a57df4aa', '2cb327ad59b140828fd26eb2a46cb948'),
	('1c4e326622aa489eb3019480a57df4aa', 'dd965b2c1dfd493fb5efc7e4bcac99d4'),
	('1c4e326622aa489eb3019480a57df4aa', '30a5e70a1456447ebf90b5546e9bc321'),
	('1c4e326622aa489eb3019480a57df4aa', '2a63040409094f1e9dc535dd78ce15b7'),
	('1c4e326622aa489eb3019480a57df4aa', '0706112ff5dc46e388064a99bcdb0561'),
	('1c4e326622aa489eb3019480a57df4aa', 'e864c78aba63448892cbcb6a3a7f4da7'),
	('1c4e326622aa489eb3019480a57df4aa', 'ff6cd243a77c4ae98dacf6149c816c75'),
	('1c4e326622aa489eb3019480a57df4aa', '733d3f35d49f45af99ca9220048583ba'),
	('1c4e326622aa489eb3019480a57df4aa', 'bcf64d623fdd4519ae345b7a08c071a1'),
	('1c4e326622aa489eb3019480a57df4aa', '66cc21d7ce104dd6877cbce114c59fb3'),
	('1c4e326622aa489eb3019480a57df4aa', '309dc29ad3c34408a68df8f867a5c9ff'),
	('1c4e326622aa489eb3019480a57df4aa', '96554b09a2dd4f82bab7546fa59acd35'),
	('1c4e326622aa489eb3019480a57df4aa', 'd568f4c2b687404e8aec7b9edcae5767'),
	('1c4e326622aa489eb3019480a57df4aa', '2fab774f8b6d40cb9d7e187babab2d91'),
	('1c4e326622aa489eb3019480a57df4aa', '45d958ca78304f25b51f6c71cf66f6d8'),
	('1c4e326622aa489eb3019480a57df4aa', '44da90bc76a5419a841f4924333f7a66'),
	('1c4e326622aa489eb3019480a57df4aa', '9a9557177d334c209cf73c3817fe3b63'),
	('1c4e326622aa489eb3019480a57df4aa', '0a43d291e0c94ad88c8b690009279e34'),
	('1c4e326622aa489eb3019480a57df4aa', '5244f5c38eb24b918e9ad64d456daa38'),
	('1c4e326622aa489eb3019480a57df4aa', '6afc5075913d4df4b44a6476080e35a0'),
	('1c4e326622aa489eb3019480a57df4aa', '1385ae887e5c4b8aa33fbf228be7f907'),
	('1c4e326622aa489eb3019480a57df4aa', 'e6b6224617b04090a76e46a4b048fb96'),
	('1c4e326622aa489eb3019480a57df4aa', '3888f05aa4064f788ba7ec51c495ce7c'),
	('1c4e326622aa489eb3019480a57df4aa', 'cabbe834a7474675b899e8442b5c2604'),
	('1c4e326622aa489eb3019480a57df4aa', 'a11163584dfe456cbfd6fb2d4b74391b'),
	('1c4e326622aa489eb3019480a57df4aa', 'c76a84f871d047db955dd1465c845ac1'),
	('1c4e326622aa489eb3019480a57df4aa', '02e86a61e99746bea34236ea73dd52a5'),
	('1c4e326622aa489eb3019480a57df4aa', 'd920314e925c451da6d881e7a29743b7'),
	('1c4e326622aa489eb3019480a57df4aa', 'd1e991ad38a8424daf9f7eb000ee27f4'),
	('1c4e326622aa489eb3019480a57df4aa', '73a29d3f99224426b5a87c92da122275'),
	('1c4e326622aa489eb3019480a57df4aa', '6b6de8c720c645a1808e1c3e9ccbfc90'),
	('1c4e326622aa489eb3019480a57df4aa', 'b2631bbdbf824cc4b74d819c87962c0d'),
	('1c4e326622aa489eb3019480a57df4aa', '4781372b00bb4d52b429b58e72b80c68'),
	('1c4e326622aa489eb3019480a57df4aa', 'e461c62a1d5441619cd35612f3b40691'),
	('1c4e326622aa489eb3019480a57df4aa', 'f6fba69c3b704d79834b8bd2cc753729'),
	('1c4e326622aa489eb3019480a57df4aa', '50ba60ee650e4c739e6abc3ab71e4960'),
	('1c4e326622aa489eb3019480a57df4aa', '6075fc0cf0ef441b9d93cc3cab3445bf'),
	('1c4e326622aa489eb3019480a57df4aa', '33aed9298643424783116e0cf0f7fcbe'),
	('1c4e326622aa489eb3019480a57df4aa', 'ef9f436c61654ec09efbfa79a40061cf'),
	('1c4e326622aa489eb3019480a57df4aa', '17500ef3a9e44b4fabb240162a164fcb'),
	('1c4e326622aa489eb3019480a57df4aa', '3f330d729ca34dc9825c46122be1bfae'),
	('1c4e326622aa489eb3019480a57df4aa', '9822bafbe3454dfd8e8b974ebc304d03'),
	('1c4e326622aa489eb3019480a57df4aa', '7db6207d0dab4d6e95a7eee4f2efe875'),
	('1c4e326622aa489eb3019480a57df4aa', '31ed2243077c44448cce26abfd5ae574'),
	('1c4e326622aa489eb3019480a57df4aa', '7125a72beee34b21ab3df9bf01b7bce6'),
	('1c4e326622aa489eb3019480a57df4aa', '68cdbf694f71445c8587a20234d6fe31'),
	('1c4e326622aa489eb3019480a57df4aa', '077cb6be4c7c41cc8955ee045a4f0286'),
	('1c4e326622aa489eb3019480a57df4aa', '36e0faf5062b4f6b95d4167cbb1f8fea'),
	('1c4e326622aa489eb3019480a57df4aa', '3c24111091ad4a70ad2d9cc361311d2f');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_route 结构
CREATE TABLE IF NOT EXISTS `sys_route` (
  `id` varchar(32) NOT NULL,
  `url` varchar(255) DEFAULT NULL COMMENT '原始路径',
  `toUrl` varchar(255) DEFAULT NULL COMMENT '跳转路径',
  `type` varchar(10) DEFAULT NULL COMMENT '转发类型',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_route 的数据：~1 rows (大约)
DELETE FROM `sys_route`;
/*!40000 ALTER TABLE `sys_route` DISABLE KEYS */;
INSERT INTO `sys_route` (`id`, `url`, `toUrl`, `type`, `disabled`, `opBy`, `opAt`, `delFlag`) VALUES
	('db5bfb9d60c54330986e5ad2b9e3a008', '/sysadmin', '/platform/login', 'hide', 0, '', 1492247384, 0);
/*!40000 ALTER TABLE `sys_route` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_task 结构
CREATE TABLE IF NOT EXISTS `sys_task` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '任务名',
  `jobClass` varchar(255) DEFAULT NULL COMMENT '执行类',
  `note` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `cron` varchar(50) DEFAULT NULL COMMENT '定时规则',
  `data` text COMMENT '执行参数',
  `exeAt` int(32) DEFAULT NULL COMMENT '执行时间',
  `exeResult` text COMMENT '执行结果',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_task 的数据：~1 rows (大约)
DELETE FROM `sys_task`;
/*!40000 ALTER TABLE `sys_task` DISABLE KEYS */;
INSERT INTO `sys_task` (`id`, `name`, `jobClass`, `note`, `cron`, `data`, `exeAt`, `exeResult`, `disabled`, `opBy`, `opAt`, `delFlag`) VALUES
	('0d121b776acc466d81520ca29c8eba83', '测试任务', 'cn.wizzer.app.web.commons.quartz.job.TestJob', '微信号：wizzer | 欢迎发送红包以示支持，多谢。。', '*/5 * * * * ?', '{"hi":"Wechat:wizzer | send red packets of support,thank u"}', 1492420205, '执行成功', 1, '295da53a22ec43f980a80135b0fe9cf7', 1492420188, 0);
/*!40000 ALTER TABLE `sys_task` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_unit 结构
CREATE TABLE IF NOT EXISTS `sys_unit` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `name` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `aliasName` varchar(100) DEFAULT NULL COMMENT '单位别名',
  `unitcode` varchar(20) DEFAULT NULL COMMENT '机构编码',
  `note` varchar(255) DEFAULT NULL COMMENT '单位介绍',
  `address` varchar(100) DEFAULT NULL COMMENT '单位地址',
  `telephone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '单位邮箱',
  `website` varchar(100) DEFAULT NULL COMMENT '单位网站',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_UNIT_PATH` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_unit 的数据：~1 rows (大约)
DELETE FROM `sys_unit`;
/*!40000 ALTER TABLE `sys_unit` DISABLE KEYS */;
INSERT INTO `sys_unit` (`id`, `parentId`, `path`, `name`, `aliasName`, `unitcode`, `note`, `address`, `telephone`, `email`, `website`, `location`, `hasChildren`, `opBy`, `opAt`, `delFlag`) VALUES
	('f14864d8ba8c4b8cab17b004801cde8b', '', '0001', '系统管理', 'System', NULL, NULL, '银河-太阳系-地球', '', 'wizzer@qq.com', 'http://www.wizzer.cn', 1, 0, '', 1492247371, 0);
/*!40000 ALTER TABLE `sys_unit` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `loginname` varchar(120) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '密码盐',
  `username` varchar(100) DEFAULT NULL COMMENT '用户名',
  `isOnline` tinyint(1) DEFAULT NULL COMMENT '是否在线',
  `disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `email` varchar(255) DEFAULT NULL,
  `loginAt` int(32) DEFAULT NULL COMMENT '登陆时间',
  `loginIp` varchar(255) DEFAULT NULL COMMENT '登陆IP',
  `loginCount` int(32) DEFAULT NULL COMMENT '登陆次数',
  `customMenu` varchar(255) DEFAULT NULL COMMENT '常用菜单',
  `loginTheme` varchar(100) DEFAULT NULL COMMENT '皮肤样式',
  `loginSidebar` tinyint(1) DEFAULT NULL,
  `loginBoxed` tinyint(1) DEFAULT NULL,
  `loginScroll` tinyint(1) DEFAULT NULL,
  `loginPjax` tinyint(1) DEFAULT NULL,
  `unitid` varchar(32) DEFAULT NULL,
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_SYS_USER_LOGINNAMAE` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_user 的数据：~1 rows (大约)
DELETE FROM `sys_user`;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `loginname`, `password`, `salt`, `username`, `isOnline`, `disabled`, `email`, `loginAt`, `loginIp`, `loginCount`, `customMenu`, `loginTheme`, `loginSidebar`, `loginBoxed`, `loginScroll`, `loginPjax`, `unitid`, `opBy`, `opAt`, `delFlag`) VALUES
	('295da53a22ec43f980a80135b0fe9cf7', 'superadmin', 'dueO0xl9Kh0uWPTUZITDFoBKfyH67LNpBS63ntH3lu8=', '4T56oEZeojBuJVvATuVNag==', '超级管理员', 1, 0, 'wizzer@qq.com', 1492431586, '127.0.0.1', 7, NULL, 'palette.3.css', 0, 0, 0, 1, 'f14864d8ba8c4b8cab17b004801cde8b', '', 1492247373, 0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `userId` varchar(32) DEFAULT NULL,
  `roleId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_user_role 的数据：~1 rows (大约)
DELETE FROM `sys_user_role`;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`userId`, `roleId`) VALUES
	('295da53a22ec43f980a80135b0fe9cf7', '1c4e326622aa489eb3019480a57df4aa');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;


-- 导出  表 nutzwk.sys_user_unit 结构
CREATE TABLE IF NOT EXISTS `sys_user_unit` (
  `userId` varchar(32) DEFAULT NULL,
  `unitId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.sys_user_unit 的数据：~1 rows (大约)
DELETE FROM `sys_user_unit`;
/*!40000 ALTER TABLE `sys_user_unit` DISABLE KEYS */;
INSERT INTO `sys_user_unit` (`userId`, `unitId`) VALUES
	('295da53a22ec43f980a80135b0fe9cf7', 'f14864d8ba8c4b8cab17b004801cde8b');
/*!40000 ALTER TABLE `sys_user_unit` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_config 结构
CREATE TABLE IF NOT EXISTS `wx_config` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `appname` varchar(120) DEFAULT NULL COMMENT '公众号名称',
  `ghid` varchar(100) DEFAULT NULL COMMENT '原始ID',
  `appid` varchar(50) DEFAULT NULL COMMENT 'Appid',
  `appsecret` varchar(50) DEFAULT NULL COMMENT 'Appsecret',
  `encodingAESKey` varchar(100) DEFAULT NULL COMMENT 'EncodingAESKey',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `access_token` varchar(255) DEFAULT NULL COMMENT 'access_token',
  `access_token_expires` int(32) DEFAULT NULL COMMENT 'access_token_expires',
  `access_token_lastat` varchar(50) DEFAULT NULL COMMENT 'access_token_lastat',
  `payEnabled` tinyint(1) DEFAULT NULL COMMENT '禁用支付',
  `payInfo` text COMMENT '支付信息',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_config 的数据：~0 rows (大约)
DELETE FROM `wx_config`;
/*!40000 ALTER TABLE `wx_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_config` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_mass 结构
CREATE TABLE IF NOT EXISTS `wx_mass` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '群发名称',
  `type` varchar(20) DEFAULT NULL COMMENT '群发类型',
  `media_id` varchar(255) DEFAULT NULL COMMENT '媒体文件ID',
  `scope` varchar(20) DEFAULT NULL COMMENT 'Scope',
  `content` text COMMENT 'Content',
  `status` int(32) DEFAULT NULL COMMENT '发送状态',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_mass 的数据：~0 rows (大约)
DELETE FROM `wx_mass`;
/*!40000 ALTER TABLE `wx_mass` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_mass` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_mass_news 结构
CREATE TABLE IF NOT EXISTS `wx_mass_news` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `thumb_media_id` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `author` varchar(120) DEFAULT NULL COMMENT '作者',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content_source_url` varchar(255) DEFAULT NULL COMMENT '原地址',
  `content` text COMMENT '图文内容',
  `digest` text COMMENT '摘要',
  `show_cover_pic` int(32) DEFAULT NULL COMMENT '显示封面',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_mass_news 的数据：~0 rows (大约)
DELETE FROM `wx_mass_news`;
/*!40000 ALTER TABLE `wx_mass_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_mass_news` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_mass_send 结构
CREATE TABLE IF NOT EXISTS `wx_mass_send` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `massId` varchar(32) DEFAULT NULL COMMENT '群发ID',
  `receivers` text COMMENT 'Openid列表',
  `status` int(32) DEFAULT NULL COMMENT '发送状态',
  `msgId` varchar(32) DEFAULT NULL COMMENT 'msgId',
  `errCode` varchar(32) DEFAULT NULL COMMENT 'errCode',
  `errMsg` varchar(255) DEFAULT NULL COMMENT 'errMsg',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_mass_send 的数据：~0 rows (大约)
DELETE FROM `wx_mass_send`;
/*!40000 ALTER TABLE `wx_mass_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_mass_send` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_menu 结构
CREATE TABLE IF NOT EXISTS `wx_menu` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parentId` varchar(32) DEFAULT NULL COMMENT '父ID',
  `path` varchar(100) DEFAULT NULL COMMENT '树路径',
  `menuName` varchar(20) DEFAULT NULL COMMENT '菜单名称',
  `menuType` varchar(20) DEFAULT NULL COMMENT '菜单类型',
  `menuKey` varchar(20) DEFAULT NULL COMMENT '关键词',
  `url` varchar(255) DEFAULT NULL COMMENT '网址',
  `appid` varchar(255) DEFAULT NULL COMMENT '小程序appid',
  `pagepath` varchar(255) DEFAULT NULL COMMENT '小程序入口页',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `hasChildren` tinyint(1) DEFAULT NULL COMMENT '有子节点',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_menu 的数据：~0 rows (大约)
DELETE FROM `wx_menu`;
/*!40000 ALTER TABLE `wx_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_menu` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_msg 结构
CREATE TABLE IF NOT EXISTS `wx_msg` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `content` text COMMENT '信息内容',
  `replyId` varchar(32) DEFAULT NULL COMMENT '回复ID',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_msg 的数据：~0 rows (大约)
DELETE FROM `wx_msg`;
/*!40000 ALTER TABLE `wx_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_msg` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_msg_reply 结构
CREATE TABLE IF NOT EXISTS `wx_msg_reply` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `msgid` varchar(32) DEFAULT NULL COMMENT 'msgid',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `content` text COMMENT '信息内容',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_msg_reply 的数据：~0 rows (大约)
DELETE FROM `wx_msg_reply`;
/*!40000 ALTER TABLE `wx_msg_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_msg_reply` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_reply 结构
CREATE TABLE IF NOT EXISTS `wx_reply` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `type` varchar(20) DEFAULT NULL COMMENT '回复类型',
  `msgType` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `keyword` varchar(50) DEFAULT NULL COMMENT '关键词',
  `content` text COMMENT '回复内容',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_reply 的数据：~0 rows (大约)
DELETE FROM `wx_reply`;
/*!40000 ALTER TABLE `wx_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_reply` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_reply_news 结构
CREATE TABLE IF NOT EXISTS `wx_reply_news` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '摘要',
  `picUrl` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '文章路径',
  `location` int(32) DEFAULT NULL COMMENT '排序字段',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_reply_news 的数据：~0 rows (大约)
DELETE FROM `wx_reply_news`;
/*!40000 ALTER TABLE `wx_reply_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_reply_news` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_reply_txt 结构
CREATE TABLE IF NOT EXISTS `wx_reply_txt` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_reply_txt 的数据：~0 rows (大约)
DELETE FROM `wx_reply_txt`;
/*!40000 ALTER TABLE `wx_reply_txt` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_reply_txt` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_tpl_id 结构
CREATE TABLE IF NOT EXISTS `wx_tpl_id` (
  `id` varchar(32) NOT NULL COMMENT '模板编号',
  `template_id` varchar(255) DEFAULT NULL COMMENT '模板ID',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_tpl_id 的数据：~0 rows (大约)
DELETE FROM `wx_tpl_id`;
/*!40000 ALTER TABLE `wx_tpl_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_tpl_id` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_tpl_list 结构
CREATE TABLE IF NOT EXISTS `wx_tpl_list` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `template_id` varchar(100) DEFAULT NULL COMMENT '模板ID',
  `title` varchar(255) DEFAULT NULL COMMENT '模板标题',
  `primary_industry` varchar(100) DEFAULT NULL COMMENT '主营行业',
  `deputy_industry` varchar(100) DEFAULT NULL COMMENT '副营行业',
  `content` varchar(300) DEFAULT NULL COMMENT '模板内容',
  `example` varchar(300) DEFAULT NULL COMMENT '模板示例',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_WX_TPL_LIST` (`template_id`,`wxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_tpl_list 的数据：~0 rows (大约)
DELETE FROM `wx_tpl_list`;
/*!40000 ALTER TABLE `wx_tpl_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_tpl_list` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_tpl_log 结构
CREATE TABLE IF NOT EXISTS `wx_tpl_log` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `content` text COMMENT '发送内容',
  `status` int(32) DEFAULT NULL COMMENT '发送状态',
  `result` text COMMENT '发送结果',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_tpl_log 的数据：~0 rows (大约)
DELETE FROM `wx_tpl_log`;
/*!40000 ALTER TABLE `wx_tpl_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_tpl_log` ENABLE KEYS */;


-- 导出  表 nutzwk.wx_user 结构
CREATE TABLE IF NOT EXISTS `wx_user` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `openid` varchar(50) DEFAULT NULL COMMENT 'openid',
  `unionid` varchar(50) DEFAULT NULL COMMENT 'unionid',
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `subscribe` tinyint(1) DEFAULT NULL COMMENT '是否关注',
  `subscribeAt` int(32) DEFAULT NULL COMMENT '关注时间',
  `sex` int(32) DEFAULT NULL COMMENT '性别',
  `country` varchar(50) DEFAULT NULL COMMENT '国家',
  `province` varchar(50) DEFAULT NULL COMMENT '省份',
  `city` varchar(50) DEFAULT NULL COMMENT '城市',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信ID',
  `opBy` varchar(32) DEFAULT NULL COMMENT '操作人',
  `opAt` int(32) DEFAULT NULL COMMENT '操作时间',
  `delFlag` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `INDEX_WX_USER_OPENID` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  nutzwk.wx_user 的数据：~0 rows (大约)
DELETE FROM `wx_user`;
/*!40000 ALTER TABLE `wx_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wx_user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
