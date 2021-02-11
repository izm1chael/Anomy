#!/bin/bash

TSOCKS=`which torsocks`
WGET=`which wget`
SSH=`which ssh`
FTP=`which ftp`
SFTPP=`which sftp`
TELNET=`which telnet`

sudo systemctl start tor

while (( "$#" )); do
  case "$1" in
    -w|--wget)
        if [ -n "$2" ]; then
        echo "Running wget on $2"
        $TSOCKS $WGET -U "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6; .NET CLR 1.1.4322)" $2
        exit;
        fi
      ;;
    -s|--ssh)
      if [ -n "$2" ]; then
        $TSOCKS $SSH $2
        exit;
        fi
      ;;
    -f|--ftp)
      if [ -n "$2" ]; then
        $TSOCKS $FTP $2
        exit;
        fi
      ;;
    -d|--sftp)
      if [ -n "$2" ]; then
        $TSOCKS $SFTP $2
        exit;
        fi
      ;;
    -d|--sftp)
      if [ -n "$2" ]; then
        $TSOCKS $SFTP $2
        exit;
        fi
      ;;
    -t|--telnet)
      if [ -n "$2" ]; then
        $TSOCKS $TELNET $2
        exit;
        fi
      ;;
    -h|--help)
        if [ -n "$1" ]; then
cat <<EOF
Usage: anomy [OPTION]... [URL]...

Mandatory arguments to long options are mandatory for short options too.
Startup:
-h,  --help                      print this help

Functions:
-w,  --wget                      wget download
-s,  --ssh                       initiate ssh connection
-f,  --ftp                       initiate ftp session
-d,  --sftp                      initiate sftp session
-t,  --telnet                    initiate telnet session
EOF
        exit;
        fi
      ;;
     *) echo "Invaild Argument Provided, use -h,  --help for more infomation" ; exit 1;
     esac
done # set positional arguments in their proper place

[ $# -eq 0 ] && { echo "No Arugment Provided, use -h,  --help for more infomation "; exit 1; }
