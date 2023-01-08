%include "include/linux.inc"
%include "string/normal.asm"

[section .rodata]
hex_xlat db "0123456789abcdef"

[section .text]
; prints null terminated string to stdout
; calls _string_length
; takes: rsi
; modifies: rax, rdi, rdx, rcx
printc:
    call strlen_sse4
    mov rdx, rax
    mov rdi, STDOUT
    mov rax, SYS_WRITE
    syscall
    ret

; prints string
; takes: rsi, rdx
; modifies: rax, rdi
prints:
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    syscall
    ret

; prints value
printv:
    ret