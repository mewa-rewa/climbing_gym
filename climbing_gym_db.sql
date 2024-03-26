-- Create the database
CREATE DATABASE climbing_gym;

USE climbing_gym;

-- Create table climbers
CREATE TABLE `climbers` (
  `climber_id` integer PRIMARY KEY,
  `first_name` varchar(55),
  `last_name` varchar(55),
  `date_birth` date,
  `membership_date` date,
  `phone` integer,
  `email` varchar(55),
  `discount` integer
);

-- Create table employees
CREATE TABLE `employees` (
  `employee_id` integer PRIMARY KEY,
  `first_name` varchar(55),
  `last_name` varchar(55),
  `employment_date` date,
  `phone` integer
);

-- Create table routes
CREATE TABLE `routes` (
  `route_id` integer PRIMARY KEY,
  `name` varchar(55),
  `grade` varchar(15),
  `length` float,
  `created_by` integer
);

-- Create table gear
CREATE TABLE `gear` (
  `gear_id` integer PRIMARY KEY,
  `kind` varchar(55),
  `brand` varchar(55),
  `model` varchar(55),
  `rental_price` float,
  `size` float,
  `purchased` date,
  `quantity_in_stock` integer,
  `needs_to_be_replaced` bool
);

-- Create table gear_rental
CREATE TABLE `gear_rental` (
  `transaction_id` integer PRIMARY KEY,
  `climber_id` integer,
  `employee_id` integer,
  `date` datetime,
  `total` float,
  `discount` float
);

-- Create table transaction_line
CREATE TABLE `transaction_line` (
  `transaction_line_id` integer PRIMARY KEY,
  `transaction_id` integer,
  `gear_id` integer,
  `quantity` integer
);

-- Create Foreign Keys in tables:
ALTER TABLE `routes` ADD FOREIGN KEY (`created_by`) REFERENCES `employees` (`employee_id`);

ALTER TABLE `gear_rental` ADD FOREIGN KEY (`climber_id`) REFERENCES `climbers` (`climber_id`);

ALTER TABLE `gear_rental` ADD FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

ALTER TABLE `transaction_line` ADD FOREIGN KEY (`gear_id`) REFERENCES `gear` (`gear_id`);

ALTER TABLE `transaction_line` ADD FOREIGN KEY (`transaction_id`) REFERENCES `gear_rental` (`transaction_id`);

-- Insert values into table climbers
INSERT INTO climbers VALUES
(1, "Adam", "Ondra", "1993-02-05", "1995-05-02", 0505345789, "aondra@climbing.com", 0),
(2, "Jorge", "Diaz-Rullo", "1999-01-07", "2005-06-12", 0601235123, "drullo@climbing.com", 0),
(3, "Jonathan", "Siegrist ", "1985-11-25", "1995-09-09", 0890678345, "josieg@climbing.com", 0),
(4, "Tanguy", "Merard", "2003-08-10", "2010-10-09", 0543789567, "tm@climbing.com", 0),
(5, "Jules", "Marchaland", "2001-07-07", "2012-04-02", 0678234890, "jmarchaland@climbing.com", 0),
(6, "Mathieu", "Bouyoud", "1989-01-31", "2003-12-27", 0123678456, "mbouyoud@climbing.com", 0),
(7, "Dylan", "Chuat", "2000-03-07", "2021-11-12", 0987654678, "dchuat@climbing.com", 0),
(8, "Leo", "Bøe", "1999-01-07", "2005-06-12", 0673234890, "leo@climbing.com", 0),
(9, "Alex", "Ventajas", "1999-11-25", "2004-12-09", 0362789345, "aventajas@climbing.com", 0),
(10, "Daniel", "Fuertes", "1980-06-17", "1999-08-19", 0589456345, "dfuertes@climbing.com", 0),
(11, "Stefano", "Ghisolfi", "1993-10-15", "2007-06-02", 0768234782, "sghisolfi@climbing.com", 0),
(12, "Luca", "Bana", "1978-05-14", "1998-06-12", 0989234543, "lbana@climbing.com", 0),
(13, "Tyler", "Thompson", "1983-12-15", '2022-09-01', 0553776989, "tthompson@climbing.com", 0),
(14, "Lair", "Thibault", '1991-03-31', '2014-09-13', 0909231328, "lthibault@climbing.com", 0),
(15, "Cameron", "Hörst", '1992-08-10', '2003-07-22', 0893451233, "choerst@climbing.com", 0),
(16, "Domen", "Škofic", '2006-12-03', '2022-11-18', 0523787864, "dskofic@climbing.com", 0),
(17, "Matteo", "Reusa", '1998-04-07', '2021-02-14', 0237878560, "mreusa@climbing.com", 0),
(18, "Vojta", "Trojan", '1989-05-09', '2013-06-13', 01267754321, "vtrojan@climbing.com", 0),
(19, "Maho", "Normand", '1974-03-21', '1999-06-01', 0455789234, "mnormand@climbing.com", 0),
(20, "Marco", "Zanone", '1978-10-23', '2001-12-23', 0676299344, "mzanone@climbing.com", 0),
(21, "Elias", "Kysela", '1990-06-19', '2007-11-28', 0956352423, "ekysela@climbing.com", 0),
(22, "Davide", "Picco", '1995-02-12', '2018-07-16', 0467883212, "dpicco@climbing.com", 0),
(23, "Moritz", "Welt", '1982-04-21', '2011-02-10', 0577833563, "mwelt@climbing.com", 0),
(24, "Matjaz", "Zorko", '1994-05-03', '2023-11-23', 0965633772, "mzorko@climbing.com", 0),
(25, "Dimitri", "Flick", '1987-08-16', '2002-09-14', 0433275495, "dflick@climbing.com", 0),
(26, "Giorgio", "Tomatis", '2007-05-18', '2023-01-14', 0566188843, "gtomatis@climbing.com", 0),
(27, "Ben", "Tilden", '2000-06-21', '2021-08-12', 0677832147, "btilden@climbing.com", 0),
(28, "Pepa", "Sindel", '1981-11-14', '2000-06-23', 0566193311, "psindel@climbing.com", 0),
(29, "Alberto", "Gotta", '1967-05-26','1998-08-09', 0789945836, "agotta@climbing.com", 0),
(30, "Benajmin", "Guigonnet", '1992-12-14', '2019-04-15', 0982246555, "bguigonnet@climbing.com", 0),
(31, "David", "Firnenburg", '1986-11-13', '2002-09-12', 908473312, "dfirnenburg@climbing.com", 0);

-- Insert values into table employees
INSERT INTO employees VALUES
(1, "Jon", "Cardwell", "1999-01-01", 0996734282),
(2, "Doug", "McConnell", "2014-05-01", 0773243789),
(3, "Wojtek", "Pełka", "2017-12-01", 0898466543),
(4, "Luke", "Dawson", "2022-11-01", 0606789789),
(5, "Martina", "Demmel", "2005-08-01", 0623678443),
(6, "Klara", "Alberti", "1998-12-01", 0787437455),
(7, "Jessica", "Pilz", "2014-03-15", 0992023221),
(8, "Erwan", "Legrand", "2009-07-15", 0854423212),
(9, "Mateusz", "Haladaj", "2012-11-01", 0989437524),
(10, "Eva", "Hammer", "1989-06-15", 0523165382),
(11, "Lorenzo", "Bogliacino", "1994-09-15", 0945784212),
(12, "Andrea", "Locatelli", "2003-10-01", 0798598346),
(13, "Jacob", "Gergo", "2008-12-01", 0778458273),
(14, "Pierre", "Marzulo", "2008-03-01", 0832475534),
(15, "Elton", "John", "2023-02-15", 0732546722),
(16, "Sebastian", "Trovero", "2001-11-01", 0231467632);

-- Insert values into table gear
INSERT INTO gear VALUES
(1, "climbing shoes", "Red Chili", "Voltage", 3.5, 24, '2021-05-01', 5, FALSE),
(2, "climbing shoes", "Red Chili", "Voltage", 3.5, 25, '2021-05-01', 5, FALSE),
(3, "climbing shoes", "Red Chili", "Voltage", 3.5, 26, '2021-05-01', 5, FALSE),
(4, "climbing shoes", "Red Chili", "Voltage", 3.5, 27, '2021-05-01', 5, FALSE),
(5, "climbing shoes", "Red Chili", "Voltage", 3.5, 28, '2021-05-01', 5, FALSE),
(6, "climbing shoes", "Red Chili", "Voltage", 3.5, 29, '2021-05-01', 5, FALSE),
(7, "climbing shoes", "Red Chili", "Voltage", 3.5, 30, '2021-05-01', 5, FALSE),
(8, "climbing shoes", "Red Chili", "Voltage", 3.5, 31, '2021-05-01', 5, FALSE),
(9, "climbing shoes", "Red Chili", "Voltage", 3.5, 32, '2021-05-01', 5, FALSE),
(10, "climbing shoes", "Red Chili", "Voltage", 3.5, 33, '2021-05-01', 5, FALSE),
(11, "climbing shoes", "Red Chili", "Voltage", 3.5, 34, '2021-05-01', 5, FALSE),
(12, "climbing shoes", "Red Chili", "Voltage", 3.5, 35, '2021-05-01', 5, FALSE),
(13, "climbing shoes", "Red Chili", "Voltage", 3.5, 36, '2021-05-01', 10, FALSE),
(14, "climbing shoes", "Red Chili", "Voltage", 3.5, 37, '2021-05-01', 10, FALSE),
(15, "climbing shoes", "Red Chili", "Voltage", 3.5, 38, '2021-05-01', 10, FALSE),
(16, "climbing shoes", "Red Chili", "Voltage", 3.5, 39, '2021-05-01', 10, FALSE),
(17, "climbing shoes", "Red Chili", "Voltage", 3.5, 40, '2021-05-01', 10, FALSE),
(18, "climbing shoes", "Red Chili", "Voltage", 3.5, 41, '2021-05-01', 10, FALSE),
(19, "climbing shoes", "Red Chili", "Voltage", 3.5, 42, '2021-05-01', 10, FALSE),
(20, "climbing shoes", "Red Chili", "Voltage", 3.5, 43, '2021-05-01', 9, FALSE),
(21, "climbing shoes", "Red Chili", "Voltage", 3.5, 44, '2021-05-01', 10, FALSE),
(22, "climbing shoes", "Red Chili", "Voltage", 3.5, 45, '2019-08-21', 8, FALSE),
(23, "climbing shoes", "Red Chili", "Voltage", 3.5, 46, '2019-08-21', 5, FALSE),
(24, "climbing shoes", "Red Chili", "Voltage", 3.5, 47, '2019-08-21', 2, FALSE),
(25, "climbing shoes", "Red Chili", "Voltage", 3.5, 48, '2019-08-21', 1, FALSE),
(26, "harness adults", "Petzl", "Corax", 4, 1, '2022-09-17', 15, FALSE),
(27, "harness adults", "Petzl", "Corax", 4, 2, '2022-09-17', 12, FALSE),
(28, "harness kids", "Petzl", "Simba", 4, NULL, '2023-04-02', 05, FALSE),
(29, "rope", "Camp", "Silver", 5, 50, '2019-06-03', 5, FALSE),
(30, "rope", "Camp", "Silver", 5, 50, '2021-11-24', 7, FALSE),
(31, "rope", "Beal", "Tiger", 5, 50, '2023-07-13', 10, FALSE),
(32, "belaying device", "Petzl", "Grigri", 4, NULL, '2023-07-13', 15, FALSE),
(33, "belaying glasses", "YY Vertical", "Classic", 2.5, NULL, '2022-05-09', 10, FALSE),
(34, "breaking resistor", "Edelrid", "Ohm", 2.5, NULL, '2023-02-02', 6, FALSE);

-- Insert values into table routes
INSERT INTO routes VALUES
(1, "Hercules", "4", 12, 2),
(2, "Lucky Charm", "4+", 12, 4),
(3, "Follow the Weasel", "4+", 12, 4),
(4, "Roger Rabbit", "5", 12, 4),
(5, "Pink Unicorn", "5", 12, 7),
(6, "Tricycle", "5", 12, 7),
(7, "Lazy legs", "5", 12, 2),
(8, "Rainy day", "5", 12, 2),
(9, "Puff, the magic dragon", "5", 12, 12),
(10, "Stairway to heaven", "5", 15, 12),
(11, "K2", "5+", 15, 12),
(12, "Look mum, no hands", "5+", 15, 3),
(13, "Candy Lane", "5+", 15, 3),
(14, "Beatbox", "6", 15, 3),
(15, "Jug tower", "6", 15, 3),
(16, "Die hard 2", "6", 15, 4),
(17, "Frog business", "6", 15, 4),
(18, "Gravity's revange", "6", 15, 4),
(19, "Slippery sloper", "6", 15, 2),
(20, "Santa Claus' chimney", "6", 15, 4),
(21, "Peter Pan", "6", 15, 7),
(22, "Flying Squirrels", "6", 15, 7),
(23, "ABCs", "6+", 15, 7),
(24, "Rockfall", "6+", 15, 7),
(25, "Don't look down", "6+", 15, 7),
(26, "The roof is on fire", "6+", 15, 3),
(27, "Fingers crossed", "6+", 15, 3),
(28, "Pinky promise", "7", 15, 3),
(29, "Doom's day", "7", 15, 7),
(30, "Just kidding", "7", 15, 15),
(31, "Bed of roses", "7", 15, 15),
(32, "Mont Blanc", "7", 15, 15),
(33, "Twist and shout", "7", 15, 15),
(34, "Beauty and the Beast", "7", 15, 15),
(35, "Please stand up", "7+", 15, 15),
(36, "Tentacle challenge", "7+", 15, 15),
(37, "Elvis' leg", "7+", 15, 15),
(38, "Just one more route", "7+", 15, 7),
(39, "Climb like there is no tomorrow", "7+", 15, 7),
(40, "Weeping willow", "7+", 15, 2),
(41, "There is no spoon", "7+", 20, 2),
(42, "Aguille du Midi", "7+", 20, 2),
(43, "Coffee break", "7+", 20, 4),
(44, "Skywalker", "8", 20, 4),
(45, "Tears and sweat", "8", 20, 4),
(46, "Mambo No 5", "8", 20, 4),
(47, "The hardest climb in the world", "8", 20, 4),
(48, "Science Friction", "8", 20, 12),
(49, "Bloody Fingers", "8", 20, 12),
(50, "Floor is lava", "8", 20, 12),
(51, "A tricky one", "8+", 20, 12),
(52, "Fly, you fools", "8+", 20, 2),
(53, "Beetween a rock and a hard place", "8+", 20, 2),
(54, "Fireplace mantle", "8+", 20, 15),
(55, "Espresso", "8+", 20, 15),
(56, "Hot cocoa", "8+", 20, 15),
(57, "Climb me if you can", "9", 20, 5),
(58, "Yoga", "9", 20, 5),
(59, "Lizard legs", "9", 20, 5),
(60, "Climb and Punishment", "9+", 20, 5),
(61, "Always uphill", "9+", 20, 2),
(62, "Monkey business", "10", 20, 4),
(63, "Black widow", "10", 20, 4);

-- Insert values into table gear_rental
INSERT INTO gear_rental VALUES
(1, 2, 6, '2024-01-01', 7.5, 0),
(2, 5, 6, '2024-01-02', 10, 0),
(3, 10, 6, '2024-01-02', 24, 0),
(4, 17, 8, '2024-01-03', 7.5, 0),
(5, 2, 6, '2024-01-04', 7.5, 0),
(6, 19, 8, '2024-01-04', 2.5, 0),
(7, 8, 8, '2024-01-05', 17, 0),
(8, 5, 8, '2024-01-06', 5, 0),
(9, 10, 9, '2024-01-06', 9, 0),
(10, 2, 9, '2024-01-07', 4, 0),
(11, 26, 6, '2024-01-07', 4, 0),
(12, 7, 6, '2024-01-07', 7.5, 0),
(13, 8, 9, '2024-01-08', 10, 0),
(14, 24, 8, '2024-01-09', 16.5, 0),
(15, 19, 6, '2024-01-09', 5, 0),
(16, 17, 6, '2024-01-11', 9, 0),
(17, 2, 8, '2024-01-11', 20, 0),
(18, 29, 9, '2024-01-12', 9, 0),
(19, 7, 11, '2024-01-13', 17, 0),
(20, 2, 6, '2024-01-15', 7.5, 0),
(21, 14, 13, '2024-01-17', 51, 0),
(22, 5, 11, '2024-01-18', 7.5, 0),
(23, 2, 11, '2024-01-19', 17, 0),
(24, 10, 13, '2024-01-19', 4, 0),
(25, 8, 13, '2024-01-21', 2.5, 0),
(26, 17, 11, '2024-01-21', 20.5, 0),
(27, 2, 11, '2024-01-22', 7.5, 0),
(28, 26, 8, '2024-01-23', 7.5, 0),
(29, 29, 8, '2024-01-23', 24, 0),
(30, 1, 8, '2024-01-24', 11.5, 0),
(31, 19, 13, '2024-01-25', 7.5, 0),
(32, 7, 6, '2024-01-27', 26.5, 0),
(33, 10, 9, '2024-01-28', 5, 0),
(34, 17, 8, '2024-01-29', 7.5, 0),
(35, 2, 8, '2024-01-31', 82.5, 0),
(36, 7, 9, '2024-01-31', 9, 0),
(37, 14, 6, '2024-02-01', 9, 0),
(38, 8, 6, '2024-02-01', 5, 0),
(39, 5, 11, '2024-02-03', 7.5, 0),
(40, 2, 11, '2024-02-04', 17, 0),
(41, 10, 6, '2024-02-04', 11.5, 0),
(42, 17, 13, '2024-02-05', 6.5, 0),
(43, 19, 13, '2024-02-06', 24.5, 0),
(44, 24, 8, '2024-02-07', 4, 0),
(45, 10, 11, '2024-02-08', 31.5, 0),
(46, 5, 8, '2024-02-08', 15, 0),
(47, 2, 8, '2024-02-08', 7.5, 0),
(48, 1, 8, '2024-02-11', 11.5, 0),
(49, 7, 9, '2024-02-11', 9, 0),
(50, 14, 13, '2024-02-13', 24, 0),
(51, 17, 6, '2024-02-14', 5, 0),
(52, 2, 6, '2024-02-16', 15, 0),
(53, 19, 13, '2024-02-16', 2.5, 0),
(54, 8, 13, '2024-02-17', 2.5, 0),
(55, 5, 8, '2024-02-18', 9, 0),
(56, 1, 6, '2024-02-19', 9, 0),
(57, 2, 6, '2024-02-22', 7.5, 0),
(58, 10, 11, '2024-02-22', 16.5, 0),
(59, 26, 11, '2024-02-23', 17, 0),
(60, 7, 11, '2024-02-24', 14, 0),
(61, 24, 13, '2024-02-25', 4, 0),
(62, 14, 11, '2024-02-25', 9, 0),
(63, 29, 6, '2024-02-25', 22.5, 0),
(64, 2, 6, '2024-02-26', 7.5, 0),
(65, 5, 9, '2024-02-27', 34, 0),
(66, 17, 8, '2024-02-28', 17, 0),
(67, 8, 8, '2024-02-28', 5, 0),
(68, 19, 11, '2024-02-29', 11.5, 0),
(69, 10, 13, '2024-02-29', 7.5, 0),
(70, 5, 8, '2024-02-29', 15, 0);

-- Insert values into table transaction_line
INSERT INTO transaction_line VALUES
(1, 1, 27, 1),
(2, 1, 21, 1),
(3, 2, 27, 1),
(4, 2, 17, 1),
(5, 2, 33, 1),
(6, 3, 19, 2),
(7, 3, 27, 2),
(8, 3, 31, 1),
(9, 3, 32, 1),
(10, 4, 13, 1),
(11, 4, 26, 1),
(12, 5, 18, 1),
(13, 5, 26, 1),
(14, 6, 33, 1),
(15, 7, 27, 2),
(16, 7, 30, 1),
(17, 7, 32, 1),
(18, 8, 33, 1),
(19, 8, 34, 1),
(20, 9, 28, 1),
(21, 9, 29, 1),
(22, 10, 27, 1),
(23, 11, 26, 1),
(24, 12, 26, 1),
(25, 12, 18, 1),
(26, 13, 16, 1),
(27, 13, 26, 1),
(28, 13, 33, 1),
(29, 14, 20, 1),
(30, 14, 26, 1),
(31, 14, 29, 1),
(32, 14, 32, 1),
(33, 15, 30, 1),
(34, 16, 30, 1),
(35, 16, 32, 1),
(36, 17, 16, 2),
(37, 17, 27, 2),
(38, 17, 30, 1),
(39, 18, 31, 1),
(40, 18, 32, 1),
(41, 19, 26, 2),
(42, 19, 29, 1),
(43, 19, 32, 1),
(44, 20, 4, 1),
(45, 20, 28, 1),
(46, 21, 27, 6),
(47, 21, 30, 3),
(48, 21, 32, 3),
(49, 22, 21, 1),
(50, 22, 27, 1),
(51, 23, 26, 2),
(52, 23, 31, 1),
(53, 23, 32, 1),
(54, 24, 32, 1),
(55, 25, 34, 1),
(56, 26, 18, 1),
(57, 26, 26, 2),
(58, 26, 31, 1),
(59, 26, 32, 1),
(60, 27, 17, 1),
(61, 27, 26, 1),
(62, 28, 22, 1),
(63, 28, 27, 1),
(64, 29, 17, 2),
(65, 29, 26, 2),
(66, 29, 31, 1),
(67, 29, 32, 1),
(68, 30, 32, 1),
(69, 30, 31, 1),
(70, 30, 33, 1),
(71, 31, 17, 1),
(72, 31, 26, 1),
(73, 32, 27, 2),
(74, 32, 20, 2),
(75, 32, 31, 1),
(76, 32, 32, 1),
(77, 32, 33, 1),
(78, 33, 29, 1),
(79, 34, 26, 1),
(80, 34, 16, 1),
(81, 35, 9, 2),
(82, 35, 10, 5),
(83, 35, 11, 4),
(84, 35, 28, 11),
(85, 36, 29, 1),
(86, 36, 32, 1),
(87, 37, 29, 1),
(88, 37, 33, 1),
(89, 38, 33, 1),
(90, 38, 34, 1),
(91, 39, 20, 1),
(92, 39, 27, 1),
(93, 40, 30, 1),
(94, 40, 32, 1),
(95, 40, 27, 2),
(96, 41, 30, 1),
(97, 41, 32, 1),
(98, 41, 33, 1),
(99, 42, 27, 1),
(100, 42, 34, 1),
(101, 43, 13, 1),
(102, 43, 26, 3),
(103, 43, 31, 1),
(104, 43, 32, 1),
(105, 44, 27, 1),
(106, 45, 17, 3),
(107, 45, 26, 3),
(108, 45, 30, 1),
(109, 45, 32, 1),
(110, 46, 26, 2),
(111, 46, 19, 2),
(112, 47, 22, 1),
(113, 47, 27, 1),
(114, 48, 32, 1),
(115, 48, 33, 1),
(116, 48, 31, 1),
(117, 49, 29, 1),
(118, 49, 32, 1),
(119, 50, 16, 2),
(120, 50, 26, 2),
(121, 50, 29, 1),
(122, 50, 32, 1),
(123, 51, 30, 1),
(124, 52, 18, 2),
(125, 52, 26, 2),
(126, 53, 33, 1),
(127, 54, 34, 1),
(128, 55, 29, 1),
(129, 55, 32, 1),
(130, 56, 30, 1),
(131, 56, 32, 1),
(132, 57, 1, 1),
(133, 57, 28, 1),
(134, 58, 24, 1),
(135, 58, 27, 1),
(136, 58, 30, 1),
(137, 58, 32, 1),
(138, 59, 26, 2),
(139, 59, 31, 1),
(140, 59, 32, 1),
(141, 60, 33, 1),
(142, 60, 34, 1),
(143, 60, 31, 1),
(144, 60, 32, 1),
(145, 61, 26, 1),
(146, 62, 29, 1),
(147, 62, 32, 1),
(148, 63, 19, 1),
(149, 63, 20, 2),
(150, 63, 26, 3),
(151, 64, 26, 1),
(152, 64, 18, 1),
(153, 65, 27, 3),
(154, 65, 19, 1),
(155, 65, 20, 2),
(156, 65, 29, 1),
(157, 65, 32, 1),
(158, 65, 33, 1),
(159, 66, 27, 2),
(160, 66, 31, 1),
(161, 66, 32, 1),
(162, 67, 33, 1),
(163, 67, 34, 1),
(164, 68, 30, 1),
(165, 68, 32, 1),
(166, 68, 34, 1),
(167, 69, 26, 1),
(168, 69, 20, 1),
(169, 70, 3, 2),
(170, 70, 28, 2);

-- Using any type of the joins create a view that combines multiple tables in a logical way

-- Create the view routes_per_employee showing number of routes and hardest route per employee who created it
CREATE VIEW routes_per_employee AS
SELECT employee_id, first_name, last_name, COUNT(r.route_id) AS number_of_routes, MAX(CAST(REPLACE(grade, "+", ".5") AS DECIMAL(3,1))) as max_grade
FROM employees
RIGHT JOIN routes as r
ON employee_id = r.created_by
GROUP BY created_by
ORDER BY number_of_routes DESC;

-- Create the view rented_gear_per_employee showing number of rented units of gear, total turnover per employee who rented it out
CREATE VIEW rented_gear_per_employee AS
SELECT e.employee_id, first_name, last_name, SUM(quantity) as units_of_rented_gear, SUM(total) as total_turnover, COUNT(DISTINCT date) as working_days_Jan_and_Feb
FROM employees e
JOIN gear_rental gr
ON e.employee_id = gr.employee_id
JOIN transaction_line tl
ON gr.transaction_id = tl.transaction_id
GROUP BY employee_id, first_name, last_name
ORDER BY units_of_rented_gear DESC;

SELECT * FROM routes_per_employee;

SELECT * FROM rented_gear_per_employee;

-- In your database, create a stored function that can be applied to a query in your DB

-- Change delimiter
DELIMITER //

-- Create the function advanced_routsetter showing if an employee is an advanced routesetter, beginner routesetter or not a routesetter at all
CREATE FUNCTION is_routesetter(
    employee INT
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE status_routesetter VARCHAR(20);
    DECLARE max_grade INT;
    
    -- Calculate the highest grade of the routes built by a given employee
    SELECT MAX(CAST(REPLACE(grade, "+", ".5") AS DECIMAL(3,1))) AS max_grade INTO max_grade
	FROM employees LEFT JOIN routes r
	ON employee_id = r.created_by
    WHERE employee_id = employee
	GROUP BY employee_id;
    
	-- Set routesetter status based on max grade
    IF max_grade > 8.5 THEN
        SET status_routesetter = 'Advanced routesetter';
    ELSEIF max_grade <= 8.5 THEN
        SET status_routesetter = 'Beginner routesetter';
    ELSEIF max_grade IS NULL THEN
		SET status_routesetter = 'Not a routesetter';
    END IF;
    RETURN (status_routesetter);
END //

DELIMITER ;

-- Call the function advanced_routsetter on the employees table
SELECT employee_id, first_name, last_name,
is_routesetter(employee_id) AS is_routesetter
FROM employees
ORDER BY is_routesetter;

-- Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis 

-- Create a query returning the sum of total amounts of rental transactions, number of rental transactions and average total amount of rental transactions per customer
SELECT climber_id, SUM(total) AS total_amount, 
    COUNT(transaction_id) AS number_of_transactions, 
    ROUND(SUM(total)/COUNT(transaction_id),2) AS avg_transaction_value_per_climber 
    FROM gear_rental
	GROUP BY climber_id
    ORDER BY total_amount DESC;

-- Use the above query as a subquery to calculate the average of those values 
SELECT ROUND(AVG(total_amount),2) AS avg_total, 
ROUND(AVG(number_of_transactions),2) AS avg_number_of_transactions, 
ROUND(AVG(avg_transaction_value_per_climber),2) AS avg_transaction_value
FROM (
	SELECT climber_id, SUM(total) AS total_amount, 
    COUNT(transaction_id) AS number_of_transactions, 
    ROUND(SUM(total)/COUNT(transaction_id),2) AS avg_transaction_value_per_climber 
    FROM gear_rental
	GROUP BY climber_id
) AS avg_per_climber;

-- In your database, create an event and demonstrate how it runs

-- Enable creating events
SET GLOBAL event_scheduler = ON;

-- Change Delimiter
DELIMITER //

-- Create a daily event to update the status needs_to_be_replaced of gear (ropes and harnesses) bought more than 3 years ago
CREATE EVENT MarkOldGear
	ON SCHEDULE EVERY 1 SECOND -- DAY changed to SECOND for the presentation
	DO BEGIN
		UPDATE gear SET needs_to_be_replaced = 1
        WHERE kind IN ("rope", "harness adults", "harness kids")
        AND TIMESTAMPDIFF(year, gear.purchased, now()) > 3;
	END //

-- Change Delimiter
DELIMITER ;

SELECT * FROM gear;

-- In  your  database,  create  a  stored  procedure  and demonstrate how it runs

-- Change delimiter
DELIMITER //

-- Create procedure to update a climber's discount
CREATE PROCEDURE SetDiscount(
    IN climber INTEGER,
    IN discount_percentage INTEGER
)
BEGIN
    UPDATE
        climbers
    SET
        discount = discount_percentage
    WHERE
        climber_id = climber;
END //
DELIMITER ;

-- Call the procedure to set a discount
CALL SetDiscount(1,15);

SELECT * FROM climbers;
