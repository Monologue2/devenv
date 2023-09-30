# Beharbor Create Dev Container 
## Writing id
```bash
$ echo <students_id> > id
```
## Start Nginx & SSH-Jump host
```
$ sudo docker compose up -d
[+] Running 2/0
 ✔ Container ssh-client        Created                                                                               0.1s 
 ✔ Container beharbor_tengine  Created                                                                               0.1s 
Attaching to beharbor_tengine, ssh-client
```

## Create Development Environment
```bash
$ sudo ./create_container.sh
"## Create Beharbor-Server Container"
"write a your class name..."
$ <writing a class name>
```

## Add your SSH config
```
#password : donga
Host donga
  HostName <beharbor-domain>
  Port 80
  User donga

#password : 1234
Host <student-id>
  HostName <class-name><student-id>
  Port 22
  User <class-name><student-id>
  ProxyJump donga
```