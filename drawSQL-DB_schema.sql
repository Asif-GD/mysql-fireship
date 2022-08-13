CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL COMMENT '255',
    `bio` TEXT NOT NULL,
    `country` VARCHAR(255) NOT NULL COMMENT '2'
);
ALTER TABLE
    `users` ADD INDEX `users_email_index`(`email`);
ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `rooms`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `owner_id` INT NOT NULL COMMENT 'foreign key to rooms.id',
    `city` VARCHAR(255) NOT NULL COMMENT '255'
);
ALTER TABLE
    `rooms` ADD PRIMARY KEY `rooms_id_primary`(`id`);
CREATE TABLE `bookings`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `guest_id` INT NOT NULL COMMENT 'foreign key to users.id',
    `room_id` INT NOT NULL,
    `price` INT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL
);
ALTER TABLE
    `bookings` ADD PRIMARY KEY `bookings_id_primary`(`id`);
ALTER TABLE
    `bookings` ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`);
ALTER TABLE
    `bookings` ADD CONSTRAINT `bookings_guest_id_foreign` FOREIGN KEY(`guest_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `rooms` ADD CONSTRAINT `rooms_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `users`(`id`);