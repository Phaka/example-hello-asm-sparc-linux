! SPARC assembly for Linux
! System calls for SPARC Linux:
! 4 for write
! 1 for exit

        .section ".text"
        .align 4
        .global _start

_start:
        ! Write system call
        mov     4, %g1          ! System call number for write
        mov     1, %o0          ! File descriptor 1 is stdout
        sethi   %hi(message), %o1
        or      %o1, %lo(message), %o1
        mov     14, %o2         ! Message length
        ta      0x10            ! Make system call

        ! Exit system call
        mov     1, %g1          ! System call number for exit
        mov     0, %o0          ! Return code 0
        ta      0x10            ! Make system call

        .section ".rodata"
        .align 4
message:
        .asciz "Hello, World!\n"
