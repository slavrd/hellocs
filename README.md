# Hello CS

A simple C# .NetCore project that prints "hello"

## Prerequisites

* install .NetCore SDK - [download](https://dotnet.microsoft.com/download)

Or if you dont won't to install the .NetCore SDK on your system use the included Vagrant project in folder vagrant/ to build an VirtualBox VM with ubuntu 16.04 OS and .NetCore SDK installed.

* Install VirtualBox - [instructions](https://www.virtualbox.org/wiki/Downloads)
* Install Vagrant - [instructions](https://www.vagrantup.com/downloads.html)
* In folder vagrant/ run `vagrant up`
* Login to the machine `vagrant ssh`
* Clone the project `git clone https://github.com/slavrd/hellocs.git`

## Run the project

* to run the app - `dotnet run`
* to build an executable - `dotnet build -r <RID>`

The RID depends on the OS you are building for - [list](https://docs.microsoft.com/en-us/dotnet/core/rid-catalog) of RIDs.

The compiled application will be placed in ./bin/Debug/netcoreapp2.1/\<RID> folder