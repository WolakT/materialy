create database ads_service;

use ads_service;

CREATE TABLE users (
 username VARCHAR(45) NOT NULL ,
 password VARCHAR(45) NOT NULL ,
 enabled TINYINT NOT NULL DEFAULT 1 ,
 phone_No varchar(45) not null,
 mail text not null,
 city varchar(45) not null,
 PRIMARY KEY (username)); 
 

Create Table Ads (
  Id int primary key auto_increment,
  username varchar(45),
  body varchar(5000) not null,
  price decimal
  );
  
  Alter table Ads add foreign key (username) references users(username) on delete restrict;

CREATE TABLE user_roles (
 user_role_id int(11) NOT NULL AUTO_INCREMENT,
 username varchar(45) NOT NULL,
 role varchar(45) NOT NULL,
 PRIMARY KEY (user_role_id));

alter table users add column city varchar(44) not null;
