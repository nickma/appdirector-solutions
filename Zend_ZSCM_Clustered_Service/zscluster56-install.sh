#!/bin/bash
# This is a Zend Server Cluster Manager installation script .Configurations will be done though configuration scripts. 
# Author: Nick Maiorsky nick@zend.com  
# Import global conf 
. $global_conf

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/vmware/bin:/opt/vmware/bin
export HOME=/root

PROGNAME=`basename $0`

##Funtion to Check Error ##
function check_error()
{
   if [ ! "$?" = "0" ]; then
      error_exit "$1"; 
   fi
}

## Function To Display Error and Exit ##
function error_exit()
{
   echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
   exit 1
}


## Creating Zend installation temprorary directory /opt/vmware/zend ##
mkdir -p /opt/vmware/zend
cd /opt/vmware/zend

## Cleanup ##
rm -rf *
check_error "Errors during cleanup."

## Download Zend Server yum configuration and installer tar ball ##
wget --output-document=zendserver-install.tar.gz $DOWNLOADRPMURL
check_error "Unable to download Zend Server configuration and installer. "

## Extracting Zend installer tar ball ##
tar -xvf zendserver-install.tar.gz
check_error "Unable to untar Zend Server tar ball."; 

## Copy repostory configuration files ##
cp ZendServer-RepositoryInstaller-linux/zend.rpm.repo /etc/yum.repos.d/
check_error "Unable to copy zend repo file to yum repos."

## Install Zend Server ##
yum -y install zend-server-cluster-manager
check_error "Unable to install Zend Server Cluster Manager via yum."

## Restart Zend Server to make sure all the new settings and packages are in place ##
/etc/init.d/zend-server restart
check_error "Unable to start Zend Server." 
