-- Later tables require certain other tables to be created first. Work by round to avoid errors
-- BEGIN ROUND 1
-- Tables without foreign keys
INSERT INTO g10."USERS" ("USERNAME","PW","FIRST_NAME","LAST_NAME","EMAIL","PHONE","IS_OPERATOR") VALUES
	 ('prof_X','$2b$10$2KRKOMn2P2/GPKy4imH1ie4lZIAKSGozS6.59dcvTXO/tBFRTBj5W','Charles','Xavier','telepath@gmail.com','1234567890',false),
	 ('Do Not Delete','$2b$10$o6B90xsN9aM5zZgkV1xo2etgrCw49Xse8zWoFB6BX59KJvSQjGNqq','Default','User','user@domain.com','1234561212',false),
	 ('admin','$2b$10$hOvlbMNkyw6GbszEM/Ijnuq7gChU79JUjTtW.sZRcho0b7dxGvsUm','Hussam','Ghunaim','hmg@fhsu.edu','1234567890',true),
	 ('peterParker','$2b$10$Dg13tpfG84a5v0QliQg.Lupo2Dcw31xPwWJxi3y4f/Pml/J32LjpW','Spider','Man','not_spiderman@gmail.com','1234567890',false);

INSERT INTO g10."RESERVATION_TYPE" ("DESCRIPTION") VALUES
	 ('single'),
	 ('guaranteed'),
	 ('walkIn');

INSERT INTO g10."RESERVATION_STATUS" ("DESCRIPTION") VALUES
	 ('created'),
	 ('canceled'),
	 ('inGarage'),
	 ('valid'),
	 ('complete');

INSERT INTO g10."SPACE_STATUS" ("DESCRIPTION") VALUES
	 ('empty'),
	 ('full'),
	 ('notAvailable');

INSERT INTO g10."GARAGES" ("DESCRIPTION","FLOOR_COUNT","LAT","LONG","OVERBOOK_RATE","IS_ACTIVE") VALUES
	 ('Easy Spaces',3,'23','23',1.5,true),
	 ('ParkingSpaceX',2,'34','86',1.5,true),
	 ('AlwaysUnavailable',3,'1','1',1.1,false),
	 ('Park-a-lot',2,'1','1',1.1,true),
	 ('Spotula',3,'1','1',1.5,true);


-- BEGIN ROUND 2
-- Tables with foreign keys. 
-- Requires Garages table
INSERT INTO g10."FLOORS" ("FLOOR_NUM","SPACE_COUNT","GARAGE_ID") VALUES
	 (1,3,1),
	 (2,3,1),
	 (3,3,1), 
	 (1,3,2),
	 (2,3,2),
	 (1,3,3),
	 (2,3,3),
	 (3,3,3),
	 (1,2,4),
	 (2,2,4);
INSERT INTO g10."FLOORS" ("FLOOR_NUM","SPACE_COUNT","GARAGE_ID") VALUES
	 (1,2,5),
	 (2,2,5),
	 (3,2,5);

-- Requires User table
INSERT INTO g10."VEHICLES" ("DESCRIPTION","PLATE_NUMBER","PLATE_STATE","IS_ACTIVE","MEMBER_ID") VALUES
	 ('La Ferrari','ABC123','StateOfMind',true,1),
	 ('My jeep','FLIPME','CA',true,2),
	 ('My moped','BUZZZZ','VT',false,2),
	 ('My Truck','NOBR8X','AK',true,2),
	 ('My car','4THEWIN','ME',true,2);

-- Requires Reservation Type table
INSERT INTO g10."PRICING" ("DESCRIPTION","COST","DAILY_MAX","RESERVATION_TYPE_ID") VALUES
	 ('single','8',50,1),
	 ('guaranteed','6',50,2), 
	 ('walkIn','10',50,3);
	 


-- BEGIN ROUND 3

-- Reuires Floor and Garage tables
-- Garage 1
INSERT INTO g10."SPACES" ("WALK_IN","SPACE_NUM","GARAGE_ID","FLOOR_ID","STATUS_ID") VALUES	 
	 (false,1,1,1,1),
	 (false,2,1,1,1),
	 (false,3,1,1,1),
	 (false,1,1,2,1),
	 (false,2,1,2,1),
	 (false,3,1,2,1),
	 (false,1,1,3,1),
	 (false,2,1,3,1),
	 (false,3,1,3,1);

-- Garage 2
INSERT INTO g10."SPACES" ("WALK_IN","SPACE_NUM","GARAGE_ID","FLOOR_ID","STATUS_ID") VALUES
	 (false,1,2,4,1),
	 (false,2,2,4,1),
	 (false,3,2,4,1),
	 (false,1,2,5,1),
	 (false,2,2,5,1),
	 (false,3,2,5,1);

-- Garage 3
INSERT INTO g10."SPACES" ("WALK_IN","SPACE_NUM","GARAGE_ID","FLOOR_ID","STATUS_ID") VALUES
	 (false,1,3,6,1),
	 (false,2,3,6,1),
	 (false,3,3,6,1),
	 (false,1,3,7,1),
	 (false,2,3,7,1),
	 (false,3,3,7,1),
	 (false,1,3,8,1),
	 (false,2,3,8,1),
	 (false,3,3,8,1);
	 
-- Garage 4
INSERT INTO g10."SPACES" ("WALK_IN","SPACE_NUM","GARAGE_ID","FLOOR_ID","STATUS_ID") VALUES
	 (false,1,4,9,1),
	 (false,2,4,9,1),
	 (false,1,4,10,1),
	 (false,2,4,10,1);
	 
-- Garage 5
INSERT INTO g10."SPACES" ("WALK_IN","SPACE_NUM","GARAGE_ID","FLOOR_ID","STATUS_ID") VALUES
	 (false,1,5,11,1),
	 (false,2,5,11,1),
	 (false,1,5,12,1),
	 (false,2,5,12,1),
	 (false,1,5,13,1),
	 (false,2,5,13,1);


-- BEGIN ROUND 4
INSERT INTO g10."RESERVATIONS" ("START_TIME","END_TIME","DATE_CREATED","EXTRA_GRACE","RES_CODE","MEMBER_ID","RESERVATION_TYPE_ID","VEHICLE_ID","STATUS_ID","GARAGE_ID","SPACE_ID") VALUES
	 ('2022-12-09 13:00:00-06','2022-12-09 23:00:00-06','2022-12-09 12:06:11.348-06',NULL,'KAEJTZCZ',2,1,NULL,1,5,NULL),
	 ('2022-12-08 12:00:00-06',NULL,'2022-12-09 12:03:40.571-06',NULL,'FTZVPRTA',2,2,NULL,1,4,NULL),
	 ('2022-12-08 12:00:00-06',NULL,'2022-12-09 12:03:17.268-06',NULL,'TNDWCDSZ',2,2,4,1,2,NULL),
	 ('2022-12-09 18:30:00-06','2022-12-09 19:00:00-06','2022-12-09 18:04:55.131-06',NULL,'UEDQMGWU',2,1,3,1,4,NULL),
	 ('2022-12-09 13:00:00-06','2022-12-09 23:00:00-06','2022-12-09 12:06:11.348-06',NULL,'MMNDHFWT',2,1,2,1,1,NULL);
