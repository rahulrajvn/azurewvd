Netsh trace start scenario=netconnection capture=yes tracefile=c:\client_nettrace.etl maxsize=512 overwrite=yes report=yes



Netsh trace stop

Portqry.exe -n 127.0.0.1 -e 135
