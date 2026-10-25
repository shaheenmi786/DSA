-- Write your PostgreSQL query statement below 
WITH valid_trips AS (
    SELECT  t.id,
            t.request_at::date   AS day,
            t.status
    FROM    Trips   t
    JOIN    Users   uc ON uc.users_id = t.client_id
    JOIN    Users   ud ON ud.users_id = t.driver_id
    WHERE   uc.banned = 'No'            -- client not banned
      AND   ud.banned = 'No'            -- driver not banned
      AND   t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT
    day AS "Day",
    /* round to 2 decimal places */
    ROUND(
        CAST(SUM(CASE WHEN status IN ('cancelled_by_driver','cancelled_by_client')
                      THEN 1 ELSE 0 END) AS numeric) /
        COUNT(*)
    , 2) AS "Cancellation Rate"
FROM valid_trips
GROUP BY day
HAVING COUNT(*) > 0                -- at least one trip on the day
ORDER BY day;