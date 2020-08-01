## AWS 2factor authentication CLI helper

The 'aws2fa' tool helps to generate temporary MFA authenticated credentials.

## How to install using Docker
1. build an image `docker build -t aws-2fa .`
2. run a container `docker run -it --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws aws-2fa`
3. use `aws2fa` with autocompletion
**The container accesses the original '~/.aws/credentials' file from your host. So if you update the file from the container the changes will be applied to the host file and vice versa.**