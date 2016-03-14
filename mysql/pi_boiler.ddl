USE DATABASE pi_boiler;

DROP TABLE IF EXISTS `temperature`;
CREATE TABLE `temperature` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `temperature` DOUBLE DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `room_id` (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `sensor_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `temperature_plan`;
CREATE TABLE `temperature_plan` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `room_id` (`room_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `day_part`;
CREATE TABLE `day_part` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `day_name` varchar(10) COLLATE utf8_bin NOT NULL,
  `temperature_plan_id` int NOT NULL,
  `start_time` TIME NOT NULL,
  `target_temperature` DOUBLE NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `temperature_plan_id` (`temperature_plan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `sensor`;
