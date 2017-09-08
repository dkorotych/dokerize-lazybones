# dokerize-lazybones
Dockerized version of [Lazybones] project creation tool

[![Build Status](https://travis-ci.org/dkorotych/dokerize-lazybones.svg?branch=master)](https://travis-ci.org/dkorotych/dokerize-lazybones)
[![license](https://img.shields.io/github/license/dkorotych/dokerize-lazybones.svg)](https://github.com/dkorotych/dokerize-lazybones.git)

# What is [Lazybones]?
Lazybones was born out of frustration that [Ratpack](https://ratpack.io)
does not and will not have a command line tool that will bootstrap a project.
It's a good decision for Ratpack, but I'm lazy and want tools to do the boring
stuff for me.

The tool is very simple: it allows you to create a new project structure for
any framework or library for which the tool has a template.

The concept of Lazybones is very similar to [Maven] archetypes, and what [Yeoman](http://yeoman.io/)
does for web applications. Lazybones also includes a subtemplates feature that
resembles the behaviour of Yeoman's sub-generators, allowing you to generate optional
extras (controllers, scaffolding etc.) inside a project.

# How to use this image
You can run a Lazybones by using the Docker image directly, passing a Lazybones command to ```docker run```.
For example, view list of standard project templates 
```docker
docker run --rm dkorotych/lazybones list
```
or create a [Maven] project
```docker
docker run --rm --interactive --tty --volume $PWD:/home/lazybones/app dkorotych/lazybones create https://dl.bintray.com/dkorotych/lazybones-templates/maven-quickstart-template-1.3.2.zip .
```
# Create an alias
By creating an alias, you can use Lazybones in the same way as if you had installed everything on your computer.
```bash
alias lazybones='docker run \
                      --rm \
                      --interactive \
                      --tty \
                      --volume $PWD:/home/lazybones/app \
                      --workdir /home/lazybones/app \
                      --user $(id -u $(whoami)):$(id -g $(whoami)) \
                      dkorotych/lazybones'
```

# Supported tags and respective Dockerfile links
| Tag | Description |
|:---:|-------------|
|[latest](https://github.com/dkorotych/dokerize-lazybones/blob/latest/Dockerfile)|Lazybones 0.8.3 on Java 8|
|[0.8.3-jre8](https://github.com/dkorotych/dokerize-lazybones/blob/0.8.3-jre8/Dockerfile)|Lazybones 0.8.3 on Java 8|
|[0.8.2-jre8](https://github.com/dkorotych/dokerize-lazybones/blob/0.8.2-jre8/Dockerfile)|Lazybones 0.8.2 on Java 8|
|[0.8.1-jre8](https://github.com/dkorotych/dokerize-lazybones/blob/0.8.1-jre8/Dockerfile)|Lazybones 0.8.1 on Java 8|
|[0.8.3-jre7](https://github.com/dkorotych/dokerize-lazybones/blob/0.8.3-jre7/Dockerfile)|Lazybones 0.8.3 on Java 7|
|[0.8.2-jre7](https://github.com/dkorotych/dokerize-lazybones/blob/0.8.2-jre7/Dockerfile)|Lazybones 0.8.2 on Java 7|
|[0.8.1-jre7](https://github.com/dkorotych/dokerize-lazybones/blob/0.8.1-jre7/Dockerfile)|Lazybones 0.8.1 on Java 7|

[Lazybones]: https://github.com/pledbrook/lazybones
[Maven]: http://maven.apache.org/