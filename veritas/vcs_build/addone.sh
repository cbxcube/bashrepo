hares -add  iotIP  IP  VirtIP
hares -modify webIP Critical 1
hares -modify webIP PrefixLen  1000
hares -modify webIP Device  eth0
hares -modify webIP Address  192.168.0.43
hares -modify webIP NetMask  255.255.255.0
hares -modify webIP Enabled 1

