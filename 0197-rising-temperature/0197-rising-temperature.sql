-- Write your PostgreSQL query statement below
SELECT  w.id
FROM    Weather AS w
JOIN    Weather AS prev
          ON prev.recordDate = w.recordDate - INTERVAL '1 day'
WHERE   w.temperature > prev.temperature;