 --MySQL 5.7.6 and later:

ALTER USER 'root'@'localhost' IDENTIFIED BY 'MyNewPass';

--MySQL 5.7.5 and earlier:

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('MyNewPass');