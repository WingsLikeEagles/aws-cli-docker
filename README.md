# aws-cli-docker
Docker image with aws-cli  

# Build
    docker build -t aws-cli-docker:yourtaghere .  


# Usage
    docker run --rm --name aws-cli-test -v /Full/Path/to/local/credentials/file:/root/.aws/credentials -it aws-cli-docker:yourtaghere /usr/bin/aws ec2 describe-instances  

You can override the region by mapping in your own config file containing:  

>    [default]  
>    region = us-gov-west-1  
>    output = json  

    docker run --rm --name aws-cli-test -v /Full/Path/to/local/credentials/file:/root/.aws/credentials -v /Full/path/to/config:/root/.aws/config -it aws-cli-docker:yourtaghere /usr/bin/aws ec2 describe-instances  

You can also set an alias do you don't have to type all that ouch each time you want to run an aws command:  
    `alias aws='docker run --rm --name aws-cli-test -v /Full/Path/to/local/credentials/file:/root/.aws/credentials -v /Full/path/to/config:/root/.aws/config -it aws-cli-docker:yourtaghere /usr/bin/aws'`
    
# Examples
### Get Docker Login token to push to AWS ECR:
`docker run --rm --name aws-cli -v C:\Users\WingsLikeEagles\.aws\credentials:/root/.aws/credentials -it aws-cli-docker:20201030-3 /usr/bin/aws ecr get-login-password | docker login -u AWS --password-stdin 12345.dkr.ecr.us-west-1.amazonaws.com`
### This allows pushing to AWS ECR using `docker push`
`docker push 12345.dkr.ecr.us-west-1.amazonaws.com/alpine:3.12.1`

### For Windows Powershell, setting a Function and then an Alias
PowerShell's Set-Alias command does not allow multiple values.  So we have to create a function first, and then call the function with the Alias.  May be pointless to have an Alias since you can just use the Function. But the Alias calling a Function seems faster for some reason (could be coincidental).  
`function aws_docker($a, $b, $c, $d, $e) { docker run --rm --name aws-cli -v C:\Users\WingsLikeEagles\.aws\credentials:/root/.aws/credentials -it aws-cli-docker:20201030-3 /usr/bin/aws $a $b $c $d $e $f}`
`Set-Alias -Name aws -Value aws_docker`
