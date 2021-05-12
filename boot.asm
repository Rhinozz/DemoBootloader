    BITS 16 ;tells compiler that we're in 16-bit real mode; not an instruction

start:
	mov ax, 600h ;set blank value for ax
	mov bx, 700h ;set blank value for bx
	xor cx, cx ;get upper left corner of window

    ;position cursor to lower right corner
	mov ax, 18h
	shl ax, 8h
	add ax, 4Fh
	mov dx, ax	
	int 10h

	mov ax, 200h ;access cursor position service
	xor bx, bx ;get page position
	xor dx, dx ;row and column position
	int 10h ;clear screen

    mov ah, 06h ;set display mode
    xor al, al ;clear entire scrolled screen
    xor cx, cx ;set upper left corner coordinates
    mov dx, 184FH ;set lower right corner coordinates
    mov bh, 17h ;set color scheme - white on blue
    int 10H ;apply color scheme

print_string: ;routine to output string in SI to screen
    mov ah, 0Eh ;set ah to int 0E (teletype mode)

.strprint:
    lodsb ;get character from string
    cmp al, 0 ;compare letter to end of string character
    je .repeat ;if char is zero, set end of string
    int 10h ;otherwise, print it
    jmp .strprint ;loop

.repeat:
    mov ah, 0
    int 16h ;wait for keyboard input
    cmp al, 0x08 ;compare input to backspace
    je back ;if input is backspace, run back and return
    cmp al, 0x0D ;compare input to enter
    int 10h ;and print
    jmp .repeat ;repeat for more letters

.back:
    mov ah, 0Eh ;set ah to int 0E (teletype mode)
    mov al, 0x08 ;backspace
    int 10h ;print
    mov al, 0x20 ;space
    int 10h ;print
    mov al, 0x08 ;2nd backspace
    int 10h ;print
    jmp .repeat ;return to repeat

    times 510-($-$$) db 0 ;create 512-byte file
    dw 0xAA55 ;boot loader signature, letting compiler know it's the bootloader