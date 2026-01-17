-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

SELECT *
FROM "balances"
LIMIT 1;
-- Seeing the account with the most money in it

SELECT "date", "amount", "category_id"
FROM "transactions"
WHERE "date" > '2026-01-01' AND "person_id" = (
    SELECT "id" FROM "people" WHERE "name" = 'John'
);
-- Seeing how much money John spent since new years day, 2026. Also returning the category id's for each transaction in order to find what he is spending money on.

SELECT "name", "type"
FROM "categories"
WHERE "id" IN (
    SELECT "category_id" FROM "transactions"
    WHERE "date" > '2026-01-01' AND "person_id" = (
        SELECT "id" FROM "people" WHERE "name" = 'John'
    )
);
-- Seeing what types of things John is buying after new years day, 2026.

SELECT * FROM "statements"
WHERE "date" > '2025-11-12'
;
-- Seeing all household transactions from after the 12th of November, 2025


SELECT "transactions"."date" AS "date", "transactions"."amount" AS "amount", "categories"."name" AS "name", "categories"."type" AS "type"
FROM "transactions" JOIN "categories" ON "transactions"."category_id" = "categories"."id"
WHERE "date" > '2026-01-01' AND "person_id" = (
    SELECT "id" FROM "people" WHERE "name" = 'John'
);
-- Combining queries 2 and 3 into one query, in case you wanted to see it all at once. It matches each transaction to its category by joining the two tables.
