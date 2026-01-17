-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

CREATE TABLE "people" ( -- The people in the household spending and making money
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE, -- Since its for one household, they cannot share the same name, and since the name is the only identifier (aside from id) its required
    "job" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "categories" (
    "id" INTEGER,
    "type" TEXT CHECK ("type" IN ('Income', 'Expense')) NOT NULL, -- In future versions, if its 'Expense' a trigger could make the value negative
    "name" TEXT, -- Gas, Groceries, etc
    PRIMARY KEY("id")
);

CREATE TABLE "accounts" ( -- These are accounts under one household
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT CHECK ("type" IN ('Chequing', 'Saving', 'Debit', 'Credit', 'Investment')),
    "account_number" INTEGER NOT NULL UNIQUE,
    PRIMARY KEY("id")
);

CREATE TABLE "send_funds" ( --For sending funds from one account to another within the household
    "id" INTEGER,
    "from_account_id" INTEGER NOT NULL,
    "to_account_id" INTEGER NOT NULL CHECK ("from_account_id" != "to_account_id"),
    "amount" NUMERIC NOT NULL,
    "date" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("from_account_id") REFERENCES "accounts"("id"),
    FOREIGN KEY("to_account_id") REFERENCES "accounts"("id")
);

CREATE TABLE "transactions" ( -- transactions that are money coming into, or going out of the household
    "id" INTEGER,
    "person_id" INTEGER NOT NULL, -- to track who is spending
    "account_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    "amount" NUMERIC NOT NULL, -- if it is an expense, it should be entered as negative
    "date" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("person_id") REFERENCES "people"("id"),
    FOREIGN KEY("account_id") REFERENCES "accounts"("id"),
    FOREIGN KEY("category_id") REFERENCES "categories"("id")
);

CREATE TABLE "statements" (
    "id" INTEGER,
    "account_id" INTEGER NOT NULL,
    "amount" NUMERIC NOT NULL,
    "type" TEXT CHECK ("type" IN ('Transaction', 'Transfer_in', 'Transfer_out')),
    "date" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("account_id") REFERENCES "accounts"("id")
);
-- Master table that tracks all transactions and transfers

CREATE INDEX "send_lookup" ON "send_funds" ("from_account_id", "to_account_id", "amount", "date");

CREATE INDEX "statements_lookup" ON "statements" ("account_id", "amount", "date", "type");

CREATE INDEX "transaction_lookup" ON "transactions" ("account_id", "amount", "date", "category_id");
-- All of these follow the same general trend, ensuring that lookups of specific transactions can be found easily by amount, type of transaction,
-- account number, and date

CREATE TRIGGER "log_transaction"
AFTER INSERT ON "transactions"
BEGIN
    INSERT INTO "statements" ("account_id", "amount", "type", "date")
    VALUES (NEW."account_id", NEW."amount", 'Transaction', NEW."date");
END;
-- When a transaction is made, it is inserted into the "statements" table

CREATE TRIGGER "log_transfer_out"
AFTER INSERT ON "send_funds"
BEGIN
    INSERT INTO "statements" ("account_id", "amount", "type", "date")
    VALUES (NEW."from_account_id", -NEW."amount", 'Transfer_out', NEW."date");
END;
-- When money is sent from one account to another, the sending account loses money in the "statements" table

CREATE TRIGGER "log_transfer_in"
AFTER INSERT ON "send_funds"
BEGIN
    INSERT INTO "statements" ("account_id", "amount", "type", "date")
    VALUES (NEW."to_account_id", NEW."amount", 'Transfer_in', NEW."date");
END;
-- When money is sent from one account to another, the receiving account gains money in the "statements" table

CREATE VIEW "balances" AS
SELECT "accounts"."name" , SUM("statements"."amount") AS "balance"
FROM "accounts" JOIN "statements" ON "accounts"."id" = "statements"."account_id"
GROUP BY "accounts"."id"
ORDER BY "balance" DESC
;
