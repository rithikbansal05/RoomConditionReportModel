--

    -- DATABASE: 'Room condition report'
    --

CREATE DATABASE IF NOT EXISTS `room_condition_report` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci; USE
    `room_condition_report`;
    --

    -- Table structure for `apartment`
    --

DROP TABLE IF EXISTS
    `apartment`;
CREATE TABLE IF NOT EXISTS `apartment`(
    `FloorNo` VARCHAR(10) DEFAULT NULL,
    `ApartmentNo` VARCHAR(10) DEFAULT NULL,
    `RoomID` VARCHAR(10) DEFAULT NULL,
    `KitchenID` VARCHAR(10) DEFAULT NULL,
    `BathroomID` VARCHAR(10) DEFAULT NULL,
    `LivingRoomID` VARCHAR(10) DEFAULT NULL,
    `BuildingID` VARCHAR(10) DEFAULT NULL,
    `ApartmentID` INT(3) NOT NULL DEFAULT '0'
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `apartment`
--

INSERT INTO `apartment`(
    `FloorNo`,
    `ApartmentNo`,
    `RoomID`,
    `KitchenID`,
    `BathroomID`,
    `LivingRoomID`,
    `BuildingID`,
    `ApartmentID`
)
VALUES(
    '1',
    '171',
    '171A',
    '171K',
    '171AB',
    '171LV',
    '1000',
    10
),(
    '2',
    '214',
    '214A',
    '214K',
    '214AB',
    '214LV',
    '1001',
    11
),(
    '1',
    '162',
    '162A',
    '162K',
    '162AB',
    '162LV',
    '1002',
    12
);
--

-- Table structure for `bathroom`
--

DROP TABLE IF EXISTS
    `bathroom`;
CREATE TABLE IF NOT EXISTS `bathroom`(
    `BathroomID` VARCHAR(10) NOT NULL DEFAULT 'A',
    `BathWalls` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Shower` VARCHAR(10) NOT NULL DEFAULT 'A',
    `BathSink` VARCHAR(10) NOT NULL DEFAULT 'A'
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `bathroom`
--

INSERT INTO `bathroom`(
    `BathroomID`,
    `BathWalls`,
    `Shower`,
    `BathSink`
)
VALUES('162AB', 'A', 'A', 'A'),('171AB', 'A', 'A', 'A'),('214AB', 'A', 'A', 'A');
--

-- Table structure for `building`
--

DROP TABLE IF EXISTS
    `building`;
CREATE TABLE IF NOT EXISTS `building`(
    `BuildingID` VARCHAR(10) NOT NULL DEFAULT '',
    `BuildingName` VARCHAR(10) DEFAULT NULL
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `building`
--

INSERT INTO `building`(`BuildingID`, `BuildingName`)
VALUES('1000', 'Pine'),('1001', 'Spruce'),('1002', 'Aspen');
--

-- Table structure for `EmergencyContact`
--

DROP TABLE IF EXISTS
    `EmergencyContact`;
CREATE TABLE IF NOT EXISTS `EmergencyContact`(
    `EmgCntID` VARCHAR(10) NOT NULL DEFAULT '',
    `EmgCntFirstName` VARCHAR(10) DEFAULT NULL,
    `EmgCntLastName` VARCHAR(10) DEFAULT NULL,
    `EmgCntPhoneNo` INT(10) DEFAULT NULL
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `EmergencyContact`
--

INSERT INTO `EmergencyContact`(
    `EmgCntID`,
    `EmgCntFirstName`,
    `EmgCntLastName`,
    `EmgCntPhoneNo`
)
VALUES(
    'BHCnt',
    'Marinda',
    'Hemsworth',
    9865327410
),('EOCnt', 'Peter', 'Ocean', 9753864210),('MMCnt', 'June', 'Smith', 9876543210),(
    'MHCnt',
    'Hendrick',
    'Munford',
    4256987310
);
--

-- Table structure for `kitchen`
--

DROP TABLE IF EXISTS
    `kitchen`;
CREATE TABLE IF NOT EXISTS `kitchen`(
    `KitchenID` VARCHAR(10) NOT NULL DEFAULT '',
    `DishWasher` VARCHAR(10) NOT NULL DEFAULT 'A',
    `KitchenSink` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Refrigerator` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Stove` VARCHAR(10) NOT NULL DEFAULT 'A'
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `kitchen`
--

INSERT INTO `kitchen`(
    `KitchenID`,
    `DishWasher`,
    `KitchenSink`,
    `Refrigerator`,
    `Stove`
)
VALUES('162K', 'A', 'A', 'A', 'A'),('171K', 'A', 'A', 'A', 'A'),('214K', 'A', 'A', 'A', 'A');
--

-- Table structure for `livingRoom`
--

DROP TABLE IF EXISTS
    `livingRoom`;
CREATE TABLE IF NOT EXISTS `livingRoom`(
    `LivingRoomID` VARCHAR(10) NOT NULL DEFAULT '',
    `Couch` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Washerdryer` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Walls` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Windows` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Blinds` VARCHAR(10) NOT NULL DEFAULT 'A'
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `livingRoom`
--

INSERT INTO `livingRoom`(
    `LivingRoomID`,
    `Couch`,
    `Washerdryer`,
    `Walls`,
    `Windows`,
    `Blinds`
)
VALUES('162LV', 'A', 'A', 'A', 'A', 'A'),('171LV', 'A', 'A', 'A', 'A', 'A'),('214LV', 'A', 'A', 'A', 'A', 'A');
--

-- Table structure for `room`
--

DROP TABLE IF EXISTS
    `room`;
CREATE TABLE IF NOT EXISTS `room`(
    `RoomID` VARCHAR(10) NOT NULL DEFAULT '',
    `Drawer` VARCHAR(10) NOT NULL DEFAULT 'A',
    `RoomCloset` VARCHAR(10) NOT NULL DEFAULT 'A',
    `RoomWalls` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Bed` VARCHAR(10) NOT NULL DEFAULT 'A',
    `Closet` VARCHAR(10) NOT NULL DEFAULT 'A'
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `room`
--

INSERT INTO `room`(
    `RoomID`,
    `Drawer`,
    `RoomCloset`,
    `RoomWalls`,
    `Bed`,
    `Closet`
)
VALUES('162A', 'A', 'A', 'A', 'A', 'A'),('171A', 'A', 'A', 'A', 'A', 'A'),('214A', 'A', 'A', 'A', 'A', 'A');
--

-- Table structure for `resident`
--

DROP TABLE IF EXISTS
    `resident`;
CREATE TABLE IF NOT EXISTS `resident`(
    `StudentID` VARCHAR(10) NOT NULL DEFAULT '',
    `FirstName` VARCHAR(10) DEFAULT NULL,
    `LastName` VARCHAR(10) DEFAULT NULL,
    `CheckInDate` DATETIME NOT NULL,
    `CheckOutDate` DATETIME DEFAULT NULL,
    `RoomID` VARCHAR(10) DEFAULT NULL,
    `EmgCntID` VARCHAR(10) DEFAULT NULL,
    `ApartmentID` INT(3) DEFAULT NULL
) ENGINE = INNODB DEFAULT CHARSET = latin1;
--

-- putting data for table `resident`
--

INSERT INTO `resident`(
    `StudentID`,
    `FirstName`,
    `LastName`,
    `CheckInDate`,
    `CheckOutDate`,
    `RoomID`,
    `EmgCntID`,
    `ApartmentID`
)
VALUES(
    1234567,
    'John',
    'Smith',
    '2018-09-28 00:00:00',
    '2019-06-14 00:00:00',
    '171A',
    'BHCnt',
    10
),(
    1345234,
    'Bill',
    'Hemsworth',
    '2018-09-28 00:00:00',
    '2019-06-14 00:00:00',
    '214A',
    'EOCnt',
    11
),(
    1456256,
    'Erin',
    'Ocean',
    '2019-04-01 00:00:00',
    '2019-06-14 00:00:00',
    '214A',
    'MMCnt',
    11
),(
    1772345,
    'Matt',
    'Munford',
    '2019-01-03 00:00:00',
    '2019-06-14 00:00:00',
    '162A',
    'MHCnt',
    12
);
--

-- Indexes for table `apartment`
--

ALTER TABLE
    `apartment` ADD PRIMARY KEY(`ApartmentID`),
    ADD KEY `RoomIdx`(`RoomID`),
    ADD KEY `KitchenIdx`(`KitchenID`),
    ADD KEY `LivingRoomIdx`(`LivingRoomID`),
    ADD KEY `BuildingIdx`(`BuildingID`),
    ADD KEY `BathroomIdx`(`BathroomID`);
    --

    -- Indexes for table `room`
    --

ALTER TABLE
    `room` ADD PRIMARY KEY(`RoomID`);
    --

    -- Indexes for table `kitchen`
    --

ALTER TABLE
    `kitchen` ADD PRIMARY KEY(`KitchenID`);
    --

    -- Indexes for table `livingRoom`
    --

ALTER TABLE
    `livingRoom` ADD PRIMARY KEY(`LivingRoomID`);
    --

    -- Indexes for table `building`
    --

ALTER TABLE
    `building` ADD PRIMARY KEY(`BuildingID`);
    --

    -- Indexes for table `bathroom`
    --

ALTER TABLE
    `bathroom` ADD PRIMARY KEY(`BathroomID`);
    --

    -- Indexes for table `resident`
    --

ALTER TABLE
    `resident` ADD PRIMARY KEY(`StudentID`),
    ADD KEY `RoomIdx`(`RoomID`),
    ADD KEY `EmgCntIdx`(`EmgCntID`),
    ADD KEY `ApartmentIdx`(`ApartmentID`);
    --

    -- Indexes for table `EmgCnt`
    --

ALTER TABLE
    `EmergencyContact` ADD PRIMARY KEY(`EmgCntID`);
ALTER TABLE
    `apartment` ADD CONSTRAINT `apartment_ibfk_1` FOREIGN KEY(`RoomID`) REFERENCES `room`(`RoomID`),
    ADD CONSTRAINT `apartment_ibfk_2` FOREIGN KEY(`KitchenID`) REFERENCES `kitchen`(`KitchenID`),
    ADD CONSTRAINT `apartment_ibfk_3` FOREIGN KEY(`LivingRoomID`) REFERENCES `livingRoom`(`LivingRoomID`),
    ADD CONSTRAINT `apartment_ibfk_4` FOREIGN KEY(`BuildingID`) REFERENCES `building`(`BuildingID`),
    ADD CONSTRAINT `apartment_ibfk_5` FOREIGN KEY(`BathroomID`) REFERENCES `bathroom`(`BathroomID`);
ALTER TABLE
    `resident` ADD CONSTRAINT `apartment_ibfk_1` FOREIGN KEY(`RoomID`) REFERENCES `room`(`RoomID`),
    ADD CONSTRAINT `apartment_ibfk_2` FOREIGN KEY(`EmgCntID`) REFERENCES `emergencyContact`(`EmgCntID`),
    ADD CONSTRAINT `apartment_ibfk_3` FOREIGN KEY(`ApartmentID`) REFERENCES `apartment`(`ApartmentID`);