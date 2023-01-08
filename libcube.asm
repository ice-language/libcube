%include "platform/linux/print_temp.asm"

%include "string/normal.asm"
%include "string/sse4.asm"

global strlen:function
global strlen_sse4:function

global printc:function
global prints:function
global printv:function