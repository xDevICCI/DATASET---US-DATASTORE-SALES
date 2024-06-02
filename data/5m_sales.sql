CREATE TABLE `countries` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `region_id` INT NULL DEFAULT 'NULL' ,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id`)
);
CREATE TABLE `items` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `item_type` VARCHAR(255) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id`)
);
CREATE TABLE `orders` ( 
  `id` BIGINT NOT NULL,
  `order_date` DATE NOT NULL,
  `ship_date` DATE NOT NULL,
  `order_priority` CHAR(1) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id`)
);
CREATE TABLE `regions` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id`)
);
CREATE TABLE `sales` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `order_id` BIGINT NULL DEFAULT 'NULL' ,
  `country_id` INT NULL DEFAULT 'NULL' ,
  `item_id` INT NULL DEFAULT 'NULL' ,
  `sales_channel` VARCHAR(50) NOT NULL,
  `units_sold` INT NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  `unit_cost` DECIMAL(10,2) NOT NULL,
  `total_revenue` DECIMAL(15,2) NOT NULL,
  `total_cost` DECIMAL(15,2) NOT NULL,
  `total_profit` DECIMAL(15,2) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id`)
);
ALTER TABLE `countries` ADD CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sales` ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sales` ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sales` ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
