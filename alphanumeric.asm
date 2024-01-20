.data
X: .string "2022CS561652"  # The string X
name: .string "Golden"  # The letter from the name "Golden"

.text
.globl main
main:
    # Print the letter from the name
    la a1, name  # Load the address of the name into a1
    lbu a0, 0(a1)  # Load the letter into a0
    li a7, 11  # System call number for print character
    ecall  # Print the letter

    # Print the first character of X
    la a1, X  # Load the address of X into a1
    lbu a0, 0(a1)  # Load the first character into a0
    li a7, 11  # System call number for print character
    ecall  # Print the character
    # Exit the program
    li a7, 93           # System call number for exit
    li a0, 0            # Exit code 0
    ecall
