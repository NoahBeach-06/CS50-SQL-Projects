CREATE TABLE `users` (
    `id` INTEGER,
    `first_name` VARCHAR(32),
    `last_name` VARCHAR(32),
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INTEGER,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education'),
    `location` VARCHAR(32),
    `year_of_founding` YEAR,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INTEGER,
    `name` TEXT NOT NULL,
    `industry` TEXT,
    `location` TEXT,
    PRIMARY KEY(`id`)
);

CREATE TABLE `connections_people` (
    `user_1_id` INTEGER,
    `user_2_id` INTEGER,
    FOREIGN KEY(`user_1_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user_2_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `connections_school` (
    `user_id` INTEGER,
    `school_id`INTEGER,
    `degree_type` VARCHAR(32),
    `start_date` DATETIME,
    `end_date` DATETIME,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `connections_company` (
    `user_id` INTEGER,
    `company_id` INTEGER,
    `title` VARCHAR(32),
    `start_date` DATETIME,
    `end_date` DATETIME,
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);
