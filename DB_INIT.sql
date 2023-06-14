USE [master]
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'OnlineJudgeDB')
	DROP DATABASE OnlineJudgeDB
GO

CREATE DATABASE OnlineJudgeDB
GO

use OnlineJudgeDB
GO
Create Table users (username varchar(30), password varchar(30), email varchar(30), score int, PRIMARY KEY (username))
GO
INSERT INTO users (username, password, email, score) VALUES ('admin', '1', 'admin@gmail.com', 0)
INSERT INTO users (username, password, email, score) VALUES ('phucnt', '1', 'phucnthe176442@fpt.edu.vn', 100)
GO
select * from users order by score DESC
GO
Create Table submissions (username varchar(30), taskname varchar(30), status varchar(30), date varchar(30), slug varchar(30), code varchar(256))
GO
INSERT INTO submissions (username, taskname, status, date, slug, code) VALUES ('phucnt', 'Q1', 'Accepted', '2023-06-14 12:45:43', 'Q1', 'alo alo')
GO
select * from submissions 
GO

drop table submissions

/* test */
update users
set score = 0
where username = 'admin'
