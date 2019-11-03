# Terraform simple EC2 instance running a web server

- Code in the repository is compatible with terraform >= 0.12
- You need to have configured properly the AWS Cli with valid access key and secret key.
- Default profile is used:
    ```
        >> cat $HOME/.aws/credentials
        
        [default]
        aws_access_key_id = AK****************XQ
        aws_secret_access_key = cQ************************************Q2        
    ```


```
>> terraform init 
>> terraform apply 

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

webapp_public_address = 34.248.158.145

>> curl http://34.248.158.145

* Rebuilt URL to: http://34.248.158.145/
*   Trying 34.248.158.145...
* Connected to 34.248.158.145 (34.248.158.145) port 80 (#0)
> GET / HTTP/1.1
> Host: 34.248.158.145
> User-Agent: curl/7.47.0
> Accept: */*
> 

```
