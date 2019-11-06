*** MARK DOWN (md)

https://github.com/codingspecialist/jsp-blog-mysql-2019-10

** 1. 사용자 생성 및 권한 주기 및 DB 생성
create user 'cos'@'localhost' identified by 'bitc5600';
GRANT ALL PRIVILEGES ON *.* TO cos@localhost;
create database cos;
use cos;


** 2. 테이블
CREATE TABLE user(
	id int auto_increment primary key,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    address varchar(100) not null,
    userProfile varchar(200),
    createDate timestamp
) engine=InnoDB default charset=utf8;

CREATE TABLE board(
	id int auto_increment primary key,
    userId int,
    title varchar(100) not null,
    content longtext,
    readCount int default 0,
    createDate timestamp,
    foreign key (userId) references user (id)
) engine=InnoDB default charset=utf8;


CREATE TABLE comment(
	id int auto_increment primary key,
    userId int,
    boardId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key (userId) references user (id),
    foreign key (boardId) references board (id)
) engine=InnoDB default charset=utf8;

CREATE TABLE reply(
	id int auto_increment primary key,
    commentId int,
    userId int,
    content varchar(300) not null,
    createDate timestamp,
    foreign key (commentId) references comment (id),
    foreign key (userId) references user (id)
) engine=InnoDB default charset=utf8;

** 3. Factory 세팅하기
https://blog.naver.com/codingspecialist/221681388208


** 4. 부트스트랩 커스터마이징 HTML파일
WebContent/ui_sample/**


** 5. 실행 영상
https://www.youtube.com/watch?v=머시기