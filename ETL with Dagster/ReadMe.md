<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/ETL_with_Dagster.png" alt="ETL-Dagster" /></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)

# ETL Pipelines with Dagster

Dagster is an application that allows you to orchestrate your Python scripts in an intuitive and robust way. It is particularly useful for managing interdependencies and the execution of ETL pipelines. In this project, we will use Dagster to automate an ETL pipeline that we developed in previous sessions.

## Prerequisites

- Python 3 installed on your machine
- `virtualenv` library installed
- Dagster and Dagit libraries installed (`pip install dagster dagit`)

## Step 1: Set Up a Virtual Environment and Install Dagster and Dagit

1. Create a virtual environment in a directory: `python -m venv env`
2. Activate the virtual environment: `source env\Scripts\Activate`
3. Install Dagster and Dagit in the virtual environment: `pip install dagster dagit`

## Step 2: Create a New Dagster Project

1. Create a new Dagster project: `dagster new -project etl`
2. Replace the contents of the `etl_pipeline.py` file with your own ETL pipeline code.

## Step 3: Define the DAG

1. In the `etl_pipeline.py` file, import the necessary libraries and define the DAG.
2. Define the tasks in the DAG, specifying their dependencies and the order in which they should be executed.

## Step 4: Run the DAG

1. Run the DAG manually or schedule it to run at regular intervals.
2. Monitor the progress of the tasks in the DAG through the Dagit UI.

## Additional Resources

- [Dagster documentation](https://docs.dagster.io/)
- [Dagit documentation](https://docs.dagster.io/overview/dagit/index)
