
# Anomy
Anomy is a bash application that routes common commands through Tor, anonymizing the traffic.

It enables connections from the following sources to connect through the Tor network:

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
            -c,  --curl                      curl data transfer
            -s,  --ssh                       initiate ssh connection
            -f,  --ftp                       initiate ftp session
            -d,  --sftp                      initiate sftp session
            -t,  --telnet                    initiate telnet session

### Install
The installation script will install both Tor and Torsocks onto the system using the available package manager (`apt`, `yum`, or `dnf`). If these are already present it will ignore them and set up Anomy.

**Note:** the install and uninstall scripts must be run with root privileges.

    cd /opt
    git clone https://github.com/izm1chael/Anomy.git
    cd Anomy
    sudo bash install.sh  

### Uninstall
The uninstallation script removes Tor and Torsocks (using the detected package manager) as well as Anomy itself.

    cd /opt/Anomy
    sudo bash uninstall.sh
