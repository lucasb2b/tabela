CREATE DATABASE `tabela` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `tabela`;

CREATE TABLE users(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  typeof VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users_permissions(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  is_admin TINYINT(4) NOT NULL,
  `user_id` INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE brands(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  picture VARCHAR(255),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  brands_id INT NOT NULL
);

CREATE TABLE cars(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name_car VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  brands_id INT NOT NULL
);

CREATE TABLE cylinder_head(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  fuel VARCHAR(255) NOT NULL,
  material_kind VARCHAR(255) NOT NULL,
  name_engine VARCHAR(255) NOT NULL,
  standard_height VARCHAR(45) NOT NULL,
  minimum_height VARCHAR(45) NOT NULL,
  observation VARCHAR(255) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cars_cylinder_head(
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  cars_id INT NOT NULL,
  cylinder_head_id INT NOT NULL
);

ALTER TABLE `users_permissions`
ADD CONSTRAINT `fk_users_users_permissions` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `cars`
ADD CONSTRAINT `fk_cars_brands` FOREIGN KEY (`brands_id`) REFERENCES `brands`(`id`);

ALTER TABLE `cars_cylinder_head`
ADD CONSTRAINT `fk_car_cylinder` FOREIGN KEY (`cars_id`) REFERENCES `cars`(`id`);

ALTER TABLE `cars_cylinder_head`
ADD CONSTRAINT `fk_carsheight` FOREIGN KEY (`cylinder_head_id`) REFERENCES `cylinder_head`(`id`);