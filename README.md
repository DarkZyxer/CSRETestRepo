Alan Gave us a script to run on an instance we have for security reasons and I wanted to try how to run it by using S3 bucket and Cloud init

Created a .yaml file for the securityscript
Uploaded the .yaml file on S3 bucket
```
#!/bin/bash
# Retrieve the Cloud-init config file from S3
aws s3 cp s3://ian-bucket-securityscript-test/securityscript.yaml /tmp/cloud-init-config.yaml

# Execute Cloud-init with the retrieved configuration
cloud-init -d init-local --local /tmp/cloud-init-config.yaml
```

Tried testing it again with a different  script for creating an index.html on var/www/html directory 
```
#!/bin/bash
# Retrieve the Cloud-init config file from S3
aws s3 cp s3://ian-bucket-securityscript-test/testscript.yaml /tmp/cloud-init-config.yaml

# Execute Cloud-init with the retrieved configuration
cloud-init -d init-local --local /tmp/cloud-init-config.yaml
```
Didn't work tried a different script
```
#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo apt install git
cd /var/www/html
git clone https://github.com/DarkZyxer/CSRETestRepo.git
cd /var/www/html/CSRETestRepo
mv index.html ../
aws s3 cp s3://ian-bucket-securityscript-test/testscript.yaml /tmp/cloud-init-config.yaml
cloud-init -d init-local --local /tmp/cloud-init-config.yaml
```
This Configuration worked on getting the git repo and moving the index.html to the html folder.

