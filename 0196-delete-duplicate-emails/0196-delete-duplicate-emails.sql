-- Write your PostgreSQL query statement below

DELETE FROM Person AS p1
USING Person AS p2
WHERE p1.email = p2.email          -- same e‑mail
  AND p1.id > p2.id;               -- keep the smaller id, delete the rest