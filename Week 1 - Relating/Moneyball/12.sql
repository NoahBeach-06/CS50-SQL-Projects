SELECT "first_name" , "last_name" FROM (
    SELECT "players"."first_name" , "players"."last_name"
FROM ("players" JOIN "performances" ON "players"."id" = "performances"."player_id") JOIN
"salaries" ON "salaries"."year" = "performances"."year" AND "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001 AND "performances"."RBI" != 0 AND "performances"."year" = 2001
ORDER BY ("salaries"."salary"/"performances"."RBI") ASC, "first_name" , "last_name"
LIMIT 10
)

INTERSECT

SELECT "first_name" , "last_name" FROM (
    SELECT "players"."first_name" , "players"."last_name"
FROM ("players" JOIN "performances" ON "players"."id" = "performances"."player_id") JOIN
"salaries" ON "salaries"."year" = "performances"."year" AND "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001 AND "performances"."H" != 0 AND "performances"."year" = 2001
ORDER BY ("salaries"."salary"/"performances"."H") ASC, "first_name" , "last_name"
LIMIT 10
)
ORDER BY "last_name" ASC
;
