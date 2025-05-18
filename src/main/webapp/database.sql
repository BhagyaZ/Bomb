CREATE TABLE `bomb`.`products` (
                                       `product_id` INT NOT NULL AUTO_INCREMENT,
                                       `name` VARCHAR(100) NULL,
                                       `category` VARCHAR(100) NULL,
                                       `price` VARCHAR(100) NULL,
                                       `quantity` VARCHAR(100) NULL,
                                       `description` VARCHAR(255) NULL,
                                       PRIMARY KEY (`product_id`));

CREATE TABLE `bomb`.`MonthlyReport` (
                                        `reportID` INT AUTO_INCREMENT PRIMARY KEY,
                                        `reportMonth` VARCHAR(20) NOT NULL,
                                        `generatedDate` DATE NOT NULL,
                                        `inStock` INT NOT NULL,
                                        `soldItems` INT NOT NULL,
                                        `lowStock` INT NOT NULL,
                                        `soldOutItems` VARCHAR(255),
                                        `damaged` INT NOT NULL,
                                        `budget` DECIMAL(12, 2) NOT NULL,
                                        `refunds` DECIMAL(12, 2) NOT NULL,
                                        `targetSale` DECIMAL(12, 2) NOT NULL,
                                        `totalSale` DECIMAL(12, 2) NOT NULL
);

CREATE TABLE `monthlyreport` (
                                 `reportID` int(11) NOT NULL AUTO_INCREMENT,
                                 `reportMonth` varchar(20) NOT NULL,
                                 `generatedDate` date NOT NULL,
                                 `inStock` int(11) NOT NULL,
                                 `soldItems` int(11) NOT NULL,
                                 `lowStock` int(11) NOT NULL,
                                 `soldOutItems` varchar(255) DEFAULT NULL,
                                 `damaged` int(11) NOT NULL,
                                 `budget` decimal(12,2) NOT NULL,
                                 `refunds` decimal(12,2) NOT NULL,
                                 `targetSale` decimal(12,2) NOT NULL,
                                 `totalSale` decimal(12,2) NOT NULL,
                                 PRIMARY KEY (`reportID`)
)

CREATE TABLE user (
                      id int(11) NOT NULL AUTO_INCREMENT,
                      name varchar(100) NOT NULL,
                      email varchar(100) NOT NULL,
                      password varchar(255) NOT NULL,
                      phone varchar(20) DEFAULT NULL,
                      role varchar(50) NOT NULL DEFAULT 'customer',
                      PRIMARY KEY (id),
                      UNIQUE KEY email (email)
)

CREATE TABLE `payments` (
                            `account_number` varchar(16) NOT NULL,
                            `card_type` varchar(50) NOT NULL,
                            `expirydate` varchar(10) DEFAULT NULL,
                            `cvv` varchar(3) NOT NULL,
                            `pin` varchar(4) NOT NULL,
                            `security_pin` varchar(4) NOT NULL,
                            `shippingId` int DEFAULT NULL,
                            PRIMARY KEY (`account_number`),
                            KEY `fk_shipping` (`shippingId`),
                            CONSTRAINT `fk_shipping` FOREIGN KEY (`shippingId`) REFERENCES `shippingdetails` (`shippingId`)
)

CREATE TABLE `shippingdetails` (
                                   `shippingId` int NOT NULL AUTO_INCREMENT,
                                   `recipientName` varchar(100) DEFAULT NULL,
                                   `recipientAddress` varchar(1000) DEFAULT NULL,
                                   `city` varchar(100) DEFAULT NULL,
                                   `recipientContactNo` int DEFAULT NULL,
                                   `senderContactNo` int DEFAULT NULL,
                                   `shippingMethod` varchar(100) DEFAULT NULL,
                                   `deliveryDate` date DEFAULT NULL,
                                   `personalMsg` varchar(1000) DEFAULT NULL,
                                   `date` datetime DEFAULT NULL,
                                   PRIMARY KEY (`shippingId`)
)

CREATE TABLE `user` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `name` varchar(100) NOT NULL,
                        `email` varchar(100) NOT NULL,
                        `password` varchar(255) NOT NULL,
                        `phone` varchar(20) DEFAULT NULL,
                        `role` varchar(50) NOT NULL DEFAULT 'customer',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `email` (`email`)
)

