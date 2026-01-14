CREATE TABLE "cipher" (
    "sentence_id" INTEGER,
    "substr_1" INTEGER,
    "substr_2" INTEGER,
    FOREIGN KEY("sentence_id") REFERENCES "sentences"("id")
);

INSERT INTO "cipher" ("sentence_id", "substr_1", "substr_2")
VALUES
(14,98,4),
(114,3,5),
(618,72,9),
(630,7,3),
(932,12,5),
(2230,50,7),
(2346,44,10),
(3041,14,5);

CREATE VIEW "message" AS
SELECT substr("sentence" , "substr_1","substr_2") AS "phrase"
FROM "sentences" JOIN "cipher" ON "cipher"."sentence_id" = "sentences"."id"
ORDER BY "sentence_id"
;

