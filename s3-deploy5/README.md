## What is Amazon S3 CLI?
Amazon Web Services provides Amazon S3 (Simple Storage Service), an object storage service used to store files such as:

- Images
- Videos
- Backups
- Documents
- Application data
- Logs

## Key Concepts
| Term   | Description                                |
| ------ | ------------------------------------------ |
| Bucket | A container for storing objects            |
| Object | A file stored in S3                        |
| Key    | Unique name of an object                   |
| Region | Physical AWS location where bucket resides |

## Useful S3 Commands
| Command     | Purpose                 |
| ----------- | ----------------------- |
| aws s3 ls   | List buckets            |
| aws s3 mb   | Create bucket           |
| aws s3 rb   | Remove bucket           |
| aws s3 cp   | Copy files              |
| aws s3 mv   | Move files              |
| aws s3 rm   | Delete files            |
| aws s3 sync | Synchronize folders     |
| aws s3api   | Advanced API operations |


## Useful Commands
```bash
aws --version

aws configure

# Lab 1: Create an S3 Bucket: Bucket names must be globally unique.
aws s3 mb s3://theo-demo-bucket-2026

# List buckets
aws s3 ls

# Lab 2: Upload files to s3 bucket
echo "Hello S3" > hello.txt
aws s3 cp hello.txt s3://student-bucket-001/

# View Bucket Contents
aws s3 ls s3://student-bucket-001

# Lab 3: Download files from s3 bucket
aws s3 cp s3://student-bucket-001/hello.txt downloaded.txt
aws s3 cp s3://student-bucket-001/hello.txt hello.txt
aws s3 cp s3://student-bucket-001/hello.txt .

# Lab 4: Upload a Folder
mkdir demo
echo "File1" > demo/file1.txt
echo "File2" > demo/file2.txt
# upload recursively
aws s3 cp demo s3://student-bucket-001/demo --recursive
aws s3 ls s3://student-bucket-001/demo/

# Lab 6: Sync S3 to Local Machine
aws s3 mb s3://student-backup-bucket-001
aws s3 cp s3://student-bucket-001/hello.txt s3://student-backup-bucket-001/

# Lab 8: Delete Objects
aws s3 rm s3://student-bucket-001/hello.txt
# delete folder
aws s3 rm s3://student-bucket-001/demo --recursive

# Lab 9: Make a File Public
aws s3 cp chapter9.jpg s3://student-bucket-001/
# grant public access
aws s3api put-object-acl --bucket student-bucket-001 --key image.jpg --acl public-read
# get public url
https://student-bucket-001.s3.amazonaws.com/chapter9.jpg

# Clean Up Resources
# Delete bucket contents
aws s3 rm s3://student-bucket-001 --recursive

# Delete bucket
aws s3 rb s3://student-bucket-001

```

## Mini Project
- Build a Backup System:
  - Create an S3 bucket.
  - Create a local folder called backup.
  - Add files.
  - Sync folder to S3.
  - Modify files.
  - Run sync again.
  - Verify only changed files are uploaded.