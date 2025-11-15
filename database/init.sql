CREATE DATABASE IF NOT EXISTS twita_db_secured;

USE twita_db_secured;

DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    role VARCHAR(20),
    password VARCHAR(255),
    failed_attempts INT,
    last_attempt TIMESTAMP,
    locked_until TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tweets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    content TEXT,
    image_url VARCHAR(255) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- INSERT INTO users (username, email, password, role, failed_attempts, last_attempt, locked_until) VALUES
-- ('alice', 'alice@example.com', 'password123', 'jelata', 0, NULL, NULL),
-- ('bob', 'bob@example.com', 'qwerty', 'jelata', 0, NULL, NULL);

INSERT INTO tweets (user_id, content) VALUES
(1, 'Hello world!'),
(2, 'Ini tweet dari Bob');