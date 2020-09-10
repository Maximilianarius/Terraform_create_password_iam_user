
resource "aws_iam_group_membership" "SysAdmin" {
  name = "SysAdmin"
  users = [
    aws_iam_user.SysAdmin1.name,
    aws_iam_user.SysAdmin2.name,
  ]
  group = aws_iam_group.SysAdmin.name
}
resource "aws_iam_group" "SysAdmin" {
  name = "SysAdmin"
}
resource "aws_iam_user" "SysAdmin1" {
  name = "SysAdmin1"
}
resource "aws_iam_user" "SysAdmin2" {
  name = "SysAdmin2"
}

resource "aws_iam_user_login_profile" "SysAdmin1" {
  user            = "SysAdmin1"
  pgp_key         = "keybase:maximfloreagmail" #Keybase:example --example means the account name of the user with the pgp key
  password_length = 10
}

resource "aws_iam_user_login_profile" "SysAdmin2" {
  user            = "SysAdmin2"
  pgp_key         = "keybase:maximfloreagmail" #Keybase:example --example means the account name of the user with the pgp key
  password_length = 10
}

resource "aws_iam_group_policy" "SysAdmin_policy" {
  name  = "SysAdmin_policy"
  group = aws_iam_group.SysAdmin.id

  policy = <<EOF
{
    "Statement": [
        {
            "Action": [
                "acm:Describe*",
                "acm:Get*",
                "acm:List*",
                "acm:Request*",
                "acm:Resend*",
                "autoscaling:*",
                "cloudtrail:DescribeTrails",
                "cloudtrail:GetTrailStatus",
                "cloudtrail:ListPublicKeys",
                "cloudtrail:ListTags",
                "cloudtrail:LookupEvents",
                "cloudtrail:StartLogging",
                "cloudtrail:StopLogging",
                "cloudwatch:*",
                "codecommit:BatchGetRepositories",
                "codecommit:CreateBranch",
                "codecommit:CreateRepository",
                "codecommit:Get*",
                "codecommit:GitPull",
                "codecommit:GitPush",
                "codecommit:List*",
                "codecommit:Put*",
                "codecommit:Test*",
                "codecommit:Update*",
                "codedeploy:*",
                "codepipeline:*",
                "config:*",
                "ds:*",
                "ec2:*",
                "elasticloadbalancing:*",
                "events:*",
                "iam:GetAccount*",
                "iam:GetContextKeys*",
                "iam:GetCredentialReport",
                "iam:ListAccountAliases",
                "iam:ListGroups",
                "iam:ListOpenIDConnectProviders",
                "iam:ListPolicies",
                "iam:ListPoliciesGrantingServiceAccess",
                "iam:ListRoles",
                "iam:ListSAMLProviders",
                "iam:ListServerCertificates",
                "iam:Simulate*",
                "iam:UpdateServerCertificate",
                "iam:UpdateSigningCertificate",
                "kinesis:ListStreams",
                "kinesis:PutRecord",
                "kms:CreateAlias",
                "kms:CreateKey",
                "kms:DeleteAlias",
                "kms:Describe*",
                "kms:GenerateRandom",
                "kms:Get*",
                "kms:List*",
                "kms:Encrypt",
                "kms:ReEncrypt*",
                "lambda:Create*",
                "lambda:Delete*",
                "lambda:Get*",
                "lambda:InvokeFunction",
                "lambda:List*",
                "lambda:PublishVersion",
                "lambda:Update*",
                "logs:*",
                "rds:Describe*",
                "rds:ListTagsForResource",
                "route53:*",
                "route53domains:*",
                "ses:*",
                "sns:*",
                "sqs:*",
                "trustedadvisor:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Action": [
                "ec2:AcceptVpcPeeringConnection",
                "ec2:AttachClassicLinkVpc",
                "ec2:AttachVolume",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateVpcPeeringConnection",
                "ec2:DeleteCustomerGateway",
                "ec2:DeleteDhcpOptions",
                "ec2:DeleteInternetGateway",
                "ec2:DeleteNetworkAcl*",
                "ec2:DeleteRoute",
                "ec2:DeleteRouteTable",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteVolume",
                "ec2:DeleteVpcPeeringConnection",
                "ec2:DetachClassicLinkVpc",
                "ec2:DetachVolume",
                "ec2:DisableVpcClassicLink",
                "ec2:EnableVpcClassicLink",
                "ec2:GetConsoleScreenshot",
                "ec2:RebootInstances",
                "ec2:RejectVpcPeeringConnection",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:RunInstances",
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:TerminateInstances"
            ],
            "Effect": "Allow",
            "Resource": [
                "*"
            ]
        },
        {
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": [
                "*"
            ]
        },
        {
            "Action": [
                "iam:GetAccessKeyLastUsed",
                "iam:GetGroup*",
                "iam:GetInstanceProfile",
                "iam:GetLoginProfile",
                "iam:GetOpenIDConnectProvider",
                "iam:GetPolicy*",
                "iam:GetRole*",
                "iam:GetSAMLProvider",
                "iam:GetSSHPublicKey",
                "iam:GetServerCertificate",
                "iam:GetServiceLastAccessed*",
                "iam:GetUser*",
                "iam:ListAccessKeys",
                "iam:ListAttached*",
                "iam:ListEntitiesForPolicy",
                "iam:ListGroupPolicies",
                "iam:ListGroupsForUser",
                "iam:ListInstanceProfiles*",
                "iam:ListMFADevices",
                "iam:ListPolicyVersions",
                "iam:ListRolePolicies",
                "iam:ListSSHPublicKeys",
                "iam:ListSigningCertificates",
                "iam:ListUserPolicies",
                "iam:Upload*"
            ],
            "Effect": "Allow",
            "Resource": [
                "*"
            ]
        },
        {
            "Action": [
                "iam:GetRole",
                "iam:ListRoles",
                "iam:PassRole"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:iam::*:role/rds-monitoring-role",
                "arn:aws:iam::*:role/ec2-sysadmin-*",
                "arn:aws:iam::*:role/ecr-sysadmin-*",
                "arn:aws:iam::*:role/lambda-sysadmin-*"
            ]
        }
    ],
    "Version": "2012-10-17"
}
EOF
}