;name = QIUYUAN YIN
;email = z5003845@unsw.edu.au
;date = 06/08/2014
;version number =1.0
;summation of x^i from i=1 to n 
; int sum
; for (a = 0;a < i ;a ++)
;  {
;    sum= X^a
;}
.include "m64def.inc"
.def N = r31
.def X = r30
.def a = r29
.def sum_low=r19
.def sum_high=r20
.def temp=r28
ldi a ,$1;						;initialize a with 1
clr sum_high					;initialize high bit of result
mov sum_low,x 					;initialize low bit of result

LOOP:
	cp n,a    					;compare a with n
	brlo END 					;if a=n=1 , summation=X
	inc x 						;sum*X+sum= sum*(X+1),so increase X by 1,
	mul x,sum_low               ;multiply 
	mov temp,r1  				;temp stores the middle bits of multiplication of 16bits*8bits
	mov sum_low,r0 				;move r0 to sum_low as the low bits of multiplication of 16bits*8bits
	mul b,sum_high				;b multiply sum_high
	mov sum_high,r1 			;mov r0 to sum_high as the middle bits of multiplication of 16bits*8bits
	add sum_high,temp 			;add the two middle bits and store final result in sum_high
	inc a 						;increase a by 1
	rjmp LOOP					;jump to LOOP

END:
	rjmp END