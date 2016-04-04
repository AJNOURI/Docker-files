#!/bin/bash
LAN="eth0"
WAN="eth1"


function internetintfn(){
 dialog --title "Select Internet interface" \
--menu "Please choose an option:" 15 55 5 \
1 "eth0" \
2 "eth1" 2> int_int.$$

internetint="$(cat int_int.$$)"
echo "choice $internetint"
echo "okcancel $?"

case $internetint in
	1) LAN="eth0";WAN="eth1";;
	2) LAN="eth1";WAN="eth0";;
esac
setiptables
}


function resetint(){
ifcmd=( "ifdown eth0" "ifdown eth1" "ifup eth0" "ifup eth1" )
  for cmd in "${ifcmd[@]}";do
    eval $cmd
  done |
  dialog --title "Interface reset" --gauge "Please wait..." 10 70 0
}


function setiptables(){
  # Flash iptables rule
  iptables -P INPUT ACCEPT
  iptables -P FORWARD ACCEPT
  iptables -P OUTPUT ACCEPT
  iptables -t nat -F
  iptables -t mangle -F
  iptables -F
  iptables -X
  # set NAT
  iptables -t nat -A POSTROUTING -i $LAN -o $WAN -j MASQUERADE
}


while true
do

 dialog --title "A dialog Menu Example" \
--menu "Please choose an option:" 15 55 5 \
1 "Assign Internet interface" \
2 "Edit interfaces file" \
3 "Clear firewall rules" \
4 "Exit to shell" 2> main_menu.$$

mainmenu=`cat main_menu.$$`
echo $mainmenu

case $mainmenu in
	1) internetintfn;;
	2) vi /etc/network/interfaces;resetint;;
        3) setiptables;;
	4) break;;
esac

done
exit 0
