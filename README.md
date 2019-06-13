# Ejercicios para Tecnicas III
 - examples/td_*

# Firmware v2
Firmware v2 is a C language software development environment for embedded
systems. At the moment it focuses specifically on the programming of 
microcontrollers.

## IMPORTANT

**This environment is under construction!!**

**Always use the [released versions](../../releases) because in these all examples are tested and the API documentation is consistent. The master branch may contain inconsistencies because this environment is currently under development.**

## Supported targets
- LPC11U68
- LPC1769
- LPC4337 (M4 and M0 cores)
- LPC54102 (M4 and M0+ cores)

## Supported boards
- CIAA-NXP and EDU-CIAA-NXP (www.proyecto-ciaa.com.ar)
- LPCXpresso with LPC1769
- LPCXpresso with LPC54102
- LPCXpresso with LPC11U68

## Available libraries
- [sAPI](https://github.com/epernia/sapi) (only for EDU-CIAA-NXP board).
- [CMSIS](http://www.arm.com/products/processors/cortex-m/cortex-microcontroller-software-interface-standard.php). and [LPCOpen](https://www.lpcware.com/lpcopen).
- [CMSIS-DSPLIB](http://www.keil.com/pack/doc/CMSIS/DSP/html/index.html).
- [lwip](http://lwip.wikia.com/wiki/LwIP_Wiki).
- [FreeRTOS](http://www.freertos.org/).

## Supported toolchains
- gcc-arm-none-eabi
## VERY IMPORTANTE
- si lo corres con Ubuntu 18.04 vas a tener problemas con la versión del cross compiler, tiene un bug
- te sugiero downgradearlo
- apt install gcc-arm-none-eabi #instala las lib y las utils 
- apt remove gcc-arm-none-eabi # borrar solo el gcc
- descargar uno anterior de http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-arm-none-eabi/gcc-arm-none-eabi_4.9.3+svn231177-1_amd64.deb
- descargar una biblioteca de punto flotante que le va a faltar de http://archive.ubuntu.com/ubuntu/pool/main/m/mpfr4/libmpfr4_3.1.4-1_amd64.deb
- instalar primero la bib con # dpkg -i libmpfr4_3.1.4-1_amd64.deb
- finalmente gcc para arm con # dpkg -i gcc-arm-none-eabi_4.9.3+svn231177-1_amd64.deb


## Usage
* Make sure you have an ```arm-none-eabi-*``` toolchain configured in your ```PATH```. If you don't have it, download [GCC ARM Embedded](https://launchpad.net/gcc-arm-embedded).
* ```git clone https://github.com/pridolfi/workspace.git && cd workspace```
* ```cp project.mk.template project.mk```
* Define ```PROJECT```, ```TARGET``` and ```BOARD``` (optional) variables in ```project.mk``` according to the project you want to compile.
* Compile with ```make```.
* Clean with ```make clean```. Clean for all targets with ```make clean_all```.
* Download to target via OpenOCD with ```make download```.

## This environment is based on

- **Workspace** by Pablo Ridolfi: <https://github.com/pridolfi/workspace>
- **sAPI** by Eric pernia: <https://github.com/epernia/sapi>

