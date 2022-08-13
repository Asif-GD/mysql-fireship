-- @BLOCK
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHARACTER(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHARACTER(2)
);
-- @BLOCK
INSERT INTO users(email, bio, country) VALUE ("stockholm@gmail.com", "I am from Sweden", "SE");
-- @BLOCK
SELECT *
FROM users;
-- @BLOCK
SELECT id,
    email
FROM users
ORDER BY id ASC
LIMIT 2;
-- @BLOCK
SELECT id,
    email,
    country
FROM users
WHERE country = "IN"
    AND id > 0
ORDER BY id ASC;
-- @BLOCK
SELECT id,
    email,
    country
FROM users
WHERE country = "SE"
    AND email LIKE "s%"
ORDER BY id ASC;
-- @BLOCK
SELECT id,
    email,
    country
FROM users
WHERE country = "SE"
    AND email LIKE "sweden%"
ORDER BY id ASC;
-- @BLOCK
CREATE INDEX users_email_index ON users(email);