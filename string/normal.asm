%ifndef LIB_STRING_NORMAL
%define LIB_STRING_NORMAL

; length of null terminated string
; use this if unaligned and/or short strings
; input: rsi
; modifies: rax, rcx
; output: rax
strlen:
    mov rcx, rsi ; rsi will most likely be reused after
    xor rax, rax
    .loop_strlen:
        cmp byte [rcx], 0
        je .strlen_end
        inc rax
        inc rcx
        jne .loop_strlen
    .strlen_end:
        ret
%endif