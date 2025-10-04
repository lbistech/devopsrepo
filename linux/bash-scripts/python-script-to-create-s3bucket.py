import boto3
from botocore.exceptions import ClientError

def create_s3_bucket(bucket_name, region="us-east-1"):
    """
    Create an S3 bucket in a specified region
    :param bucket_name: Name of the bucket
    :param region: AWS region (default: us-east-1)
    :return: True if bucket created, else False
    """
    try:
        if region == "us-east-1":
            s3_client = boto3.client("s3")
            s3_client.create_bucket(Bucket=bucket_name)
        else:
            s3_client = boto3.client("s3", region_name=region)
            s3_client.create_bucket(
                Bucket=bucket_name,
                CreateBucketConfiguration={"LocationConstraint": region},
            )
        print(f"✅ Bucket '{bucket_name}' created successfully in region '{region}'")
        return True
    except ClientError as e:
        print(f"❌ Error creating bucket: {e}")
        return False

if __name__ == "__main__":
    # Change these values as per your requirement
    bucket_name = "lbistech-python-bucket-000123"  # must be globally unique
    region = "us-east-1"  # e.g., us-east-1, us-west-2, eu-central-1

    create_s3_bucket(bucket_name, region)