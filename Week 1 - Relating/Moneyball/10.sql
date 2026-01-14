SELECT "players"."first_name" , "players"."last_name" , "salaries"."salary" , "performances"."HR" , "salaries"."year"
FROM ("players" JOIN "performances" ON "players"."id" = "performances"."player_id") JOIN
    "salaries" ON "salaries"."year" = "performances"."year" AND "players"."id" = "salaries"."player_id"

ORDER BY "players"."id" ASC, "salaries"."year" DESC, "performances"."HR" DESC, "salaries"."salary" DESC
;
