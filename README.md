# Easy-DC
Easy Docker Study Documentation.

## Table of Content
[1. Installation](#installation)
- [1.1 Install docker on ubuntu using apt](#install-ubuntu)
- [1.2 Install docker-compose on ubuntu using apt](#install-ubuntu-dc)
- [1.3 Install docker official link](https://docs.docker.com/engine/install/)
- [1.4 Install docker-compose official link](https://docs.docker.com/compose/install/)
- [1.5 After installation check version](#install-version)
- [1.6 After docker-compose installation check version](#dc-install-version)


----------


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

#### <a name='install-version'>After installation check version</a>
If the docker installation is successfull. run the command to check the version
```bash
root@machine: ~/ # docker -v
Docker version 19.03.6, build 369ce74a3c
```

#### <a name='dc-install-version'>After docker-compose installation check version</a>
```bash
root@machine: ~/ # docker-compose -v
docker-compose version 1.17.1, build unknown
```

