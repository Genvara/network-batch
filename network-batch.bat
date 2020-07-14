ipconfig /all
netsh wlan show all
certutil -store -silent My & certutil -store -silent -user My
netsh interface set interface name="Ethernet" admin=DISABLED
netsh interface set interface name="Local Area Connection" admin=DISABLED
netsh interface set interface name="Local Area Connection 2" admin=DISABLED
netsh interface set interface name="Wi-Fi" admin=DISABLED
netsh interface set interface name="Wi-Fi" admin=ENABLED
netsh interface set interface name="Wi-Fi 2" admin=DISABLED
netsh interface set interface name="Wi-Fi 2" admin=ENABLED
TIMEOUT /T 8
netsh interface ip set address "Wi-Fi" dhcp
ipconfig /release
ipconfig /renew
TIMEOUT /T 3
netsh interface ip set dns "Wi-Fi" static 8.8.8.8
netsh interface ip add dns "Wi-Fi" 8.8.4.4 Index=2
netsh interface ip add dns "Wi-Fi" 4.2.2.2 Index=3
ipconfig /flushdns
TIMEOUT /T 3
ipconfig /registerdns
netsh int tcp set global autotuninglevel=normal
TIMEOUT /T 3
netsh int tcp set global autotuninglevel=disabled
TIMEOUT /T 3
netsh interface ipv4 set subinterface "Wi-Fi" mtu=600 store=persistent
