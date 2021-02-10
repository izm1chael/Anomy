## Anomy
Anomy is a bash application that will route common commands though Tor, anonymizing the traffic. 

It enables connections from the following source to connect through the tor network
| wget | ssh | ftp | sftp | telnet |


       $ anomy -h
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

