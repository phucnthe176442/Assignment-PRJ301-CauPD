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
GO
select * from users
GO

/* test */
update users
set score = 0
where username = 'admin'
