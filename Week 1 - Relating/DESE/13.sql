SELECT "districts"."name" , "schools"."name"
FROM "districts" JOIN "schools" ON "districts"."id" = "schools"."district_id"
WHERE "schools"."id" IN (SELECT "school_id" FROM "graduation_rates" WHERE "dropped" > 5);
