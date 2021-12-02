main:
# first part: 1759
# second part: 1805

# t1 is the overall counter
li $t1, 0

# t2 is the last number 
li $v0, 5
syscall
move $t2, $v0
	
loop: 
	# read integer
	li $v0, 5
	syscall
	
	# break out of loop if we read -1
	li $t3, -1
	beq $v0, $t3, loopEnd
	
	# check if curr > last
	ble $v0, $t2, currIsLess # v0 is <= t2
	
		# curr > last. increment counter
		addi $t1, $t1, 1
	
	currIsLess:
	
	# set new last
	move $t2, $v0
	
	# repeat loop
	j loop
	
loopEnd:
	
# print the result
move $a0, $t1
li $v0, 1 # print int
syscall

li $v0, 10
syscall
