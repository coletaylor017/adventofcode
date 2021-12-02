main:
# first part: 1759
# second part: 1805

# t4 is the overall counter
li $t4, 0

# t0 is 3 numbers ago
li $v0, 5
syscall
move $t0, $v0

#t1 is 2 numbers ago
li $v0, 5
syscall
move $t1, $v0
	
#t2 is last number
li $v0, 5
syscall
move $t2, $v0

loop: 
	# read integer
	li $v0, 5
	syscall
	
	# break out of loop if we read -1 (use t3 as temp)
	li $t3, -1
	beq $v0, $t3, loopEnd
	
    # t5 is last triple
    # t3 is temp variable storing sum of last two
    add $t3, $t1, $t2
    add $t5, $t3, $t0

    # t6 is the current triple
    # Re-use t3 as it already contains sum of last two
    add $t6, $t3, $v0

	# check if curr > last
	ble $t6, $t5, currIsLess # t6 is <= t5, i.e. curr <= last
	
		# curr > last. increment counter
		addi $t4, $t4, 1
	
	currIsLess:
	
	# set vars for next iteration
    move $t0, $t1
    move $t1, $t2
    move $t2, $v0
	
	# repeat loop
	j loop
	
loopEnd:
	
# print the result
move $a0, $t4
li $v0, 1 # print int
syscall

li $v0, 10
syscall
