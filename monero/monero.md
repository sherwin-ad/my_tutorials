# Monero



```
ssh -i sherwinowen-key sherwinowen3210@65.109.109.203
```





/etc/systemd/system/monero.service

```
[Unit]
Description=monero service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=10
User=monero
ExecStart=/home/monero/monero-bin/monerod

[Install]
WantedBy=multi-user.target
```



To list all services that are currently loaded and running on your system:

```
systemctl -t service --state=active
```

If you want to list services that start when your system boots then you can use:

```
systemctl list-unit-files --state=enabled
```