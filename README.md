# DemoBootloader
Commented demo bootloader in assembly, for reference

Only tested in QEmu. The only feature is typing, but it's a great start. Note that CTRL and ALT do not have the same functions as on Windows, Linux, or any other OS. Also, arrow keys and enter do not work - however, for enter, you can use CTRL + enter.

The code is commented up in the .asm file. To build, install NASM and run the command:

```
nasm -f bin boot.asm -o boot.bin
```

You can then run the binary file in QEmu.

Here's a demo video. Note that instead of compiling myself, I run a batch file - it contains the command above, as well as one starting QEmu.

https://user-images.githubusercontent.com/68926744/118056046-2d643280-b357-11eb-9be6-842511d881d0.mp4

Enjoy and I hope this helps someone!
