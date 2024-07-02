CREATE TABLE `users` (
  `username` varchar(255) PRIMARY KEY,
  `hashed_password` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `password_changed_at` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `accounts` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `owner` varchar(255) NOT NULL,
  `balance` BIGINT NOT NULL,
  `currency` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `entries` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `account_id` BIGINT NOT NULL,
  `amount` BIGINT NOT NULL COMMENT 'can be negative or positive',
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `transfers` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
  `from_account_id` BIGINT NOT NULL,
  `to_account_id` BIGINT NOT NULL,
  `amount` BIGINT NOT NULL COMMENT 'must be positive',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `sessions` (
  `id` CHAR(36) PRIMARY KEY,
  `username` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `client_ip` varchar(255) NOT NULL,
  `is_blocked` BOOLEAN NOT NULL DEFAULT false,
  `expires_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX `accounts_index_0` ON `accounts` (`owner`);

CREATE UNIQUE INDEX `accounts_index_1` ON `accounts` (`owner`, `currency`);

CREATE INDEX `entries_index_2` ON `entries` (`account_id`);

CREATE INDEX `transfers_index_3` ON `transfers` (`from_account_id`);

CREATE INDEX `transfers_index_4` ON `transfers` (`to_account_id`);

CREATE INDEX `transfers_index_5` ON `transfers` (`from_account_id`, `to_account_id`);

ALTER TABLE `accounts` ADD FOREIGN KEY (`owner`) REFERENCES `users` (`username`);

ALTER TABLE `entries` ADD FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

ALTER TABLE `transfers` ADD FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`);

ALTER TABLE `transfers` ADD FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`);

ALTER TABLE `sessions` ADD FOREIGN KEY (`username`) REFERENCES `users` (`username`);