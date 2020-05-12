# Easy-DC
Easy Docker Study Documentation.

## Table of Content
* [Installation](#installation)
  * [1.1 Install docker on ubuntu using apt](#install-ubuntu)
  * [1.2 Install docker-compose on ubuntu using apt](#install-ubuntu-dc)
  * [1.3 Install docker official link](https://docs.docker.com/engine/install/)
  * [1.4 Install docker-compose official link](https://docs.docker.com/compose/install/)
  * [1.5 After installation check docker version](#install-version)
  * [1.6 After installation check docker-compose version](#dc-install-version)

* [My aliases](#mybashalias)
  * [dc - for docker-compose](#dc)
  * [names - formatted docker ps output for large list of services](#names)
  * [rmi - stop all docker containes. Removes all docker services, images and volumes (including dangling)](#rmi)
  * [PS1 - colored PS1 for root user in ~/.bashrc](#PS1)
  * [git prompt - git branch status in PS1](#PS1-git)
  * [Misc](#misc)

* Study Links & References
  * github links
    * [Complete docker library](https://github.com/veggiemonk/awesome-docker)
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


<br></br><br></br><br></br><br></br>

### <a name='installation'>Installation</a>
-----
#### <a name='install-ubuntu'>Install docker on Ubuntu using apt</a>
```bash
root@machine: ~/ # apt install docker.io
```

#### <a name='install-ubuntu-dc'>Install docker-compose on ubuntu using apt</a>
Installing docker-ompose from the official ubuntu repository.
```bash
root@machine: ~/ # apt install docker-compose
```

#### <a name='install-version'>After installation check docker version</a>
If the docker installation is successfull. Run the command to check the version
```bash
root@machine: ~/ # docker -v
Docker version 19.03.6, build 369ce74a3c
```

#### <a name='dc-install-version'>After installation check docker-compose version</a>
If the docker-compose installation is successfull. Run the command to check the version
```bash
root@machine: ~/ # docker-compose -v
docker-compose version 1.17.1, build unknown
```



### <a name='mybashalias'>My Bash Aliases</a>
Bash aliases in file ~/.bash_aliases

#### <a name='dc'>dc</a>
```bash
alias dc='docker-compose' 
```

#### <a name='names'>names</a>
```bash
alias names='docker ps --format "table {{.ID}}\\t{{.Names}}\\t{{.Image}}\\t{{.RunningFor}} ago\\t{{.Status}}\\t{{.Command}}"'
```

#### <a name='rmi'>rmi</a>
```bash
alias rmi='dc stop; docker rm -f $(docker ps -a -q); docker rmi $(docker images -q -a); docker volume rm $(docker volume ls -f dangling=true -q);'
```

#### <a name='PS1'>PS1 - colored PS1 for root user in ~/.bashrc</a>
```bash
export PS1="\[\033[01;31m\]\u@\h\[\e[m\]:\[\033[01;34m\]\w \[\033[36m\]\`parse_git_branch\`\[\e[m\]# "
```

#### <a name='PS1-git'>git prompt</a>
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

#### <a name='misc'>misc</a>
```bash
alias s='source ~/.bashrc'
```

