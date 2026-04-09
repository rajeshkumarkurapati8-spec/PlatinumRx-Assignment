# Queries(Solutions) for Part A (Question 1 - 5)

# Question 1 (For every user in the system, get the user_id and last booked room_no)

SELECT b.user_id, b.room_no
FROM bookings b
WHERE b.booking_date = (
    SELECT MAX(booking_date)
    FROM bookings
    WHERE user_id = b.user_id
);


# Question 2 (Get booking_id and total billing amount of every booking created in November, 2021)

SELECT bc.booking_id,
       SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 11
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.booking_id;


# Question 3 (Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000)

SELECT bc.bill_id,
       SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date) = 10
  AND YEAR(bc.bill_date) = 2021
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;


# Question 4 (Determine the most ordered and least ordered item of each month of year 2021)

SELECT t.month, t.item_id, t.total_qty
FROM (
    SELECT MONTH(bill_date) AS month,
           item_id,
           SUM(item_quantity) AS total_qty
    FROM booking_commercials
    WHERE YEAR(bill_date) = 2021
    GROUP BY MONTH(bill_date), item_id
) t
WHERE t.total_qty = (
        SELECT MAX(total_qty)
        FROM (
            SELECT MONTH(bill_date) AS month,
                   item_id,
                   SUM(item_quantity) AS total_qty
            FROM booking_commercials
            WHERE YEAR(bill_date) = 2021
            GROUP BY MONTH(bill_date), item_id
        ) x
        WHERE x.month = t.month
    )
   OR t.total_qty = (
        SELECT MIN(total_qty)
        FROM (
            SELECT MONTH(bill_date) AS month,
                   item_id,
                   SUM(item_quantity) AS total_qty
            FROM booking_commercials
            WHERE YEAR(bill_date) = 2021
            GROUP BY MONTH(bill_date), item_id
        ) y
        WHERE y.month = t.month
    );


# Question 5 (Find the customers with the second highest bill value of each month of year 2021)

SELECT *
FROM (
    SELECT MONTH(bc.bill_date) AS month,
           b.user_id,
           SUM(bc.item_quantity * i.item_rate) AS total_bill
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    JOIN bookings b ON bc.booking_id = b.booking_id
    WHERE YEAR(bc.bill_date) = 2021
    GROUP BY MONTH(bc.bill_date), b.user_id
) t
WHERE total_bill = (
    SELECT MAX(total_bill)
    FROM (
        SELECT MONTH(bc.bill_date) AS month,
               b.user_id,
               SUM(bc.item_quantity * i.item_rate) AS total_bill
        FROM booking_commercials bc
        JOIN items i ON bc.item_id = i.item_id
        JOIN bookings b ON bc.booking_id = b.booking_id
        WHERE YEAR(bc.bill_date) = 2021
        GROUP BY MONTH(bc.bill_date), b.user_id
    ) x
    WHERE x.month = t.month
      AND x.total_bill < (
          SELECT MAX(total_bill)
          FROM (
              SELECT MONTH(bc.bill_date) AS month,
                     b.user_id,
                     SUM(bc.item_quantity * i.item_rate) AS total_bill
              FROM booking_commercials bc
              JOIN items i ON bc.item_id = i.item_id
              JOIN bookings b ON bc.booking_id = b.booking_id
              WHERE YEAR(bc.bill_date) = 2021
              GROUP BY MONTH(bc.bill_date), b.user_id
          ) z
          WHERE z.month = t.month
      )
);

