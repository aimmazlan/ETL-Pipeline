<p align="center"><img src="https://github.com/aimmazlan/ETL-Pipeline/blob/main/IMG/ETL_to_AWS_S3.png" alt="ETL-PIPELINE" /></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![last-commit](https://img.shields.io/github/last-commit/aimmazlan/etl-pipeline)
![commit-activity](https://img.shields.io/github/commit-activity/w/aimmazlan/etl-pipeline)

# Uploading on-premise database data to AWS S3 using Python

In this project, we will cover how to upload data from an on-premise database to an AWS S3 bucket using Python. We will use the AWS S3 API to achieve this by connecting to the database, reading the data into a data frame for each table, and writing the data to S3 in a separate folder for each table.

## Prerequisites

- An AWS account (sign up [here](https://aws.amazon.com/) if you don't have one)
- Python 3 installed on your machine
- Required libraries imported at the top of the script (e.g. `boto3`, `pandas`)

## Step 1: Create a User with API Key Access to S3

1. Go to the [AWS IAM dashboard](https://console.aws.amazon.com/iam/) and click on **Users** in the left-hand menu.
2. Click the **Add user** button.
3. Give the user a name (e.g. `s3-etl-user`) and select **Programmatic access** as the access type.
4. Click on **Next: Permissions**.
5. On the Set permissions page, assign the user to a group with the necessary permissions. In this case, we need the user to have full access to S3, so we will add the user to a group with **AmazonS3FullAccess**.
6. Click **Next: Tags** and then **Next: Review**.
7. Click **Create user** to create the user and generate the API keys.
8. Copy the **Access key ID** and **Secret access key** and paste them into a configuration file (e.g. `config.json`). Save the file for use in the script.

## Step 2: Create an S3 Bucket

1. Go to the [AWS S3 dashboard](https://s3.console.aws.amazon.com/) and click the **Create bucket** button.
2. Give the bucket a unique name (e.g. `my-unique-bucket-12345`).
3. Click **Create** to create the bucket.

## Step 3: Write the Python Script

1. Import the required libraries at the top of the script (e.g. `boto3`, `pandas`).
2. Import the AWS API keys from the configuration file (e.g. `config.json`).
3. Connect to the database and read the data into a data frame for each table.
4. Iterate through each table and write the data to S3 in a separate folder for each table.
5. Run the script to initiate the upload process.

## Additional Resources

- [AWS S3 documentation](https://aws.amazon.com/s3/)
- [Boto 3 documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html)
- [Pandas documentation](https://pandas.pydata.org/docs/)
