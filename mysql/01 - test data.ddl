INSERT INTO `room` (`room_name`, `sensor_id`) VALUES ('Living room', 'TA');
INSERT INTO `room` (`room_name`, `sensor_id`) VALUES ('Kitchen', 'TB');
INSERT INTO `room` (`room_name`, `sensor_id`) VALUES ('Master bedroom', 'TC');
INSERT INTO `room` (`room_name`, `sensor_id`) VALUES ('Guest bedroom', 'TD');
INSERT INTO `room` (`room_name`, `sensor_id`) VALUES ('Bathroom', 'TE');

INSERT INTO `temperature_plan` (`description`, `room_id`)
SELECT 'Living room default plan', _id
FROM `room`
WHERE `room_name` = 'Living room';

INSERT INTO `temperature_plan` (`description`, `room_id`)
SELECT 'Kitchen default plan', _id
FROM `room`
WHERE `room_name` = 'Kitchen';

INSERT INTO `temperature_plan` (`description`, `room_id`)
SELECT 'Master bedroom default plan', _id
FROM `room`
WHERE `room_name` = 'Master bedroom';

INSERT INTO `temperature_plan` (`description`, `room_id`)
SELECT 'Guest bedroom default plan', _id
FROM `room`
WHERE `room_name` = 'Guest bedroom';

INSERT INTO `temperature_plan` (`description`, `room_id`)
SELECT 'Bathroom default plan', _id
FROM `room`
WHERE `room_name` = 'Bathroom';
