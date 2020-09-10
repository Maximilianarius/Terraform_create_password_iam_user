output "password_SysAdmin1" {
  value = aws_iam_user_login_profile.SysAdmin1.encrypted_password
}
output "password_SysAdmin2" {
  value = aws_iam_user_login_profile.SysAdmin2.encrypted_password
}
output "password_Monitor1" {
  value = aws_iam_user_login_profile.Monitor1.encrypted_password
}
output "password_Monitor2" {
  value = aws_iam_user_login_profile.Monitor2.encrypted_password
}
output "password_Monitor3" {
  value = aws_iam_user_login_profile.Monitor3.encrypted_password
}
output "password_Monitor4" {
  value = aws_iam_user_login_profile.Monitor4.encrypted_password
}