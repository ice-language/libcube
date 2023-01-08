; SSE4 constants
EQUAL_EACH equ 1000b


; length of null terminated string
; uses SSE4
; requires 16 byte alignment, otherwise might now work
; input: rsi
; modfies: rax, rcx 
; output: rax
strlen_sse4:
    xor rax, rax
    pxor xmm0, xmm0
    .loop_strlen_sse4:
        pcmpistri xmm0, [rsi + rax], EQUAL_EACH
        lea rax, [rax + 16]
        jnz .loop_strlen_sse4
    lea rax, [rax + rcx - 16]
    ret
