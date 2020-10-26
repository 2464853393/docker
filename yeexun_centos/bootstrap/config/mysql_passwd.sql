set global validate_password_policy=0;
set global validate_password_length=1;
SET PASSWORD = PASSWORD('123456');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456'); 
FLUSH PRIVILEGES;

grant all privileges on *.* to 'root'@'*' identified by '123456' with grant option;
FLUSH PRIVILEGES;
