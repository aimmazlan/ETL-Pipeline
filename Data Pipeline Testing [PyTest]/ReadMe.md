<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/Testing_with_PyTest.png" alt="ETL-PIPELINE" /></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)
## <p align="center"> Testing ETL Pipelines with Pytest 

## Overview
In this repository, we demonstrate how to use Pytest to test ETL pipelines in Python. Pytest is a tool that helps us ensure the accuracy and consistency of the data being delivered to stakeholders, 
and can detect errors in transformation logic. It is a command-line tool that runs tests automatically and provides results and debugging information. 
Pytest can also be integrated with continuous integration or continuous delivery processes.

## Sample Database
[Product.xlsx](https://github.com/aimmazlan/ETL-Pipeline/blob/main/Data%20Pipeline%20Testing%20%5BPyTest%5D/Product.xlsx) - data from an Excel file exported from the adventureworks database.

## Prerequisites
- Pytest library installed on system
- Python file with `test_` prefix
- Data to be tested

## Step 1: Install Pytest Library
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

