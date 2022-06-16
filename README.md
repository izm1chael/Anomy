
# Anomy
Anomy is a bash application that will route common commands though Tor, anonymizing the traffic. 

It enables connections from the following source to connect through the tor network:

 *  wget  
 *  curl
 *  ssh  
 *  sftp  
 *  ftp  
 *  telnet   
 
  
### Example
    $ anomy -h
            Usage: anomy [OPTION]... [URL]...
            Mandatory arguments to long options are mandatory for short options too.
            Startup:
            -h,  --help                      print this help
            Functions:
            -w,  --wget                      wget download
            -c,  --curl
            -s,  --ssh                       initiate ssh connection
            -f,  --ftp                       initiate ftp session
            -d,  --sftp                      initiate sftp session
            -t,  --telnet                    initiate telnet session

### Install
The installation scrip will install both Tor and Torsocks onto the system, if these are already present it will ignore and set up anomy

    cd /opt
    git clone https://github.com/izm1chael/Anomy.git
    cd /Anomy
    sudo bash install.sh  

### Uninstall
The uninstallation script will remove both Tor and Torsocks from the systems as well as removing anomy

    cd /opt/Anomy
    sudo bash uninstall.sh
