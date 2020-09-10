output "password" {
  value = aws_iam_user_login_profile.SysAdmin1.encrypted_password
}