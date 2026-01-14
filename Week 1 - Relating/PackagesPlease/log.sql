-- *** The Lost Letter ***
-- SELECT "type" , "address" FROM "addresses" WHERE "id" = (
    --SELECT "address_id" FROM "scans" WHERE ("package_id" = (
    --  SELECT "id" FROM "packages" WHERE "from_address_id" = (
    ---     SELECT "id" FROM "addresses" WHERE "address" LIKE '%900 somerville avenue%"))) AND "action" = 'Drop');

-- *** The Devious Delivery ***
-- SELECT * FROM "packages" WHERE (
--      "contents" LIKE '%duck%') AND "from_address_id" IS NULL;
-- SELECT * FROM "scans" WHERE "package_id" = 5098 AND "action" = 'Drop';
-- SELECT "type" FROM "addresses" WHERE "id" = 348;

-- *** The Forgotten Gift ***
-- SELECT "contents" , "id" FROM "packages" WHERE ("from_address_id" = (
--    SELECT "id" FROM "addresses" WHERE "address" LIKE '%109 tileston street%')
--) AND ("to_address_id" = (
--    SELECT "id" FROM "addresses" WHERE "address" LIKE '%728 maple place%'
));
-- SELECT * FROM "scans" WHERE "package_id" = 9523 ORDER BY "timestamp" DESC;
-- SELECT "name" FROM "drivers" WHERE "id" = 17;
