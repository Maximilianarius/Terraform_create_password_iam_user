
resource "aws_iam_group_membership" "Monitor" {
  name = "Monitor"
  users = [
    aws_iam_user.Monitor1.name,
    aws_iam_user.Monitor2.name,
    aws_iam_user.Monitor3.name,
    aws_iam_user.Monitor4.name,
  ]
  group = aws_iam_group.Monitor.name
}
resource "aws_iam_group" "Monitor" {
  name = "Monitor"
}
resource "aws_iam_user" "Monitor1" {
  name = "Monitor1"
}
resource "aws_iam_user" "Monitor2" {
  name = "Monitor2"
}
resource "aws_iam_user" "Monitor3" {
  name = "Monitor3"
}
resource "aws_iam_user" "Monitor4" {
  name = "Monitor4"
}
resource "aws_iam_user_login_profile" "Monitor1" {
  user            = "Monitor1"
  pgp_key         = "keybase:maximfloreagmail" #Keybase:example --example means the account name of the user with the pgp key
  password_length = 10
}
resource "aws_iam_user_login_profile" "Monitor2" {
  user            = "Monitor2"
  pgp_key         = "keybase:maximfloreagmail"
  password_length = 10
}
resource "aws_iam_user_login_profile" "Monitor3" {
  user            = "Monitor3"
  pgp_key         = "keybase:maximfloreagmail"
  password_length = 10
}
resource "aws_iam_user_login_profile" "Monitor4" {
  user            = "Monitor4"
  pgp_key         = "keybase:maximfloreagmail"
  password_length = 10
}

resource "aws_iam_group_policy" "Monitor_policy" {
  name   = "Monitor_policy"
  group  = aws_iam_group.Monitor.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:GetEbsEncryptionByDefault",
                "s3:GetObjectVersionTagging",
                "ec2:DescribeVolumesModifications",
                "ec2:GetHostReservationPurchasePreview",
                "ec2:GetConsoleScreenshot",
                "s3:GetObjectAcl",
                "s3:GetBucketObjectLockConfiguration",
                "ec2:GetLaunchTemplateData",
                "ec2:DescribeScheduledInstanceAvailability",
                "rds:DownloadDBLogFilePortion",
                "ec2:GetEbsDefaultKmsKeyId",
                "s3:GetObjectVersionAcl",
                "s3:GetBucketPolicyStatus",
                "ec2:GetManagedPrefixListEntries",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:GetJobTagging",
                "ec2:DescribeVpnConnections",
                "s3:ListJobs",
                "ec2:DescribeFastSnapshotRestores",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "ec2:GetReservedInstancesExchangeQuote",
                "s3:GetReplicationConfiguration",
                "s3:ListMultipartUploadParts",
                "s3:GetObject",
                "ec2:GetPasswordData",
                "ec2:DescribeScheduledInstances",
                "s3:DescribeJob",
                "s3:GetAnalyticsConfiguration",
                "ec2:DescribeElasticGpus",
                "s3:GetObjectVersionForReplication",
                "s3:GetAccessPoint",
                "s3:GetLifecycleConfiguration",
                "ec2:GetDefaultCreditSpecification",
                "s3:GetBucketTagging",
                "s3:GetInventoryConfiguration",
                "s3:ListBucketVersions",
                "s3:GetBucketLogging",
                "ec2:GetCapacityReservationUsage",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketPolicy",
                "ec2:GetConsoleOutput",
                "s3:GetObjectVersionTorrent",
                "s3:GetEncryptionConfiguration",
                "s3:GetBucketRequestPayment",
                "s3:GetAccessPointPolicyStatus",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketPublicAccessBlock",
                "s3:ListBucketMultipartUploads",
                "s3:ListAccessPoints",
                "ec2:DescribeTags",
                "ec2:GetCoipPoolUsage",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:GetObjectTorrent",
                "s3:GetAccountPublicAccessBlock",
                "rds:ListTagsForResource",
                "ec2:GetManagedPrefixListAssociations",
                "s3:GetBucketCORS",
                "s3:GetBucketLocation",
                "s3:GetAccessPointPolicy",
                "s3:GetObjectVersion"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}