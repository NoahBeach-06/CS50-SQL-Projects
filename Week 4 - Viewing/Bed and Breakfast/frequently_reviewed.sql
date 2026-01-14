CREATE VIEW "frequently_reviewed" AS
SELECT "listings"."id", "listings"."property_type", "listings"."host_name", COUNT("reviews"."id") AS "reviews"
FROM "listings" JOIN "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY "listings"."id"
ORDER BY COUNT("reviews"."id") DESC, "property_type", "host_name"
LIMIT 100
;
