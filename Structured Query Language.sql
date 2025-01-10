CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Task 1: Insert data into Members table
INSERT INTO Members (id, name, age)
VALUES
    (1, 'Jane Doe', 28),
    (2, 'John Smith', 35),
    (3, 'Emily Davis', 25),
    (4, 'Michael Brown', 30);

-- Task 1: Insert data into WorkoutSessions table
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity)
VALUES
    (101, 1, '2025-01-08', 'Morning', 'Yoga'),
    (102, 2, '2025-01-08', 'Afternoon', 'Cardio'),
    (103, 3, '2025-01-09', 'Morning', 'Strength Training'),
    (104, 4, '2025-01-09', 'Evening', 'HIIT');

-- Task 2: Update Jane Doe's workout session time
UPDATE WorkoutSessions
SET session_time = 'Evening'
WHERE member_id = (
    SELECT id FROM Members WHERE name = 'Jane Doe'
);

-- Task 3: Delete John Smith's workout sessions
DELETE FROM WorkoutSessions
WHERE member_id = (
    SELECT id FROM Members WHERE name = 'John Smith'
);

-- Task 3: Delete John Smith's membership record
DELETE FROM Members
WHERE name = 'John Smith';
