:: PLEASE READ
:: this is network-batch, a script that might fix network :: stuff, however i do not promise that all of your problems :: will be fixed.
:: you have to configure this script before running :: it, follow the documentation written in the script in :: order to setup.
:: this should be used by someone that knows what is :: happening in this script, if you don't know what the hell :: is going on, don't execute this script, or call-up a :: friend that knows this stuff and let them set it up for :: you.
:: i am not responsible for any damages caused by this :: script, if anything breaks, it's not my fault, you have :: been warned.

:: disable and re-enable adapters
:: change 'value' with the name of your network adapter that you use to connect to the internet (Ex: Ethernet, Wi-Fi, Wi=Fi 2, etc...)
:: you can disable and re-enable as many adapters as you want to, by adding the same commands with a different 'value'
netsh interface set interface name="value" admin=DISABLED
netsh interface set interface name="value" admin=ENABLED
TIMEOUT /T 8
:: enables DHCP in said adapter
:: change 'value' with the name of your network adapter that you use to connect to the internet (Ex: Ethernet, Wi-Fi, Wi=Fi 2, etc...)
:: you can enable DHCP in any adapter you want to all the same time, by adding the same command with a different 'value'
netsh interface ip set address "value" dhcp
:: renew IP address (you can't really change much here)
ipconfig /release
ipconfig /renew
TIMEOUT /T 3
:: adds DNS addresses
:: change 'value' with the name of your network adapter that you use to connect to the internet (Ex: Ethernet, Wi-Fi, Wi=Fi 2, etc...)
:: change 'value2' with the DNS address you want
:: 'static' is the primary DNS, the ones with 'Index=num' is the secondary DNS, you can add as many as you want
:: recommended DNS addresses: 8.8.8.8 (primary), 8.8.4.4 (secondary), 4.2.2.2 (primary), 1.1.1.1 (primary), 1.0.0.1 (secondary)
:: you can add your preffered DNS though
netsh interface ip set dns "value" static value2
netsh interface ip add dns "value" value2 Index=2
netsh interface ip add dns "value" value2 Index=3
:: flushes DNS (you can't really change much here)
ipconfig /flushdns
TIMEOUT /T 3
:: registers DNS (you can't really change much here)
ipconfig /registerdns
:: turns auto-tune ON (you can't really change much here)
netsh int tcp set global autotuninglevel=normal
TIMEOUT /T 3
:: turns auto-tune OFF (you can't really change much here)
netsh int tcp set global autotuninglevel=disabled
TIMEOUT /T 3
:: sets MTU, set 'value' with the optimal MTU, don't know what's your MTU? this article will help you determine the optimal MTU size on router:
:: https://kb.netgear.com/19863/Ping-Test-to-determine-Optimal-MTU-Size-on-Router
netsh interface ipv4 set subinterface "Wi-Fi" mtu=value store=persistent
