import boto3
import io
# Create connection to Wasabi / S3
s3 = boto3.resource('s3',
    endpoint_url = 'https://s3.eu-central-1.wasabisys.com',
    aws_access_key_id = 'MY_ACCESS_KEY',
    aws_secret_access_key = 'MY_SECRET_KEY'
)
# Get bucket object
my_bucket = s3.Bucket('boto-test')
# Upload string to file
my_string = "This shall be the content for a file I want to create on an S3-compatible storage"
my_bucket.upload_fileobj(io.BytesIO(my_string.encode("utf-8")), "myfile.txt")
