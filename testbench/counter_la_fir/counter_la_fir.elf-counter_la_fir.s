	.file	"counter_la_fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/course-lab_4_2/testbench/counter_la_fir" "counter_la_fir.c"
	.align	2
	.type	flush_cpu_icache, @function
flush_cpu_icache:
.LFB21:
	.file 1 "../../firmware/system.h"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	flush_cpu_icache, .-flush_cpu_icache
	.align	2
	.type	flush_cpu_dcache, @function
flush_cpu_dcache:
.LFB22:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 33 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	flush_cpu_dcache, .-flush_cpu_dcache
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
.LFB316:
	.file 2 "../../firmware/stub.c"
	.loc 2 19 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	mv	a5,a0
	sb	a5,-17(s0)
	.loc 2 20 5
	lbu	a4,-17(s0)
	li	a5,10
	bne	a4,a5,.L6
	.loc 2 21 3
	li	a0,13
	call	putchar
.L6:
	.loc 2 22 11
	nop
.L5:
	.loc 2 22 13 discriminator 1
	li	a5,-268410880
	addi	a5,a5,-2044
	lw	a4,0(a5)
	.loc 2 22 60 discriminator 1
	li	a5,1
	beq	a4,a5,.L5
	.loc 2 23 3
	li	a5,-268410880
	addi	a5,a5,-2048
	.loc 2 23 50
	lbu	a4,-17(s0)
	sw	a4,0(a5)
	.loc 2 24 1
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	putchar, .-putchar
	.align	2
	.globl	print
	.type	print, @function
print:
.LFB317:
	.loc 2 27 1
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 28 8
	j	.L8
.L9:
	.loc 2 29 14
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	.loc 2 29 3
	lbu	a5,0(a5)
	mv	a0,a5
	call	putchar
.L8:
	.loc 2 28 9
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L9
	.loc 2 30 1
	nop
	nop
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	print, .-print
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB318:
	.file 3 "counter_la_fir.c"
	.loc 3 35 1
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	.loc 3 63 3
	li	a5,637534208
	addi	a5,a5,160
	.loc 3 63 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 64 3
	li	a5,637534208
	addi	a5,a5,156
	.loc 3 64 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 65 3
	li	a5,637534208
	addi	a5,a5,152
	.loc 3 65 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 66 3
	li	a5,637534208
	addi	a5,a5,148
	.loc 3 66 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 67 3
	li	a5,637534208
	addi	a5,a5,144
	.loc 3 67 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 68 3
	li	a5,637534208
	addi	a5,a5,140
	.loc 3 68 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 69 3
	li	a5,637534208
	addi	a5,a5,136
	.loc 3 69 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 70 3
	li	a5,637534208
	addi	a5,a5,132
	.loc 3 70 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 71 3
	li	a5,637534208
	addi	a5,a5,128
	.loc 3 71 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 72 3
	li	a5,637534208
	addi	a5,a5,124
	.loc 3 72 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 73 3
	li	a5,637534208
	addi	a5,a5,120
	.loc 3 73 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 74 3
	li	a5,637534208
	addi	a5,a5,116
	.loc 3 74 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 75 3
	li	a5,637534208
	addi	a5,a5,112
	.loc 3 75 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 76 3
	li	a5,637534208
	addi	a5,a5,108
	.loc 3 76 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 77 3
	li	a5,637534208
	addi	a5,a5,104
	.loc 3 77 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 78 3
	li	a5,637534208
	addi	a5,a5,100
	.loc 3 78 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 80 3
	li	a5,637534208
	addi	a5,a5,96
	.loc 3 80 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 81 3
	li	a5,637534208
	addi	a5,a5,92
	.loc 3 81 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 82 3
	li	a5,637534208
	addi	a5,a5,88
	.loc 3 82 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 83 3
	li	a5,637534208
	addi	a5,a5,84
	.loc 3 83 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 84 3
	li	a5,637534208
	addi	a5,a5,80
	.loc 3 84 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 85 3
	li	a5,637534208
	addi	a5,a5,76
	.loc 3 85 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 86 3
	li	a5,637534208
	addi	a5,a5,72
	.loc 3 86 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 87 3
	li	a5,637534208
	addi	a5,a5,68
	.loc 3 87 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 88 3
	li	a5,637534208
	addi	a5,a5,64
	.loc 3 88 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 89 3
	li	a5,637534208
	addi	a5,a5,60
	.loc 3 89 36
	li	a4,8192
	addi	a4,a4,-2039
	sw	a4,0(a5)
	.loc 3 90 3
	li	a5,637534208
	addi	a5,a5,56
	.loc 3 90 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 91 3
	li	a5,637534208
	addi	a5,a5,52
	.loc 3 91 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 92 3
	li	a5,637534208
	addi	a5,a5,48
	.loc 3 92 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 93 3
	li	a5,637534208
	addi	a5,a5,44
	.loc 3 93 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 94 3
	li	a5,637534208
	addi	a5,a5,40
	.loc 3 94 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 95 3
	li	a5,637534208
	addi	a5,a5,36
	.loc 3 95 36
	li	a4,8192
	addi	a4,a4,-2040
	sw	a4,0(a5)
	.loc 3 99 3
	li	a5,-268410880
	.loc 3 99 50
	li	a4,1
	sw	a4,0(a5)
	.loc 3 102 3
	li	a5,637534208
	.loc 3 102 36
	li	a4,1
	sw	a4,0(a5)
	.loc 3 103 8
	nop
.L11:
	.loc 3 103 10 discriminator 1
	li	a5,637534208
	lw	a4,0(a5)
	.loc 3 103 43 discriminator 1
	li	a5,1
	beq	a4,a5,.L11
	.loc 3 107 60
	li	a5,-268423168
	addi	a4,a5,12
	.loc 3 107 114
	li	a5,0
	sw	a5,0(a4)
	.loc 3 107 3
	li	a4,-268423168
	addi	a4,a4,28
	.loc 3 107 57
	sw	a5,0(a4)
	.loc 3 108 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 108 112
	li	a5,-1
	sw	a5,0(a4)
	.loc 3 108 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 108 56
	sw	a5,0(a4)
	.loc 3 109 59
	li	a5,-268423168
	addi	a4,a5,4
	.loc 3 109 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 109 3
	li	a4,-268423168
	addi	a4,a4,20
	.loc 3 109 56
	sw	a5,0(a4)
	.loc 3 110 53
	li	a4,-268423168
	.loc 3 110 100
	li	a5,0
	sw	a5,0(a4)
	.loc 3 110 3
	li	a4,-268423168
	addi	a4,a4,16
	.loc 3 110 50
	sw	a5,0(a4)
	.loc 3 113 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 113 36
	li	a4,-1421869056
	sw	a4,0(a5)
	.loc 3 116 3
	li	a5,-268423168
	addi	a5,a5,56
	.loc 3 116 56
	sw	zero,0(a5)
	.loc 3 119 59
	li	a5,-268423168
	addi	a4,a5,8
	.loc 3 119 112
	li	a5,0
	sw	a5,0(a4)
	.loc 3 119 3
	li	a4,-268423168
	addi	a4,a4,24
	.loc 3 119 56
	sw	a5,0(a4)
	.loc 3 122 6
	li	a5,11
	sw	a5,-28(s0)
	.loc 3 123 6
	li	a5,64
	sw	a5,-32(s0)
	.loc 3 126 3
	li	a5,939528192
	addi	a5,a5,16
	.loc 3 126 36
	lw	a4,-32(s0)
	sw	a4,0(a5)
	.loc 3 129 13
	call	fir
	sw	a0,-36(s0)
	.loc 3 130 38
	lw	a5,-36(s0)
	lw	a4,0(a5)
	.loc 3 130 3
	li	a5,939528192
	addi	a5,a5,32
	.loc 3 130 36
	sw	a4,0(a5)
	.loc 3 131 43
	lw	a5,-36(s0)
	addi	a5,a5,4
	.loc 3 131 38
	lw	a4,0(a5)
	.loc 3 131 3
	li	a5,939528192
	addi	a5,a5,36
	.loc 3 131 36
	sw	a4,0(a5)
	.loc 3 132 43
	lw	a5,-36(s0)
	addi	a5,a5,8
	.loc 3 132 38
	lw	a4,0(a5)
	.loc 3 132 3
	li	a5,939528192
	addi	a5,a5,40
	.loc 3 132 36
	sw	a4,0(a5)
	.loc 3 133 43
	lw	a5,-36(s0)
	addi	a5,a5,12
	.loc 3 133 38
	lw	a4,0(a5)
	.loc 3 133 3
	li	a5,939528192
	addi	a5,a5,44
	.loc 3 133 36
	sw	a4,0(a5)
	.loc 3 134 43
	lw	a5,-36(s0)
	addi	a5,a5,16
	.loc 3 134 38
	lw	a4,0(a5)
	.loc 3 134 3
	li	a5,939528192
	addi	a5,a5,48
	.loc 3 134 36
	sw	a4,0(a5)
	.loc 3 135 43
	lw	a5,-36(s0)
	addi	a5,a5,20
	.loc 3 135 38
	lw	a4,0(a5)
	.loc 3 135 3
	li	a5,939528192
	addi	a5,a5,52
	.loc 3 135 36
	sw	a4,0(a5)
	.loc 3 136 43
	lw	a5,-36(s0)
	addi	a5,a5,24
	.loc 3 136 38
	lw	a4,0(a5)
	.loc 3 136 3
	li	a5,939528192
	addi	a5,a5,56
	.loc 3 136 36
	sw	a4,0(a5)
	.loc 3 137 43
	lw	a5,-36(s0)
	addi	a5,a5,28
	.loc 3 137 38
	lw	a4,0(a5)
	.loc 3 137 3
	li	a5,939528192
	addi	a5,a5,60
	.loc 3 137 36
	sw	a4,0(a5)
	.loc 3 138 43
	lw	a5,-36(s0)
	addi	a5,a5,32
	.loc 3 138 38
	lw	a4,0(a5)
	.loc 3 138 3
	li	a5,939528192
	addi	a5,a5,64
	.loc 3 138 36
	sw	a4,0(a5)
	.loc 3 139 43
	lw	a5,-36(s0)
	addi	a5,a5,36
	.loc 3 139 38
	lw	a4,0(a5)
	.loc 3 139 3
	li	a5,939528192
	addi	a5,a5,68
	.loc 3 139 36
	sw	a4,0(a5)
	.loc 3 140 43
	lw	a5,-36(s0)
	addi	a5,a5,40
	.loc 3 140 38
	lw	a4,0(a5)
	.loc 3 140 3
	li	a5,939528192
	addi	a5,a5,72
	.loc 3 140 36
	sw	a4,0(a5)
	.loc 3 142 38
	lw	a5,-36(s0)
	lw	a4,0(a5)
	.loc 3 142 3
	li	a5,939540480
	addi	a5,a5,32
	.loc 3 142 36
	sw	a4,0(a5)
	.loc 3 143 43
	lw	a5,-36(s0)
	addi	a5,a5,4
	.loc 3 143 38
	lw	a4,0(a5)
	.loc 3 143 3
	li	a5,939540480
	addi	a5,a5,36
	.loc 3 143 36
	sw	a4,0(a5)
	.loc 3 144 43
	lw	a5,-36(s0)
	addi	a5,a5,8
	.loc 3 144 38
	lw	a4,0(a5)
	.loc 3 144 3
	li	a5,939540480
	addi	a5,a5,40
	.loc 3 144 36
	sw	a4,0(a5)
	.loc 3 145 43
	lw	a5,-36(s0)
	addi	a5,a5,12
	.loc 3 145 38
	lw	a4,0(a5)
	.loc 3 145 3
	li	a5,939540480
	addi	a5,a5,44
	.loc 3 145 36
	sw	a4,0(a5)
	.loc 3 146 43
	lw	a5,-36(s0)
	addi	a5,a5,16
	.loc 3 146 38
	lw	a4,0(a5)
	.loc 3 146 3
	li	a5,939540480
	addi	a5,a5,48
	.loc 3 146 36
	sw	a4,0(a5)
	.loc 3 147 43
	lw	a5,-36(s0)
	addi	a5,a5,20
	.loc 3 147 38
	lw	a4,0(a5)
	.loc 3 147 3
	li	a5,939540480
	addi	a5,a5,52
	.loc 3 147 36
	sw	a4,0(a5)
	.loc 3 148 43
	lw	a5,-36(s0)
	addi	a5,a5,24
	.loc 3 148 38
	lw	a4,0(a5)
	.loc 3 148 3
	li	a5,939540480
	addi	a5,a5,56
	.loc 3 148 36
	sw	a4,0(a5)
	.loc 3 149 43
	lw	a5,-36(s0)
	addi	a5,a5,28
	.loc 3 149 38
	lw	a4,0(a5)
	.loc 3 149 3
	li	a5,939540480
	addi	a5,a5,60
	.loc 3 149 36
	sw	a4,0(a5)
	.loc 3 150 43
	lw	a5,-36(s0)
	addi	a5,a5,32
	.loc 3 150 38
	lw	a4,0(a5)
	.loc 3 150 3
	li	a5,939540480
	addi	a5,a5,64
	.loc 3 150 36
	sw	a4,0(a5)
	.loc 3 151 43
	lw	a5,-36(s0)
	addi	a5,a5,36
	.loc 3 151 38
	lw	a4,0(a5)
	.loc 3 151 3
	li	a5,939540480
	addi	a5,a5,68
	.loc 3 151 36
	sw	a4,0(a5)
	.loc 3 152 43
	lw	a5,-36(s0)
	addi	a5,a5,40
	.loc 3 152 38
	lw	a4,0(a5)
	.loc 3 152 3
	li	a5,939540480
	addi	a5,a5,72
	.loc 3 152 36
	sw	a4,0(a5)
.LBB2:
	.loc 3 154 10
	sw	zero,-20(s0)
	.loc 3 154 2
	j	.L12
.L15:
	.loc 3 156 4
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 156 37
	li	a4,10813440
	sw	a4,0(a5)
	.loc 3 157 4
	li	a5,939528192
	.loc 3 157 37
	li	a4,1
	sw	a4,0(a5)
.LBB3:
	.loc 3 161 12
	sw	zero,-24(s0)
	.loc 3 161 3
	j	.L13
.L14:
	.loc 3 162 47 discriminator 3
	lw	a4,-24(s0)
	lw	a5,-28(s0)
	add	a5,a4,a5
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	.loc 3 162 40 discriminator 3
	lw	a4,0(a5)
	.loc 3 162 5 discriminator 3
	li	a5,939532288
	.loc 3 162 38 discriminator 3
	sw	a4,0(a5)
	.loc 3 168 43 discriminator 3
	li	a5,-268423168
	addi	a5,a5,40
	lw	a4,0(a5)
	.loc 3 168 6 discriminator 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 168 96 discriminator 3
	slli	a4,a4,16
	.loc 3 168 39 discriminator 3
	sw	a4,0(a5)
	.loc 3 161 37 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L13:
	.loc 3 161 31 discriminator 1
	lw	a5,-32(s0)
	addi	a5,a5,-1
	.loc 3 161 18 discriminator 1
	lw	a4,-24(s0)
	blt	a4,a5,.L14
.LBE3:
	.loc 3 171 56 discriminator 2
	lw	a4,-32(s0)
	.loc 3 171 58 discriminator 2
	lw	a5,-28(s0)
	add	a4,a4,a5
	li	a5,1073741824
	addi	a5,a5,-1
	add	a5,a4,a5
	slli	a5,a5,2
	lw	a4,-36(s0)
	add	a5,a4,a5
	.loc 3 171 39 discriminator 2
	lw	a4,0(a5)
	.loc 3 171 4 discriminator 2
	li	a5,939532288
	addi	a5,a5,8
	.loc 3 171 37 discriminator 2
	sw	a4,0(a5)
	.loc 3 172 41 discriminator 2
	li	a5,-268423168
	addi	a5,a5,40
	lw	a4,0(a5)
	.loc 3 172 4 discriminator 2
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 172 94 discriminator 2
	slli	a4,a4,16
	.loc 3 172 37 discriminator 2
	sw	a4,0(a5)
	.loc 3 178 94 discriminator 2
	li	a5,-268423168
	addi	a5,a5,40
	lw	a5,0(a5)
	slli	a3,a5,24
	.loc 3 178 4 discriminator 2
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 178 101 discriminator 2
	li	a4,5898240
	add	a4,a3,a4
	.loc 3 178 37 discriminator 2
	sw	a4,0(a5)
	.loc 3 154 25 discriminator 2
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L12:
	.loc 3 154 19 discriminator 1
	lw	a4,-20(s0)
	li	a5,2
	ble	a4,a5,.L15
.LBE2:
	.loc 3 207 93
	li	a5,-268423168
	addi	a5,a5,40
	lw	a5,0(a5)
	slli	a3,a5,24
	.loc 3 207 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 207 100
	li	a4,5898240
	add	a4,a3,a4
	.loc 3 207 36
	sw	a4,0(a5)
	.loc 3 210 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 3 210 36
	li	a4,-1420754944
	sw	a4,0(a5)
	.loc 3 211 1
	nop
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE318:
	.size	main, .-main
.Letext0:
	.file 4 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x175
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x8
	.4byte	.LASF17
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x9
	.4byte	.LASF18
	.byte	0x4
	.byte	0x34
	.byte	0x1b
	.4byte	0x5c
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0xb
	.string	"fir"
	.byte	0x3
	.byte	0x16
	.byte	0xd
	.4byte	0x8a
	.4byte	0x8a
	.byte	0xc
	.byte	0
	.byte	0x3
	.4byte	0x6a
	.byte	0xd
	.4byte	.LASF19
	.byte	0x3
	.byte	0x22
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.4byte	0x105
	.byte	0xe
	.string	"j"
	.byte	0x3
	.byte	0x24
	.byte	0x6
	.4byte	0x6a
	.byte	0x2
	.string	"N"
	.byte	0x7a
	.byte	0x6
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0xf
	.4byte	.LASF11
	.byte	0x3
	.byte	0x7b
	.byte	0x6
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0x2
	.string	"tmp"
	.byte	0x81
	.byte	0x7
	.4byte	0x8a
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x4
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.byte	0x2
	.string	"j"
	.byte	0x9a
	.byte	0xa
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x4
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x2
	.string	"i"
	.byte	0xa1
	.byte	0xc
	.4byte	0x6a
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LASF13
	.byte	0x1a
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x126
	.byte	0x6
	.string	"p"
	.byte	0x1a
	.byte	0x18
	.4byte	0x126
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x3
	.4byte	0x132
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x10
	.4byte	0x12b
	.byte	0x5
	.4byte	.LASF14
	.byte	0x12
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x158
	.byte	0x6
	.string	"c"
	.byte	0x12
	.byte	0x13
	.4byte	0x12b
	.byte	0x2
	.byte	0x91
	.byte	0x6f
	.byte	0
	.byte	0x7
	.4byte	.LASF15
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x7
	.4byte	.LASF16
	.byte	0xe
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x3
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0x4
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x25
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"flush_cpu_dcache"
.LASF6:
	.string	"unsigned char"
.LASF8:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF14:
	.string	"putchar"
.LASF17:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF19:
	.string	"main"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"long long unsigned int"
.LASF16:
	.string	"flush_cpu_icache"
.LASF5:
	.string	"long long int"
.LASF12:
	.string	"char"
.LASF13:
	.string	"print"
.LASF3:
	.string	"short int"
.LASF11:
	.string	"DATA_LENGTH"
.LASF18:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"counter_la_fir.c"
.LASF1:
	.string	"/home/ubuntu/course-lab_4_2/testbench/counter_la_fir"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
