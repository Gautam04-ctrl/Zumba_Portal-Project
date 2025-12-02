CREATE DATABASE zumba_portal;
USE zumba_portal;

CREATE TABLE admin_login (
  admin_id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL
);

INSERT INTO admin_login(username, password) VALUES ('Rohit', 'admin@123');

CREATE TABLE batches (
  batch_id INT PRIMARY KEY AUTO_INCREMENT,
  batch_name VARCHAR(100) NOT NULL,
  timing VARCHAR(100)
);

INSERT INTO batches(batch_name, timing) VALUES ('Morning','7 AM - 8 AM'),('Evening','6 PM - 7 PM');

CREATE TABLE members (
  member_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL,
  gender VARCHAR(10),
  dob DATE,
  phone VARCHAR(20),
  address VARCHAR(255),
  batch_id INT,
  FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);
 
 select*from admin_login;
 
 select*from batches;
 
 select*from members;