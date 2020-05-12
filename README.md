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
  * [Misc](*misc)

<p></p><p></p>

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
:small_blue_diamond: Bash aliases in file ~/.bash_aliases

<a name='dc'>
  alias dc='docker-compose'
</a></p>

<a name='names'>
  alias names='docker ps --format "table {{.ID}}\\t{{.Names}}\\t{{.Image}}\\t{{.RunningFor}} ago\\t{{.Status}}\\t{{.Command}}"'
</a></p>

<a name='rmi'>
  alias rmi='dc stop; docker rm -f $(docker ps -a -q); docker rmi $(docker images -q -a); docker volume rm $(docker volume ls -f dangling=true -q);'
</a></p>

<a name='misc'>
  alias s='source ~/.bashrc'
</a></p>

