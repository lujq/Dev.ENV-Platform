#!/bin/bash
#Program:
#	Check Linux SYS Info,
#	include CPU, Mem, HDD, SYS Operation Info
#History:
# 2011/04/04	Zic		first release
# 2014/02/10	Alex	Mod functions of Mem Sys info
#PATH=/bin;/sbin;/usr/bin;/usr/sbin;/usr/local/bin;/usr/local/sbin;~/bin
#export PATH

# Create Log txt

touch sysinfo_log.txt
chmod 664 sysinfo_log.txt
 
# CPU Info
#echo "CPU Info:" > sysinfo_log.txt
echo "CPU Info:" 1>>sysinfo_log.txt
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c 1>>sysinfo_log.txt
echo "" 1>>sysinfo_log.txt

# Mem Info
echo "Mem Info:" >> sysinfo_log.txt
free -m -t
free -m -t 1>>sysinfo_log.txt
echo "" 1>>sysinfo_log.txt

# HDD Info
echo "HDD Info:" >> sysinfo_log.txt
df -lh
df -lh 1>>sysinfo_log.txt
echo "" 1>>sysinfo_log.txt

# SYS Info
# yum install -y redhat-lsb
echo "Linux release Info:" >> sysinfo_log.txt
lsb_release -a
lsb_release -a 1>>sysinfo_log.txt
echo "" 1>>sysinfo_log.txt

# Kernel Info
echo "Kernel release Info:" >> sysinfo_log.txt
uname -r
uname -r 1>>sysinfo_log.txt
echo "" 1>>sysinfo_log.txt

# Network Info
echo "Network Info:" >> sysinfo_log.txt
ifconfig
ifconfig 1>>sysinfo_log.txt
echo "" 1>>sysinfo_log.txt
