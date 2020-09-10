# Terraform_create_password_iam_user
Create Password for IAM_USER using Terraform                Decode and Decrypt data into Password

 1. Need to install Keybase in our local
 2. Need to create Keybase key by using "keybase pgp gen"
 3. Then give the reference of this Keybase key in your terraform code Keybase:username_of_keybase  # Look into SysAdmin.tf
 4. Then terraform apply
 5. Then we need to get the decrypted password with the command "terraform output password | base64 --decode | keybase pgp decrypt" # Linux command  ❗
 
   Powershell command >>  certutil -decode .\example1 .\example2    # Powershell command for decrypting the password for the iam_user
   
 example1 = file with encryption 
 example2 = new file for store decode data

keybase pgp decrypt -i example2.txt # Keybase command to decrypt example2.txt ( will show a passowrd here)
Then a dialog appears and you enter your pass-phrase to decode it.

For additional troubleshoot use google ))
