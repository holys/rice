CREATE DATABASE IF NOT EXISTS `rice`;

USE `rice`;

CREATE TABLE IF NOT EXISTS `rice_user` (
	`userid` BIGINT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(40) NOT NULL DEFAULT "",
	`avatar_url` VARCHAR(255) NOT NULL DEFAULT "",
	`password` VARCHAR(255) NOT NULL,
	`status` ENUM('active', 'inactive', `banned`) NOT NULL DEFAULT 'inactive',
	`created_at` INT UNSIGNED NOT NULL DEFAULT 0,
	`updated_at` INT UNSIGNED NOT NULL DEFAULT 0,
	`deleted_at` INT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`userid`),
	UNIQUE KEY `name`
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户基本属性表';

CREATE TABLE IF NOT EXISTS `rice_user_profile` (
	`_id` BIGINT NOT NULL AUTO_INCREMENT,
	`userid` BIGINT NOT NULL,
	`key` VARCHAR(20) NOT NULL,
	`value` VARCHAR(100) NOT NULL,
	PRIMARY KEY(`_id`),
	UNIQUE KEY `_uk_userid_key`(`userid`, `key`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户扩展属性表';

CREATE TABLE IF NOT EXISTS `rice_email_bind`(
	`_id` BIGINT NOT NULL AUTO_INCREMENT,
	`userid` BIGINT NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`status` ENUM('active', 'inactive') DEFAULT 'inactive',
	`created_at` INT UNSIGNED NOT NULL,
	PRIMARY KEY (`_id`),
	KEY `_idx_user`(`userid`),
	UNIQUE KEY `_uk_email`(`email`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户email绑定表';

CREATE TABLE IF NOT EXISTS `rice_phone_bind`(
	`_id` BIGINT NOT NULL AUTO_INCREMENT,
	`userid` BIGINT NOT NULL,
	`phone` VARCHAR(20) NOT NULL,
	`created_at` INT UNSIGNED NOT NULL,
	PRIMARY KEY(`_id`),
	KEY `_idx_user`(`userid`),
	UNIQUE KEY `_uk_phone`(`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户手机号绑定表';

CREATE TABLE IF NOT EXISTS `rice_oauth_bind` (
	`_id` BIGINT NOT NULL AUTO_INCREMENT,
	`userid` BIGINT NOT NULL,
	`type` ENUM('qq', 'wechat', 'weibo') NOT NULL COMMENT '第三方账号类型',
	`authid` VARCHAR(60) NOT NULL,
	`nickname` VARCHAR(50) NOT NULL DEFAULT '',
	`avatar_url` VARCHAR(255) NOT NULL DEFAULT '',
	`created_at` INT UNSIGNED NOT NULL,
	PRIMARY KEY(`_id`),
	KEY `_idx_user`(`userid`),
	KEY `_idx_authid`(`authid`),
	UNIQUE KEY `_uk_oauth`(`type`, `authid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户OAuth账号绑定表';


