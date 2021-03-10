AVR assembler on PlatformIO
===========================

1. Install visual studio code
2. Install PlatformIO plugin
3. Add our user to dialout group
```console
username@cpu:~$ sudo usermod -a -G dialout <username>
```
4. Create in PlatformIO a project with
    1. Board : ATmega328P/PA
    2. framework : Arduino
5. In the file Platformio.ini 
    1. Delete the framework line. In order to use avr-gcc as compiler
    2. add the follow line to the file **debug_tool = simavr**
6. Close vscode
7. Go to the PlatformIO path. If you are already crate the project you will see the atmelavr folder
 ```console
username@cpu:~$ cd ~/.platformio/platforms/atmelavr
```  
8. Create the path ~/.platformio/platforms/atmelavr/misc/svd
 ```console
username@cpu:~/.platformio/platforms/atmelavr$ mkdir misc
username@cpu:~/.platformio/platforms/atmelavr$ cd misc
username@cpu:~/.platformio/platforms/atmelavr/misc$ mkdir svd
``` 
9. Copy the file atmega328p.svd into the svd folder
 ```console
username@cpu:~$ cp <path_to_this_repo>/atmega328p.svd ~/.platformio/platforms/atmelavr/misc/svd
``` 
10. Change the file "~/.platformio/platforms/atmelavr/boards/ATmega328P.json" for the one given in this repository
 ```console
username@cpu:~$ rm ~/.platformio/platforms/atmelavr/boards/ATmega328P.json
username@cpu:~$ cp <path_to_this_repo>/ATmega328P.json ~/.platformio/platforms/atmelavr/boards/
```
11. Open vscode and change "src/main.cpp" to "src/main.S"
12. Modify main.S with your assembler code. you can use the examples in this repository as a template