# CS50 SQL - Harvard University

This repository contains my solutions to **CS50's Introduction to Databases with SQL**. 

As a Physics student at Carleton University, I am completing this course to build a 
stronger foundation in data management and relational logic to supplement my 
computational physics work.

## Week 0
**Focus:** Querying
* Practiced retrieving data from a SQLite database using `SELECT`.
* Applied filtering logic using `WHERE`, `LIKE`, and Boolean operators.
* Used aggregate functions like `COUNT` and `AVG` to summarize dataset properties.

## Week 1
**Focus:** Relating
* Covered one-to-one, one-to-many, and many-to-many relations, and modelled them using Entity Relationship Diagrams.
* Practiced more advanced queries using concepts such as subqueries and `IN`.
* Used `JOIN` operations (including `LEFT JOIN` and `NATURAL JOIN`) to query and interpret relational data.
* Applied **set operations** (`UNION`, `INTERSECT`, `EXCEPT`) and **grouping logic** (`GROUP BY`, `HAVING`) to synthesize and filter multi-dimensional datasets.

## Week 2
**Focus:** Designing
* Learned the principles of **normalization** to reduce data redundancy and improve data integrity.
* Explored the differences between **storage classes**, **data types**, and **type affinities** in SQLite.
* Modified existing database structures using `ALTER TABLE` to `RENAME`, `ADD`, or `DROP` columns.
* Developed **database schemas** by determining how to best structure data into tables, columns, and relationships.

## Week 3
**Focus:** Writing
* Implemented **Create, Read, Update, and Delete** operations to modify database contents.
* Inserted data using `INSERT INTO` and imported CSV files using `.import`.
* Explored the use of **foreign key constraints** in maintaining referential integrity between related tables.
* Applied **triggers** and **soft deletion** techniques to manage data lifecycle without permanently removing records.

## Week 4
**Focus:** Viewing
* Created **views** using `CREATE VIEW` to simplify complex queries and improve readability.
* Used views for **aggregation** and **partitioning** to analyze subsets of data more effectively.
* Implemented **temporary views** with `CREATE TEMPORARY VIEW` for intermediate and session-scoped queries.
* Applied **Common Table Expressions (CTEs)** to structure multi-step queries clearly.

## Week 5
**Focus:** Optimizing
* Improved query performance using indexes, covering indexes, and partial indexes with `CREATE INDEX`.
* Analyzed query execution strategies with `EXPLAIN QUERY PLAN` to identify bottlenecks.
* Implemented transactions using `BEGIN TRANSACTION`, `COMMIT`, and `ROLLBACK`.
* Applied **ACID principles** (Atomicity, Consistency, Isolation, Durability) to ensure reliable database operations.
* Identified and mitigated race conditions through proper locking and transactional design.

## Week 6
**Focus:** Scaling
*
