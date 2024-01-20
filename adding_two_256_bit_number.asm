.data
num1: .word 111, 0, 0, 3, 8, 0, 0, 89  # First large number (8 x 32 bits)
num2: .word 111, 0, 0, 4, 3, 0, 0, 2  # Second large number (8 x 32 bits)
result: .word 0, 0, 0, 0, 0, 0, 0, 0, 0  # Result of the addition (8 x 32 bits + 1 for carry)

.text
.globl main
main:
    la a0, num1  # Load address of first number
    la a1, num2  # Load address of second number
    la a2, result  # Load address of result
    li a3, 8  # Counter for the loop

add_loop:
    lw t0, 0(a0)  # Load a chunk of the first number
    lw t1, 0(a1)  # Load a chunk of the second number
    add t2, t0, t1  # Add the chunks
    sw t2, 0(a2)  # Store the result

    addi a0, a0, 4  # Move to the next chunk of the first number
    addi a1, a1, 4  # Move to the next chunk of the second number
    addi a2, a2, 4  # Move to the next chunk of the result

    addi a3, a3, -1  # Decrement the counter
    bnez a3, add_loop  # If the counter is not zero, loop again

    # Print the result
    la a0, result  # Load address of result
    li a4, 8  # Counter for the loop


print_loop:
    lw a0, 0(a1)  # Load a part of the result into a0
    li a7, 1  # System call number for print integer
    ecall  # Print the part

    addi a1, a1, 4  # Move to the next part of the result
    addi a4, a4, -1  # Decrement the counter
    bnez a4, print_loop  # If the counter is not zero, loop again
        # Exit the program
    li a7, 93           # System call number for exit
    li a0, 0            # Exit code 0
    ecall
