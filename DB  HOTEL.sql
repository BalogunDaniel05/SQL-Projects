create database DB;




-- Tables
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50),
    price_per_night DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount_paid DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Data
INSERT INTO Guests VALUES
(1, 'Daniel', 'Olawale', '08012345678', 'daniel@email.com'),
(2, 'James', 'Smith', '08098765432', 'james@email.com');

INSERT INTO Rooms VALUES
(101, 'Single', 30000, 'Available'),
(102, 'Double', 45000, 'Occupied');

INSERT INTO Bookings VALUES
(1, 1, 101, '2026-02-01', '2026-02-05');

INSERT INTO Payments VALUES
(1, 1, 120000, '2026-02-05');

-- Queries
SELECT * FROM Guests;
SELECT * FROM Rooms;

SELECT g.first_name, r.room_type, b.check_in
FROM Bookings b
JOIN Guests g ON b.guest_id = g.guest_id
JOIN Rooms r ON b.room_id = r.room_id;

SELECT SUM(amount_paid) AS total_revenue FROM Payments;
