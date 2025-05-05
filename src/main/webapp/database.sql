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
