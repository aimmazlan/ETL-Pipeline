<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/ETL_to_BigQuery.png" alt="ETL-PIPELINE" /></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)

## Extract data from on-premise SQL Server and load it to BigQuery with Airflow

## Overview
This project demonstrates how to extract data from an on-premise SQL Server database and load it into Google's BigQuery using Airflow. The code borrows heavily from [ETL with Apache Airflow](https://github.com/aimmazlan/ETL-Pipeline/tree/main/ETL%20with%20Apache%20Airflow)'s repository.

## Prerequisites
- A running instance of SQL Server with the [AdventureWorks](https://learn.microsoft.com/en-us/sql/samples/sql-samples-where-are?view=sql-server-ver16) database installed
- A Google Cloud account with a project and dataset created in BigQuery
- A service account with permissions to access the project and dataset, and a JSON key file generated for authentication
## Libraries used
- `google-auth`, `google-auth-oauthlib`, `google-auth-httplib2`, and `google-api-python-client` for authenticating with Google Cloud's service account
- `msql-hook` for querying SQL Server
- `pandas` for creating and manipulating the data frame
## Workflow
- The Python script is triggered by a DAG running in Airflow
- The script reads data from the SQL Server database into a data frame
- The data frame is written to BigQuery using the Python client library
## DAG details
The DAG is scheduled to run daily at midnight. It has two tasks:

1. `sql_extract` - gets the names of tables in the SQL Server database using the msql-hook and saves them into a data frame. In this example, only one table is being processed, but multiple tables can be handled as well. The task returns the table name as a dictionary.
2. `gcp_load` - authenticates with Google Cloud using the service account JSON key file and defines the project ID and dataset name. It then loads the data from the data frame into the specified table in BigQuery.

## To run this project
- Set up the prerequisites as described above
- Place the service account JSON key file in the correct location on the system where Airflow is running
- Modify the variables in the Python script with your own project, dataset, and table names
- Set up the DAG in Airflow with the correct schedule and dependencies
- Run the DAG and verify that the data has been successfully loaded into BigQuery.

## Conclusion
This project demonstrates how to extract data from an on-premise SQL Server database and load it into BigQuery using Airflow and Python.
It also shows how to authenticate against BigQuery using a service account and how to interact with BigQuery using Python.

## Additional Documentation
- [BigQuery Documentation](https://cloud.google.com/bigquery/docs)
- [Airflow Documentation](https://airflow.apache.org/docs/)
