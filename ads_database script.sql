create database ads_service;

use ads_service;

CREATE TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  phone_No int not null,
  mail text not null,
  PRIMARY KEY (username));
  
 

Create Table Ads (
  Id int primary key auto_increment,
  username varchar(45),
  body varchar(5000) not null,
  price decimal
  );
  
  Alter table Ads add foreign key (username) references users(username) on delete restrict;

alter table users add column city varchar(44) not null;
