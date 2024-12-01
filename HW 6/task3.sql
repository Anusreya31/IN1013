-- List the names of the waiters who have served the customer Tanya Singh.
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- On which dates in February 2016 did the Headwaiter 'Charles' manage the 'Green' room?
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green' AND rm.room_date BETWEEN 160201 AND 160229;

-- List the names and surnames of the waiters with the same headwaiter as the waiter Zoe Ball.
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');

-- List the customer name, the amount they spent, and the waiter’s name for all bills, ordered by the amount spent (highest first).
SELECT b.cust_name, b.bill_total, s.first_name AS waiter_first_name, s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s ON waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- List the names and surnames of the waiters who serve tables that worked in the same team that served bills 00014 and 00017.
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter IN (
    SELECT DISTINCT s1.headwaiter
    FROM restStaff s1
    JOIN restBill b1 ON s1.staff_no = b1.waiter_no
    WHERE b1.bill_no IN (14, 17)
);

-- List the names and surnames of the waiters in the team (including the headwaiter) that served Blue room on 160312.
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (SELECT headwaiter FROM restRoom_management WHERE room_name = 'Blue' AND room_date = 160312)
   OR s.staff_no = (SELECT headwaiter FROM restRoom_management WHERE room_name = 'Blue' AND room_date = 160312);
