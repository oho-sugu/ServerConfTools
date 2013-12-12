#!/bin/bash

#########################################################################
###   Config file management script for ohosting virtual machine host 
###          Author  Suguru Oho <oho-s@klab.com>
###          Date    2013/08/29
###   Description
###     If you need to edit system config files such as /etc/*.conf.
###     Use this script for edit.
###     Script automatically make symbolic link of config file 
###     to aggregation directory if it not exists.
###
###   Usage:  vconf <filename>
###
#########################################################################

## scripts aggregation directory
AGG_DIR="/opt/ohosting/sysconf"
## Your editor
EDITWITH="vim"

if [ $# -eq 0 ]; then
  echo "Usage: `basename $0` <filename>"
  exit 1
fi

if [ $# -ne 1 ]; then
  echo "Usage: `basename $0` <filename>"
  exit 1
fi

if [ ! -e $1 ]; then
  touch $1
fi

CUR_DIR=`pwd`

if [ ! -d ${AGG_DIR}${CUR_DIR}/`dirname $1` ]; then
  mkdir -p ${AGG_DIR}${CUR_DIR}/`dirname $1`
fi

if [ ! -e ${AGG_DIR}${CUR_DIR}/$1".org" ]; then
  cp $1 ${AGG_DIR}${CUR_DIR}/$1".org"
fi

if [ ! -e ${AGG_DIR}${CUR_DIR}/$1 ]; then
  cp $1 ${AGG_DIR}${CUR_DIR}/$1
fi

${EDITWITH} $1

if [ ! -e ${AGG_DIR}${CUR_DIR}/$1 ]; then
  cp $1 ${AGG_DIR}${CUR_DIR}/$1
fi


