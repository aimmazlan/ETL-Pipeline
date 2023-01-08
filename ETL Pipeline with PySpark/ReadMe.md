# PySpark
<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/ETL_with_PySpark.png" alt="ETL-PIPELINE" /></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)


## Overview

This project demonstrates how to build an ETL (extract, transform, and load) pipeline using PySpark. We extract data from a SQL Server database, transform it, and then load it into a PostgreSQL database.


## Sample database
[AdventureWorks](https://learn.microsoft.com/en-us/sql/samples/sql-samples-where-are?view=sql-server-ver16)

## Prerequisites

- Python 3 installed on your machine
- Java (version 18.0.2.1 or later)
- PySpark
- SQL Server
- PostgreSQL

## Step 1: import the necessary libraries and set the Java home variable. 
1. Define the Spark configuration details and initiate a Spark session.
2. Set the database details, including the server name, source and target databases, and the driver class for both SQL Server and PostgreSQL. 
3. We define the JDBC URLs for the source and target databases using these variables.

## Step 2: Test our connection
1. Executing a query against the SQL Server system schema and saving the results to a DataFrame called `dfs`.
2. Display the data in this DataFrame and retrieve all the values in the DataFrame, storing the results in a list called `data_collect`. 
3. Iterate over this list and extract the data for each table.

## Step 3: Run the script 
1. We have defined two functions, `extract()` and `load()`, to extract data from the source system and persist it in the target database, respectively. 
2. The `extract()` function reads data from the SQL Server database and saves it to a DataFrame. 
3. The `load()` function writes this DataFrame to the PostgreSQL database using the `write` function and setting the format as JDBC.

## Conclusion
With PySpark, it is easy to build an ETL pipeline to extract data from a source, transform it as needed, and load it into a destination database on a distributed platform.

## Additional Documentation

- [PySpark documentation](https://spark.apache.org/docs/latest/api/python/)



