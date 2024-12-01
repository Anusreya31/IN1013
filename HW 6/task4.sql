-- List the names of customers who spent more than 450.00 on a single bill on occasions when ‘Charles’ was their Headwaiter.
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total > 450.00
  AND b.waiter_no IN (
      SELECT s.staff_no
      FROM restStaff s
      WHERE s.headwaiter = (
          SELECT staff_no
          FROM restStaff
          WHERE first_name = 'Charles'
      )
  );

-- A customer called Nerida complained about a rude waiter on 11th January 2016. 
-- What is the name and surname of the Headwaiter who will have to deal with the matter?
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = (
        SELECT rt.room_name
        FROM restRest_table rt
        WHERE rt.table_no = (
            SELECT b.table_no
            FROM restBill b
            WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
        )
    ) AND room_date = 160111
);

-- What are the names of customers with the smallest bill?
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- List the names of any waiters who have not taken any bills.
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- Which customers had the largest single bill? List the customer name, the name and surname of headwaiters, and the room name where they were served on that occasion.
--DOUBT
