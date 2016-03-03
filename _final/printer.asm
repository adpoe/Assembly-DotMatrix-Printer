.data
                      #    # " !       ' & % $     + * ) (     / . - ,     3 2 1 0     7 6 5 4     ; : 9 8     ? > = <     C B A @     G F E D     K J I H     O N M L     S R Q P     W V U T     [ Z Y X     _ ^ ] \     c b a `     g f e d     k j i h     0 n m l     s r q p     w v u t     { z y x     | } ~ <-
	line1:	.word	0x50502000, 0x2040c020, 0x00002020, 0x00000000, 0x70702070, 0xf870f810, 0x00007070, 0x70000000,	0x70f07070, 0x70f8f8f0, 0x88087088, 0x70888880, 0x70f070f0, 0x888888f8, 0x70f88888, 0x00207000, 0x00800020, 0x00300008, 0x80102080, 0x00000060, 0x00000000, 0x00000040, 0x10000000, 0x00404020
	line2:	.word	0x50502000, 0x20a0c878, 0x20a81040, 0x08000000, 0x88886088, 0x08888030, 0x00008888, 0x88400010, 0x88888888, 0x88808088, 0x90082088, 0x8888d880, 0x88888888, 0x88888820, 0x40088888, 0x00501080, 0x00800020, 0x00400008, 0x80000080, 0x00000020, 0x00000000, 0x00000040, 0x20000000, 0x00a82020
	line3:	.word	0xf8502000, 0x20a01080, 0x20701040, 0x10000000, 0x08082098, 0x1080f050, 0x20208888, 0x0820f820, 0x80888898, 0x80808088, 0xa0082088, 0x88c8a880, 0x80888888, 0x88888820, 0x40105050, 0x00881040, 0x70f07010, 0x70e07078, 0x903060f0, 0x70f8f020, 0x78b878f0, 0xa88888f0, 0x20f88888, 0x00102020
	line4:	.word	0x50002000, 0x00402070, 0xf8d81040, 0x2000f800, 0x301020a8, 0x20f80890, 0x00007870, 0x30100040, 0x80f088a8, 0x80f0f088, 0xc00820f8, 0x88a88880, 0x70f088f0, 0x88888820, 0x40202020, 0x00001020, 0x88880800, 0x88408888, 0xa0102088, 0x8888a820, 0x80488888, 0xa8888840, 0x40108850, 0x00001020
	line5:	.word	0xf8002000, 0x00a84008, 0x20701040, 0x40000030, 0x082020c8, 0x208808f8, 0x20200888, 0x2020f820, 0x8088f898, 0xb8808088, 0xa0882088, 0x88988880, 0x08a08880, 0xa8888820, 0x40402050, 0x00001010, 0x80887800, 0x8840f888, 0xc0102088, 0x8888a820, 0x70408888, 0xa8508840, 0x20208820, 0x00002020
	line6:	.word	0x50000000, 0x009098f0, 0x20a81040, 0x80000030, 0x88402088, 0x20888810, 0x20008888, 0x00400010, 0x88888880, 0x88808088, 0x90882088, 0x88888880, 0x88909880, 0xd8508820, 0x40802088, 0x00001008, 0x80888800, 0x78408088, 0xa0102088, 0x8888a820, 0x084078f0, 0xa8508840, 0x20407850, 0x00002020
	line7:	.word	0x50002000, 0x00681820, 0x00002020, 0x00200010, 0x70f87070, 0x20707010, 0x00007070, 0x20000000, 0x70f08878, 0x7080f8f0, 0x88707088, 0x708888f8, 0x70887880, 0x88207020, 0x70f82088, 0xf8007000, 0x78f07800, 0x08407878, 0x90907088, 0x7088a870, 0xf0400880, 0x50207830, 0x10f80888, 0x00004020
	line8:	.word	0x00000000, 0x00000000, 0x00000000, 0x00000020, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0xf0000000, 0x00600000, 0x00000000, 0x00000880, 0x00000000, 0x00007000, 0x00000000
	
	
	# Given input array 
	prompt:  	    .asciiz    "Please enter a filename to be printed: \n"
	spaceChar:	    .asciiz    " " 
	newLine:            .asciiz    "\n"
	errorPrintingMSG:   .asciiz    "There was an error while printing\n"
	testOutput:         .asciiz    "This_is_a_test_to_make_sure_the-_printLine_function_works!"
	fnfException:       .asciiz    "\nThat file was not found. \nPlease restart program and try again.\n"
	
	# Test prompts
	registerValues:     .asciiz   "\nEach value that actually makes it to the register, IN ORDER\n"
	
	# Buffers for input and output
	inputFile:          .space    64
	outputBuffer:       .space    80
	blank:              .space    10
	characterBuffer:    .space     1
	lineOfSpaces:       .space    60
	printCharBuffer:    .space     4
	# str:                .asciiz   "T"


.text

# What I know:
#    - This gives me a buffer that is sixty bytes, is full, and has the right data in it.
#    - I can print 5 blank lines correctly with my _printSpacebetweenLine function
#    - I can print any individual character correctly
# To Do: 
#    - Test print a buffer

Main:
	# print prompt
	la    $a0, prompt     	        # load prompt into $a0
	addi  $v0, $zero, 4   	        # prepare for syscall 4 - print a string
	syscall 	                # print string	
	
	# Syscall 8:  Read String from Keyboard	
	la   $a0, inputFile		# load inputFile buffer into $a0
	addi $v0, $zero, 8		# prepare for syscall 8 - get user input
	addi $a1, $zero, 64             # Specify 64 as max length of input 
	syscall		                # Read string - store it at address of inputFile

	# remove the newline which we got in user input
	addi  $s0, $zero, 0             # $s0 = start index of the string
removeNewline:
        lb    $a3, inputFile($s0)       # $a3 = character at current index
        addi  $s0, $s0, 1               # Increment index by 1
        bne   $a3, 0, removeNewline     # If $a3 != 0, continue looping
        addi  $s0, $s0, -2              # $s0 - 2 = position of the newLine character
        sb    $zero, inputFile($s0)     # Replace newLine with a null character (0)	

	# Syscall 13 - Open File
	la    $a0, inputFile            # move user-selected file name into $a0, file to be opened in curr directory
	addi  $a1, $zero, 0             # specify $a1 flag as 0:  open file for READING
	addi  $a2, $zero, 0		# mode is ignored
	addi  $v0, $zero, 13            # prepare for syscall 13 - open file
	syscall                         # open a file (file descriptor returned in $v0)
	move  $s6, $v0                  # store the file descriptor in $s6
	
	blt   $s6, $zero, fileNotFound

	
###########################
##### Merge Main Loop #####
###########################
readAndPrint:	
		# FUNCTION CALL - GOAL: 
	# -------------------------------------------------------------------------------
	# Create a 60-byte (1-line) buffer, corresponding to NEXT line of our input file
	# Assert:  $v0 = 1 if we reach the end of the file. 
	# -------------------------------------------------------------------------------
	# confirm input values
	add  $a0, $zero, $s6           # $a0 = the file descriptor, returned by syscall 13
	la   $a1, outputBuffer         # $a1 = 60 byte outputBuffer
	
	# Store $t values before making a call to _readLine
	addi $sp, $sp, -20
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	# End storage
	
	jal _readLine                  # Function call to fill a buffer with next line; tells us if end of file
	
	# Restore $t values
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 20
	# End restore 
	
	addi $t0, $v0, 0               # $t0 = the return value from _readLine
	  			       # $t0 = 1 if file is empty;  0 if data left to read

	#          #
	# /endCall #
	#          #
		
	
	
	
		# FUNCTION CALL - GOAL: 
	# -------------------------------------------------------------------------------
	# Print the entirety of our 60-byte buffer (8 lines)
	# Assert:  return value is void
	# -------------------------------------------------------------------------------
	
	# Now, pass our ASCII value 60-byte buffer to printBuffer, and print one full line of ASCII values
	la $a0, outputBuffer               # Assert:  $a0 = our 60-byte ASCII buffer
	
	# Store $t values before making a call to _printBuffer
	addi $sp, $sp, -20
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	# End storage
	
	jal _printBuffer               # Function call to fill a buffer with next line; tells us if end of file
				       # Function call is void, so no need to restore return values
				
	# Restore $t values
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 20
	# End restore	
	
	#          #
	# /endCall #
	#          #
	beq  $t0, 1, allDataRead
	j readAndPrint

allDataRead:

  	# Close the file 
  	addi   $v0, $zero, 16       # Syscall 16 -  close file
  	add    $a0, $zero, $s6      # $a0 = file descriptor to close
  	syscall                     # close file
 
	# Terminate program
	addi $v0, $zero, 10          # prepare for syscall 10 - exit
	syscall 	             # exit
	
###            ###
###  /endMain  ###
###	       ###

		
############################	
	
	# exit program
	addi $v0, $zero, 10
	syscall


fileNotFound:
	# throw error if file not found
	la   $a0, fnfException
	addi $v0, $zero, 4
	syscall 
	
	# exit program
	addi $v0, $zero, 10
	syscall


	

##########################
######   FUNTIONS   ######
##########################


# Function:      Read Line (_readLine)
# Purpose:       Read each line of the input file (80 bytes)
# arguments:     $a0 = file address returned by syscall 13
#                $a1 = address of an 60-byte buffer
# return values: $v0 = 1 if end of file is encountered; otherwise 0 	
#                $v1 = A 60-byte buffer full of translated ASCII values
_readLine:
# END of file is?  newLine (ASCII value 10) -> fill up to 80 with spaces (ASCII 32)
# Function would return 0
# READ FILE - byte by byte, each time checking whether it is an end of file. (return value 0 if so)
# always scheck for return value 0 for each byte you read, checking this syscall
# QUESTION:   How tot tell if end of file? Just newline? 


	# Create stack
	addi $sp $sp, -32     
	sw   $ra, 0($sp)
	sw   $a0, 4($sp)
	sw   $a1, 8($sp)
	sw   $s0, 12($sp) 
	sw   $s1, 16($sp)
	sw   $s2, 20($sp)
	sw   $s3, 24($sp)
	sw   $s4, 28($sp)
	# End stack creation
	
	
	# how to read a file one byte at a time ?
	# at each byte, check if end of file... return value 0.... use readfile from above, but only 1 char at a time
	addi $s0, $a0, 0                 # Store the file descriptor passed into $s0
	addi $s1, $a1, 0                 # Store the address of the 80 byte buffer passed into this file in $s1
	addi $s2, $zero, 0               # Assert:   $s2 = counter, intialized to 0
					 #           We use $s2 to count the number of bytes stored
					 #           in 80 byte output buffer so far
	addi $t6, $zero, 0               # Assert:  $t6 = each character, as it is pulled from file.
	 
readNextChar:
################################
##### File is READ here ########
################################
	bgt   $s2, 79, exitReadFile      # After going through this section 80x and storing all 80 bytes
					 # in the 80 byte output buffer, exit this function
	# Syscall 14 - Read from the file opened by syscall 13
	addi  $a0, $s0, 0                # Confirm:  descriptor of opened file to read is in $a0 	
	la    $a1, characterBuffer       # Confirm:  address of outbuffer is in $a1
	addi  $a2, $zero, 1              # read file one byte at a time
	addi  $v0, $zero, 14             # prepare for syscall 14 - read file         
	syscall                          # READ:   1 char FROM file referenced in $s6 
	 		                 #         TO - output buffer
	 		    		 # After RETURNING from this call:
	 		    		 # $v0 = returns the number of characters written to buffer; neg if error
	 		    		 # if $v0 = 0, means END of file
	 		    		 
	# *** NOTE:  $a1 now contains the next character read from file ***

	# Check if end of file is reached 
	blt  $v0, $zero, endFileReached  # if value stored in $v0 < 1, that is (0 or negative) then read complete
				         # $v0 < 1 means:   __end_of_file__   OR   __error__
	
	

##############################################################################
#### CONFIRM:  We are pulling out correct characters from the file ###########	
##############################################################################
	# print return value 
	addi $a0, $a1, 0
	addi $v0, $zero, 4
	# syscall
	
	lbu  $t6, 0($a1)
##############################################################################	
	
	# check if newline is reached		    				    		
	beq   $t6, 10, newLineReached       
	bne   $t6, 10, regularCharacter
	
	
regularCharacter:	
	# IF END file NOT reached -- STORE the byte in characterBuffer in the output buffer
	# ONE byte at a time, THEN increment value of OUTPUT BUFFER, and go back through loop.....
	# until... a counter starting at 0, ending at 79.... if GREATER THAN 79, DONT do syscall 14 at all... 
	# leave this function, and ..... pass the built output buffer somewhere else...
	# but need to pass only a 32 bit register at a time to the output.... why...
	addi  $t6, $t6, -32                # Decrement by 32 to make it an ASCII Value
#########################################
###### CHECK STORAGE VALUES #############
#########################################	
	# print return value 
	sb   $t6, 0($a0)
	addi $v0, $zero, 4
	#syscall
	
	
	# print charNum of each value 
	addi $a0, $t6, 0
	addi $v0, $zero, 1
	#syscall 

	# print a newLine, so we can see all the correlated values for each char 
	la   $a0, newLine
	addi $v0, $zero, 4
	#syscall
	
##########################################
##########################################
	sb    $t6, 0($s1)           	   # Assert: $a1 = character just read in from file
					   # Assert: $s1 = output buffer, 80 bytes long
					   # store byte num = to counter in that byte of output buffer
	addi  $s1, $s1, 1                  # Increment $s1 +1, so that next time we come through this loop
					   # we will be able ot access byte n+1 in memory address of output buffer
	addi  $s2, $s2, 1                  # COUNTER + 1.  Keep track of how many bytes we've written to in our
					   # 80 byte output buffer		
	# If end of file NOT reached, print what's in the buffer --- make this a sb for current position of outputbuff
 	# la    $a0, outputBuffer          # Set $a0 = address of output buffer
 	# addi  $v0, $zero, 4              # Syscall 4: Print string
 	# syscall                          # Print the string prompt1	
 	addi $v0, $zero, 0                 # $v0 = 0; file has not ended 
 	j readNextChar 			
	
newLineReached:
	# If newLine encountered, fill the rest of 80 byte buffer with spaces -> ASCII 32
	#  Need to determine how many spaces left on current line... fill THAT MANY with ASCII 32

	# find first line of buffer which != 0, fill with number 32
	addi $v0, $zero, 0                 # $v0 = zero in this instance because file is not ended
	#addi $s3, $zero, 0                 # $s3 = 32. ASCII Character for SPACE
fillSpace:
	bgt  $s2, 79, exitReadFile         # After we are at position 80 in output buffer, leave the function
	sb   $zero, 0($s1)                 # Store a SPACE in the current byte $s1
	addi $s1, $s1, 1                   # Increment position of buffer by 1
	addi $s2, $s2, 1                   # Increment counter + 1
	addi $v0, $zero, 0                 # $v0 = 0; file has not ended 		
	j fillSpace

endFileReached:      
	# Store return value
	addi $v0, $zero, 1	           # $v0 = 1 if we have reached the end of file
	j exitReadFile
	
exitReadFile:
	addi $v1, $s1, 0                   # Store ASCII values we found in $v1 as a return value on file exit
					   # We do this whether it's end of file or NOT. 
	# Destroy stack
	lw   $s4, 28($sp)
	lw   $s3, 24($sp)
	lw   $s2, 20($sp)
	lw   $s1, 16($sp)
	lw   $s0, 12($sp)
	lw   $a1, 8($sp)
	lw   $a0, 4($sp)
	lw   $ra, 0($sp)
	addi $sp $sp, 32     
	# End stack destruction
	jr $ra


# Function:      Print Line (_printLine)
# Purpose:       Print one line of dots, based on the 80-byte buffer and the line data
# arguments:     $a0 = address of 60-byte buffer
#                $a1 = address of the line data to be used (i.e. - address of labels line1 to line 8)
# return value:  void.  Send data to printer one word (32 bits) at a time, for 15 words.	
_printLine:
	# Create stack
	addi $sp $sp, -32     
	sw   $ra, 0($sp)
	sw   $a0, 4($sp)
	sw   $a1, 8($sp)
	sw   $s0, 12($sp) 
	sw   $s1, 16($sp)
	sw   $s2, 20($sp)
	sw   $s3, 24($sp)
	sw   $s4, 28($sp)
	# End stack creation
	
	
	# declare variables
	addi $t0, $a0, 0                # Set $t0 = input buffer
	addi $s1, $a1, 0                # Set $s1 = to the line buffer we need to map against
	addi $s2, $zero, 0              # $s2 = each individual character to print
	addi $s3, $zero, 0              # $s3 = counter, do it 15x

	
#############################
###### Perform mapping ######
#############################	
mapAndPrint:
bgt  $s3, 14, exitPrintLine
		
# do once for each register x15

############ Char 1 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)	       # lbu 0($register) to access the specific char we want to print
	
	#############
	# Confirm, we are getting a diff value in $s0 every time
	la   $a0, newLine
	addi $v0, $zero, 4
	#syscall
	
	move $a0, $s0
	addi $v0, $zero, 1
	#syscall 
	# Test
	###########
	
	add  $s1, $s1, $s0             # addi $character value and address
	lbu  $t7, 0($s1)
	
	#############
	# Confirm, we are storing a different value in $t7 every time
	la   $a0, spaceChar
	addi $v0, $zero, 4
	#syscall
	
	move $a0, $t7
	addi $v0, $zero, 1
	#syscall 
	# Test
	###########
	

	# shift for 1st char
	sll  $t7, $t7, 24           # Shift left 24
	add  $t8, $t8, $t7		
	#sb   $t7, 3($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address
	
############ Char 2 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0              # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	sll  $t7, $t7, 18           # Shift left 16
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address
	
############ Char 3 ##############
	addi $s1, $a1, 0              # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0            # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 3rd char
	sll  $t7, $t7, 12             # Shift left 8
	add  $t8, $t8, $t7				
	#sb   $t7, 1($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address

############ Char 4 ##############
	addi $s1, $a1, 0              # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0            # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 4th char
	sll  $t7, $t7, 6              # Shift left 0
	add  $t8, $t8, $t7		
	
	# sb   $t7, 0($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address
	
#####################################
#####################################
############ Char 5 ##############
	addi $s1, $a1, 0              # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0            # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 4th char
	sll  $t7, $t7, 0              # Shift left 1
	add  $t8, $t8, $t7		
	
	# sb   $t7, 0($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address
	
#####################################
#####################################

############ Char 6 - Part 1 ##############
	addi $s1, $a1, 0              # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0            # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)              # $t7 = the actual value of char 6, un-manipulated
	and  $t6, $t7, 192             # $t6 = the 2 bits I need for the first register I'm sending
	srl  $t6, $t6, 6 
	# shift for 4th char
	# srl  $t7, $t7, 5            # Shift left 0 
	add  $t8, $t8, $t6	      # Add last 2 bits of $t6 to $t8		
	# sb   $t7, 0($t6)

	# $t7 = the full value from Char 6	
	# hold $t6, which has the last 2 values in top.... 

####################################
######## Print values - 1 ##########
####################################


	addi $t9, $zero, 1
	addi $s3, $s3, 1
	# addi $t6, $t6, -4     # Restore $t6
	addi $t8, $zero, 0      # clear $t8
	bgt  $s3, 14, exitPrintLine
	
	
#####################################
#####################################	

############ Char 6 - Part 2 ##############
        and  $t7, $t7, 56             # $t6 = the bottom 3 bits I need for the 2nd register I'm sending
        srl  $t7, $t7, 3 	      # remove 3 blank bits from end of character
	sll  $t7, $t7, 29	      # Shift the bottom 3 bits of character 6 to top of 2nd register
	# shift for 4th char 
	# srl  $t7, $t7, 5            # Shift left 0
	add  $t8, $t8, $t7	      # Add  bits of $t7 to $t8	
	# sb   $t7, 0($t6)
	addi $t0, $t0, 1              # increment $t0 by 1, so we can index next byte in address

############ Char 7 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	sll  $t7, $t7, 20             # Shift left 20
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address      

############ Char 8 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	sll  $t7, $t7, 14             # Shift left 14
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address      
             
############ Char 9 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	sll  $t7, $t7, 8             # Shift left 8
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1               # increment $s0 by 1, so we can index next byte in address      
      
############ Char 10 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1) 
	# shift for 2nd char 
	sll  $t7, $t7, 2               # Shift left 3 
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1               # increment $s0 by 1, so we can index next byte in address      
 
############ Char 11 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	 # store leftover values
      	and  $t6, $t7, 8              # store the bit which was missed
      	# keep last few values for this iteration
	srl  $t7, $t7, 4               # Shift right by 3 to remove bottom 3 bits
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6) 

     
	# now, $t6 = the last 1 bit
	
####################################
######## Print values - 2 ##########
####################################

	#la $t8, printCharBuffer
	addi $t9, $zero, 1
	addi $s3, $s3, 1
	# addi $t6, $t6, -4     # Restore $t6
	addi $t8, $zero, 0    # clear $t8
	bgt  $s3, 14, exitPrintLine
################################### 
 
########## Char 11 - part 2 ########
	srl  $t6, $t6, 3              # remove last 3 bits, so we only have the one bit leftover
	sll  $t7, $t6, 31	      # Shift the bottom 1 bits of character 11 to top of 2nd register
	# shift for 4th char 
	# srl  $t7, $t7, 5            # Shift left 0
	add  $t8, $t8, $t7	      # Add  bits of $t7 to $t8	
	# sb   $t7, 0($t6)
	addi $t0, $t0, 1              # increment $t0 by 1, so we can index next byte in address

############ Char 12 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	sll  $t7, $t7, 22             # Shift left 20
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address      

############ Char 13 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	sll  $t7, $t7, 16             # Shift left 14
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1              # increment $s0 by 1, so we can index next byte in address      
             
############ Char 14 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	sll  $t7, $t7, 10             # Shift left 8
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1               # increment $s0 by 1, so we can index next byte in address      
      
############ Char 15 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1) 
	# shift for 2nd char 
	sll  $t7, $t7, 4               # Shift left 3 
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6)
	addi $t0, $t0, 1               # increment $s0 by 1, so we can index next byte in address      
 
############ Char 16 ##############
	addi $s1, $a1, 0               # load the address of the line we want to print
	lbu  $s0  0($t0)
	add  $s1, $s1, $s0             # $s2 = the mapped character address in $s2
	lbu  $t7, 0($s1)
	# shift for 2nd char
	 # store leftover values
      	#and  $t6, $t7, 8              # store the bit which was missed
      	# keep last few values for this iteration
	srl  $t7, $t7, 2               # Shift right by 3 to remove bottom 3 bits
	add  $t8, $t8, $t7		
	#sb   $t7, 2($t6) 
	addi $t0, $t0, 1               # increment $s0 by 1, so we can index next byte in address      
       
     
	# now, $t6 = the last 1 bit
	
####################################
######## Print values - 3 ##########
####################################

	#la $t8, printCharBuffer
	addi $t9, $zero, 1
	addi $s3, $s3, 1
	# addi $t6, $t6, -4     # Restore $t6
	addi $t8, $zero, 0    # clear $t8
	bgt  $s3, 14, exitPrintLine
###################################
	
		
			
					
	j mapAndPrint


	# increment $s0, we want next address in input buffer


	# pull all four values... increment four on $a0
	# repeat 15x	

exitPrintLine:
	# Destroy stack
	lw   $s4, 28($sp)
	lw   $s3, 24($sp)
	lw   $s2, 20($sp)
	lw   $s1, 16($sp)
	lw   $s0, 12($sp)
	lw   $a1, 8($sp)
	lw   $a0, 4($sp)
	lw   $ra, 0($sp)
	addi $sp $sp, 32     
	# End stack destruction
	jr $ra
	
	

# Function:      Print Buffer (_printBuffer)
# Purpose:       Print one 60 byte buffer to the printer
# arguments:     $a0 = address of 60-byte inputBuffer
# return value:  void.  Should call _printLine 8 times.	
_printBuffer:
	# Create stack
	addi $sp $sp, -32     
	sw   $ra, 0($sp)
	sw   $a0, 4($sp)
	sw   $a1, 8($sp)
	sw   $s0, 12($sp) 
	sw   $s1, 16($sp)
	sw   $s2, 20($sp)
	sw   $s3, 24($sp)
	sw   $s4, 28($sp)
	# End stack creation
	
	
	# declare variables
	addi $a0, $a0, 0       # Assert:  $a0 = the 60 byte buffer passed to printBuffer
			       # We will now print it 8x -> Once for EACH line
			       # This operation with will form a full dot-matrix line


	la   $a1, line1
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 
	
	la   $a1, line2
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 
	
	
	la   $a1, line3
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 

	la   $a1, line4
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 

	la   $a1, line5
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage	
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 

	la   $a1, line6
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 

	la   $a1, line7
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 

	la   $a1, line8
	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 

	# Store $t values before making a call to _printline
	addi $sp, $sp, -40
	sw   $a0, 0($sp)
	sw   $a1, 4($sp)
	sw   $t0, 8($sp)
	sw   $t1, 12($sp)
	sw   $t2, 16($sp)
	sw   $t3, 20($sp)
	sw   $t4, 24($sp)
	sw   $t5, 28($sp)
	sw   $t6, 32($sp)
	sw   $t7, 36($sp)
	# End storage
	jal _printSpaceBetweenLine
	# Restore $t values
	lw  $t7, 36($sp)
	lw  $t6, 32($sp)
	lw  $t5, 28($sp)
	lw  $t4, 24($sp)
	lw  $t3, 20($sp)
	lw  $t2, 16($sp)
	lw  $t1, 12($sp)
	lw  $t0, 8($sp)
	lw  $a1, 4($sp)
	lw  $a0, 0($sp)
	addi $sp, $sp, 40
	# End restore 
	
	
exitPrintBuffer:
	# Destroy stack
	lw   $s4, 28($sp)
	lw   $s3, 24($sp)
	lw   $s2, 20($sp)
	lw   $s1, 16($sp)
	lw   $s0, 12($sp)
	lw   $a1, 8($sp)
	lw   $a0, 4($sp)
	lw   $ra, 0($sp)
	addi $sp $sp, 32     
	# End stack destruction
	jr $ra
	

# Function:      Print Buffer (_printBuffer)
# Purpose:       Print space between lines. Space between two lines of characters should be 5-dots high.
#                Save 5 15-word data to printer where each word is 0
#                Recall:  Can only send one word at a time.
# arguments:     None
# return value:  void.  Should interface with the printer application.
_printSpaceBetweenLine:
	# Create stack
	addi $sp $sp, -32     
	sw   $ra, 0($sp)
	sw   $a0, 4($sp)
	sw   $a1, 8($sp)
	sw   $s0, 12($sp) 
	sw   $s1, 16($sp)
	sw   $s2, 20($sp)
	sw   $s3, 24($sp)
	sw   $s4, 28($sp)
	# End stack creation
	
	addi $s0, $zero, 0    # set a line counter = 0
printLine:
	bgt  $s0, 4, endPrintSpace
	addi $t0, $zero, 0    # set a space counter = 0
printSpace:
	bgt  $t0, 14, IncrementLineCounter
	# print a blank space 15 times (=1 line)	
	addi $t8, $zero, 0 
	addi $t9, $zero, 1
	addi $t0, $t0, 1
	j printSpace

IncrementLineCounter:	
	addi $s0, $s0, 1
	j printLine

endPrintSpace:
	# Destroy stack
	lw   $s4, 28($sp)
	lw   $s3, 24($sp)
	lw   $s2, 20($sp)
	lw   $s1, 16($sp)
	lw   $s0, 12($sp)
	lw   $a1, 8($sp)
	lw   $a0, 4($sp)
	lw   $ra, 0($sp)
	addi $sp $sp, 32     
	# End stack destruction
	jr $ra
	

	
