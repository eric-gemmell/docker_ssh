# Simple docker ssh server

## Commands 

 - `docker build -t ubuntu-ssh-server .`

 - `docker run -d -p 3000:22 -v $(pwd):/documents ubuntu-ssh-server`
