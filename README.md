Serial Port Assistant
=====================

Author: Kang Lin (kl222@126.com)
--------------------------------

[<img src="Resource/png/China.png" alt="Chinese" title="Chinese" width="16" height="16" />Chinese](README_zh_CN.md)

1. ![Project: https://github.com/KangLin/SerialPortAssistant](https://github.com/KangLin/SerialPortAssistant)  
This project is a cross-platform serial assistant. It can run on:
    - [x] WINDOWS
    - [x] linux
    - [x] mac  
        Mac os, I don't have the corresponding equipment,
        please compile and test the user with the corresponding equipment.

2. Complie status

    |Platform|Status|
    |:---:|:------:|
    |windows、android|[![windows、android](https://ci.appveyor.com/api/projects/status/y77e828ysqc79r9o?svg=true)](https://ci.appveyor.com/project/KangLin/serialportassistant)|
    |linux|[![linux](https://travis-ci.org/KangLin/SerialPortAssistant.svg?branch=master)](https://travis-ci.org/KangLin/SerialPortAssistant)|

3. Multi-language
    * Chinese  
    ![Chinese](Docs/ui-zh.jpg)
    * Englisth  
    ![Englisth](Docs/ui-en.jpg)

4. Multi style

5. ![Release download](https://github.com/KangLin/SerialPortAssistant/releases)  
![Latest release download](https://github.com/KangLin/SerialPortAssistant/releases/latest)

- windows
    + [SerialPortAssistant-Setup-v0.4.1.exe](https://github.com/KangLin/SerialPortAssistant/releases/download/v0.4.1/SerialPortAssistant-Setup-v0.4.1.exe)

- linux
    + [SerialPortAssistant_v0.4.1.tar.gz](https://github.com/KangLin/SerialPortAssistant/releases/download/v0.4.1/SerialPortAssistant_v0.4.1.tar.gz)  
        The AppImage format executable can be run directly on the Linux system, see: https://appimage.org/  
        Usage:    
        1. Decompress. Copy SerialPortAssistant_v0.4.1.tar.gz to install directory, then decompress it:
    
                  mkdir SerialPortAssistant
                  cd SerialPortAssistant
                  cp $DOWNLOAD/SerialPortAssistant_v0.4.1.tar.gz .
                  tar xvfz SerialPortAssistant_v0.4.1.tar.gz
    
        2. install
    
                  ./install.sh install
    
        3. If you want to uninstall
    
                  ./install.sh remove
- ubuntu
    + [serialportassistant_0.4.1_amd64.deb](https://github.com/KangLin/SerialPortAssistant/releases/download/v0.4.1/serialportassistant_0.4.1_amd64.deb)

            sudo dpkg -i serialportassistant_0.4.1_amd64.deb

6. Donate  
If you are satisfied, you can donate to me

- Donation (greater than ¥20):  
![donation (greater than ¥20)](https://github.com/KangLin/RabbitCommon/raw/master/Src/Resource/image/Contribute.png "donation (greater than ¥20)")

- Donate ¥20  
![donation ¥20](https://github.com/KangLin/RabbitCommon/raw/master/Src/Resource/image/Contribute20.png "donation ¥20")
    
7. Dependence
  RabbitCommon: https://github.com/KangLin/RabbitCommon
  
  ```
  git clon https://github.com/KangLin/RabbitCommon.git
  ```
  
8. Compile
    - Compiled with QtCreator
       * Open the project file ![SerialPortAssistant.pro](SerialPortAssistant.pro) with QtCreator
       * Set the parameter RabbitCommon_DIR
       * Direct compilation can generate programs
    - Compile with the command line
       * Build the build directory in the project root directory
       * *qmake* build compilation project
       * *make* install Build the program with the local toolchain
       * The program is generated in the *install* directory

    ```sh
    mkdir build
    cd build
    qmake ../SerialPortAssistant.pro
    make install
    cd install  #The program is generated in the install directory
    ```
