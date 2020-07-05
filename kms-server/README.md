# kms-server
kms server.

## Run

* Run docker-compose

```
$ docker-compose up -d
```

* Run docker

```
$ docker run -it -d -p 1688:1688 kms-server:v1.0
```

## Client usage:

**Note: run `cmd` with administrator or `powershell` with administrator.**  

- Windows:
```powershell
slmgr /upk
slmgr /ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
slmgr /skms YOUR_IP_OR_HOSTNAME
slmgr /ato
```

- Office 2010, 2013, 2016 and 2019:

```powershell
# Office 2010
CD \Program Files\Microsoft Office\Office14
# Office 2013
CD \Program Files\Microsoft Office\Office15
# Office 2016 and 2019
CD \Program Files\Microsoft Office\Office16 

OR 

CD \Program Files (x86)\Microsoft Office\Office16
cscript ospp.vbs /sethst:YOUR_IP_OR_HOSTNAME

cscript ospp.vbs /inpkey:xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
cscript ospp.vbs /act
cscript ospp.vbs /dstatusall
```


- Source Code:
You can download source code on [https://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms](https://forums.mydigitallife.info/threads/50234-Emulated-KMS-Servers-on-non-Windows-platforms)

- Key:
You can find key on [https://technet.microsoft.com/en-us/library/jj612867.aspx](https://technet.microsoft.com/en-us/library/jj612867.aspx)
