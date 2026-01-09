SELECT "first_name" , "last_name" FROM "players"
WHERE "birth_country" NOT LIKE '%United States%' AND "birth_country" NOT LIKE '%USA%'
ORDER BY "first_name" ASC, "last_name" ASC;
