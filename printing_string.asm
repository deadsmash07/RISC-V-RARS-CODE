.data
name:   .string "Arnav Raj\n"
entry_no: .string "2022CS51652\n"

.text
.globl _start

_start:
    # Print the name
    li a0, 1            # File descriptor: 1 (stdout)
    la a1, name         # Load address of the name string into a1
    li a2, 10           # Length of the name string
    li a7, 64           # System call number for write
    ecall
   # print the entry no
    li a0, 1            # File descriptor: 1 (stdout)
    la a1, entry_no         # Load address of the name string into a1
    li a2, 13           # Length of the name string
    li a7, 64           # System call number for write
    ecall

    # Exit the program
    li a7, 93           # System call number for exit
    li a0, 0            # Exit code 0
    ecall
