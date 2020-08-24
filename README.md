## AWS Multi-factor authentication CLI helper

The *aws2fa* tool helps to generate temporary MFA authenticated credentials.

## How to install using Docker
1. clone the repo

    `git clone https://github.com/vadymbat/aws-2fa.git`
2. build an image

    `cd aws-2fa`

    `docker build -t aws-2fa .`
3. run a container
    
    `docker run -it --rm --mount type=bind,source=$HOME/.aws,target=/root/.aws aws-2fa`
4. use `aws2fa` with autocompletion inside the container

**The container accesses the original `~/.aws/credentials` file from your host. So if you update the file from the container the changes will be applied to the host file and vice versa.**