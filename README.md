# ROS_Docker
Installieren Sie sich Docker auf Ihrem Rechner. 

## Build Docker (MAC + LINUX)
Öffnen Sie eine Terminal im Repository und führen Sie das build_docker.sh Skript aus:
```bash
sh build_docker.sh
```

## Build Docker (WINDOWS)
Öffnen Sie die Docker-Einstellungen und erlauben Sie den Zugriff auf die Daten
![](img/img.png)

Öffnen Sie eine Powershell im Repository und führen Sie das build_docker.bat Skript aus:
```
.\build_docker.bat
```

## Starten des Dockers (MAC + LINUX)

Führen Sie das start_docker.sh Skript aus:
```bash
sh start_docker.sh
```

Sie können sich per VNC auf den Docker verbinden indem Sie folgenden Link aufrufen:
http://127.0.0.1:6080

Alternativ können Sie sich mit einem VNC Viewer mit folgender Adresse verbinden:
localhost:5900

Um eine Konsole ohne VNC des Docker-Images zu öffnen muss der Docker laufen.
```
sh open_shell.sh
```

## Starten des Dockers (Windows)

Führen Sie das start_docker.bat Skript aus:
```
./start_docker.bat
```

Sie können sich per VNC auf den Docker verbinden indem Sie folgenden Link aufrufen:
http://127.0.0.1:6080

Alternativ können Sie sich mit einem VNC Viewer mit folgender Adresse verbinden:
localhost:5900

Um eine Konsole ohne VNC des Docker-Images zu öffnen muss der Docker laufen.
```
./open_shell.bat
```


