# Easy-DC
Easy Docker Study Documentation.

## Table of Content
* [Installation - Docker/Docker-compose](#installation)
  * [Install docker on ubuntu using apt](#install-ubuntu)
  * [Install docker-compose on ubuntu using apt](#install-ubuntu-dc)
  * [Install docker official link](https://docs.docker.com/engine/install/)
  * [Install docker-compose official link](https://docs.docker.com/compose/install/)
  * [After installation check docker version](#install-version)
  * [After installation check docker-compose version](#dc-install-version)
* [Docker commands](#docker-commands)
  * [Create docker file for ever running ubuntu container](#create-dockerfile)
  * [Create docker image from dockerfile](#create-image-from-dockerfile)
  * [create container from image](#create-docker-container)
  * [Run stopped docker container](#run-container)
  * [Create image from container](#create-image-from-container)
  * [Remove docker container](#remove-docker-container)
  * [Remove docker images](#remove-docker-images)
  * [Copy file to/from host machine to/from docker container](#docker-copy)
* [Install jupyter notebook](#install-jupyter-notebook)
  * [Install on Windows](#install-jupyter-notebook-windows)
  * [Autocomplete for jupyter notebook](#jupyter-notebook-autocomplete)
* [Linux Study Material](#linux-study)
  * [Enable root login in linux](#enable-root-login)
  * [Enable root login via ssh](#enable-root-login-via-ssh)
  * [SSH tunnelling and Port Forwarding](#ssh-tunnel)
    * [Some useful sites for more information](#ssh-tunnel-sites)
  * [vimdiff shortcuts](#vimdiff-shortcuts)
  * [Resource rc Files]()
    * [screenrc](https://github.com/ashfaqraj/easy-dc/blob/master/screenrc)
    * [vimrc](https://github.com/ashfaqraj/easy-dc/blob/master/vimrc)
* [Putty Study Material](#putty-study)
  * [Connect Local Windows VirtualBox VM via Putty](#VB-VM-via-putty-windows)
* [My aliases - bash](#mybashalias)
  * [dc - for docker-compose](#dc)
  * [names - formatted docker ps output for large list of services](#names)
  * [rmi - stop all docker containes. Removes all docker services, images and volumes (including dangling)](#rmi)
  * [PS1 - colored PS1 for root user in ~/.bashrc](#PS1)
  * [git prompt - git branch status in PS1](#PS1-git)
  * [Misc](#misc)
* [My aliases - windows](#mywindowsalias)
  * [Create/Setup windows aliases](#create-windows-alias)
  * [Few useful windows aliases](#my-windows-aliases)
* [Sublime Study](#sublime-study)
  * [Sublime Settings file - user settings](https://github.com/ashfaqraj/easy-dc/blob/master/sublime-settings)
  * [Sublime packages Install](#sublime-package-install)
  * [Sublime shortcuts - windows](#sublime-shortcuts-windows)
* Study Links & References
  * github links
    * [Complete docker library - Awesome Docker](https://github.com/veggiemonk/awesome-docker)
    * [Minimize docker container - skinnywhale](https://github.com/djosephsen/skinnywhale)
    * [All desktop application docker files](https://github.com/jessfraz/dockerfiles)
    * [docker ssh](https://github.com/jeroenpeeters/docker-ssh)
    * [docker tiny core dockerfile](https://github.com/tatsushid/docker-tinycore/blob/master/7.2/x86/Dockerfile)
    * [docker for beginners - installation](https://github.com/groda/big_data/blob/master/docker_for_beginners.md)    
    * [github writing - help doc](https://help.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax#headings)
  * Linux/Unix Links
    * [alpine stable releases](http://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/)
  * docker hub links
    * [tinycore](https://hub.docker.com/r/tatsushid/tinycore/)
  * Misc Links & Blogs
    * [text based gmail from docker](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/)
    * [Docker cmd to docker-compose convertor](https://www.composerize.com/)

[//]: # (comment: ###########################################################)
[//]: # (comment: docker installation starts here)
[//]: # (comment: ###########################################################)
## <a name='installation'>Installation - Docker/Docker-compose</a>
### <a name='install-ubuntu'>Install docker on Ubuntu using apt</a>
```
root@machine: ~/ # apt install docker.io
```
### <a name='install-ubuntu-dc'>Install docker-compose on ubuntu using apt</a>
Installing docker-ompose from the official ubuntu repository.
```
root@machine: ~/ # apt install docker-compose
```
### <a name='install-version'>After installation check docker version</a>
If the docker installation is successfull. Run the command to check the version
```
root@machine: ~/ # docker -v
Docker version 19.03.6, build 369ce74a3c
```
### <a name='dc-install-version'>After installation check docker-compose version</a>
If the docker-compose installation is successfull. Run the command to check the version
```
root@machine: ~/ # docker-compose -v
docker-compose version 1.17.1, build unknown
```

[//]: # (comment: ###########################################################)
[//]: # (comment: docker commands starts here)
[//]: # (comment: ###########################################################)
## <a name='docker-commands'>Docker commands</a>
### <a name='create-dockerfile'>Create Dockerfile for ever running ubuntu container</a>
Create a file ```Dockerfile``` in a directory ```/home/ashfaqr/docker/``` with content</br>
```vim /home/ashfaqr/docker/Dockerfile```
```
FROM ubuntu:18.04

# other commands
RUN apt-get install -y vim
EXPOSE 5000

CMD ["tail", "-f", "/dev/null"]
```

### <a name='create-image-from-dockerfile'>Create docker image from dockerfile</a>
Will create image by the name ```ubuntu18_i_v1.0```</br>
using Dockerfile from above [step](#create-dockerfile)</br>
```
cd /home/ashfaqr/docker/
docker build -t ubuntu18_i_v1.0 .
```
Note: don't miss the dot (.) at the end of command

### <a name='create-docker-container'>create container from image</a>
Will create container by the name ```ubuntu18_c``` using image ```ubuntu18_i_v1.0```</br>
-p : is bind host port(8888) to exposed port(5000) inside container</br>
```
docker run -d -it --name ubuntu18_c -p 8888:5000 ubuntu18_i_v1.0
```

### <a name='run-container'>Run stopped docker container</a>
Get container ID from
```docker ps -a``` OR ```docker container ls -a```</br>
Start/Run container using
```docker container start <container-id>```

### <a name='create-image-from-container'>Create image from container</a>
Get container ID from
```docker ps -a``` OR ```docker container ls -a```</br>
Create image using container id as
```docker commit $CONTAINER_ID ubuntu18_i_v2.0```

### <a name='remove-docker-container'>Remove docker container</a>
Get container ID from
```docker ps -a``` OR ```docker container ls -a```</br>
Remove docker container via
```docker container rm <container-id>```

### <a name='remove-docker-images'>Remove docker images</a>
Get image ID from
```docker images -a```</br>
Remove Image using command
```docker rmi <image-id>```

### <a name='docker-copy'>Copy file to/from host machine to/from docker container</a>
Host to container
```docker cp /home/ashfaqr/file.txt ubuntu18_c:/file.txt```
Container to host
```docker cp ubuntu18_c:/file.txt /home/ashfaqr/file.txt```

[//]: # (comment: ###########################################################)
[//]: # (comment: jupyter notebook installation steps starts here)
[//]: # (comment: ###########################################################)
## <a name='install-jupyter-notebook'>Install jupyter notebook</a>
### <a name='install-jupyter-notebook-windows'>Install on Windows</a>
```
	1. install windows python 3.7.7 installer
	2. goto cmd and move to python/Scripts folder
	3. pip.exe install notebook
```
### <a name='jupyter-notebook-autocomplete'>Autocomplete for jupyter notebook</a>
Execute this line on top of every notebook</br>
To do auto completion processing faster on TAB press
```%config Completer.use_jedi = False```

[//]: # (comment: ###########################################################)
[//]: # (comment: Linux study material start here)
[//]: # (comment: ###########################################################)
## <a name='linux-study'>Linux Study Material</a>
### <a name='enable-root-login'>Enable root login in linux</a>
For Ubuntu 20: 
Step 1. add line in /etc/gdm3/custom.conf
```
[security]
AllowRoot=true
AllowRemoteRoot=true
```
Step 2. Comment below line in file /etc/pam.d/gdm-password
```
auth required pam_succeed_if.so user !=root quiet_success
```

### <a name='enable-root-login-via-ssh'>Enable root login via ssh</a>
Steps:
1. apt install ssh
2. Add line ```PermitRootLogin yes``` in file /etc/ssh/sshd_config

### <a name='ssh-tunnel'>SSH tunnelling and Port Forwarding</a>
#### Concept:
There are 2 types of port forwarding:
#### Local Forwarding
Local forwarding is used to forward a port from the client machine to the server machine.</br>
Typical uses for local port forwarding is creating tunnel sessions to remote server via jump servers</br></br>
Use below command from your local command prompt</br>
After successfull command execution</br>
You can send request from local browser to remote server machine which is listening on port 80</br>
Example: open browser and type: ```localhost:12345```
```
ssh -A -t jumphostuser@10.10.10.10 -L 12345:20.20.20.20:80 ssh serveruser@20.20.20.20
```
Options Explained:</br>
```
-t - to connect multiple ssh command in one line
-L - port information which need to be forwarded
10.10.10.10 - jump server IP
20.20.20.20 - remote server IP (actual server)
12345 - port from local windows/linux machine/laptop
80 - remote server port
```
Steps executed here:</br>
1. ```ssh -A -t jumphostuser@10.10.10.10 -L 12345:20.20.20.20:80```</br>
Connect to jump host server, and forward the local laptop port 12345 from jumphost server to actual server 20.20.20.20 on port 80</br>
```12345:20.20.20.20:80``` or ```127.0.0.1:12345:20.20.20.20:80``` - ```<local socket>:<remote socket>```</br>
2. ```ssh serveruser@20.20.20.20```</br>
Connect to remote server to create the tunnel</br>

#### Remote Forwarding

#### <a name='ssh-tunnel-sites'>Some useful sites for more information</a>
1. https://www.ssh.com/ssh/tunneling/example
2. https://www.tecmint.com/access-linux-server-using-a-jump-host/
3. https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
4. http://blog.remibergsma.com/2013/05/28/creating-a-multi-hop-ssh-tunnel-by-chaining-ssh-commands-and-using-a-jump-host/

### <a name='vimdiff-shortcuts'>vimdiff shortcuts</a>
```
]c :        - next difference
[c :        - previous difference
do          - diff obtain
dp          - diff put
zo          - open folded text
zc          - close folded text
:diffupdate - re-scan the files for differences
```

[//]: # (comment: ###########################################################)
[//]: # (comment: Putty study material start here)
[//]: # (comment: ###########################################################)
## <a name='putty-study'>Putty Study Material</a>
### <a name='VB-VM-via-putty-windows'>Connect Local Windows VirtualBox VM via Putty</a>
Steps:
* Open Settings --> network settings in virtual box where my connection(adapter 1) showed 'NAT'
* Clicked the 'port forwarding' option at the bottom of the screen
* Gave it a name 'PuTTY-port-fwd', protocol TCP, host IP 127.0.1.1 host port 8001 guest IP 10.0.2.15 guest port 22
  * NOTE: 10.0.2.15 is the IP inside VirtualBox VM
* Launch PuTTY and set it to root@127.0.1.1 port 8001 and try connect
  * NOTE: VB VM should be running
  * NOTE: This will help to connect via ubuntu user
    * to enable ssh for root user
    * add line PermitRootLogin yes 
    * in file /etc/ssh/sshd_config

[//]: # (comment: ###########################################################)
[//]: # (comment: My bash aliases starts here)
[//]: # (comment: ###########################################################)
## <a name='mybashalias'>My Bash Aliases</a>
Bash aliases in file ~/.bash_aliases
### <a name='dc'>dc</a>
```
alias dc='docker-compose' 
```
### <a name='names'>names</a>
```
alias names='docker ps --format "table {{.ID}}\\t{{.Names}}\\t{{.Image}}\\t{{.RunningFor}} ago\\t{{.Status}}\\t{{.Command}}"'
```
### <a name='rmi'>rmi</a>
```
alias rmi='dc stop; docker rm -f $(docker ps -a -q); docker rmi $(docker images -q -a); docker volume rm $(docker volume ls -f dangling=true -q);'
```
### <a name='PS1'>PS1 - colored PS1 for root user in ~/.bashrc</a>
```
export PS1="\[\033[01;31m\]\u@\h\[\e[m\]:\[\033[01;34m\]\w \[\033[36m\]\`parse_git_branch\`\[\e[m\]# "
```
### <a name='PS1-git'>git prompt</a>
```bash
# get current branch in git repo
function parse_git_branch() {
        BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
        if [ ! "${BRANCH}" == "" ]
        then
                STAT=`parse_git_dirty`
                echo "[${BRANCH}${STAT}]"
        else
                echo ""
        fi
}

# get current status of git repo
function parse_git_dirty {
        status=`git status 2>&1 | tee`
        dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
        untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
        ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
        newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
        renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
        deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
        bits=''
        if [ "${renamed}" == "0" ]; then
                bits=">${bits}"
        fi
        if [ "${ahead}" == "0" ]; then
                bits="*${bits}"
        fi
        if [ "${newfile}" == "0" ]; then
                bits="+${bits}"
        fi
        if [ "${untracked}" == "0" ]; then
                bits="?${bits}"
        fi
        if [ "${deleted}" == "0" ]; then
                bits="x${bits}"
        fi
        if [ "${dirty}" == "0" ]; then
                bits="!${bits}"
        fi
        if [ ! "${bits}" == "" ]; then
                echo " ${bits}"
        else
                echo ""
        fi
}

#export PS1="\[\e[31m\]\u\[\e[m\]\[\e[31m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\] \[\e[36m\]\`parse_git_branch\`\[\e[m\]# "
export PS1="\[\033[01;31m\]\u@\h\[\e[m\]:\[\033[01;34m\]\w \[\033[36m\]\`parse_git_branch\`\[\e[m\]# "
```
### <a name='misc'>misc</a>
```
alias s='source ~/.bashrc'
```

[//]: # (comment: ###########################################################)
[//]: # (comment: My windows aliases starts here)
[//]: # (comment: ###########################################################)
## <a name='mywindowsalias'>My aliases - windows</a>
### <a name='create-windows-alias'>Create/Setup windows aliases</a>
Steps to create aliases files
```
1. create file aliases.bat to any windows folder, say C:\Users\admin\Desktop\aliases.bat
2. Add file path C:\Users\admin\Desktop\aliases.bat to PATH environment variable.
3. Start/Restart CMD prompt
4. # aliases.bat     or     # aliases
```
### <a name='my-windows-aliases'>Few useful windows aliases</a>
```
@echo off

doskey ls=dir
doskey desk=cd C:\Users\admin.DDSPL1491\Desktop

```

[//]: # (comment: ###########################################################)
[//]: # (comment: sublime study starts here)
[//]: # (comment: ###########################################################)
## <a name='sublime-study'>Sublime Study</a>
### <a name='sublime-package-install'>Sublime packages Install</a>
```
goto Tools --> click Install Package Control
```
### <a name='sublime-shortcuts-windows'>Sublime shortcuts - windows</a>
| shortcut | Description	|
| ------------- | ------------------------------	|
| `Ctrl+Shift+P`      | package install manager	|
| `Ctrl + p`   | **search file in repo**	|
| `Ctrl + f` | search in file	|
