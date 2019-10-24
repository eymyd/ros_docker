# ROS_Docker
Installieren Sie sich Docker auf Ihrem Rechner. Sie brauchen eine außreichende Internetverbindung.

## Instaltion (Windows 10 Education, Professinal)
https://docs.docker.com/docker-for-windows/install/

## Installation (Windows 7, 8, 10 Home)
https://docs.docker.com/toolbox/toolbox_install_windows/

## Installation (LINUX)
https://docs.docker.com/install/linux/docker-ce/debian/

https://docs.docker.com/install/linux/docker-ce/ubuntu/

https://docs.docker.com/install/linux/docker-ce/fedora/


## Installation (MAC)
https://docs.docker.com/docker-for-mac/install/



## Datenzugriff erlaufen (WINDOWS)
Öffnen Sie die Docker-Einstellungen und erlauben Sie den Zugriff auf die Daten
![](img/img.png)


## Build Docker (OPTIONIAL)
Falls Sie das Docker-Image selber bauen wollen führen Sie folgende Schritte aus, anderenfalls wird ein bereits gebautes Docker-Images vom Repository downgeloaded.
### Build Docker (MAC + LINUX)
Öffnen Sie eine Terminal im Repository und führen Sie das build_docker.sh Skript aus:
```bash
sh build_docker.sh
```

### Build Docker (WINDOWS)
Öffnen Sie eine Powershell im Repository und führen Sie das build_docker.bat Skript aus:
```
.\build_docker.bat
```

## Starten des Dockers
Folgende Skripte können mit dem selbst gebauten Docker-Image oder mit dem Docker-Image aus dem Repository (**wird automatisch beim ersten Starten heruntergeladen (ca. 3GB).**) ausgeführt werden.

Falls es beim Herunterladen oder Starten zu Problemen kommt, können Sie das Herungerladen mit folgendem Befehl anstoßen:
```bash
docker pull eymy/isse-ros:latest
```

### Starten des Dockers (MAC + LINUX)

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
##
### Starten des Dockers (Windows)

Führen Sie das start_docker.bat Skript aus:
```
./start_docker.bat
```

Achten Sie darauf das im Verzeichnispfad keine Leerzeichen sind.

Sie können sich per VNC auf den Docker verbinden indem Sie folgenden Link aufrufen:
http://127.0.0.1:6080

Alternativ können Sie sich mit einem VNC Viewer mit folgender Adresse verbinden:
localhost:5900

Um eine Konsole ohne VNC des Docker-Images zu öffnen muss der Docker laufen.
```
./open_shell.bat
```


