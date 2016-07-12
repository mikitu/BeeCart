
-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `address_ibfk_3` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `affiliate`;
CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  CONSTRAINT `affiliate_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `affiliate_ibfk_2` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliate_activity`;
CREATE TABLE `affiliate_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`),
  CONSTRAINT `affiliate_activity_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliate_login`;
CREATE TABLE `affiliate_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `affiliate_transaction`;
CREATE TABLE `affiliate_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliate_id` (`affiliate_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `affiliate_transaction_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliate` (`id`),
  CONSTRAINT `affiliate_transaction_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `api_ip`;
CREATE TABLE `api_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_id` (`api_id`),
  CONSTRAINT `api_ip_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `api` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `api_session`;
CREATE TABLE `api_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_id` (`api_id`),
  CONSTRAINT `api_session_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `api` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_group_id` (`attribute_group_id`),
  CONSTRAINT `attribute_ibfk_1` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `attribute_description`;
CREATE TABLE `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `attribute_description_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  CONSTRAINT `attribute_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `attribute_group`;
CREATE TABLE `attribute_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `attribute_group_description`;
CREATE TABLE `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `attribute_group_description_ibfk_1` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_group` (`id`),
  CONSTRAINT `attribute_group_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE `banner_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `banner_id` (`banner_id`),
  CONSTRAINT `banner_image_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `banner_image_description`;
CREATE TABLE `banner_image_description` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`,`language_id`),
  KEY `banner_id` (`banner_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `banner_image_description_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`),
  CONSTRAINT `banner_image_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`),
  KEY `product_id` (`product_id`),
  KEY `recurring_id` (`recurring_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`recurring_id`) REFERENCES `recurring` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category_description`;
CREATE TABLE `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `category_description_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `category_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category_filter`;
CREATE TABLE `category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`),
  KEY `filter_id` (`filter_id`),
  CONSTRAINT `category_filter_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `category_filter_ibfk_2` FOREIGN KEY (`filter_id`) REFERENCES `filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category_path`;
CREATE TABLE `category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`),
  CONSTRAINT `category_path_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category_to_layout`;
CREATE TABLE `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `category_to_layout_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `category_to_layout_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `category_to_layout_ibfk_3` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `category_to_store`;
CREATE TABLE `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `category_to_store_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `category_to_store_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `coupon_category`;
CREATE TABLE `coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `coupon_category_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `coupon_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `coupon_history`;
CREATE TABLE `coupon_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `order_id` (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `coupon_history_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `coupon_history_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `coupon_history_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `coupon_product`;
CREATE TABLE `coupon_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_id` (`coupon_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `coupon_product_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `coupon_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_field`;
CREATE TABLE `custom_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_field_customer_group`;
CREATE TABLE `custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`),
  KEY `customer_group_id` (`customer_group_id`),
  CONSTRAINT `custom_field_customer_group_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_field` (`id`),
  CONSTRAINT `custom_field_customer_group_ibfk_2` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_field_description`;
CREATE TABLE `custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `custom_field_description_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_field` (`id`),
  CONSTRAINT `custom_field_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_field_value`;
CREATE TABLE `custom_field_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_field_id` (`custom_field_id`),
  CONSTRAINT `custom_field_value_ibfk_1` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_field` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `custom_field_value_description`;
CREATE TABLE `custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `custom_field_value_description_ibfk_1` FOREIGN KEY (`custom_field_value_id`) REFERENCES `custom_field_value` (`id`),
  CONSTRAINT `custom_field_value_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_activity`;
CREATE TABLE `customer_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_activity_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE `customer_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_group_description`;
CREATE TABLE `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `customer_group_description_ibfk_1` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`),
  CONSTRAINT `customer_group_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_history`;
CREATE TABLE `customer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_history_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_ip`;
CREATE TABLE `customer_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_ip_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_login`;
CREATE TABLE `customer_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_online`;
CREATE TABLE `customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_online_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_reward`;
CREATE TABLE `customer_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `customer_reward_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `customer_reward_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_transaction`;
CREATE TABLE `customer_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `customer_transaction_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `customer_transaction_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `customer_wishlist`;
CREATE TABLE `customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `customer_wishlist_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `customer_wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `download_description`;
CREATE TABLE `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `download_description_ibfk_1` FOREIGN KEY (`download_id`) REFERENCES `download` (`id`),
  CONSTRAINT `download_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `extension`;
CREATE TABLE `extension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `filter`;
CREATE TABLE `filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_group_id` (`filter_group_id`),
  CONSTRAINT `filter_ibfk_1` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `filter_description`;
CREATE TABLE `filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `filter_group_id` (`filter_group_id`),
  CONSTRAINT `filter_description_ibfk_1` FOREIGN KEY (`filter_id`) REFERENCES `filter` (`id`),
  CONSTRAINT `filter_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `filter_description_ibfk_3` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `filter_group`;
CREATE TABLE `filter_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `filter_group_description`;
CREATE TABLE `filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `filter_group_description_ibfk_1` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_group` (`id`),
  CONSTRAINT `filter_group_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `geo_zone`;
CREATE TABLE `geo_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `information_description`;
CREATE TABLE `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `information_description_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`),
  CONSTRAINT `information_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `information_to_layout`;
CREATE TABLE `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `information_to_layout_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`),
  CONSTRAINT `information_to_layout_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `information_to_layout_ibfk_3` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `information_to_store`;
CREATE TABLE `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `information_to_store_ibfk_1` FOREIGN KEY (`information_id`) REFERENCES `information` (`id`),
  CONSTRAINT `information_to_store_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `layout`;
CREATE TABLE `layout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `layout_module`;
CREATE TABLE `layout_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `layout_module_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `layout_route`;
CREATE TABLE `layout_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `layout_id` (`layout_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `layout_route_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`),
  CONSTRAINT `layout_route_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `length_class`;
CREATE TABLE `length_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `length_class_description`;
CREATE TABLE `length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `length_class_description_ibfk_1` FOREIGN KEY (`length_class_id`) REFERENCES `length_class` (`id`),
  CONSTRAINT `length_class_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `manufacturer_to_store`;
CREATE TABLE `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `manufacturer_to_store_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`),
  CONSTRAINT `manufacturer_to_store_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `marketing`;
CREATE TABLE `marketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `option`;
CREATE TABLE `option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `option_description`;
CREATE TABLE `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `option_description_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`),
  CONSTRAINT `option_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `option_value`;
CREATE TABLE `option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  CONSTRAINT `option_value_ibfk_1` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `option_value_description`;
CREATE TABLE `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `option_id` (`option_id`),
  CONSTRAINT `option_value_description_ibfk_1` FOREIGN KEY (`option_value_id`) REFERENCES `option_value` (`id`),
  CONSTRAINT `option_value_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `option_value_description_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_group_id` (`customer_group_id`),
  KEY `payment_country_id` (`payment_country_id`),
  KEY `payment_zone_id` (`payment_zone_id`),
  KEY `shipping_country_id` (`shipping_country_id`),
  KEY `shipping_zone_id` (`shipping_zone_id`),
  KEY `order_status_id` (`order_status_id`),
  KEY `affiliate_id` (`affiliate_id`),
  KEY `marketing_id` (`marketing_id`),
  KEY `language_id` (`language_id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `order_ibfk_10` FOREIGN KEY (`marketing_id`) REFERENCES `marketing` (`id`),
  CONSTRAINT `order_ibfk_11` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `order_ibfk_12` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`),
  CONSTRAINT `order_ibfk_4` FOREIGN KEY (`payment_country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `order_ibfk_5` FOREIGN KEY (`payment_zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `order_ibfk_6` FOREIGN KEY (`shipping_country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `order_ibfk_7` FOREIGN KEY (`shipping_zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `order_ibfk_8` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `order_ibfk_9` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_custom_field`;
CREATE TABLE `order_custom_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `custom_field_id` (`custom_field_id`),
  KEY `custom_field_value_id` (`custom_field_value_id`),
  CONSTRAINT `order_custom_field_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_custom_field_ibfk_2` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_field` (`id`),
  CONSTRAINT `order_custom_field_ibfk_3` FOREIGN KEY (`custom_field_value_id`) REFERENCES `custom_field_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_history`;
CREATE TABLE `order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_status_id` (`order_status_id`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_option`;
CREATE TABLE `order_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `order_product_id` (`order_product_id`),
  KEY `product_option_id` (`product_option_id`),
  KEY `product_option_value_id` (`product_option_value_id`),
  CONSTRAINT `order_option_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_option_ibfk_2` FOREIGN KEY (`order_product_id`) REFERENCES `order_product` (`id`),
  CONSTRAINT `order_option_ibfk_3` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`),
  CONSTRAINT `order_option_ibfk_4` FOREIGN KEY (`product_option_value_id`) REFERENCES `product_option_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_recurring`;
CREATE TABLE `order_recurring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `recurring_id` (`recurring_id`),
  CONSTRAINT `order_recurring_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_recurring_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `order_recurring_ibfk_3` FOREIGN KEY (`recurring_id`) REFERENCES `recurring` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_recurring_transaction`;
CREATE TABLE `order_recurring_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_recurring_id` (`order_recurring_id`),
  CONSTRAINT `order_recurring_transaction_ibfk_1` FOREIGN KEY (`order_recurring_id`) REFERENCES `order_recurring` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_total`;
CREATE TABLE `order_total` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_total_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `order_voucher`;
CREATE TABLE `order_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `voucher_id` (`voucher_id`),
  KEY `voucher_theme_id` (`voucher_theme_id`),
  CONSTRAINT `order_voucher_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_voucher_ibfk_2` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`),
  CONSTRAINT `order_voucher_ibfk_3` FOREIGN KEY (`voucher_theme_id`) REFERENCES `voucher_theme` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_status_id` (`stock_status_id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `tax_class_id` (`tax_class_id`),
  KEY `weight_class_id` (`weight_class_id`),
  KEY `length_class_id` (`length_class_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`stock_status_id`) REFERENCES `stock_status` (`id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_class` (`id`),
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`weight_class_id`) REFERENCES `weight_class` (`id`),
  CONSTRAINT `product_ibfk_5` FOREIGN KEY (`length_class_id`) REFERENCES `length_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`),
  KEY `attribute_id` (`attribute_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `product_attribute_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attribute` (`id`),
  CONSTRAINT `product_attribute_ibfk_3` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_description`;
CREATE TABLE `product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `product_description_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_discount`;
CREATE TABLE `product_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `customer_group_id` (`customer_group_id`),
  CONSTRAINT `product_discount_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_discount_ibfk_2` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_filter`;
CREATE TABLE `product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`),
  KEY `filter_id` (`filter_id`),
  CONSTRAINT `product_filter_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_filter_ibfk_2` FOREIGN KEY (`filter_id`) REFERENCES `filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_option`;
CREATE TABLE `product_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `option_id` (`option_id`),
  CONSTRAINT `product_option_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_option_ibfk_2` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_option_value`;
CREATE TABLE `product_option_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_option_id` (`product_option_id`),
  KEY `product_id` (`product_id`),
  KEY `option_id` (`option_id`),
  KEY `option_value_id` (`option_value_id`),
  CONSTRAINT `product_option_value_ibfk_1` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`),
  CONSTRAINT `product_option_value_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_option_value_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `option` (`id`),
  CONSTRAINT `product_option_value_ibfk_4` FOREIGN KEY (`option_value_id`) REFERENCES `option_value` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_recurring`;
CREATE TABLE `product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`),
  KEY `recurring_id` (`recurring_id`),
  KEY `customer_group_id` (`customer_group_id`),
  CONSTRAINT `product_recurring_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_recurring_ibfk_2` FOREIGN KEY (`recurring_id`) REFERENCES `recurring` (`id`),
  CONSTRAINT `product_recurring_ibfk_3` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_related`;
CREATE TABLE `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`),
  KEY `related_id` (`related_id`),
  CONSTRAINT `product_related_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_related_ibfk_2` FOREIGN KEY (`related_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_reward`;
CREATE TABLE `product_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `customer_group_id` (`customer_group_id`),
  CONSTRAINT `product_reward_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_reward_ibfk_2` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_special`;
CREATE TABLE `product_special` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `customer_group_id` (`customer_group_id`),
  CONSTRAINT `product_special_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_special_ibfk_2` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_to_category`;
CREATE TABLE `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_to_category_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_to_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_to_download`;
CREATE TABLE `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`),
  KEY `download_id` (`download_id`),
  CONSTRAINT `product_to_download_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_to_download_ibfk_2` FOREIGN KEY (`download_id`) REFERENCES `download` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_to_layout`;
CREATE TABLE `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `store_id` (`store_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `product_to_layout_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_to_layout_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `product_to_layout_ibfk_3` FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_to_store`;
CREATE TABLE `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `product_to_store_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `product_to_store_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `recurring`;
CREATE TABLE `recurring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `recurring_description`;
CREATE TABLE `recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `recurring_description_ibfk_1` FOREIGN KEY (`recurring_id`) REFERENCES `recurring` (`id`),
  CONSTRAINT `recurring_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `return`;
CREATE TABLE `return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  KEY `return_reason_id` (`return_reason_id`),
  KEY `return_action_id` (`return_action_id`),
  KEY `return_status_id` (`return_status_id`),
  CONSTRAINT `return_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `return_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `return_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `return_ibfk_4` FOREIGN KEY (`return_reason_id`) REFERENCES `return_reason` (`id`),
  CONSTRAINT `return_ibfk_5` FOREIGN KEY (`return_action_id`) REFERENCES `return_action` (`id`),
  CONSTRAINT `return_ibfk_6` FOREIGN KEY (`return_status_id`) REFERENCES `return_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `return_action`;
CREATE TABLE `return_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `return_action_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `return_history`;
CREATE TABLE `return_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `return_id` (`return_id`),
  KEY `return_status_id` (`return_status_id`),
  CONSTRAINT `return_history_ibfk_1` FOREIGN KEY (`return_id`) REFERENCES `return` (`id`),
  CONSTRAINT `return_history_ibfk_2` FOREIGN KEY (`return_status_id`) REFERENCES `return_status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `return_reason`;
CREATE TABLE `return_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `return_reason_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `return_status`;
CREATE TABLE `return_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `return_status_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id`) REFERENCES `product` (`id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `stock_status`;
CREATE TABLE `stock_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `stock_status_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE `tax_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tax_rate`;
CREATE TABLE `tax_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_zone_id` (`geo_zone_id`),
  CONSTRAINT `tax_rate_ibfk_1` FOREIGN KEY (`geo_zone_id`) REFERENCES `geo_zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tax_rate_to_customer_group`;
CREATE TABLE `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`),
  KEY `customer_group_id` (`customer_group_id`),
  CONSTRAINT `tax_rate_to_customer_group_ibfk_1` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rate` (`id`),
  CONSTRAINT `tax_rate_to_customer_group_ibfk_2` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tax_rule`;
CREATE TABLE `tax_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `tax_class_id` (`tax_class_id`),
  KEY `tax_rate_id` (`tax_rate_id`),
  CONSTRAINT `tax_rule_ibfk_1` FOREIGN KEY (`tax_class_id`) REFERENCES `tax_class` (`id`),
  CONSTRAINT `tax_rule_ibfk_2` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `url_alias`;
CREATE TABLE `url_alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_group_id` (`user_group_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `voucher_theme_id` (`voucher_theme_id`),
  CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `voucher_ibfk_2` FOREIGN KEY (`voucher_theme_id`) REFERENCES `voucher_theme` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `voucher_history`;
CREATE TABLE `voucher_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voucher_id` (`voucher_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `voucher_history_ibfk_1` FOREIGN KEY (`voucher_id`) REFERENCES `voucher` (`id`),
  CONSTRAINT `voucher_history_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `voucher_theme`;
CREATE TABLE `voucher_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `voucher_theme_description`;
CREATE TABLE `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `voucher_theme_description_ibfk_1` FOREIGN KEY (`voucher_theme_id`) REFERENCES `voucher_theme` (`id`),
  CONSTRAINT `voucher_theme_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `weight_class`;
CREATE TABLE `weight_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `weight_class_description`;
CREATE TABLE `weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `weight_class_description_ibfk_1` FOREIGN KEY (`weight_class_id`) REFERENCES `weight_class` (`id`),
  CONSTRAINT `weight_class_description_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `zone_to_geo_zone`;
CREATE TABLE `zone_to_geo_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  KEY `geo_zone_id` (`geo_zone_id`),
  CONSTRAINT `zone_to_geo_zone_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `zone_to_geo_zone_ibfk_2` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `zone_to_geo_zone_ibfk_3` FOREIGN KEY (`geo_zone_id`) REFERENCES `geo_zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `affiliate`;
DROP TABLE IF EXISTS `affiliate_activity`;
DROP TABLE IF EXISTS `affiliate_login`;
DROP TABLE IF EXISTS `affiliate_transaction`;
DROP TABLE IF EXISTS `api`;
DROP TABLE IF EXISTS `api_ip`;
DROP TABLE IF EXISTS `api_session`;
DROP TABLE IF EXISTS `attribute`;
DROP TABLE IF EXISTS `attribute_description`;
DROP TABLE IF EXISTS `attribute_group`;
DROP TABLE IF EXISTS `attribute_group_description`;
DROP TABLE IF EXISTS `banner`;
DROP TABLE IF EXISTS `banner_image`;
DROP TABLE IF EXISTS `banner_image_description`;
DROP TABLE IF EXISTS `cart`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `category_description`;
DROP TABLE IF EXISTS `category_filter`;
DROP TABLE IF EXISTS `category_path`;
DROP TABLE IF EXISTS `category_to_layout`;
DROP TABLE IF EXISTS `category_to_store`;
DROP TABLE IF EXISTS `country`;
DROP TABLE IF EXISTS `coupon`;
DROP TABLE IF EXISTS `coupon_category`;
DROP TABLE IF EXISTS `coupon_history`;
DROP TABLE IF EXISTS `coupon_product`;
DROP TABLE IF EXISTS `currency`;
DROP TABLE IF EXISTS `custom_field`;
DROP TABLE IF EXISTS `custom_field_customer_group`;
DROP TABLE IF EXISTS `custom_field_description`;
DROP TABLE IF EXISTS `custom_field_value`;
DROP TABLE IF EXISTS `custom_field_value_description`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `customer_activity`;
DROP TABLE IF EXISTS `customer_group`;
DROP TABLE IF EXISTS `customer_group_description`;
DROP TABLE IF EXISTS `customer_history`;
DROP TABLE IF EXISTS `customer_ip`;
DROP TABLE IF EXISTS `customer_login`;
DROP TABLE IF EXISTS `customer_online`;
DROP TABLE IF EXISTS `customer_reward`;
DROP TABLE IF EXISTS `customer_transaction`;
DROP TABLE IF EXISTS `customer_wishlist`;
DROP TABLE IF EXISTS `download`;
DROP TABLE IF EXISTS `download_description`;
DROP TABLE IF EXISTS `event`;
DROP TABLE IF EXISTS `extension`;
DROP TABLE IF EXISTS `filter`;
DROP TABLE IF EXISTS `filter_description`;
DROP TABLE IF EXISTS `filter_group`;
DROP TABLE IF EXISTS `filter_group_description`;
DROP TABLE IF EXISTS `geo_zone`;
DROP TABLE IF EXISTS `information`;
DROP TABLE IF EXISTS `information_description`;
DROP TABLE IF EXISTS `information_to_layout`;
DROP TABLE IF EXISTS `information_to_store`;
DROP TABLE IF EXISTS `language`;
DROP TABLE IF EXISTS `layout`;
DROP TABLE IF EXISTS `layout_module`;
DROP TABLE IF EXISTS `layout_route`;
DROP TABLE IF EXISTS `length_class`;
DROP TABLE IF EXISTS `length_class_description`;
DROP TABLE IF EXISTS `location`;
DROP TABLE IF EXISTS `manufacturer`;
DROP TABLE IF EXISTS `manufacturer_to_store`;
DROP TABLE IF EXISTS `marketing`;
DROP TABLE IF EXISTS `modification`;
DROP TABLE IF EXISTS `module`;
DROP TABLE IF EXISTS `option`;
DROP TABLE IF EXISTS `option_description`;
DROP TABLE IF EXISTS `option_value`;
DROP TABLE IF EXISTS `option_value_description`;
DROP TABLE IF EXISTS `order`;
DROP TABLE IF EXISTS `order_custom_field`;
DROP TABLE IF EXISTS `order_history`;
DROP TABLE IF EXISTS `order_option`;
DROP TABLE IF EXISTS `order_product`;
DROP TABLE IF EXISTS `order_recurring`;
DROP TABLE IF EXISTS `order_recurring_transaction`;
DROP TABLE IF EXISTS `order_status`;
DROP TABLE IF EXISTS `order_total`;
DROP TABLE IF EXISTS `order_voucher`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `product_attribute`;
DROP TABLE IF EXISTS `product_description`;
DROP TABLE IF EXISTS `product_discount`;
DROP TABLE IF EXISTS `product_filter`;
DROP TABLE IF EXISTS `product_image`;
DROP TABLE IF EXISTS `product_option`;
DROP TABLE IF EXISTS `product_option_value`;
DROP TABLE IF EXISTS `product_recurring`;
DROP TABLE IF EXISTS `product_related`;
DROP TABLE IF EXISTS `product_reward`;
DROP TABLE IF EXISTS `product_special`;
DROP TABLE IF EXISTS `product_to_category`;
DROP TABLE IF EXISTS `product_to_download`;
DROP TABLE IF EXISTS `product_to_layout`;
DROP TABLE IF EXISTS `product_to_store`;
DROP TABLE IF EXISTS `recurring`;
DROP TABLE IF EXISTS `recurring_description`;
DROP TABLE IF EXISTS `return`;
DROP TABLE IF EXISTS `return_action`;
DROP TABLE IF EXISTS `return_history`;
DROP TABLE IF EXISTS `return_reason`;
DROP TABLE IF EXISTS `return_status`;
DROP TABLE IF EXISTS `review`;
DROP TABLE IF EXISTS `setting`;
DROP TABLE IF EXISTS `stock_status`;
DROP TABLE IF EXISTS `store`;
DROP TABLE IF EXISTS `tax_class`;
DROP TABLE IF EXISTS `tax_rate`;
DROP TABLE IF EXISTS `tax_rate_to_customer_group`;
DROP TABLE IF EXISTS `tax_rule`;
DROP TABLE IF EXISTS `upload`;
DROP TABLE IF EXISTS `url_alias`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `user_group`;
DROP TABLE IF EXISTS `voucher`;
DROP TABLE IF EXISTS `voucher_history`;
DROP TABLE IF EXISTS `voucher_theme`;
DROP TABLE IF EXISTS `voucher_theme_description`;
DROP TABLE IF EXISTS `weight_class`;
DROP TABLE IF EXISTS `weight_class_description`;
DROP TABLE IF EXISTS `zone`;
DROP TABLE IF EXISTS `zone_to_geo_zone`;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
