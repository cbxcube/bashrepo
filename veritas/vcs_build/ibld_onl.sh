hares -add  dbIP  IP  VirtIP
hares -modify  dbIP Critical 1
hares -modify  dbIP PrefixLen  1000
hares -modify  dbIP Device  eth0
hares -modify  dbIP Address  192.168.0.31
hares -modify  dbIP NetMask  255.255.255.0
hares -modify  dbIP enabled 1
hares -online dbIP -sys gemini2

hares -add  webIP  IP  VirtIP
hares -modify webIP Critical 1
hares -modify webIP PrefixLen  1000
hares -modify webIP Device  eth0
hares -modify webIP Address  192.168.0.48
hares -modify webIP NetMask  255.255.255.0
hares -modify webIP Enabled 1
hares -online webIP -sys gemini1

hares -add  ftpIP  IP  VirtIP
hares -modify ftpIP  Critical 1
hares -modify  ftpIP PrefixLen  1000
hares -modify  ftpIP Device  eth0
hares -modify  ftpIP Address  192.168.0.32
hares -modify  ftpIP NetMask  255.255.255.0
hares -modify  ftpIP Enabled 1
hares -online ftpIP -sys gemini2

hares -add  crmIP  IP  VirtIP
hares -online  crmIP -sys gemini1
hares -modify crmIP Critical 1
hares -modify crmIP PrefixLen  1000
hares -modify crmIP Device  eth0
hares -modify crmIP Address  192.168.0.33
hares -modify crmIP NetMask  255.255.255.0
hares -modify crmIP Enabled 1
hares -online  crmIP -sys gemini1

hares -add  iotIP  IP  VirtIP
hares -modify iotIP Critical 1
hares -modify iotIP PrefixLen  1000
hares -modify iotIP Device  eth0
hares -modify iotIP Address  192.168.0.43
hares -modify iotIP NetMask  255.255.255.0
hares -modify iotIP Enabled 1
hares -online iotIP -sys gemini2


echo "\n"
echo " * * *     D O N E      ****"
echo "\n"
hares -state

echo "\n"
echo "bye! (cbx)"

