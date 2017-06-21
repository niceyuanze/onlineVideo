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



-- CREATE TABLE role (
--   id VARCHAR(32) NOT NULL UNIQUE COMMENT 'ID',
--   content VARCHAR(150) NOT NULL COMMENT '角色信息',
--   PRIMARY KEY (id),
--   UNIQUE KEY (content)
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- INSERT INTO role VALUES('e140c7a322494a23bc1b85739b01113d','normal');
--
--
--
-- CREATE TABLE user_role(
--   user$id VARCHAR(32) NOT NULL  COMMENT '用户表的id',
--   role$id VARCHAR(32) NOT NULL  COMMENT '角色表的id',
--   state bool NOT NULL DEFAULT TRUE,
--   PRIMARY KEY(user$id, role$id),
--   CONSTRAINT USER_ROLE_FK_user FOREIGN KEY(user$id) REFERENCES user(id),
--   CONSTRAINT USER_ROLE_FK_role FOREIGN KEY(role$id) REFERENCES role(id)
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- INSERT INTO user_role VALUES('e140c7a322494a23bc1b85739b01113d','e140c7a322494a23bc1b85739b01113d',true);
--
--
--
-- CREATE TABLE function(
-- 	id VARCHAR(32) NOT NULL COMMENT 'ID',
-- 	content VARCHAR(500) NOT NULL COMMENT '权利信息'
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;





CREATE TABLE type(
  id VARCHAR(32) NOT NULL COMMENT 'ID',
  name VARCHAR(200) NOT NULL COMMENT'类别名字',
  PRIMARY KEY(name),
  UNIQUE KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO type VALUES ('3ef7164d1f6167cb9f2658c07d3c2f0a','学习视频');
INSERT INTO type VALUES ('7897c738bf294ae8a814daa88fa630f8','娱乐视频');

CREATE TABLE video(
  id VARCHAR(32) NOT NULL COMMENT 'ID',
  name VARCHAR(2000) NOT NULL COMMENT '影片名称',
  path VARCHAR(2000) NOT NULL COMMENT '影片路径',
  abstracts VARCHAR(2000) NOT NULL COMMENT '影片摘要',
  source VARCHAR(2000) NOT NULL COMMENT '片源信息',
  type VARCHAR(200) NOT NULL COMMENT'影片类别',
  cover VARCHAR(2000) NOT NULL COMMENT '封面地址',
  PRIMARY KEY(id),
  CONSTRAINT VIDEO_FK_TYPE FOREIGN KEY(type) REFERENCES type(name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO video VALUES ('e6fa076138df460f83d0821d2dc02071',
'机器学习视频1',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','学习视频','upload/cover/test.jpg');

INSERT INTO video VALUES ('3982897928dc4a3da1e9d95ea106a871',
'机器学习视频2',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','学习视频','upload/cover/test.jpg');

INSERT INTO video VALUES ('91df774f91bc4b9e9781dac2f66825d6',
'机器学习视频3',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','学习视频','upload/cover/test.jpg');
INSERT INTO video VALUES ('d7af54696925467c99c1e38e3d60f134',
'机器学习视频4',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','学习视频','upload/cover/test.jpg');



INSERT INTO video VALUES ('9499af4ce8c44808ae5f3c59703bf745',
'娱乐视频1',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','娱乐视频','upload/cover/test.jpg');

INSERT INTO video VALUES ('5497649eefd24e6abf3f1bffa43cb7ea',
'娱乐视频2',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','娱乐视频','upload/cover/test.jpg');

INSERT INTO video VALUES ('9f1c3f51c1a64ea7813738226b8e52a7',
'娱乐视频3',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','娱乐视频','upload/cover/test.jpg');
INSERT INTO video VALUES ('0a3842f20bac4f6c94f87f72a1a4aa3d',
'娱乐视频4',
'upload/video/study/e6fa076138df460f83d0821d2dc02071ml1.mp4',
'学好机器学习很重要',
'来自百度云','娱乐视频','upload/cover/test.jpg');










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
--   id VARCHAR(32) NOT NULL COMMENT 'ID',
  video$id VARCHAR(32) NOT NULL COMMENT '视频的id',
  advertisement$id VARCHAR(32) NOT NULL COMMENT '广告的id',
  PRIMARY KEY(video$id, advertisement$id),
  CONSTRAINT VIDEO_ADVERTISEMENT_FK_VIDEO FOREIGN KEY(video$id) REFERENCES video(id),
  CONSTRAINT VIDEO_ADVERTISEMENT_FK_ADVERTISEMENT FOREIGN KEY(advertisement$id) REFERENCES advertisement(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO video_advertisement VALUES(
'e6fa076138df460f83d0821d2dc02071',
'2f88c0f94f2542daafd21248bbfc9ce0'
);

CREATE TABLE role(
  id VARCHAR(32) NOT NULL ,
  content VARCHAR(100) NOT NULL,
  homePage VARCHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (content)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO role VALUES ('3a8e94d86fda499ca97d78947e493e4e','系统管理员','admin.html');
INSERT INTO role VALUES ('eebf1e7b4d3b492bb400599e8a03fd3d','影视资料管理员','videoManager.html');

CREATE TABLE staff(
  staffCode VARCHAR(6) NOT NULL COMMENT '员工号',
  password VARCHAR(100) NOT NULL COMMENT '员工登录密码',
  name VARCHAR(100) NOT NULL COMMENT '员工姓名',
  role$id VARCHAR(32) NOT NULL COMMENT '员工角色',
  PRIMARY KEY (staffCode),
  CONSTRAINT STAFF_STAFFCODE_FK FOREIGN KEY (role$id) REFERENCES role(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO staff VALUES ('AAAAAA','a7d0ba86b047d2e1e8f163ccc60307df','张学友','3a8e94d86fda499ca97d78947e493e4e');
INSERT INTO staff VALUES ('BBBBBB','60324d885e31febc4af3efbb6c7d867c','刘德华','eebf1e7b4d3b492bb400599e8a03fd3d');


-- cf983b6531fc449f99dcb367fce1c66e
-- 3a282574499a4c4ba8fb823872de4b97
-- 253bcab695b74faabb5c3db8ebcd15a2
-- 5bda264f63974b41a3a40a663da13d64
-- 79083f392460439d8e2c71334e2ce50e
-- 8d10fd2aa70f477fb473b92c738098ae
-- 0a16f34e8d024838b038d013a9749b99
-- 05608da8a13f4d6f95b8f662685b211b
-- 5e281129d647438faf72354e6a2fefd3
-- c5f7e1e1aa4d4133b9670ad08d6f2924

