/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.20-log : Database - auth
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`auth` /*!40100 DEFAULT CHARACTER SET latin1 */;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `token_key` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` smallint(3) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '4',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  `bnet2_pass_hash` varchar(256) NOT NULL DEFAULT '',
  `bnet2_salt` varchar(64) NOT NULL DEFAULT '',
  `google_auth` varchar(15) DEFAULT NULL,
  `rsa_clear` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `recruiterIndex` (`recruiter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System';

/*Table structure for table `account_access` */

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  `comment` text,
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `account_banned` */

DROP TABLE IF EXISTS `account_banned`;

CREATE TABLE `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

/*Table structure for table `account_battlepet` */

DROP TABLE IF EXISTS `account_battlepet`;

CREATE TABLE `account_battlepet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(10) unsigned NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(50) NOT NULL,
  `nameTimeStamp` int(10) unsigned NOT NULL DEFAULT '0',
  `species` int(10) unsigned NOT NULL DEFAULT '0',
  `quality` int(10) unsigned NOT NULL DEFAULT '0',
  `breed` int(10) unsigned NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `xp` int(10) unsigned NOT NULL DEFAULT '0',
  `display` int(10) unsigned NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `infoPower` int(11) NOT NULL DEFAULT '0',
  `infoMaxHealth` int(11) NOT NULL DEFAULT '0',
  `infoSpeed` int(11) NOT NULL DEFAULT '0',
  `infoGender` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `account_log_ip` */

DROP TABLE IF EXISTS `account_log_ip`;

CREATE TABLE `account_log_ip` (
  `accountid` int(11) unsigned NOT NULL,
  `ip` varchar(30) NOT NULL DEFAULT '0.0.0.0',
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`accountid`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `account_premium` */

DROP TABLE IF EXISTS `account_premium`;

CREATE TABLE `account_premium` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `setdate` bigint(40) NOT NULL DEFAULT '0',
  `unsetdate` bigint(40) NOT NULL DEFAULT '0',
  `premium_type` tinyint(4) unsigned NOT NULL DEFAULT '1',
  `gm` varchar(12) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`setdate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `account_spell` */

DROP TABLE IF EXISTS `account_spell`;

CREATE TABLE `account_spell` (
  `accountId` int(11) NOT NULL,
  `spell` int(10) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accountId`,`spell`),
  KEY `account` (`accountId`) USING HASH,
  KEY `account_spell` (`accountId`,`spell`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `firewall_farms` */

DROP TABLE IF EXISTS `firewall_farms`;

CREATE TABLE `firewall_farms` (
  `ip` tinytext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ip_banned` */

DROP TABLE IF EXISTS `ip_banned`;

CREATE TABLE `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

/*Table structure for table `ip_to_country` */

DROP TABLE IF EXISTS `ip_to_country`;

CREATE TABLE `ip_to_country` (
  `IP_FROM` double NOT NULL,
  `IP_TO` double NOT NULL,
  `COUNTRY_CODE` char(2) DEFAULT NULL,
  `COUNTRY_CODE_3` char(3) NOT NULL,
  `COUNTRY_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IP_FROM`,`IP_TO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `log_vote` */

DROP TABLE IF EXISTS `log_vote`;

CREATE TABLE `log_vote` (
  `top_name` varchar(15) NOT NULL DEFAULT 'top',
  `ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `date` int(11) NOT NULL,
  PRIMARY KEY (`top_name`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `realmcharacters` */

DROP TABLE IF EXISTS `realmcharacters`;

CREATE TABLE `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

/*Table structure for table `realmlist` */

DROP TABLE IF EXISTS `realmlist`;

CREATE TABLE `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '17399' COMMENT '17399 build 5.4.0',
  `online` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

/*Table structure for table `stat_lifetime_retention` */

DROP TABLE IF EXISTS `stat_lifetime_retention`;

CREATE TABLE `stat_lifetime_retention` (
  `minutes` int(11) NOT NULL,
  `usersPercentage` float(11,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `transferts` */

DROP TABLE IF EXISTS `transferts`;

CREATE TABLE `transferts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `perso_guid` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `revision` blob NOT NULL,
  `dump` longtext NOT NULL,
  `last_error` blob NOT NULL,
  `nb_attempt` int(11) NOT NULL,
  `state` int(10) NOT NULL DEFAULT '0',
  `error` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `transferts_logs` */

DROP TABLE IF EXISTS `transferts_logs`;

CREATE TABLE `transferts_logs` (
  `id` int(11) DEFAULT NULL,
  `account` int(11) DEFAULT NULL,
  `perso_guid` int(11) DEFAULT NULL,
  `from` int(2) DEFAULT NULL,
  `to` int(2) DEFAULT NULL,
  `dump` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `uptime` */

DROP TABLE IF EXISTS `uptime`;

CREATE TABLE `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;