<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/Testing_with_PyTest.png" alt="ETL-PIPELINE" /></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)
## <p align="center"> Testing ETL Pipelines with Pytest 

## Overview
In this repository, stream real-time sensor data (IoT) from a manufacturing facility into a database using Kafka and also analyzing device telemetry data using ksqlDB application in Confluent Cloud. The disconnect sensor log will be sink to sink database.
 

## Prerequisites
- A Confluent Cloud Account (sign up [here](https://login.confluent.io/login?state=hKFo2SA0MzNHd0VFbnJOLTFHRG5mVDIyQ05NYVdfcll6UzVEN6FupWxvZ2luo3RpZNkgSDEyNEdZSklYcVNHYnJjdmVna3R4MElkVXBZSGRQNWKjY2lk2SBsMmhPcDBTMHRrU0IwVEZ0dklZZlpaOUVhS0Z2clNjNg&client=l2hOp0S0tkSB0TFtvIYfZZ9EaKFvrSc6&protocol=oauth2&cache=%5Bobject%20Object%5D&redirect_uri=https%3A%2F%2Fconfluent.cloud%2Fauth_callback&redirect_path=%2F&last_org_resource_id_map=%7B%229b8e301a4f493a93b66ab610cab59fda77c4e89d0b1526739e77089cc4a72835%22%3A%7B%22org_resource_id%22%3A%22e3e109ca-0b0c-47a3-afc2-192061b8e750%22%2C%22timestamp%22%3A1673532746761%2C%22is_sso%22%3Afalse%7D%7D&segment_anon_id=ccea811c-bff6-4601-8306-0e3ec51706ad&scope=openid%20profile%20email%20offline_access&response_type=code&response_mode=query&nonce=SVNqcThpNjFNTC1ENWM1M1JrUER0cHJEfmFWeHZiX2Z2aFI3Qzg5V0JFZA%3D%3D&code_challenge=VnwcBiN9BDsphCJT3ZMgLlspExiskoBg0hwAPx1Vvok&code_challenge_method=S256&auth0Client=eyJuYW1lIjoiYXV0aDAtcmVhY3QiLCJ2ZXJzaW9uIjoiMS45LjAifQ%3D%3D)
  if you don't have one)
- Source Db (PostgreSQL)
- Sink Db (SQL Server)

## Step 1: Set up your enviroment
Make sure Pytest is installed on your system using: 
```shell 
- pip install pytest 
``` 
## Step 2: Create a new Python file 
Name file with the `test_` prefix (e.g. `test_pipeline_data_core.py`) 
## Step 3: Import necessary libraries 
```python
import pytest
import pandas as pd
import numpy as np
from numpy import nan
```
## Step 4: Bring in the data the test data
In this example, we will use data from [Product.xlsx](https://github.com/aimmazlan/ETL-Pipeline/blob/main/Data%20Pipeline%20Testing%20%5BPyTest%5D/Product.xlsx) exported from the adventureworks database.
## Step 5: Define test cases to run against the data 
Possible test cases to include are:
   - Testing that none of the columns in the data are null
   - Testing that certain columns (e.g. product ID) are unique
   - Testing the correctness of data transformation (e.g. proper date formatting, correct calculation of values)
## Step 6: Write a test case with Pytest 
Define a function with the `test_` prefix (e.g. `def test_columns_not_null():`). Inside the function, use Pytest's `assert` function to make an assertion about the data. For example:
```python
def test_columns_not_null():
assert data.isnull().sum().sum() == 0
```
## Step 7: Run the test cases
Use the `pytest` command in your terminal. 
Pytest will discover and run all of the test cases in the file, providing results and debugging information for any failures.


## Conclusion
By including test cases in our ETL pipelines, we can catch data anomalies and transformation logic flaws early on and ensure that accurate and consistent data is being delivered to stakeholders. Pytest is a simple and powerful tool for testing pipelines and improving the quality of our data.

## Additional Documentation
- [Pytest documentation](https://docs.pytest.org/en/stable/)
