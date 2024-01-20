.data
n: .word 0  # The position of the Fibonacci number to calculate

.text
.globl main
main:
    # Read n from the user
    li a7, 5  # System call number for read integer
    ecall  # Read the number
    la t0, n  # Load the address of n into t0
    sw a0, 0(t0)  # Store the number in n

    lw a1, 0(t0)  # Load n into a1

    # Initialize the first two Fibonacci numbers
    li a2, 0  # Fib(0)
    li a3, 1  # Fib(1)

    # Calculate the nth Fibonacci number
fib_loop:
    beqz a1, fib_done  # If n is zero, we're done
    add a4, a2, a3  # Calculate the next Fibonacci number
    mv a2, a3  # Move Fib(1) to Fib(0)
    mv a3, a4  # Move the next Fibonacci number to Fib(1)
    addi a1, a1, -1  # Decrement n
    j fib_loop  # Jump back to the start of the loop

fib_done:
    # Print the nth Fibonacci number
    mv a0, a2  # Move the nth Fibonacci number to a0
    li a7, 1  # System call number for print integer
    ecall  # Print the number
    # Exit the program
    li a7, 93           # System call number for exit
    li a0, 0            # Exit code 0
    ecall
