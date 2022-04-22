-- drop database if exists HW_socialmedia;    - checking for redundancy and creating the database
-- create database HW_socialmedia;
-- use HW_socialmedia; 

-- DROP TABLE IF EXISTS COMMENTS;  -- removing redunant tables if necessary 
-- DROP TABLE IF EXISTS POSTS;
-- DROP TABLE IF EXISTS USER_Data;  

CREATE TABLE USER_data(  
user_id INT NOT NULL auto_increment,
username VARCHAR(30) NOT NULL,
password VARCHAR(40) NOT NULL,
email VARCHAR (100) NOT NULL,
user_blurb VARCHAR(200),

PRIMARY KEY(user_id)
);
-- user data table, user_blurb is there for a quick profile message or about me type section

CREATE TABLE POSTS(
post_id INT NOT NULL auto_increment,
user_id INT NOT NULL,
post_content VARCHAR(300),
post_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

primary key(post_id),
foreign key(user_id) references user_data(user_id)
);

CREATE TABLE COMMENTS(
comment_id INT NOT NULL auto_increment,
post_id INT NOT NULL,
user_id INT NOT NULL,
comment_content VARCHAR(300),
comment_time TIMESTAMP DEFAULT current_timestamp,

primary key(comment_id),
foreign key(post_id) references POSTS(post_id),
foreign key(user_id) references USER_data(user_id)
);