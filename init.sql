ALTER USER 'root'@'localhost' IDENTIFIED BY 'ProjetBI2026!';


CREATE USER 'bi_user'@'localhost' IDENTIFIED BY 'episen2026!';
CREATE USER 'bi_user'@'%' IDENTIFIED BY 'episen2026!';


FLUSH PRIVILEGES;


CREATE DATABASE ods_staging
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


CREATE DATABASE datawarehouse
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


GRANT ALL PRIVILEGES ON ods_staging.* TO 'bi_user'@'localhost';
GRANT ALL PRIVILEGES ON datawarehouse.* TO 'bi_user'@'localhost';
GRANT ALL PRIVILEGES ON ods_staging.* TO 'bi_user'@'%';
GRANT ALL PRIVILEGES ON datawarehouse.* TO 'bi_user'@'%';
FLUSH PRIVILEGES;
