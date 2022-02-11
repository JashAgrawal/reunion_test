CREATE TABLE `tbluser_details` (
    `User_Id` varchar(200) NOT NULL,
    `User_Name` varchar(100) DEFAULT NULL,
    `Email` varchar(100) DEFAULT NULL,
    `PasswordHash` varchar(500) DEFAULT NULL,
    `salt` varchar(100) DEFAULT NULL,
    `isDelete` varchar(100) DEFAULT '0',
    `created_date` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`User_Id`)
  );

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUp`(IN User_Ids varchar(200),IN User_Names varchar(200),IN Emails varchar(200),IN PasswordHashs varchar(200),IN salts varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails or User_Name = User_Names) then
begin
select 'Email OR UserName Already Exists' as 'Messaage',false as 'SuccessFull';
end;
else 
begin
INSERT INTO tbluser_details
(`User_Id`,`User_Name`,`Email`,`PasswordHash`,`salt`,
isDelete,
created_date)
VALUES
(User_Ids,User_Names,Emails,PasswordHashs,salts,
0,
now());
select 'SuccessFully Signed Up' as 'Messaage',true as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in Emails varchar(200),in PasswordHashs varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails) then
begin
if(select 1=1 from tbluser_details where Email = Emails and PasswordHash = PasswordHashs) then
begin
select 'SuccessFully Loggen In' as 'Messaage',true as 'SuccessFull',User_Id from tbluser_details where Email = Emails and PasswordHash = PasswordHashs;
end;
else
begin
select 'Incorrect Password' as 'Messaage',false as 'SuccessFull';
end;
end if;
end;
else 
begin
select 'Email Does Exists' as 'Messaage',false as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ForgotPassword`(IN Emails varchar(200),IN PasswordHashs varchar(200),IN salts varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails or User_Name = User_Names) then
begin
CALL `auto_backend`.`update_user_details`(null, null,null, Emails,PasswordHashs,salts,null,null);
select 'SuccessFully Changed Password' as 'Messaage',true as 'SuccessFull';
end;
else 
begin
select 'Email Does Not Exists' as 'Messaage',false as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  
undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_user;
  
  DELIMITER $$
  CREATE PROCEDURE Add_user (IN ids String,IN postss varchar(200),IN no_of_followerss varchar(200),IN followings varchar(200),IN userNames varchar(200))
  BEGIN
  INSERT INTO user
  (`id`
,`posts`
,`no_of_followers`
,`following`
,`userName`
,
  isDelete,
  created_date)
  VALUES
  (ids
,postss
,no_of_followerss
,followings
,userNames
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_user;
DELIMITER $$
CREATE PROCEDURE Get_All_user ()
BEGIN
select * from user where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_user;
  DELIMITER $$
  CREATE PROCEDURE Update_user (IN ids String,IN postss varchar(200),IN no_of_followerss varchar(200),IN followings varchar(200),IN userNames varchar(200))
  BEGIN
  UPDATE user
  SET
  `id` = ifnull(ids,`id`)
,`posts` = ifnull(postss,`posts`)
,`no_of_followers` = ifnull(no_of_followerss,`no_of_followers`)
,`following` = ifnull(followings,`following`)
,`userName` = ifnull(userNames,`userName`)

  WHERE id = ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_user;
  DELIMITER $$
  CREATE PROCEDURE Delete_user (IN ids varchar(200))
  BEGIN
  UPDATE user
  SET
  isDelete = 1
  WHERE id = ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_user;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_user ()
  BEGIN
  select * from user where id = ids  ;
  END$$
  DELIMITER ;
undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_comments;
  
  DELIMITER $$
  CREATE PROCEDURE Add_comments (IN comment_Ids String,IN contents varchar(200),IN repliess varchar(200))
  BEGIN
  INSERT INTO comments
  (`comment_Id`
,`content`
,`replies`
,
  isDelete,
  created_date)
  VALUES
  (comment_Ids
,contents
,repliess
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_comments;
DELIMITER $$
CREATE PROCEDURE Get_All_comments ()
BEGIN
select * from comments where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_comments;
  DELIMITER $$
  CREATE PROCEDURE Update_comments (IN comment_Ids String,IN contents varchar(200),IN repliess varchar(200))
  BEGIN
  UPDATE comments
  SET
  `comment_Id` = ifnull(comment_Ids,`comment_Id`)
,`content` = ifnull(contents,`content`)
,`replies` = ifnull(repliess,`replies`)

  WHERE comment_Id = comment_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_comments;
  DELIMITER $$
  CREATE PROCEDURE Delete_comments (IN comment_Ids varchar(200))
  BEGIN
  UPDATE comments
  SET
  isDelete = 1
  WHERE comment_Id = comment_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_comments;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_comments ()
  BEGIN
  select * from comments where comment_Id = comment_Ids  ;
  END$$
  DELIMITER ;
undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_user;
  
  DELIMITER $$
  CREATE PROCEDURE Add_user (IN ids String,IN postss varchar(200),IN no_of_followerss varchar(200),IN followings varchar(200),IN userNames varchar(200))
  BEGIN
  INSERT INTO user
  (`id`
,`posts`
,`no_of_followers`
,`following`
,`userName`
,
  isDelete,
  created_date)
  VALUES
  (ids
,postss
,no_of_followerss
,followings
,userNames
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_user;
DELIMITER $$
CREATE PROCEDURE Get_All_user ()
BEGIN
select * from user where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_user;
  DELIMITER $$
  CREATE PROCEDURE Update_user (IN ids String,IN postss varchar(200),IN no_of_followerss varchar(200),IN followings varchar(200),IN userNames varchar(200))
  BEGIN
  UPDATE user
  SET
  `id` = ifnull(ids,`id`)
,`posts` = ifnull(postss,`posts`)
,`no_of_followers` = ifnull(no_of_followerss,`no_of_followers`)
,`following` = ifnull(followings,`following`)
,`userName` = ifnull(userNames,`userName`)

  WHERE id = ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_user;
  DELIMITER $$
  CREATE PROCEDURE Delete_user (IN ids varchar(200))
  BEGIN
  UPDATE user
  SET
  isDelete = 1
  WHERE id = ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_user;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_user ()
  BEGIN
  select * from user where id = ids  ;
  END$$
  DELIMITER ;
undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_comments;
  
  DELIMITER $$
  CREATE PROCEDURE Add_comments (IN comment_Ids String,IN contents varchar(200),IN repliess varchar(200))
  BEGIN
  INSERT INTO comments
  (`comment_Id`
,`content`
,`replies`
,
  isDelete,
  created_date)
  VALUES
  (comment_Ids
,contents
,repliess
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_comments;
DELIMITER $$
CREATE PROCEDURE Get_All_comments ()
BEGIN
select * from comments where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_comments;
  DELIMITER $$
  CREATE PROCEDURE Update_comments (IN comment_Ids String,IN contents varchar(200),IN repliess varchar(200))
  BEGIN
  UPDATE comments
  SET
  `comment_Id` = ifnull(comment_Ids,`comment_Id`)
,`content` = ifnull(contents,`content`)
,`replies` = ifnull(repliess,`replies`)

  WHERE comment_Id = comment_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_comments;
  DELIMITER $$
  CREATE PROCEDURE Delete_comments (IN comment_Ids varchar(200))
  BEGIN
  UPDATE comments
  SET
  isDelete = 1
  WHERE comment_Id = comment_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_comments;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_comments ()
  BEGIN
  select * from comments where comment_Id = comment_Ids  ;
  END$$
  DELIMITER ;
CREATE TABLE `tbluser_details` (
    `User_Id` varchar(200) NOT NULL,
    `User_Name` varchar(100) DEFAULT NULL,
    `Email` varchar(100) DEFAULT NULL,
    `PasswordHash` varchar(500) DEFAULT NULL,
    `salt` varchar(100) DEFAULT NULL,
    `isDelete` varchar(100) DEFAULT '0',
    `created_date` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`User_Id`)
  );

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUp`(IN User_Ids varchar(200),IN User_Names varchar(200),IN Emails varchar(200),IN PasswordHashs varchar(200),IN salts varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails or User_Name = User_Names) then
begin
select 'Email OR UserName Already Exists' as 'Messaage',false as 'SuccessFull';
end;
else 
begin
INSERT INTO tbluser_details
(`User_Id`,`User_Name`,`Email`,`PasswordHash`,`salt`,
isDelete,
created_date)
VALUES
(User_Ids,User_Names,Emails,PasswordHashs,salts,
0,
now());
select 'SuccessFully Signed Up' as 'Messaage',true as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in Emails varchar(200),in PasswordHashs varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails) then
begin
if(select 1=1 from tbluser_details where Email = Emails and PasswordHash = PasswordHashs) then
begin
select 'SuccessFully Loggen In' as 'Messaage',true as 'SuccessFull',User_Id from tbluser_details where Email = Emails and PasswordHash = PasswordHashs;
end;
else
begin
select 'Incorrect Password' as 'Messaage',false as 'SuccessFull';
end;
end if;
end;
else 
begin
select 'Email Does Exists' as 'Messaage',false as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ForgotPassword`(IN Emails varchar(200),IN PasswordHashs varchar(200),IN salts varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails or User_Name = User_Names) then
begin
CALL `auto_backend`.`update_user_details`(null, null,null, Emails,PasswordHashs,salts,null,null);
select 'SuccessFully Changed Password' as 'Messaage',true as 'SuccessFull';
end;
else 
begin
select 'Email Does Not Exists' as 'Messaage',false as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_posts;
  
  DELIMITER $$
  CREATE PROCEDURE Add_posts (IN post_Ids String,IN Titles varchar(200),IN Descriptions varchar(200),IN likess varchar(200),IN commentss varchar(200))
  BEGIN
  INSERT INTO posts
  (`post_Id`
,`Title`
,`Description`
,`likes`
,`comments`
,
  isDelete,
  created_date)
  VALUES
  (post_Ids
,Titles
,Descriptions
,likess
,commentss
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_posts;
DELIMITER $$
CREATE PROCEDURE Get_All_posts ()
BEGIN
select * from posts where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_posts;
  DELIMITER $$
  CREATE PROCEDURE Update_posts (IN post_Ids String,IN Titles varchar(200),IN Descriptions varchar(200),IN likess varchar(200),IN commentss varchar(200))
  BEGIN
  UPDATE posts
  SET
  `post_Id` = ifnull(post_Ids,`post_Id`)
,`Title` = ifnull(Titles,`Title`)
,`Description` = ifnull(Descriptions,`Description`)
,`likes` = ifnull(likess,`likes`)
,`comments` = ifnull(commentss,`comments`)

  WHERE post_Id = post_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_posts;
  DELIMITER $$
  CREATE PROCEDURE Delete_posts (IN post_Ids varchar(200))
  BEGIN
  UPDATE posts
  SET
  isDelete = 1
  WHERE post_Id = post_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_posts;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_posts ()
  BEGIN
  select * from posts where post_Id = post_Ids  ;
  END$$
  DELIMITER ;
undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_user;
  
  DELIMITER $$
  CREATE PROCEDURE Add_user (IN ids String,IN postss varchar(200),IN no_of_followerss varchar(200),IN followings varchar(200),IN userNames varchar(200))
  BEGIN
  INSERT INTO user
  (`id`
,`posts`
,`no_of_followers`
,`following`
,`userName`
,
  isDelete,
  created_date)
  VALUES
  (ids
,postss
,no_of_followerss
,followings
,userNames
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_user;
DELIMITER $$
CREATE PROCEDURE Get_All_user ()
BEGIN
select * from user where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_user;
  DELIMITER $$
  CREATE PROCEDURE Update_user (IN ids String,IN postss varchar(200),IN no_of_followerss varchar(200),IN followings varchar(200),IN userNames varchar(200))
  BEGIN
  UPDATE user
  SET
  `id` = ifnull(ids,`id`)
,`posts` = ifnull(postss,`posts`)
,`no_of_followers` = ifnull(no_of_followerss,`no_of_followers`)
,`following` = ifnull(followings,`following`)
,`userName` = ifnull(userNames,`userName`)

  WHERE id = ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_user;
  DELIMITER $$
  CREATE PROCEDURE Delete_user (IN ids varchar(200))
  BEGIN
  UPDATE user
  SET
  isDelete = 1
  WHERE id = ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_user;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_user ()
  BEGIN
  select * from user where id = ids  ;
  END$$
  DELIMITER ;
CREATE TABLE `tbluser_details` (
    `User_Id` varchar(200) NOT NULL,
    `User_Name` varchar(100) DEFAULT NULL,
    `Email` varchar(100) DEFAULT NULL,
    `PasswordHash` varchar(500) DEFAULT NULL,
    `salt` varchar(100) DEFAULT NULL,
    `isDelete` varchar(100) DEFAULT '0',
    `created_date` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`User_Id`)
  );

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUp`(IN User_Ids varchar(200),IN User_Names varchar(200),IN Emails varchar(200),IN PasswordHashs varchar(200),IN salts varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails or User_Name = User_Names) then
begin
select 'Email OR UserName Already Exists' as 'Messaage',false as 'SuccessFull';
end;
else 
begin
INSERT INTO tbluser_details
(`User_Id`,`User_Name`,`Email`,`PasswordHash`,`salt`,
isDelete,
created_date)
VALUES
(User_Ids,User_Names,Emails,PasswordHashs,salts,
0,
now());
select 'SuccessFully Signed Up' as 'Messaage',true as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in Emails varchar(200),in PasswordHashs varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails) then
begin
if(select 1=1 from tbluser_details where Email = Emails and PasswordHash = PasswordHashs) then
begin
select 'SuccessFully Loggen In' as 'Messaage',true as 'SuccessFull',User_Id from tbluser_details where Email = Emails and PasswordHash = PasswordHashs;
end;
else
begin
select 'Incorrect Password' as 'Messaage',false as 'SuccessFull';
end;
end if;
end;
else 
begin
select 'Email Does Exists' as 'Messaage',false as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ForgotPassword`(IN Emails varchar(200),IN PasswordHashs varchar(200),IN salts varchar(200))
BEGIN
if(select 1=1 from tbluser_details where Email = Emails or User_Name = User_Names) then
begin
CALL `auto_backend`.`update_user_details`(null, null,null, Emails,PasswordHashs,salts,null,null);
select 'SuccessFully Changed Password' as 'Messaage',true as 'SuccessFull';
end;
else 
begin
select 'Email Does Not Exists' as 'Messaage',false as 'SuccessFull';
end;
end if;
ENd$$
DELIMITER ;;

undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_comments;
  
  DELIMITER $$
  CREATE PROCEDURE Add_comments (IN comment_Ids String,IN contents varchar(200),IN repliess varchar(200))
  BEGIN
  INSERT INTO comments
  (`comment_Id`
,`content`
,`replies`
,
  isDelete,
  created_date)
  VALUES
  (comment_Ids
,contents
,repliess
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_comments;
DELIMITER $$
CREATE PROCEDURE Get_All_comments ()
BEGIN
select * from comments where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_comments;
  DELIMITER $$
  CREATE PROCEDURE Update_comments (IN comment_Ids String,IN contents varchar(200),IN repliess varchar(200))
  BEGIN
  UPDATE comments
  SET
  `comment_Id` = ifnull(comment_Ids,`comment_Id`)
,`content` = ifnull(contents,`content`)
,`replies` = ifnull(repliess,`replies`)

  WHERE comment_Id = comment_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_comments;
  DELIMITER $$
  CREATE PROCEDURE Delete_comments (IN comment_Ids varchar(200))
  BEGIN
  UPDATE comments
  SET
  isDelete = 1
  WHERE comment_Id = comment_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_comments;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_comments ()
  BEGIN
  select * from comments where comment_Id = comment_Ids  ;
  END$$
  DELIMITER ;
undefined

  create table comments(
    comment_Id String 
,content  
,replies  
,
    created_date varchar(200),
    isDelete varchar(200)
  );
 

  DROP procedure IF EXISTS Add_posts;
  
  DELIMITER $$
  CREATE PROCEDURE Add_posts (IN post_Ids String,IN Titles varchar(200),IN Descriptions varchar(200),IN likess varchar(200),IN commentss varchar(200))
  BEGIN
  INSERT INTO posts
  (`post_Id`
,`Title`
,`Description`
,`likes`
,`comments`
,
  isDelete,
  created_date)
  VALUES
  (post_Ids
,Titles
,Descriptions
,likess
,commentss
,
  0,
  now());
  
  END$$
  
  DELIMITER ;
DROP procedure IF EXISTS Get_All_posts;
DELIMITER $$
CREATE PROCEDURE Get_All_posts ()
BEGIN
select * from posts where isDelete = 0;
END$$
DELIMITER ;
  DROP procedure IF EXISTS Update_posts;
  DELIMITER $$
  CREATE PROCEDURE Update_posts (IN post_Ids String,IN Titles varchar(200),IN Descriptions varchar(200),IN likess varchar(200),IN commentss varchar(200))
  BEGIN
  UPDATE posts
  SET
  `post_Id` = ifnull(post_Ids,`post_Id`)
,`Title` = ifnull(Titles,`Title`)
,`Description` = ifnull(Descriptions,`Description`)
,`likes` = ifnull(likess,`likes`)
,`comments` = ifnull(commentss,`comments`)

  WHERE post_Id = post_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Delete_posts;
  DELIMITER $$
  CREATE PROCEDURE Delete_posts (IN post_Ids varchar(200))
  BEGIN
  UPDATE posts
  SET
  isDelete = 1
  WHERE post_Id = post_Ids  ;
  
  END$$
  
  DELIMITER ;
  DROP procedure IF EXISTS Get_By_Id_posts;
  DELIMITER $$
  CREATE PROCEDURE Get_By_Id_posts ()
  BEGIN
  select * from posts where post_Id = post_Ids  ;
  END$$
  DELIMITER ;
