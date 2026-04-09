# Queries(Solutions) for Part B (Question 1 - 5)

# Question - 1 (Find the revenue we got from each sales channel in a given year)

SELECT sales_channel,
       SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;


# Question - 2 (Find top 10 the most valuable customers for a given year)

SELECT uid,
       SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;


# Question - 3 (Find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year)

SELECT r.month,
       r.revenue,
       e.expense,
       (r.revenue - e.expense) AS profit,
       IF((r.revenue - e.expense) > 0, 'profitable', 'not-profitable') AS status
FROM (
    SELECT MONTH(datetime) AS month,
           SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) r
JOIN (
    SELECT MONTH(datetime) AS month,
           SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY MONTH(datetime)
) e
ON r.month = e.month;


# Question - 4 (For each city find the most profitable clinic for a given month)

SELECT c.city, t.cid, t.profit
FROM (
    SELECT cs.cid,
           (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit
    FROM clinic_sales cs
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE MONTH(cs.datetime) = 10 AND YEAR(cs.datetime) = 2021
    GROUP BY cs.cid
) t
JOIN clinics c ON t.cid = c.cid
WHERE t.profit = (
    SELECT MAX(profit)
    FROM (
        SELECT cs.cid,
               (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit
        FROM clinic_sales cs
        LEFT JOIN expenses e ON cs.cid = e.cid
        WHERE MONTH(cs.datetime) = 10 AND YEAR(cs.datetime) = 2021
        GROUP BY cs.cid
    ) x
    WHERE x.cid IN (
        SELECT cid FROM clinics WHERE city = c.city
    )
);


# Question - 5 (For each state find the second least profitable clinic for a given month)

SELECT c.state, t.cid, t.profit
FROM (
    SELECT cs.cid,
           (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit
    FROM clinic_sales cs
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE MONTH(cs.datetime) = 10 AND YEAR(cs.datetime) = 2021
    GROUP BY cs.cid
) t
JOIN clinics c ON t.cid = c.cid
WHERE t.profit = (
    SELECT MIN(profit)
    FROM (
        SELECT cs.cid,
               (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit
        FROM clinic_sales cs
        LEFT JOIN expenses e ON cs.cid = e.cid
        WHERE MONTH(cs.datetime) = 10 AND YEAR(cs.datetime) = 2021
        GROUP BY cs.cid
    ) x
    WHERE x.profit > (
        SELECT MIN(profit)
        FROM (
            SELECT cs.cid,
                   (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit
            FROM clinic_sales cs
            LEFT JOIN expenses e ON cs.cid = e.cid
            WHERE MONTH(cs.datetime) = 10 AND YEAR(cs.datetime) = 2021
            GROUP BY cs.cid
        ) y
        WHERE y.cid IN (
            SELECT cid FROM clinics WHERE state = c.state
        )
    )
);
