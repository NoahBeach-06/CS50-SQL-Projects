CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT,
    "unit_price" NUMERIC,
    PRIMARY KEY("id")
);

CREATE TABLE "recipes" (
    "ingredient_id" INTEGER,
    "donut_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT,
    "unit_price" NUMERIC,
    "gluten_free" BOOLEAN,
    PRIMARY KEY("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "order_history" (
    "customer_id" INTEGER,
    "order_id" INTEGER,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "order_contents" (
    "order_id" INTEGER,
    "donut_id" INTEGER,
    "amount" INTEGER,
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
