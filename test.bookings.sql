CREATE TABLE IF NOT EXISTS bookings(
    id INT AUTO_INCREMENT,
    guest_id INT,
    room_id INT,
    start_date DATETIME,
    end_date DATETIME,
    price INT,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES users(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);
-- @BLOCK add column
/* BEFORE end_date->throws an error. A column has to exist already on the table. */
ALTER TABLE bookings
ADD COLUMN end_date DATE,
    ADD COLUMN start_date DATE
AFTER price;
-- @BLOCK remove column
ALTER TABLE bookings DROP COLUMN start_date,
    DROP COLUMN end_date;
-- @BLOCK
/* have to check options to prevent people from booking on for same dates. Maybe server-side checks? */
INSERT INTO bookings (guest_id, room_id, price, start_date, end_date)
VALUES (5, 2, 400, "2022-08-20", "2022-08-24");
-- @BLOCK all users who have booked a certain room
SELECT room_id,
    guest_id,
    start_date
FROM bookings
    INNER JOIN rooms ON rooms.id = room_id
WHERE room_id = 2;
-- @BLOCK all rooms booked by a user
SELECT guest_id,
    room_id,
    start_date
FROM bookings
    INNER JOIN rooms ON rooms.id = room_id
WHERE guest_id = 5;
-- @BLOCK booking history of a room
SELECT room_id,
    guest_id,
    start_date
FROM bookings
    INNER JOIN users ON users.id = guest_id
WHERE room_id = 2;