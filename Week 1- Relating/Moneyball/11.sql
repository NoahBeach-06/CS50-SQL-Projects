SELECT "players"."first_name" , "players"."last_name" , ("salaries"."salary"/"performances"."H") AS 'dollars per hit'
FROM ("players" JOIN "performances" ON "players"."id" = "performances"."player_id") JOIN
"salaries" ON "salaries"."year" = "performances"."year" AND "players"."id" = "salaries"."player_id"
WHERE "salaries"."year" = 2001 AND "performances"."H" != 0 AND "performances"."year" = 2001
ORDER BY "dollars per hit" ASC, "first_name" , "last_name"
LIMIT 10
;
