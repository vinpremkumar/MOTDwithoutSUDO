# MOTDwithoutSUDO
In Centos 7, if you would like to make a MOTD (login banner) unique to your ID, and without the requirement of sudo, then you have come to the right place

It has been coded such that it will automatically adjust itself to the center of the screen

# .bashrc edit
In your _.bashrc_ file, add the following:
```
# .bashrc

alias clear="source ~/.bashrc"
# This is added to make the login banner stay on top all the time. 
# You can remove the above line if you want the banner to be removed when using clear command

if [[ "$SSH_TTY" == */dev/pts/* ]] ; then
    bash ~/.loginmsg.sh
fi

```
