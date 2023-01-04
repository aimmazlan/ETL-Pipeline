![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)

# Automate Python ETL Pipeline with Airflow

<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/ETL%20Airflow.jpeg" alt="ETL-Airflow" /></p>

## Overview
In this project, we will use Apache Airflow to automate our Python ETL pipeline. Airflow is a popular open-source workflow management system that provides data engineers with an intuitive platform to create, schedule, monitor, and maintain complex data pipelines.

## Sample database
[AdventureWorks](https://learn.microsoft.com/en-us/sql/samples/sql-samples-where-are?view=sql-server-ver16)

## Prerequisites

- Python 3 installed on your machine
- Apache Airflow installed and set up on your machine

## Step 1: Set Up Connections in the Airflow UI

1. In the Airflow UI, go to the **Admin > Connections** page.
2. Click the **+** icon to add a new connection.
3. Select the appropriate database (e.g. PostgreSQL, MySQL, etc.) and enter the connection details.
4. Make note of the **conn_id** that you specify for the connection. You will use this in your Python code to reference the connection.

## Step 2: Refactor ETL Script to Work with Airflow

1. In your Python code, import the necessary libraries including the ones from Airflow (`dag`, `task`, and `task_group`).
2. Use the `task` decorator to define your tasks.
3. Use the `task_group` decorator to define a group of tasks that should be executed together.
4. Use the `conn_id` parameter in your task definitions to reference the connections you set up in the Airflow UI.
5. Define your DAG and specify the dependencies between tasks.

## Step 3: Run the DAG

1. In the Airflow UI, go to the **DAGs** page and trigger the DAG to run.
2. Monitor the progress of the tasks in the DAG through the Airflow UI.

## Additional Resources

- [Apache Airflow documentation](https://airflow.apache.org/docs/)
- [Airflow tutorial on building ETL pipelines](https://airflow.apache.org/tutorial.html#tutorial)

