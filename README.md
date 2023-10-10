# CSRETestRepo
Alan Gave us a shell script to run on an instnace we have for security reasons and I wanted to try how to run it by using S3 bucket and Cloud init

Created a .yaml file for the securityscript
Uploaded the .yaml file on S3 bucket
```
#!/bin/bash
# Retrieve the Cloud-init config file from S3
aws s3 cp s3://ian-bucket-securityscript-test/securityscript.yaml /tmp/cloud-init-config.yaml

# Execute Cloud-init with the retrieved configuration
cloud-init -d init-local --local /tmp/cloud-init-config.yaml
```

Tried testing it again with a different shell script for creating an index.html on var/www/html directory 
```
#!/bin/bash
# Retrieve the Cloud-init config file from S3
aws s3 cp s3://ian-bucket-securityscript-test/testscript.yaml /tmp/cloud-init-config.yaml

# Execute Cloud-init with the retrieved configuration
cloud-init -d init-local --local /tmp/cloud-init-config.yaml
```
