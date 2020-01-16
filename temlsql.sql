
勿绑定手机会自动续费扣话费！如果频繁被挤就等下再用，你买的是共享号不要一直独占！容易冻结！记住购买网站zuxunlei.com 账户txtqxw302密码s112233

CREATE TABLE People(
    Pid int PRIMARY KEY AUTO_INCREMENT,
    Pname varchar(10) ,
    Pagee varchar(4),
    Psex varchar(4),
    Psymptom varchar(20),/*症状*/
    Phome varchar(10),
    Pdoctor varchar(10),
    Ptime datetime DEFAULT CURRENT_TIMESTAMP
)

SELECT COUNT(*) FROM people


insert into people(Pname,Pagee,Psex,Psymptom,Phome,Pdoctor) values ("李佳奇","19","男","秃头","整形科","李嵩浩医师");

CREATE TABLE commodity(
    Cid int PRIMARY KEY AUTO_INCREMENT,
    Cname varchar(100),    /* 商品名*/
    CstockNumber int,     /* 库存数量*/
    CshelfNumber int,     /* 架上数量*/
    CdayVolume int ,      /*单日售量*/
    CoutPrice float(15),  /* 售价*/
    CinPrice  float(15),  /* 进价*/
    Cucl varchar(6),      /*存放位置*/
    Ctype varchar(20)     /*类别*/
)
INSERT INTO commodity(Cname,CstockNumber,CshelfNumber,CdayVolume,CoutPrice,CinPrice,Cucl) values ('康师傅茉莉花茶',500,200,0,3.00,2.80,'A321');

CREATE TABLE user(
    Usid varchar(9) PRIMARY KEY,
    UsPass varchar(15),
    Usname varchar(10),
    Uslevel varchar(6),
)

CREATE TABLE user(
    Uname VARCHAR(15) PRIMARY KEY,
    UPassWord VARCHAR(35),
    Uemail VARCHAR(254)
)
DELETE FROM commodity WHERE Cid = 15

INSERT INTO user values ();

SELECT * FROM commodity 
WHERE commodity.Cname LIKE '%茶%' AND commodity.Cid = '187'

SELECT count(*) FROM commodity 
WHERE commodity.Cname LIKE '%茶%' AND commodity.Cid = '187'

UPDATE commodity SET Cname = "汇源果汁饮料"
WHERE Cid = 3

CREATE TABLE cstati(
    Ctime VARCHAR(15) PRIMARY KEY,
    Cmoney float(15) /*日销售额*/ 
)
SELECT * FROM cstati

课设数据库
用户
CREATE TABLE user(
    u_id INT PRIMARY KEY AUTO_INCREMENT,
    u_name NVARCHAR(50),
    u_password NVARCHAR(50),
    u_email NVARCHAR(50),
    u_phone NVARCHAR(50),
    u_age NVARCHAR(50),
    u_avatar_url NVARCHAR(50),/*头像地址*/
    /*最后修改日期*/
    u_create_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    u_live BOOLEAN DEFAULT 1/*状态列*/
)
管理员
CREATE TABLE admini(
    a_id INT,
    a_password NVARCHAR(50),
    a_create_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    a_live BOOLEAN DEFAULT 1, /*状态列*/
    FOREIGN KEY (a_id) REFERENCES user(u_id),
    PRIMARY KEY (a_id)
)
房屋
CREATE TABLE house(
    h_id INT PRIMARY KEY AUTO_INCREMENT,
    h_number NVARCHAR(50) ,/*门牌号*/
    h_money NVARCHAR(50),/*总价*/
    h_area NVARCHAR(50), /*面积*/
    h_floor NVARCHAR(50),/*楼层*/
    h_type NVARCHAR(50), /*类型*/
    h_url NVARCHAR(50),   /*房屋图片地址*/
    /*最后修改日期*/
    h_add_admin INT,/*添加者*/
    h_create_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    h_live BOOLEAN DEFAULT 1 ,/*状态列*/
    FOREIGN KEY (h_add_admin) REFERENCES admini(a_id)
)
喜欢
CREATE TABLE love(
    u_id INT(50),
    h_id INT(50),
    l_live BOOLEAN DEFAULT 1 ,/*状态列*/
    FOREIGN KEY (u_id) REFERENCES user(u_id),
    FOREIGN KEY (h_id) REFERENCES house(h_id),
    PRIMARY KEY(u_id,h_id)
    
)


INSERT INTO house(Hnumber,Hmoney,Harea,Hfloor,Htype,Hurl)
VALUES("233-6-3","888","60","6","1室1厅1卫","/images/houseIMG/One (1).jpg");

SELECT Hnumber FROM house;

SELECT Hnumber FROM house 
ORDER BY ABS(SUBSTRING(Hnumber,6))

INSERT INTO love(Uname,Hnumber) VALUES ("1","233-1-1");
DELETE FROM love WHERE Uname = '1' AND Hnumber = '233-1-1';

INSERT INTO house(h_number,h_money,h_area,h_floor,h_type,h_url,h_add_admin) VALUES('233-1-213','123','123','123','1室1厅1卫','/images/houseIMG/1.jpg','2');

SELECT l_live FROM love WHERE u_id = '1' AND h_id = '2';

UPDATE love SET l_live = '1' WHERE u_id = '1' AND h_id ='2';

SELECT h_id FROM love WHERE u_id = "2"

SELECT u_id,u_name,u_password,u_email,u_phone,u_age,u_avatar_url,u_create_date FROM user WHERE u_id = '2'AND u_live = 1;

UPDATE user SET u_live = '0' WHERE u_id = '1';

UPDATE user SET u_name = 'waabd626' WHERE u_id = '2';

SELECT u_id,u_name,u_password,u_email,u_phone,u_age,u_avatar_url,u_create_date FROM user WHERE (u_id LIKE '%1%' OR u_name LIKE '%1%' )AND u_live = 1;

CREATE TABLE user(
    u_id INT PRIMARY KEY AUTO_INCREMENT,
    u_name NVARCHAR(50),
    u_password NVARCHAR(50),
    u_email NVARCHAR(50),
    u_phone NVARCHAR(50),
    u_age NVARCHAR(50),
)

SELECT house.h_id COUNT(love.h_id) FROM love LEFT JOIN house ON love.h_id = house.h_id GROUP BY love.h_id;
SELECT love.h_id,COUNT(love.h_id) FROM love LEFT JOIN house ON love.h_id = house.h_id GROUP BY love.h_id;



#重修报名系统数据库

CREATE DATABASE db_rtrs DEFAULT CHARACTER SET utf8;
/*科目表*/
CREATE TABLE re_course(
    co_id INT PRIMARY KEY AUTO_INCREMENT, /*课程编号*/
    co_name  varchar(50)  not null, /*课程名*/
    co_make  varchar(250) not null, /*课程公告*/
    co_price float(10,4)  not null, /*重修费用*/
    co_Regist_open BOOLEAN not null DEFAULT 0 /*是否开启报名（默认关闭）*/
)
/*学生_科目表*/
CREATE TABLE re_course_stydent(
    co_id INT not null,/*课程编号*/
    st_id varchar(50) not null,/*学号*/
    moneyed float(10,4) not null DEFAULT 0.0, /*已缴费金额*/
    confirm BOOLEAN  not null DEFAULT 0,   /*确认已缴费*/
    FOREIGN KEY (co_id) REFERENCES re_course(co_id),
    FOREIGN KEY (st_id) REFERENCES student(st_id),  
    PRIMARY KEY(co_id,st_id)
)
/*学生表*/
CREATE TABLE student(
    st_ticket     varchar(50) not null, /*考号*/
    st_name       varchar(50) not null, /*姓名*/
    st_college    varchar(50) not null, /*学院-学部*/
    st_department varchar(50) not null, /*系别-学部*/
    st_id         varchar(50) not null primary key ,/*学号*/
    st_up_date DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP/*最后修改日期*/
)
