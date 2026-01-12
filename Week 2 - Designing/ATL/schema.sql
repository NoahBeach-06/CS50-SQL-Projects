CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "checkin_date" NUMERIC,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id)")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT,
    "airport_id" INTEGER,
    "concourses" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("airport_id") REFERENCES "airports"("id")
);

CREATE TABLE "airports" (
    "id" INTEGER,
    "name" TEXT,
    "code" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER,
    "airline_id" INTEGER,
    "airport_from_id" INTEGER,
    "airport_to_id" INTEGER,
    "date_of_dep" NUMERIC,
    "date_of_arr" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id"),
    FOREIGN KEY("airport_from_id") REFERENCES "airports"("id"),
    FOREIGN KEY("airport_to_id") REFERENCES "airports"("id")
);
