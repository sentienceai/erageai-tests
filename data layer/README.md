# Data Layer and DBMS

The aim of this article is to objectively determine the strengths and weaknesses of various database technologies. In the journal entry /04-03 Database and REST API research I will analyse the findings and find a solution.

## SQL based Databases (RDBMS)

### MySQL / MariaDB

MySQL is the most popular form of SQL Database. SQL stands for "structured query language", which aptly describes the ideas behind this type of DB. The data is stored in tables and columns, which all are related to each other. This way of storing data makes sense, since everything has a relationship to everything else in the real world. The static schema for storing data allows for very complex queries MySQL has been around since 1995, so it has become a very robust and well documented rdbms in the meantime. It is compatible with a large variety of languages. According to https://www.xplenty.com/blog/the-sql-vs-nosql-difference/, mysql is a "good choice for any business that will benefit from its pre-defined structure and set schemas". Since MySQL does not try to implement all ANSI SQL requirements, the devs could focus on speed.

### PostgreSQL
https://www.postgresql.org/files/documentation/pdf/12/postgresql-12-A4.pdf
PostgreSQL is a hybrid between SQL and NoSQL. It has also been around for a really long time (30 years). It offers similar stellar compatibility for different client languages. It is considered a ORDBMS (object-relational database management system) due to the fact that it offers features of both SQL and NoSQL systems. Just like MySQL it has predefined schemas with primary and foreign keys, but it seems more powerful than MySQL, since it supports both static and dynamic schemas. PostgreSQL can be turned into NoSQL, storing JSON documents but with constraintrs on the fields data. It scales vertically, same as MySQL. PostgreSQL is highly ACID compliant, which is great for data integrity. It handles concurrency better since it implements MVCC and can create partial indexes, so that many processes can access data at once.

According to a couple of websites*, PostgreSQL's main use case is when the workload is very read/write intensive. The DBMS was designed with extensibility in mind. This means that it is suited for data analysis, since it handles complex procedures better. MySQL is best suited for read-only transactions and often gets very slow when asked to execute complicated queries. Therefore it is easy to set up and should be faster than Postgres for simple use cases. It is pretty hard to beat when it comes to read-heavy operations, where speed is required. Recent benchmarks have shown though that PostgreSQL can come close to or even match MySQL in performance.

### SQLite
https://www.sqlite.org/serverless.html
SQLite is considered a "serverless" database, since it directly reads from and writes to disk instead of being part of a server process. This means that it is very simple and easy to configure. It is really nice for embedded systems due to its small footprint and uncomplicated architecture. The drawbacks are the low writing throughput since only one write process can be invoked at once.

*sources
https://developer.okta.com/blog/2019/07/19/mysql-vs-postgres
https://www.2ndquadrant.com/en/postgresql/postgresql-vs-mysql/
https://hackr.io/blog/postgresql-vs-mysql
http://betica.com/blog/2017/05/12/the-nosql-capabilities-of-postgresql/
https://www.techiediaries.com/mysql-vs-postgresql/
https://www.digitalocean.com/community/tutorials/sqlite-vs-mysql-vs-postgresql-a-comparison-of-relational-database-management-systems
https://www.theserverside.com/feature/Comparing-MySQL-and-Postgres-90-Replication
https://www.postgresqltutorial.com/postgresql-vs-mysql/
### Side Note
All of these databases supported by Laravel https://laravel.com/docs/5.8/database

## NoSQL

NoSQL is good because it is horizontally scalable. This makes it possible to increase the size of the database easily. Another advantage of NoSQL is when the situation requires high data flexbility, since RDBMS rely on very structured data. RDBMS make a big point of using normalized data for ease of sorting and searching. NoSQL databases dont use a predefined schema and are therefore more suited for semi-structured data and unstructured data. Unlike relational databases, a document oriented database can store all the data of a given object in a single document. Document stores contain metadata about the type of data that is contained. By nesting documents within other documents, it is possible to create complicated data structures. These languages are excellent for managing large amounts of unrelated, complex information with varying structure.
