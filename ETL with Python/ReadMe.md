![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)

# ETL Pipeline with Python
<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/sql-server-to-postgres.jpg" alt="SQL-SERVER-POSTGRESS-PIPELINE" /></p>


## Overview
In this project, we will build an ETL (extract, transform, and load) pipeline using Python and the pandas library. The goal is to take data from a source (SQL Server) database and transform it before loading it into a destination database (PostgreSQL).

## Sample database
[AdventureWorks](https://learn.microsoft.com/en-us/sql/samples/sql-samples-where-are?view=sql-server-ver16)

## Setup

Before we begin coding the ETL pipeline, we need to set up both the PostgreSQL and SQL Server environments. In PostgreSQL, we will create a new database called `AdventureWorks` and a user called `etl` with the necessary permissions. In SQL Server, we will also create an `etl` user with the necessary permissions to connect and read data from the `AdventureWorks` database.

## Extract

The first step in our ETL pipeline is to extract the data from the source database (SQL Server). We will use Python and the pandas library to connect to the database and extract the necessary data.

## Transform

The next step is to transform the data as needed. This may include structuring, formatting, or cleaning the data. We will use the pandas library to perform these operations.

## Load

Finally, we will load the transformed data into the destination database (PostgreSQL). We will use Python to connect to the database and load the data.

## Conclusion

With Python and the pandas library, it is easy to build an ETL pipeline to extract data from a source, transform it as needed, and load it into a destination database. The full source code for this project is available in this repository.



