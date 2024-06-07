#!/bin/sh
clear
linux_version=$(lsb_release -a 2>/dev/null | grep 'Description:' | cut -f2)
kernel=$(uname -r)
packagesdpkg=$(dpkg -l | grep '^ii' | wc -l)
ram=$(grep -E 'MemTotal|MemFree|MemAvailable' /proc/meminfo | awk '
{
    # Convert KB to GB by dividing by 1024^2 (1048576)
    value = $2 / 1048576
    printf "%s: %.2f GB\n", $1, value
}')


cat << "EOF"
       .--.  
      |o_o | 
      |:_/ | 
     //   \ \ 
    (|     | )
   /'\_   _/`\
   \___)=(___/
EOF
echo ""
echo "$linux_version"
echo "\033[34m Kernel\033[0m: $kernel"
echo "\033[31m dpkg Packages\033[0m: ($packagesdpkg)"
echo "\033[35m RAM\033[0m:\n$ram"
echo ""

