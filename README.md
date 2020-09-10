# Terraform_create_password_iam_user
Create Password for IAM_USER using Terraform

Creating password for user in Terraform

To Decode
terraform output encrypted_secret | base64 --decode | keybase pgp decrypt  # Linux command for decrypting the password


certutil -decode .\example1 .\example2 # Powershell command for decrypting the password for the iam_user |
 example1 = file with encryption 
 example2 = new file for store decode data

keybase pgp decrypt -i example2.txt # Keybase command to decrypt example2.txt ( will show a passowrd here)
Then a dialog appears and you enter your pass-phrase to decode it.