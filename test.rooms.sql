-- @BLOCK
CREATE TABLE rooms(
    id INT AUTO_INCREMENT,
    street VARCHARACTER(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);
-- @BLOCK
INSERT INTO rooms (owner_id, street)
VALUES (1, "Chennai");
-- @BLOCK
SELECT *
FROM users
    INNER JOIN rooms ON rooms.owner_id = users.id;
-- @BLOCK
SELECT *
FROM users
    LEFT JOIN rooms ON rooms.owner_id = users.id;
-- @BLOCK
-- result will be same as users LEFT JOIN on rooms
SELECT *
FROM rooms
    RIGHT JOIN users ON users.id = rooms.owner_id;
-- @BLOCK
SELECT *
FROM users
    RIGHT JOIN rooms ON rooms.owner_id = users.id;
-- @BLOCK
-- result will be same as users RIGHT JOIN on rooms
SELECT *
FROM rooms
    LEFT JOIN users ON users.id = rooms.owner_id;
-- @BLOCK
-- can't use * when creating alias for columns
SELECT users.id AS users_id,
    rooms.id AS rooms_id,
    email,
    country
FROM users
    INNER JOIN rooms ON rooms.owner_id = users.id;
-- @BLOCK rename COLUMN_NAME
ALTER TABLE rooms
    RENAME COLUMN street TO city;