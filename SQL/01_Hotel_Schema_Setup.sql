# Table Creation and Inserting Sample data into Queries (hotel management system)

CREATE TABLE users (
    user_id TEXT,
    name TEXT,
    phone_number TEXT,
    mail_id TEXT,
    billing_address TEXT
);

CREATE TABLE bookings (
    booking_id TEXT,
    booking_date TIMESTAMP,
    room_no TEXT,
    user_id TEXT
);

CREATE TABLE booking_commercials (
    id TEXT,
    booking_id TEXT,
    bill_id TEXT,
    bill_date TIMESTAMP,
    item_id TEXT,
    item_quantity FLOAT
);

CREATE TABLE items (
    item_id TEXT,
    item_name TEXT,
    item_rate FLOAT
);

INSERT INTO users VALUES
('21wrcxuy-67erfn', 'John Doe', '97XXXXXXXX', 'john.doe@mail.com', 'XX, Street Y , ABC City');

INSERT INTO bookings VALUES
('bk-09f3e-95hj', '2021-09-23 7:36:48', 'rm-bhf9-aerjn', '21wrcxuy-67erfn');

INSERT INTO booking_commercials VALUES
('q34r-3q4o8-q34u', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a9e8-q8fu', 3),
('q3o4-ahf32-o2u4', 'bk-09f3e-95hj', 'bl-0a87y-q340', '2021-09-23 12:03:22', 'itm-a07vh-aer8', 1),
('134lr-oyfo8-3qk4', 'bk-q034-q4o', 'bl-34qhd-r7h8', '2021-09-23 12:05:37', 'itm-w978-23u4', 0.5);

INSERT INTO items VALUES
('itm-a9e8-q8fu', 'Tawa Paratha', 18),
('itm-a07vh-aer8', 'Mix Veg', 89);

