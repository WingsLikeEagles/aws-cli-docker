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
    
