
resource "aws_iam_group_membership" "DBAdmin" {
  name = "DBAdmin"
  users = [

    aws_iam_user.DBAdmin1.name,
    aws_iam_user.DBAdmin2.name,

  ]
  group = aws_iam_group.DBAdmin.name
}
resource "aws_iam_group" "DBAdmin" {
  name = "DBAdmin"
}
resource "aws_iam_user" "DBAdmin1" {
  name = "DBAdmin1"
}
resource "aws_iam_user" "DBAdmin2" {
  name = "DBAdmin2"
}
resource "aws_iam_user_login_profile" "DBAdmin1" {
  user            = "DBAdmin1"
  pgp_key         = "keybase:maximfloreagmail" #Keybase:example --example means the account name of the user with the pgp key
  password_length = 10
}
resource "aws_iam_user_login_profile" "DBAdmin2" {
  user            = "DBAdmin2"
  pgp_key         = "keybase:maximfloreagmail" #Keybase:example --example means the account name of the user with the pgp key
  password_length = 10
}
resource "aws_iam_account_password_policy" "strict" {
  require_lowercase_characters = true
  require_numbers              = true
  require_uppercase_characters = true
  require_symbols              = true
  max_password_age             = 90
  password_reuse_prevention    = 3
  minimum_password_length      = 8
}
resource "aws_iam_group_policy" "DBAdmin_policy" {
  name   = "DBAdmin_policy"
  group  = aws_iam_group.DBAdmin.name
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "cloudwatch:DeleteAlarms",
                "cloudwatch:Describe*",
                "cloudwatch:DisableAlarmActions",
                "cloudwatch:EnableAlarmActions",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "cloudwatch:PutMetricAlarm",
                "datapipeline:ActivatePipeline",
                "datapipeline:CreatePipeline",
                "datapipeline:DeletePipeline",
                "datapipeline:DescribeObjects",
                "datapipeline:DescribePipelines",
                "datapipeline:GetPipelineDefinition",
                "datapipeline:ListPipelines",
                "datapipeline:PutPipelineDefinition",
                "datapipeline:QueryObjects",
                "dynamodb:*",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAddresses",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeInternetGateways",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "elasticache:*",
                "iam:ListRoles",
                "iam:GetRole",
                "kms:ListKeys",
                "lambda:CreateEventSourceMapping",
                "lambda:CreateFunction",
                "lambda:DeleteEventSourceMapping",
                "lambda:DeleteFunction",
                "lambda:GetFunctionConfiguration",
                "lambda:ListEventSourceMappings",
                "lambda:ListFunctions",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:FilterLogEvents",
                "logs:GetLogEvents",
                "logs:Create*",
                "logs:PutLogEvents",
                "logs:PutMetricFilter",
                "rds:*",
                "redshift:*",
                "s3:CreateBucket",
                "sns:CreateTopic",
                "sns:DeleteTopic",
                "sns:Get*",
                "sns:List*",
                "sns:SetTopicAttributes",
                "sns:Subscribe",
                "sns:Unsubscribe"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:AbortMultipartUpload",
                "s3:DeleteObject*",
                "s3:Get*",
                "s3:List*",
                "s3:PutAccelerateConfiguration",
                "s3:PutBucketTagging",
                "s3:PutBucketVersioning",
                "s3:PutBucketWebsite",
                "s3:PutLifecycleConfiguration",
                "s3:PutReplicationConfiguration",
                "s3:PutObject*",
                "s3:Replicate*",
                "s3:RestoreObject"
            ],
            "Resource": [
                "*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:PassRole"
            ],
            "Resource": [
                "arn:aws:iam::*:role/rds-monitoring-role",
                "arn:aws:iam::*:role/rdbms-lambda-access",
                "arn:aws:iam::*:role/lambda_exec_role",
                "arn:aws:iam::*:role/lambda-dynamodb-*",
                "arn:aws:iam::*:role/lambda-vpc-execution-role",
                "arn:aws:iam::*:role/DataPipelineDefaultRole",
                "arn:aws:iam::*:role/DataPipelineDefaultResourceRole"
            ]
        }
    ]
}
EOF
}