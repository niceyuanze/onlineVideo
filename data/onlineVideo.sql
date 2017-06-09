-- 如果这个脚本把你的数据库删没了,你可别怪我 岳远泽

DROP DATABASE IF EXISTS onlineVideo;
CREATE DATABASE onlineVideo;
use onlineVideo;
set sql_safe_updates=0;

CREATE TABLE user(
  id VARCHAR(32) NOT NULL UNIQUE COMMENT 'ID',
  loginname VARCHAR (120) NOT NULL COMMENT '用户名',
  password VARCHAR (100) NOT NULL COMMENT '密码',
  name VARCHAR(50) NOT NULL COMMENT '用户昵称',
  email VARCHAR (32) NOT NULL COMMENT '邮箱',
  PRIMARY KEY (id),
  UNIQUE KEY INDEX_USER_LOGINNAME(loginname)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO user VALUES ('e140c7a322494a23bc1b85739b01113d','admin','3ef7164d1f6167cb9f2658c07d3c2f0a','老师您最好','admin@admin.com');



CREATE TABLE role (
  id VARCHAR(32) NOT NULL UNIQUE COMMENT 'ID',
  content VARCHAR(150) NOT NULL COMMENT '角色信息',
  PRIMARY KEY (id),
  UNIQUE KEY (content)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO role VALUES('e140c7a322494a23bc1b85739b01113d','normal');



CREATE TABLE user_role(
  user$id VARCHAR(32) NOT NULL  COMMENT '用户表的id',
  role$id VARCHAR(32) NOT NULL  COMMENT '角色表的id',
  state bool NOT NULL DEFAULT TRUE,
  PRIMARY KEY(user$id, role$id),
  CONSTRAINT USER_ROLE_FK_user FOREIGN KEY(user$id) REFERENCES user(id),
  CONSTRAINT USER_ROLE_FK_role FOREIGN KEY(role$id) REFERENCES role(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO user_role VALUES('e140c7a322494a23bc1b85739b01113d','e140c7a322494a23bc1b85739b01113d',true);



CREATE TABLE function(
	id VARCHAR(32) NOT NULL COMMENT 'ID',
	content VARCHAR(500) NOT NULL COMMENT '权利信息'
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE video(
  id VARCHAR(32) NOT NULL COMMENT 'ID',
  name VARCHAR(2000) NOT NULL COMMENT '影片名称',
  path VARCHAR(2000) NOT NULL COMMENT '影片路径',
  abstracts VARCHAR(2000) NOT NULL COMMENT '影片摘要',
  source VARCHAR(2000) NOT NULL COMMENT '片源信息',
--   cover VARCHAR(2000) NOT NULL COMMENT '封面地址'
  PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO video VALUES ('e6fa076138df460f83d0821d2dc02071',
'机器学习视频1',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云');


CREATE TABLE advertisement(
  id VARCHAR(32) NOT NULL COMMENT 'ID',
  name VARCHAR(4000) NOT NULL COMMENT '广告名字',
  path VARCHAR(4000) NOT NULL COMMENT '广告路径',
  PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO advertisement VALUES('2f88c0f94f2542daafd21248bbfc9ce0',
'Volkswagen.大众汽车2012超级碗广告狗狗合唱篇._爱给网_aigei_com',
'upload/advertisement/2f88c0f94f2542daafd21248bbfc9ce0_Volkswagen.大众汽车2012超级碗广告狗狗合唱篇._爱给网_aigei_com.mp4');




CREATE TABLE video_advertisement(
  id VARCHAR(32) NOT NULL COMMENT 'ID',
  video$id VARCHAR(32) NOT NULL COMMENT '视频的id',
  advertisement$id VARCHAR(32) NOT NULL COMMENT '广告的id',
  PRIMARY KEY(video$id, advertisement$id),
  CONSTRAINT VIDEO_ADVERTISEMENT_FK_VIDEO FOREIGN KEY(video$id) REFERENCES video(id),
  CONSTRAINT VIDEO_ADVERTISEMENT_FK_ADVERTISEMENT FOREIGN KEY(advertisement$id) REFERENCES advertisement(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO video_advertisement VALUES('5b3276c801c14d79a1fdf38bdd2de481',
'e6fa076138df460f83d0821d2dc02071',
'2f88c0f94f2542daafd21248bbfc9ce0'
);

