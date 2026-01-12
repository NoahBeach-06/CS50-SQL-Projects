CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "location" TEXT,
    "year_of_founding" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "connections_people" (
    "user_1_id" INTEGER,
    "user_2_id" INTEGER,
    FOREIGN KEY("user_1_id") REFERENCES "users"("id"),
    FOREIGN KEY("user_2_id") REFERENCES "users"("id")
);

CREATE TABLE "connections_school" (
    "user_id" INTEGER,
    "school_id" INTEGER,
    "degree_type" TEXT,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

CREATE TABLE "connections_company" (
    "user_id" INTEGER,
    "company_id" INTEGER,
    "title" TEXT,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);
