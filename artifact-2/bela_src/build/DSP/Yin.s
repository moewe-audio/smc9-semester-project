	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-a8
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	neon
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 2	@ Tag_ABI_FP_denormal
	.eabi_attribute	23, 1	@ Tag_ABI_FP_number_model
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	28, 1	@ Tag_ABI_VFP_args
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.eabi_attribute	68, 1	@ Tag_Virtualization_use
	.file	"/root/Bela/projects/NIEMO/build/dsp/Yin.bc"
	.globl	_ZN3Yin10initializeEfi
	.p2align	2
	.type	_ZN3Yin10initializeEfi,%function
_ZN3Yin10initializeEfi:                 @ @_ZN3Yin10initializeEfi
.Lfunc_begin0:
	.file	1 "/root/Bela/projects/NIEMO/dsp" "Yin.cpp"
	.loc	1 3 0                   @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:3:0
	.fnstart
	.cfi_startproc
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
.Ltmp0:
	.cfi_def_cfa_offset 24
.Ltmp1:
	.cfi_offset lr, -4
.Ltmp2:
	.cfi_offset r11, -8
.Ltmp3:
	.cfi_offset r10, -12
.Ltmp4:
	.cfi_offset r6, -16
.Ltmp5:
	.cfi_offset r5, -20
.Ltmp6:
	.cfi_offset r4, -24
	.setfp	r11, sp, #16
	add	r11, sp, #16
.Ltmp7:
	.cfi_def_cfa r11, 8
	@DEBUG_VALUE: initialize:this <- %R0
	@DEBUG_VALUE: initialize:yinSampleRate <- %S0
	@DEBUG_VALUE: initialize:yinBufferSize <- %R1
	mov	r4, r1
.Ltmp8:
	@DEBUG_VALUE: initialize:yinBufferSize <- %R4
	mov	r5, r0
.Ltmp9:
	@DEBUG_VALUE: initialize:this <- %R5
	.loc	1 11 21 prologue_end discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:21
	add	r0, r4, r4, lsr #31
.Ltmp10:
	.loc	1 7 12                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:7:12
	movw	r2, #13107
	movt	r2, #16323
	.loc	1 4 13                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:4:13
	str	r4, [r5, #8]
.Ltmp11:
	.loc	1 11 21 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:21
	asr	r6, r0, #1
	mov	r0, #4
.Ltmp12:
	.loc	1 10 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	umull	r0, r1, r6, r0
	.loc	1 5 13                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:5:13
	vstr	s0, [r5, #16]
	.loc	1 6 17                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:6:17
	str	r6, [r5, #12]
	.loc	1 7 12                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:7:12
	str	r2, [r5, #4]
	movw	r2, #13107
	movt	r2, #13107
	.loc	1 10 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	cmp	r1, #0
	.loc	1 7 12                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:7:12
	str	r2, [r5]
	.loc	1 10 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	movwne	r1, #1
	cmp	r1, #0
	mov	r2, #0
	mvnne	r0, #0
	.loc	1 8 14                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:8:14
	str	r2, [r5, #24]
	.loc	1 10 14 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	bl	_Znaj
.Ltmp13:
	.loc	1 11 2 discriminator 1  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:2
	cmp	r4, #2
.Ltmp14:
	.loc	1 10 12                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:12
	str	r0, [r5, #20]
.Ltmp15:
	@DEBUG_VALUE: i <- 0
	.loc	1 14 1                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:14:1
	poplt	{r4, r5, r6, r10, r11, pc}
.Ltmp16:
	.loc	1 11 2 discriminator 1  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:2
	cmp	r6, #1
.Ltmp17:
	.loc	1 12 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:12:16
	mov	r1, #0
.Ltmp18:
	.loc	1 11 2 discriminator 1  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:2
	movle	r6, #1
	lsl	r2, r6, #2
.Ltmp19:
	.loc	1 12 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:12:16
	bl	memset
.Ltmp20:
	.loc	1 14 1                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:14:1
	pop	{r4, r5, r6, r10, r11, pc}
.Ltmp21:
.Lfunc_end0:
	.size	_ZN3Yin10initializeEfi, .Lfunc_end0-_ZN3Yin10initializeEfi
	.cfi_endproc
	.file	2 "/root/Bela/projects/NIEMO/dsp" "Yin.h"
	.fnend

	.globl	_ZN3YinC2Ev
	.p2align	2
	.type	_ZN3YinC2Ev,%function
_ZN3YinC2Ev:                            @ @_ZN3YinC2Ev
.Lfunc_begin1:
	.loc	1 16 0                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:16:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: Yin:this <- %R0
	.loc	1 17 1 prologue_end     @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:17:1
	bx	lr
.Ltmp22:
.Lfunc_end1:
	.size	_ZN3YinC2Ev, .Lfunc_end1-_ZN3YinC2Ev
	.cfi_endproc
	.fnend

	.globl	_ZN3YinC2Efi
	.p2align	2
	.type	_ZN3YinC2Efi,%function
_ZN3YinC2Efi:                           @ @_ZN3YinC2Efi
.Lfunc_begin2:
	.loc	1 19 0                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:19:0
	.fnstart
	.cfi_startproc
@ BB#0:
	.save	{r4, r5, r6, r10, r11, lr}
	push	{r4, r5, r6, r10, r11, lr}
.Ltmp23:
	.cfi_def_cfa_offset 24
.Ltmp24:
	.cfi_offset lr, -4
.Ltmp25:
	.cfi_offset r11, -8
.Ltmp26:
	.cfi_offset r10, -12
.Ltmp27:
	.cfi_offset r6, -16
.Ltmp28:
	.cfi_offset r5, -20
.Ltmp29:
	.cfi_offset r4, -24
	.setfp	r11, sp, #16
	add	r11, sp, #16
.Ltmp30:
	.cfi_def_cfa r11, 8
	@DEBUG_VALUE: Yin:this <- %R0
	@DEBUG_VALUE: Yin:yinSampleRate <- %S0
	@DEBUG_VALUE: Yin:yinBufferSize <- %R1
	mov	r5, r1
.Ltmp31:
	@DEBUG_VALUE: Yin:yinBufferSize <- %R5
	mov	r4, r0
.Ltmp32:
	@DEBUG_VALUE: initialize:yinBufferSize <- %R5
	@DEBUG_VALUE: initialize:yinSampleRate <- %S0
	@DEBUG_VALUE: Yin:this <- %R4
	.loc	1 11 21 prologue_end discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:21
	add	r0, r5, r5, lsr #31
.Ltmp33:
	.loc	1 7 12                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:7:12
	movw	r2, #13107
	movt	r2, #16323
	.loc	1 4 13                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:4:13
	str	r5, [r4, #8]
.Ltmp34:
	.loc	1 11 21 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:21
	asr	r6, r0, #1
	mov	r0, #4
.Ltmp35:
	.loc	1 10 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	umull	r0, r1, r6, r0
.Ltmp36:
	@DEBUG_VALUE: initialize:this <- %R4
	.loc	1 5 13                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:5:13
	vstr	s0, [r4, #16]
	.loc	1 6 17                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:6:17
	str	r6, [r4, #12]
	.loc	1 7 12                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:7:12
	str	r2, [r4, #4]
	movw	r2, #13107
	movt	r2, #13107
	.loc	1 10 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	cmp	r1, #0
	.loc	1 7 12                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:7:12
	str	r2, [r4]
	.loc	1 10 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	movwne	r1, #1
	cmp	r1, #0
	mov	r2, #0
	mvnne	r0, #0
	.loc	1 8 14                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:8:14
	str	r2, [r4, #24]
	.loc	1 10 14 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:14
	bl	_Znaj
.Ltmp37:
	.loc	1 10 12 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:10:12
	str	r0, [r4, #20]
.Ltmp38:
	@DEBUG_VALUE: i <- 0
	.loc	1 11 2 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:2
	cmp	r5, #2
	blt	.LBB2_2
.Ltmp39:
@ BB#1:                                 @ %.lr.ph.i
	@DEBUG_VALUE: initialize:this <- %R4
	@DEBUG_VALUE: Yin:this <- %R4
	@DEBUG_VALUE: initialize:yinBufferSize <- %R5
	@DEBUG_VALUE: Yin:yinBufferSize <- %R5
	cmp	r6, #1
.Ltmp40:
	.loc	1 12 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:12:16
	mov	r1, #0
.Ltmp41:
	.loc	1 11 2 discriminator 1  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:11:2
	movle	r6, #1
	lsl	r2, r6, #2
.Ltmp42:
	.loc	1 12 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:12:16
	bl	memset
.Ltmp43:
.LBB2_2:                                @ %_ZN3Yin10initializeEfi.exit
	@DEBUG_VALUE: initialize:this <- %R4
	@DEBUG_VALUE: Yin:this <- %R4
	@DEBUG_VALUE: initialize:yinBufferSize <- %R5
	@DEBUG_VALUE: Yin:yinBufferSize <- %R5
	.loc	1 21 1                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:21:1
	mov	r0, r4
	pop	{r4, r5, r6, r10, r11, pc}
.Ltmp44:
.Lfunc_end2:
	.size	_ZN3YinC2Efi, .Lfunc_end2-_ZN3YinC2Efi
	.cfi_endproc
	.fnend

	.globl	_ZN3Yin14getProbabilityEv
	.p2align	2
	.type	_ZN3Yin14getProbabilityEv,%function
_ZN3Yin14getProbabilityEv:              @ @_ZN3Yin14getProbabilityEv
.Lfunc_begin3:
	.loc	1 23 0                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:23:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: getProbability:this <- %R0
	.loc	1 24 9 prologue_end     @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:24:9
	vldr	s0, [r0, #24]
	.loc	1 24 2 is_stmt 0        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:24:2
	bx	lr
.Ltmp45:
.Lfunc_end3:
	.size	_ZN3Yin14getProbabilityEv, .Lfunc_end3-_ZN3Yin14getProbabilityEv
	.cfi_endproc
	.fnend

	.globl	_ZN3Yin8getPitchEPKf
	.p2align	2
	.type	_ZN3Yin8getPitchEPKf,%function
_ZN3Yin8getPitchEPKf:                   @ @_ZN3Yin8getPitchEPKf
.Lfunc_begin4:
	.loc	1 27 0 is_stmt 1        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:27:0
	.fnstart
	.cfi_startproc
@ BB#0:
	.save	{r4, r5, r6, r7, r11, lr}
	push	{r4, r5, r6, r7, r11, lr}
.Ltmp46:
	.cfi_def_cfa_offset 24
.Ltmp47:
	.cfi_offset lr, -4
.Ltmp48:
	.cfi_offset r11, -8
.Ltmp49:
	.cfi_offset r7, -12
.Ltmp50:
	.cfi_offset r6, -16
.Ltmp51:
	.cfi_offset r5, -20
.Ltmp52:
	.cfi_offset r4, -24
	@DEBUG_VALUE: getPitch:this <- %R0
	@DEBUG_VALUE: getPitch:buffer <- %R1
.Ltmp53:
	@DEBUG_VALUE: getPitch:tauEstimate <- -1
	@DEBUG_VALUE: getPitch:pitchInHertz <- -1.000000e+00
	@DEBUG_VALUE: difference:this <- %R0
	@DEBUG_VALUE: difference:tau <- 0
	.loc	1 59 24 prologue_end    @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:59:24
	ldr	lr, [r0, #12]
.Ltmp54:
	.loc	1 114 6                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:114:6
	ldr	r12, [r0, #20]
.Ltmp55:
	.loc	1 108 2 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:108:2
	cmp	lr, #1
	blt	.LBB4_18
.Ltmp56:
@ BB#1:                                 @ %.preheader.us.i.preheader
	@DEBUG_VALUE: difference:this <- %R0
	@DEBUG_VALUE: getPitch:buffer <- %R1
	@DEBUG_VALUE: getPitch:this <- %R0
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	mov	r2, lr
	mov	r3, #0
	bfc	r2, #0, #2
.Ltmp57:
	.loc	1 32 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:32:2
	mov	r4, r1
.Ltmp58:
.LBB4_2:                                @ %.preheader.us.i
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB4_5 Depth 2
                                        @     Child Loop BB4_9 Depth 2
	vmov.i32	d0, #0x0
.Ltmp59:
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	cmp	lr, #4
	blo	.LBB4_7
.Ltmp60:
@ BB#3:                                 @ %.preheader.us.i
                                        @   in Loop: Header=BB4_2 Depth=1
	mov	r6, #0
	cmp	r2, #0
	beq	.LBB4_8
@ BB#4:                                 @ %vector.body.preheader
                                        @   in Loop: Header=BB4_2 Depth=1
	vmov.i32	q8, #0x0
	.loc	1 32 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:32:2
	mov	r5, r4
	mov	r6, r1
	mov	r7, r2
.LBB4_5:                                @ %vector.body
                                        @   Parent Loop BB4_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
.Ltmp61:
	.loc	1 111 27                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:27
	vld1.32	{d18, d19}, [r5]!
.Ltmp62:
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	subs	r7, r7, #4
.Ltmp63:
	.loc	1 111 11                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	vld1.32	{d20, d21}, [r6]!
	.loc	1 111 25 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:25
	vsub.f32	q9, q10, q9
	.loc	1 112 22 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:22
	vmul.f32	q9, q9, q9
	.loc	1 112 13 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vadd.f32	q8, q9, q8
.Ltmp64:
	.loc	1 110 3 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	bne	.LBB4_5
@ BB#6:                                 @ %middle.block
                                        @   in Loop: Header=BB4_2 Depth=1
.Ltmp65:
	.loc	1 112 13                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vext.32	q9, q8, q8, #2
	mov	r6, r2
.Ltmp66:
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	cmp	lr, r2
.Ltmp67:
	.loc	1 112 13                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vadd.f32	q8, q8, q9
	vdup.32	q9, d16[1]
	vadd.f32	q0, q8, q9
	bne	.LBB4_8
	b	.LBB4_10
.LBB4_7:                                @   in Loop: Header=BB4_2 Depth=1
	mov	r6, #0
.LBB4_8:                                @ %scalar.ph.preheader
                                        @   in Loop: Header=BB4_2 Depth=1
	.loc	1 111 11                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	sub	r5, lr, r6
	lsl	r6, r6, #2
.LBB4_9:                                @ %scalar.ph
                                        @   Parent Loop BB4_2 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	.loc	1 111 27 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:27
	add	r7, r4, r6
.Ltmp68:
	.loc	1 110 3 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	subs	r5, r5, #1
.Ltmp69:
	.loc	1 111 27                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:27
	vldr	s4, [r7]
	.loc	1 111 11 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	add	r7, r1, r6
.Ltmp70:
	.loc	1 110 3 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	add	r6, r6, #4
.Ltmp71:
	@DEBUG_VALUE: difference:deltaSum <- %S0
	.loc	1 111 11                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	vldr	s6, [r7]
	.loc	1 111 25 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:25
	vsub.f32	d16, d3, d2
.Ltmp72:
	@DEBUG_VALUE: difference:delta <- undef
	.loc	1 112 22 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:22
	vmul.f32	d16, d16, d16
	.loc	1 112 13 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vadd.f32	d0, d16, d0
.Ltmp73:
	bne	.LBB4_9
.Ltmp74:
.LBB4_10:                               @ %._crit_edge.us.i
                                        @   in Loop: Header=BB4_2 Depth=1
	.loc	1 114 6 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:114:6
	add	r5, r12, r3, lsl #2
.Ltmp75:
	.loc	1 108 41 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:108:41
	add	r3, r3, #1
.Ltmp76:
	@DEBUG_VALUE: difference:tau <- %R3
	.loc	1 108 2 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:108:2
	add	r4, r4, #4
	cmp	r3, lr
.Ltmp77:
	.loc	1 114 21 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:114:21
	vstr	s0, [r5]
	bne	.LBB4_2
.Ltmp78:
@ BB#11:                                @ %_ZN3Yin10differenceEPKf.exit
	@DEBUG_VALUE: difference:tau <- %R3
	.loc	1 95 15                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:95:15
	mov	r1, #1065353216
.Ltmp79:
	.loc	1 97 2 discriminator 1  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:2
	cmp	lr, #2
.Ltmp80:
	.loc	1 95 15                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:95:15
	str	r1, [r12]
.Ltmp81:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- 1
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- 0.000000e+00
	mov	r1, #2
	blt	.LBB4_19
.Ltmp82:
@ BB#12:                                @ %.lr.ph.i7.preheader
	@DEBUG_VALUE: difference:tau <- %R3
	vmov.i32	d0, #0x0
.Ltmp83:
	.loc	1 98 17                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:98:17
	add	r2, r12, #4
	mov	r3, #1
.Ltmp84:
.LBB4_13:                               @ %.lr.ph.i7
                                        @ =>This Inner Loop Header: Depth=1
	vldr	s2, [r2]
	.loc	1 99 21                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:99:21
	vmov	s4, r3
	vcvt.f32.s32	d2, d2
.Ltmp85:
	.loc	1 97 41 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:41
	add	r3, r3, #1
.Ltmp86:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- %R3
	.loc	1 98 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:98:14
	vadd.f32	d0, d1, d0
.Ltmp87:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- %S0
	.loc	1 97 2 discriminator 1  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:2
	cmp	lr, r3
.Ltmp88:
	.loc	1 99 25                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:99:25
	vdiv.f32	s4, s4, s0
	.loc	1 99 18 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:99:18
	vmul.f32	d1, d2, d1
	vstmia	r2!, {s2}
.Ltmp89:
	.loc	1 97 2 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:2
	bne	.LBB4_13
.Ltmp90:
@ BB#14:                                @ %_ZN3Yin34cumulativeMeanNormalizedDifferenceEv.exit
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- %S0
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- %R3
	@DEBUG_VALUE: absoluteThreshold:tau <- 2
	.loc	1 122 2 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:122:2
	cmp	lr, #3
	blt	.LBB4_19
.Ltmp91:
@ BB#15:                                @ %.lr.ph.i
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- %S0
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- %R3
	add	r2, r12, #8
.Ltmp92:
	@DEBUG_VALUE: absoluteThreshold:this <- %R0
	.loc	1 123 24                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:123:24
	vldr	d16, [r0]
	mov	r1, #2
.Ltmp93:
.LBB4_16:                               @ =>This Inner Loop Header: Depth=1
	.loc	1 123 7 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:123:7
	vldr	s0, [r2]
	vcvt.f64.f32	d17, s0
.Ltmp94:
	.loc	1 123 7                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:123:7
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	blt	.LBB4_28
.Ltmp95:
@ BB#17:                                @   in Loop: Header=BB4_16 Depth=1
	.loc	1 122 42 is_stmt 1 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:122:42
	add	r1, r1, #1
.Ltmp96:
	@DEBUG_VALUE: absoluteThreshold:tau <- %R1
	.loc	1 122 2 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:122:2
	add	r2, r2, #4
	cmp	r1, lr
	blt	.LBB4_16
	b	.LBB4_19
.Ltmp97:
.LBB4_18:                               @ %_ZN3Yin10differenceEPKf.exit.thread
	@DEBUG_VALUE: difference:this <- %R0
	@DEBUG_VALUE: getPitch:buffer <- %R1
	@DEBUG_VALUE: getPitch:this <- %R0
	.loc	1 95 15 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:95:15
	mov	r1, #1065353216
.Ltmp98:
	str	r1, [r12]
.Ltmp99:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- 1
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- 0.000000e+00
	mov	r1, #2
.Ltmp100:
.LBB4_19:                               @ %.loopexit.i
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 141 28                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:28
	cmp	r1, lr
	beq	.LBB4_26
.Ltmp101:
@ BB#20:
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 141 31 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:31
	add	r2, r12, r1, lsl #2
	.loc	1 141 49 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:49
	vldr	d16, [r0]
.Ltmp102:
	.loc	1 66 7 is_stmt 1        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:7
	vldr	s2, [r2]
.Ltmp103:
	@DEBUG_VALUE: s1 <- %S2
	.loc	1 141 31 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:31
	vcvt.f64.f32	d17, s2
	.loc	1 141 6 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:6
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	bge	.LBB4_26
.Ltmp104:
@ BB#21:                                @ %_ZN3Yin17absoluteThresholdEv.exit
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 41 5 is_stmt 1        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:41:5
	cmn	r1, #1
	beq	.LBB4_27
.Ltmp105:
@ BB#22:
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 42 18                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:42:18
	vldr	s0, [r0, #16]
.Ltmp106:
	.loc	1 59 18                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:59:18
	add	r0, r1, #1
.Ltmp107:
	.loc	1 61 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:61:2
	cmp	r0, lr
.Ltmp108:
	.loc	1 53 6                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:53:6
	mov	r2, r1
.Ltmp109:
	.loc	1 61 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:61:2
	movge	r0, r1
.Ltmp110:
	.loc	1 53 6                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:53:6
	cmp	r1, #0
	subgt	r2, r2, #1
	ble	.LBB4_32
.Ltmp111:
@ BB#23:
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 74 33                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:33
	add	r3, r12, r2, lsl #2
.Ltmp112:
	.loc	1 73 11                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:73:11
	cmp	r0, r1
.Ltmp113:
	.loc	1 74 33                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:33
	vldr	s4, [r3]
.Ltmp114:
	@DEBUG_VALUE: s0 <- %S4
	.loc	1 73 11                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:73:11
	bne	.LBB4_35
.Ltmp115:
@ BB#24:
	@DEBUG_VALUE: s0 <- %S4
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 74 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:7
	vcmpe.f32	s2, s4
	vmrs	APSR_nzcv, fpscr
	ble	.LBB4_34
.Ltmp116:
@ BB#25:
	@DEBUG_VALUE: s0 <- %S4
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 78 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:78:16
	vmov	s2, r2
.Ltmp117:
	vcvt.f32.s32	d1, d1
.Ltmp118:
	@DEBUG_VALUE: parabolicInterpolation:betterTau <- %S2
	b	.LBB4_36
.Ltmp119:
.LBB4_26:                               @ %_ZN3Yin17absoluteThresholdEv.exit.thread
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	@DEBUG_VALUE: absoluteThreshold:tau <- -1
	vmov.f32	d0, #-1.000000e+00
.Ltmp120:
	@DEBUG_VALUE: parabolicInterpolation:this <- %R0
	mov	r1, #0
.Ltmp121:
	.loc	1 143 15                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:143:15
	str	r1, [r0, #24]
.Ltmp122:
	.loc	1 45 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:45:2
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	pop	{r4, r5, r6, r7, r11, pc}
.Ltmp123:
.LBB4_27:
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	vmov.f32	d0, #-1.000000e+00
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
	pop	{r4, r5, r6, r7, r11, pc}
.Ltmp124:
.LBB4_28:                               @ %.preheader.i.preheader
	.loc	1 38 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:38:16
	mov	r4, r1
.LBB4_29:                               @ %.preheader.i
                                        @ =>This Inner Loop Header: Depth=1
	mov	r1, r4
.Ltmp125:
	.loc	1 124 15 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:15
	add	r4, r1, #1
	.loc	1 124 60 is_stmt 0 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:60
	mov	r3, r2
	.loc	1 124 36 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:36
	cmp	r4, lr
	bge	.LBB4_31
@ BB#30:                                @   in Loop: Header=BB4_29 Depth=1
	.loc	1 124 39 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:39
	vldr	s2, [r3, #4]
	add	r2, r3, #4
	.loc	1 124 4 discriminator 3 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:4
	vcmpe.f32	s2, s0
	.loc	1 124 60 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:60
	vmov.f32	s0, s2
	.loc	1 124 4 discriminator 3 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:4
	vmrs	APSR_nzcv, fpscr
	blt	.LBB4_29
.LBB4_31:                               @ %.critedge.i
	.loc	1 136 20 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:20
	vmov.f32	d16, #1.000000e+00
	.loc	1 136 22 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:22
	vldr	s0, [r3]
	.loc	1 136 20                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:20
	vsub.f32	d0, d16, d0
	.loc	1 136 16                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:16
	vstr	s0, [r0, #24]
	b	.LBB4_19
.Ltmp126:
.LBB4_32:
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 66 33 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:33
	add	r2, r12, r0, lsl #2
	vldr	s4, [r2]
.Ltmp127:
	.loc	1 66 7 is_stmt 0        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:7
	vcmpe.f32	s2, s4
	vmrs	APSR_nzcv, fpscr
	ble	.LBB4_34
.Ltmp128:
@ BB#33:
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 70 16 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:70:16
	vmov	s2, r0
.Ltmp129:
	vcvt.f32.s32	d1, d1
.Ltmp130:
	@DEBUG_VALUE: parabolicInterpolation:betterTau <- %S2
	b	.LBB4_36
.Ltmp131:
.LBB4_34:
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 67 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:67:16
	vmov	s2, r1
.Ltmp132:
	vcvt.f32.s32	d1, d1
.Ltmp133:
	@DEBUG_VALUE: parabolicInterpolation:betterTau <- %S2
	b	.LBB4_36
.Ltmp134:
.LBB4_35:
	@DEBUG_VALUE: s0 <- %S4
	@DEBUG_VALUE: s1 <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 85 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:85:8
	add	r0, r12, r0, lsl #2
.Ltmp135:
	.loc	1 42 31                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:42:31
	vneg.f32	d16, d2
.Ltmp136:
	.loc	1 88 49                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:49
	vadd.f32	d17, d1, d1
	.loc	1 85 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:85:8
	vldr	s6, [r0]
.Ltmp137:
	@DEBUG_VALUE: s2 <- %S6
	.loc	1 88 54                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:54
	vsub.f32	d16, d16, d3
	.loc	1 88 33 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:33
	vsub.f32	d1, d3, d2
.Ltmp138:
	.loc	1 88 59                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:59
	vadd.f32	d16, d16, d17
	.loc	1 88 44                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:44
	vadd.f32	d2, d16, d16
.Ltmp139:
	.loc	1 88 39                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:39
	vdiv.f32	s2, s2, s4
	.loc	1 88 15                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:15
	vmov	s4, r1
	vcvt.f32.s32	d16, d2
	.loc	1 88 27                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:27
	vadd.f32	d1, d1, d16
.Ltmp140:
	@DEBUG_VALUE: parabolicInterpolation:betterTau <- %S2
.LBB4_36:                               @ %_ZN3Yin22parabolicInterpolationEi.exit
	@DEBUG_VALUE: parabolicInterpolation:betterTau <- %S2
	@DEBUG_VALUE: getPitch:tauEstimate <- %R1
	.loc	1 42 29 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:42:29
	vdiv.f32	s0, s0, s2
.Ltmp141:
	@DEBUG_VALUE: getPitch:pitchInHertz <- %S0
	.loc	1 45 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:45:2
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
.Ltmp142:
	pop	{r4, r5, r6, r7, r11, pc}
.Ltmp143:
.Lfunc_end4:
	.size	_ZN3Yin8getPitchEPKf, .Lfunc_end4-_ZN3Yin8getPitchEPKf
	.cfi_endproc
	.fnend

	.globl	_ZN3Yin10differenceEPKf
	.p2align	2
	.type	_ZN3Yin10differenceEPKf,%function
_ZN3Yin10differenceEPKf:                @ @_ZN3Yin10differenceEPKf
.Lfunc_begin5:
	.loc	1 103 0                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:103:0
	.fnstart
	.cfi_startproc
@ BB#0:
	.save	{r4, r5, r6, lr}
	push	{r4, r5, r6, lr}
.Ltmp144:
	.cfi_def_cfa_offset 16
.Ltmp145:
	.cfi_offset lr, -4
.Ltmp146:
	.cfi_offset r6, -8
.Ltmp147:
	.cfi_offset r5, -12
.Ltmp148:
	.cfi_offset r4, -16
	@DEBUG_VALUE: difference:this <- %R0
	@DEBUG_VALUE: difference:buffer <- %R1
.Ltmp149:
	@DEBUG_VALUE: difference:tau <- 0
	.loc	1 110 26 prologue_end discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:26
	ldr	r2, [r0, #12]
.Ltmp150:
	.loc	1 108 2 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:108:2
	cmp	r2, #1
.Ltmp151:
	.loc	1 116 1                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:116:1
	poplt	{r4, r5, r6, pc}
.Ltmp152:
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	mov	lr, r2
.Ltmp153:
	.loc	1 114 6                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:114:6
	ldr	r12, [r0, #20]
.Ltmp154:
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	bfc	lr, #0, #2
	mov	r0, #0
.Ltmp155:
	mov	r3, r1
.LBB5_1:                                @ %.preheader.us
                                        @ =>This Loop Header: Depth=1
                                        @     Child Loop BB5_4 Depth 2
                                        @     Child Loop BB5_8 Depth 2
	vmov.i32	d0, #0x0
	cmp	r2, #4
	blo	.LBB5_6
@ BB#2:                                 @ %.preheader.us
                                        @   in Loop: Header=BB5_1 Depth=1
	mov	r4, #0
	cmp	lr, #0
	beq	.LBB5_7
@ BB#3:                                 @ %vector.body.preheader
                                        @   in Loop: Header=BB5_1 Depth=1
	vmov.i32	q8, #0x0
	.loc	1 110 47 is_stmt 0 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:47
	mov	r4, r3
	mov	r5, r1
	mov	r6, lr
.LBB5_4:                                @ %vector.body
                                        @   Parent Loop BB5_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
.Ltmp156:
	.loc	1 111 27 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:27
	vld1.32	{d18, d19}, [r4]!
.Ltmp157:
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	subs	r6, r6, #4
.Ltmp158:
	.loc	1 111 11                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	vld1.32	{d20, d21}, [r5]!
	.loc	1 111 25 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:25
	vsub.f32	q9, q10, q9
	.loc	1 112 22 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:22
	vmul.f32	q9, q9, q9
	.loc	1 112 13 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vadd.f32	q8, q9, q8
.Ltmp159:
	.loc	1 110 3 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	bne	.LBB5_4
@ BB#5:                                 @ %middle.block
                                        @   in Loop: Header=BB5_1 Depth=1
.Ltmp160:
	.loc	1 112 13                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vext.32	q9, q8, q8, #2
	mov	r4, lr
.Ltmp161:
	.loc	1 110 3 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	cmp	r2, lr
.Ltmp162:
	.loc	1 112 13                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vadd.f32	q8, q8, q9
	vdup.32	q9, d16[1]
	vadd.f32	q0, q8, q9
	bne	.LBB5_7
	b	.LBB5_9
.LBB5_6:                                @   in Loop: Header=BB5_1 Depth=1
	mov	r4, #0
.LBB5_7:                                @ %scalar.ph.preheader
                                        @   in Loop: Header=BB5_1 Depth=1
	.loc	1 111 11                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	lsl	r5, r4, #2
.LBB5_8:                                @ %scalar.ph
                                        @   Parent Loop BB5_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	.loc	1 111 27 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:27
	add	r6, r3, r5
.Ltmp163:
	.loc	1 110 47 is_stmt 1 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:47
	add	r4, r4, #1
.Ltmp164:
	@DEBUG_VALUE: difference:deltaSum <- %S0
	@DEBUG_VALUE: difference:index <- %R4
	.loc	1 110 3 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:3
	cmp	r4, r2
.Ltmp165:
	.loc	1 111 27 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:27
	vldr	s4, [r6]
	.loc	1 111 11 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	add	r6, r1, r5
.Ltmp166:
	.loc	1 110 24 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:110:24
	add	r5, r5, #4
.Ltmp167:
	.loc	1 111 11                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:11
	vldr	s6, [r6]
	.loc	1 111 25 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:111:25
	vsub.f32	d16, d3, d2
.Ltmp168:
	@DEBUG_VALUE: difference:delta <- undef
	.loc	1 112 22 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:22
	vmul.f32	d16, d16, d16
	.loc	1 112 13 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:112:13
	vadd.f32	d0, d16, d0
.Ltmp169:
	blt	.LBB5_8
.Ltmp170:
.LBB5_9:                                @ %._crit_edge.us
                                        @   in Loop: Header=BB5_1 Depth=1
	.loc	1 114 6 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:114:6
	add	r4, r12, r0, lsl #2
.Ltmp171:
	.loc	1 108 41 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:108:41
	add	r0, r0, #1
.Ltmp172:
	@DEBUG_VALUE: difference:tau <- %R0
	.loc	1 108 2 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:108:2
	add	r3, r3, #4
	cmp	r0, r2
.Ltmp173:
	.loc	1 114 21 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:114:21
	vstr	s0, [r4]
	bne	.LBB5_1
.Ltmp174:
@ BB#10:                                @ %._crit_edge27
	@DEBUG_VALUE: difference:tau <- %R0
	.loc	1 116 1                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:116:1
	pop	{r4, r5, r6, pc}
.Ltmp175:
.Lfunc_end5:
	.size	_ZN3Yin10differenceEPKf, .Lfunc_end5-_ZN3Yin10differenceEPKf
	.cfi_endproc
	.fnend

	.globl	_ZN3Yin34cumulativeMeanNormalizedDifferenceEv
	.p2align	2
	.type	_ZN3Yin34cumulativeMeanNormalizedDifferenceEv,%function
_ZN3Yin34cumulativeMeanNormalizedDifferenceEv: @ @_ZN3Yin34cumulativeMeanNormalizedDifferenceEv
.Lfunc_begin6:
	.loc	1 93 0                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:93:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:this <- %R0
	.loc	1 98 17 prologue_end    @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:98:17
	ldr	r1, [r0, #20]
.Ltmp176:
	.loc	1 95 15                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:95:15
	mov	r2, #1065353216
	str	r2, [r1]
.Ltmp177:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- 1
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- 0.000000e+00
	.loc	1 97 22 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:22
	ldr	r0, [r0, #12]
.Ltmp178:
	.loc	1 97 2 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:2
	cmp	r0, #2
.Ltmp179:
	.loc	1 101 1 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:101:1
	bxlt	lr
	vmov.i32	d0, #0x0
.Ltmp180:
	.loc	1 98 17                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:98:17
	add	r1, r1, #4
	mov	r2, #1
.LBB6_1:                                @ %.lr.ph
                                        @ =>This Inner Loop Header: Depth=1
	vldr	s2, [r1]
	.loc	1 99 21                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:99:21
	vmov	s4, r2
	vcvt.f32.s32	d2, d2
.Ltmp181:
	.loc	1 97 41 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:41
	add	r2, r2, #1
.Ltmp182:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- %R2
	.loc	1 98 14                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:98:14
	vadd.f32	d0, d1, d0
.Ltmp183:
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- %S0
	.loc	1 97 2 discriminator 1  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:97:2
	cmp	r2, r0
.Ltmp184:
	.loc	1 99 25                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:99:25
	vdiv.f32	s4, s4, s0
	.loc	1 99 18 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:99:18
	vmul.f32	d1, d2, d1
	vstmia	r1!, {s2}
	blt	.LBB6_1
.Ltmp185:
@ BB#2:                                 @ %._crit_edge
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:runningSum <- %S0
	@DEBUG_VALUE: cumulativeMeanNormalizedDifference:tau <- %R2
	.loc	1 101 1 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:101:1
	bx	lr
.Ltmp186:
.Lfunc_end6:
	.size	_ZN3Yin34cumulativeMeanNormalizedDifferenceEv, .Lfunc_end6-_ZN3Yin34cumulativeMeanNormalizedDifferenceEv
	.cfi_endproc
	.fnend

	.globl	_ZN3Yin17absoluteThresholdEv
	.p2align	2
	.type	_ZN3Yin17absoluteThresholdEv,%function
_ZN3Yin17absoluteThresholdEv:           @ @_ZN3Yin17absoluteThresholdEv
.Lfunc_begin7:
	.loc	1 118 0                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:118:0
	.fnstart
	.cfi_startproc
@ BB#0:
	.save	{r11, lr}
	push	{r11, lr}
.Ltmp187:
	.cfi_def_cfa_offset 8
.Ltmp188:
	.cfi_offset lr, -4
.Ltmp189:
	.cfi_offset r11, -8
	@DEBUG_VALUE: absoluteThreshold:this <- %R0
.Ltmp190:
	@DEBUG_VALUE: absoluteThreshold:tau <- 2
	.loc	1 141 13 prologue_end   @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:13
	ldr	r12, [r0, #12]
	mov	r1, #2
.Ltmp191:
	.loc	1 122 2 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:122:2
	cmp	r12, #3
	blt	.LBB7_8
@ BB#1:                                 @ %.lr.ph
	@DEBUG_VALUE: absoluteThreshold:this <- %R0
.Ltmp192:
	.loc	1 136 22                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:22
	ldr	r1, [r0, #20]
.Ltmp193:
	.loc	1 123 24                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:123:24
	vldr	d16, [r0]
.Ltmp194:
	.loc	1 122 2 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:122:2
	add	r3, r1, #8
	mov	r1, #2
.LBB7_2:                                @ =>This Inner Loop Header: Depth=1
.Ltmp195:
	.loc	1 123 7                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:123:7
	vldr	s0, [r3]
	vcvt.f64.f32	d17, s0
.Ltmp196:
	.loc	1 123 7 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:123:7
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	blt	.LBB7_4
.Ltmp197:
@ BB#3:                                 @   in Loop: Header=BB7_2 Depth=1
	.loc	1 122 42 is_stmt 1 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:122:42
	add	r1, r1, #1
.Ltmp198:
	@DEBUG_VALUE: absoluteThreshold:tau <- %R1
	.loc	1 122 2 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:122:2
	add	r3, r3, #4
	cmp	r1, r12
	blt	.LBB7_2
	b	.LBB7_8
.Ltmp199:
.LBB7_4:                                @ %.preheader.preheader
	mov	r2, r1
.LBB7_5:                                @ %.preheader
                                        @ =>This Inner Loop Header: Depth=1
	mov	r1, r2
.Ltmp200:
	.loc	1 124 15 is_stmt 1 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:15
	add	r2, r1, #1
	.loc	1 124 60 is_stmt 0 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:60
	mov	lr, r3
	.loc	1 124 36 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:36
	cmp	r2, r12
	bge	.LBB7_7
@ BB#6:                                 @   in Loop: Header=BB7_5 Depth=1
	.loc	1 124 39 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:39
	vldr	s2, [lr, #4]
	add	r3, lr, #4
	.loc	1 124 4 discriminator 3 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:4
	vcmpe.f32	s2, s0
	.loc	1 124 60 discriminator 2 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:60
	vmov.f32	s0, s2
	.loc	1 124 4 discriminator 3 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:124:4
	vmrs	APSR_nzcv, fpscr
	blt	.LBB7_5
.LBB7_7:                                @ %.critedge
	.loc	1 136 20 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:20
	vmov.f32	d16, #1.000000e+00
	.loc	1 136 22 is_stmt 0      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:22
	vldr	s0, [lr]
	.loc	1 136 20                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:20
	vsub.f32	d0, d16, d0
	.loc	1 136 16                @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:136:16
	vstr	s0, [r0, #24]
.Ltmp201:
.LBB7_8:                                @ %.loopexit
	.loc	1 141 28 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:28
	cmp	r1, r12
	beq	.LBB7_10
@ BB#9:
	.loc	1 141 31 is_stmt 0 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:31
	ldr	r2, [r0, #20]
	.loc	1 141 49 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:49
	vldr	d16, [r0]
	.loc	1 141 31 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:31
	add	r2, r2, r1, lsl #2
	vldr	s0, [r2]
	vcvt.f64.f32	d17, s0
	.loc	1 141 6 discriminator 1 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:141:6
	vcmpe.f64	d17, d16
	vmrs	APSR_nzcv, fpscr
	blt	.LBB7_11
.LBB7_10:
.Ltmp202:
	@DEBUG_VALUE: absoluteThreshold:tau <- -1
	.loc	1 143 15 is_stmt 1      @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:143:15
	mov	r1, #0
	str	r1, [r0, #24]
	mvn	r1, #0
.Ltmp203:
.LBB7_11:
	.loc	1 145 2                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:145:2
	mov	r0, r1
	pop	{r11, pc}
.Ltmp204:
.Lfunc_end7:
	.size	_ZN3Yin17absoluteThresholdEv, .Lfunc_end7-_ZN3Yin17absoluteThresholdEv
	.cfi_endproc
	.fnend

	.globl	_ZN3Yin22parabolicInterpolationEi
	.p2align	2
	.type	_ZN3Yin22parabolicInterpolationEi,%function
_ZN3Yin22parabolicInterpolationEi:      @ @_ZN3Yin22parabolicInterpolationEi
.Lfunc_begin8:
	.loc	1 48 0                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:48:0
	.fnstart
	.cfi_startproc
@ BB#0:
	@DEBUG_VALUE: parabolicInterpolation:this <- %R0
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
	.loc	1 59 24 prologue_end    @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:59:24
	ldr	r3, [r0, #12]
	.loc	1 59 18 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:59:18
	add	r2, r1, #1
.Ltmp205:
	.loc	1 61 2 is_stmt 1        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:61:2
	cmp	r2, r3
.Ltmp206:
	.loc	1 53 6                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:53:6
	mov	r3, r1
.Ltmp207:
	.loc	1 61 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:61:2
	movge	r2, r1
.Ltmp208:
	.loc	1 53 6                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:53:6
	cmp	r1, #0
	subgt	r3, r3, #1
	ble	.LBB8_4
.Ltmp209:
@ BB#1:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
	@DEBUG_VALUE: parabolicInterpolation:this <- %R0
	.loc	1 74 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:7
	ldr	r0, [r0, #20]
.Ltmp210:
	.loc	1 73 11                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:73:11
	cmp	r2, r1
	bne	.LBB8_8
@ BB#2:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
.Ltmp211:
	.loc	1 74 33                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:33
	add	r2, r0, r3, lsl #2
	.loc	1 74 7 is_stmt 0        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:7
	add	r0, r0, r1, lsl #2
	.loc	1 74 33                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:33
	vldr	s0, [r2]
	.loc	1 74 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:7
	vldr	s2, [r0]
.Ltmp212:
	.loc	1 74 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:74:7
	vcmpe.f32	s2, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB8_6
@ BB#3:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
.Ltmp213:
	.loc	1 78 16 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:78:16
	vmov	s0, r3
	b	.LBB8_7
.Ltmp214:
.LBB8_4:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
	@DEBUG_VALUE: parabolicInterpolation:this <- %R0
	.loc	1 66 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:7
	ldr	r0, [r0, #20]
.Ltmp215:
	.loc	1 66 33 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:33
	add	r3, r0, r2, lsl #2
	.loc	1 66 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:7
	add	r0, r0, r1, lsl #2
	.loc	1 66 33                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:33
	vldr	s0, [r3]
	.loc	1 66 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:7
	vldr	s2, [r0]
.Ltmp216:
	.loc	1 66 7                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:66:7
	vcmpe.f32	s2, s0
	vmrs	APSR_nzcv, fpscr
	ble	.LBB8_6
@ BB#5:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
.Ltmp217:
	.loc	1 70 16 is_stmt 1       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:70:16
	vmov	s0, r2
	b	.LBB8_7
.Ltmp218:
.LBB8_6:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
	.loc	1 67 16                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:67:16
	vmov	s0, r1
.LBB8_7:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
	vcvt.f32.s32	d0, d0
.Ltmp219:
	@DEBUG_VALUE: parabolicInterpolation:betterTau <- %S0
	.loc	1 90 2                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:90:2
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
.Ltmp220:
	bx	lr
.LBB8_8:
	@DEBUG_VALUE: parabolicInterpolation:tauEstimate <- %R1
.Ltmp221:
	.loc	1 85 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:85:8
	add	r12, r0, r2, lsl #2
	.loc	1 84 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:84:8
	add	r2, r0, r1, lsl #2
	.loc	1 83 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:83:8
	add	r0, r0, r3, lsl #2
	.loc	1 84 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:84:8
	vldr	s2, [r2]
.Ltmp222:
	@DEBUG_VALUE: s1 <- %S2
	.loc	1 83 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:83:8
	vldr	s0, [r0]
.Ltmp223:
	@DEBUG_VALUE: s0 <- %S0
	.loc	1 85 8                  @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:85:8
	vldr	s4, [r12]
.Ltmp224:
	@DEBUG_VALUE: s2 <- %S4
	.loc	1 88 49                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:49
	vadd.f32	d17, d1, d1
	vneg.f32	d16, d0
	.loc	1 88 33 is_stmt 0       @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:33
	vsub.f32	d0, d2, d0
.Ltmp225:
	.loc	1 88 54                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:54
	vsub.f32	d16, d16, d2
	.loc	1 88 59                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:59
	vadd.f32	d16, d16, d17
	.loc	1 88 44                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:44
	vadd.f32	d1, d16, d16
.Ltmp226:
	.loc	1 88 39                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:39
	vdiv.f32	s0, s0, s2
	.loc	1 88 15                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:15
	vmov	s2, r1
	vcvt.f32.s32	d16, d1
	.loc	1 88 27                 @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:88:27
	vadd.f32	d0, d0, d16
.Ltmp227:
	@DEBUG_VALUE: parabolicInterpolation:betterTau <- %S0
	.loc	1 90 2 is_stmt 1        @ /root/Bela/projects/NIEMO/dsp/Yin.cpp:90:2
                                        @ kill: %S0<def> %S0<kill> %D0<kill>
.Ltmp228:
	bx	lr
.Ltmp229:
.Lfunc_end8:
	.size	_ZN3Yin22parabolicInterpolationEi, .Lfunc_end8-_ZN3Yin22parabolicInterpolationEi
	.cfi_endproc
	.fnend

	.section	.debug_str,"MS",%progbits,1
.Linfo_string0:
	.asciz	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)" @ string offset=0
.Linfo_string1:
	.asciz	"/root/Bela/projects/NIEMO/build/dsp/Yin.cpp" @ string offset=45
.Linfo_string2:
	.asciz	"/root/Bela"            @ string offset=89
.Linfo_string3:
	.asciz	"threshold"             @ string offset=100
.Linfo_string4:
	.asciz	"double"                @ string offset=110
.Linfo_string5:
	.asciz	"bufferSize"            @ string offset=117
.Linfo_string6:
	.asciz	"int"                   @ string offset=128
.Linfo_string7:
	.asciz	"halfBufferSize"        @ string offset=132
.Linfo_string8:
	.asciz	"sampleRate"            @ string offset=147
.Linfo_string9:
	.asciz	"float"                 @ string offset=158
.Linfo_string10:
	.asciz	"yinBuffer"             @ string offset=164
.Linfo_string11:
	.asciz	"probability"           @ string offset=174
.Linfo_string12:
	.asciz	"Yin"                   @ string offset=186
.Linfo_string13:
	.asciz	"_ZN3Yin10initializeEfi" @ string offset=190
.Linfo_string14:
	.asciz	"initialize"            @ string offset=213
.Linfo_string15:
	.asciz	"_ZN3Yin8getPitchEPKf"  @ string offset=224
.Linfo_string16:
	.asciz	"getPitch"              @ string offset=245
.Linfo_string17:
	.asciz	"_ZN3Yin14getProbabilityEv" @ string offset=254
.Linfo_string18:
	.asciz	"getProbability"        @ string offset=280
.Linfo_string19:
	.asciz	"_ZN3Yin22parabolicInterpolationEi" @ string offset=295
.Linfo_string20:
	.asciz	"parabolicInterpolation" @ string offset=329
.Linfo_string21:
	.asciz	"_ZN3Yin17absoluteThresholdEv" @ string offset=352
.Linfo_string22:
	.asciz	"absoluteThreshold"     @ string offset=381
.Linfo_string23:
	.asciz	"_ZN3Yin34cumulativeMeanNormalizedDifferenceEv" @ string offset=399
.Linfo_string24:
	.asciz	"cumulativeMeanNormalizedDifference" @ string offset=445
.Linfo_string25:
	.asciz	"_ZN3Yin10differenceEPKf" @ string offset=480
.Linfo_string26:
	.asciz	"difference"            @ string offset=504
.Linfo_string27:
	.asciz	"this"                  @ string offset=515
.Linfo_string28:
	.asciz	"yinSampleRate"         @ string offset=520
.Linfo_string29:
	.asciz	"yinBufferSize"         @ string offset=534
.Linfo_string30:
	.asciz	"i"                     @ string offset=548
.Linfo_string31:
	.asciz	"tauEstimate"           @ string offset=550
.Linfo_string32:
	.asciz	"betterTau"             @ string offset=562
.Linfo_string33:
	.asciz	"x0"                    @ string offset=572
.Linfo_string34:
	.asciz	"x2"                    @ string offset=575
.Linfo_string35:
	.asciz	"s1"                    @ string offset=578
.Linfo_string36:
	.asciz	"s0"                    @ string offset=581
.Linfo_string37:
	.asciz	"s2"                    @ string offset=584
.Linfo_string38:
	.asciz	"buffer"                @ string offset=587
.Linfo_string39:
	.asciz	"tau"                   @ string offset=594
.Linfo_string40:
	.asciz	"deltaSum"              @ string offset=598
.Linfo_string41:
	.asciz	"delta"                 @ string offset=607
.Linfo_string42:
	.asciz	"index"                 @ string offset=613
.Linfo_string43:
	.asciz	"runningSum"            @ string offset=619
.Linfo_string44:
	.asciz	"_ZN3YinC2Ev"           @ string offset=630
.Linfo_string45:
	.asciz	"_ZN3YinC2Efi"          @ string offset=642
.Linfo_string46:
	.asciz	"pitchInHertz"          @ string offset=655
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp9-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	.Ltmp9-.Lfunc_begin0
	.long	.Ltmp16-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	85                      @ DW_OP_reg5
	.long	0
	.long	0
.Ldebug_loc1:
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp13-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc2:
	.long	.Lfunc_begin0-.Lfunc_begin0
	.long	.Ltmp8-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	.Ltmp8-.Lfunc_begin0
	.long	.Ltmp16-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	84                      @ DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc3:
	.long	.Lfunc_begin2-.Lfunc_begin0
	.long	.Ltmp32-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	.Ltmp32-.Lfunc_begin0
	.long	.Ltmp44-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	84                      @ DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc4:
	.long	.Lfunc_begin2-.Lfunc_begin0
	.long	.Ltmp37-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc5:
	.long	.Lfunc_begin2-.Lfunc_begin0
	.long	.Ltmp31-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	.Ltmp31-.Lfunc_begin0
	.long	.Ltmp44-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	85                      @ DW_OP_reg5
	.long	0
	.long	0
.Ldebug_loc6:
	.long	.Ltmp32-.Lfunc_begin0
	.long	.Ltmp44-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	85                      @ DW_OP_reg5
	.long	0
	.long	0
.Ldebug_loc7:
	.long	.Ltmp32-.Lfunc_begin0
	.long	.Ltmp37-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc8:
	.long	.Ltmp36-.Lfunc_begin0
	.long	.Ltmp44-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	84                      @ DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc9:
	.long	.Lfunc_begin4-.Lfunc_begin0
	.long	.Ltmp58-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	.Ltmp97-.Lfunc_begin0
	.long	.Ltmp100-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc10:
	.long	.Lfunc_begin4-.Lfunc_begin0
	.long	.Ltmp58-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	.Ltmp97-.Lfunc_begin0
	.long	.Ltmp98-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc11:
	.long	.Ltmp53-.Lfunc_begin0
	.long	.Ltmp100-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	127                     @ -1
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp100-.Lfunc_begin0
	.long	.Ltmp121-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	.Ltmp123-.Lfunc_begin0
	.long	.Ltmp124-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	.Ltmp126-.Lfunc_begin0
	.long	.Lfunc_end4-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc12:
	.long	.Ltmp53-.Lfunc_begin0
	.long	.Ltmp141-.Lfunc_begin0
	.short	7                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	128                     @ 3212836864
	.byte	128                     @ DW_OP_stack_value
	.byte	128                     @ 
	.byte	252                     @ 
	.byte	11                      @ 
	.byte	159                     @ 
	.long	.Ltmp141-.Lfunc_begin0
	.long	.Ltmp142-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc13:
	.long	.Ltmp53-.Lfunc_begin0
	.long	.Ltmp58-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	.Ltmp97-.Lfunc_begin0
	.long	.Ltmp100-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc14:
	.long	.Ltmp53-.Lfunc_begin0
	.long	.Ltmp76-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp76-.Lfunc_begin0
	.long	.Ltmp84-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	83                      @ DW_OP_reg3
	.long	0
	.long	0
.Ldebug_loc15:
	.long	.Ltmp71-.Lfunc_begin0
	.long	.Ltmp73-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc16:
	.long	.Ltmp81-.Lfunc_begin0
	.long	.Ltmp86-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	1                       @ 1
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp86-.Lfunc_begin0
	.long	.Ltmp93-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	83                      @ DW_OP_reg3
	.long	.Ltmp99-.Lfunc_begin0
	.long	.Lfunc_end4-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	1                       @ 1
	.byte	159                     @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc17:
	.long	.Ltmp81-.Lfunc_begin0
	.long	.Ltmp87-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp87-.Lfunc_begin0
	.long	.Ltmp93-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp99-.Lfunc_begin0
	.long	.Lfunc_end4-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc18:
	.long	.Ltmp90-.Lfunc_begin0
	.long	.Ltmp96-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	2                       @ 2
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp96-.Lfunc_begin0
	.long	.Ltmp97-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	.Ltmp119-.Lfunc_begin0
	.long	.Lfunc_end4-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	127                     @ -1
	.byte	159                     @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc19:
	.long	.Ltmp92-.Lfunc_begin0
	.long	.Ltmp93-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc20:
	.long	.Ltmp103-.Lfunc_begin0
	.long	.Ltmp117-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp123-.Lfunc_begin0
	.long	.Ltmp124-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp126-.Lfunc_begin0
	.long	.Ltmp129-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp131-.Lfunc_begin0
	.long	.Ltmp132-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp134-.Lfunc_begin0
	.long	.Ltmp138-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc21:
	.long	.Ltmp114-.Lfunc_begin0
	.long	.Ltmp119-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	130                     @ 258
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp134-.Lfunc_begin0
	.long	.Ltmp139-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	130                     @ 258
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc22:
	.long	.Ltmp118-.Lfunc_begin0
	.long	.Ltmp119-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp130-.Lfunc_begin0
	.long	.Ltmp131-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp133-.Lfunc_begin0
	.long	.Ltmp134-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp140-.Lfunc_begin0
	.long	.Lfunc_end4-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc23:
	.long	.Ltmp120-.Lfunc_begin0
	.long	.Ltmp123-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc24:
	.long	.Ltmp137-.Lfunc_begin0
	.long	.Ltmp140-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	131                     @ 259
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc25:
	.long	.Lfunc_begin5-.Lfunc_begin0
	.long	.Ltmp155-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc26:
	.long	.Ltmp149-.Lfunc_begin0
	.long	.Ltmp172-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp172-.Lfunc_begin0
	.long	.Lfunc_end5-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc27:
	.long	.Ltmp164-.Lfunc_begin0
	.long	.Ltmp169-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc28:
	.long	.Ltmp164-.Lfunc_begin0
	.long	.Ltmp170-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	84                      @ DW_OP_reg4
	.long	0
	.long	0
.Ldebug_loc29:
	.long	.Lfunc_begin6-.Lfunc_begin0
	.long	.Ltmp178-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc30:
	.long	.Ltmp177-.Lfunc_begin0
	.long	.Ltmp182-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	1                       @ 1
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp182-.Lfunc_begin0
	.long	.Lfunc_end6-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	82                      @ DW_OP_reg2
	.long	0
	.long	0
.Ldebug_loc31:
	.long	.Ltmp177-.Lfunc_begin0
	.long	.Ltmp183-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	16                      @ DW_OP_constu
	.byte	0                       @ 0
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp183-.Lfunc_begin0
	.long	.Lfunc_end6-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc32:
	.long	.Ltmp190-.Lfunc_begin0
	.long	.Ltmp198-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	2                       @ 2
	.byte	159                     @ DW_OP_stack_value
	.long	.Ltmp198-.Lfunc_begin0
	.long	.Ltmp199-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	81                      @ DW_OP_reg1
	.long	.Ltmp202-.Lfunc_begin0
	.long	.Lfunc_end7-.Lfunc_begin0
	.short	3                       @ Loc expr size
	.byte	17                      @ DW_OP_consts
	.byte	127                     @ -1
	.byte	159                     @ DW_OP_stack_value
	.long	0
	.long	0
.Ldebug_loc33:
	.long	.Lfunc_begin8-.Lfunc_begin0
	.long	.Ltmp210-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	.Ltmp214-.Lfunc_begin0
	.long	.Ltmp215-.Lfunc_begin0
	.short	1                       @ Loc expr size
	.byte	80                      @ DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc34:
	.long	.Ltmp219-.Lfunc_begin0
	.long	.Ltmp220-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	.Ltmp227-.Lfunc_begin0
	.long	.Ltmp228-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc35:
	.long	.Ltmp222-.Lfunc_begin0
	.long	.Ltmp226-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	129                     @ 257
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc36:
	.long	.Ltmp223-.Lfunc_begin0
	.long	.Ltmp225-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	128                     @ 256
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
.Ldebug_loc37:
	.long	.Ltmp224-.Lfunc_begin0
	.long	.Lfunc_end8-.Lfunc_begin0
	.short	5                       @ Loc expr size
	.byte	144                     @ super-register DW_OP_regx
	.byte	130                     @ 258
	.byte	2                       @ DW_OP_piece
	.byte	147                     @ 4
	.byte	4                       @ 
	.long	0
	.long	0
	.section	.debug_abbrev,"",%progbits
.Lsection_abbrev:
	.byte	1                       @ Abbreviation Code
	.byte	17                      @ DW_TAG_compile_unit
	.byte	1                       @ DW_CHILDREN_yes
	.byte	37                      @ DW_AT_producer
	.byte	14                      @ DW_FORM_strp
	.byte	19                      @ DW_AT_language
	.byte	5                       @ DW_FORM_data2
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	16                      @ DW_AT_stmt_list
	.byte	23                      @ DW_FORM_sec_offset
	.byte	27                      @ DW_AT_comp_dir
	.byte	14                      @ DW_FORM_strp
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	2                       @ Abbreviation Code
	.byte	2                       @ DW_TAG_class_type
	.byte	1                       @ DW_CHILDREN_yes
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	11                      @ DW_AT_byte_size
	.byte	11                      @ DW_FORM_data1
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	3                       @ Abbreviation Code
	.byte	13                      @ DW_TAG_member
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	56                      @ DW_AT_data_member_location
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	4                       @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	60                      @ DW_AT_declaration
	.byte	25                      @ DW_FORM_flag_present
	.byte	63                      @ DW_AT_external
	.byte	25                      @ DW_FORM_flag_present
	.byte	50                      @ DW_AT_accessibility
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	5                       @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	52                      @ DW_AT_artificial
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	6                       @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	7                       @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	60                      @ DW_AT_declaration
	.byte	25                      @ DW_FORM_flag_present
	.byte	63                      @ DW_AT_external
	.byte	25                      @ DW_FORM_flag_present
	.byte	50                      @ DW_AT_accessibility
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	8                       @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	60                      @ DW_AT_declaration
	.byte	25                      @ DW_FORM_flag_present
	.byte	63                      @ DW_AT_external
	.byte	25                      @ DW_FORM_flag_present
	.byte	50                      @ DW_AT_accessibility
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	9                       @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	60                      @ DW_AT_declaration
	.byte	25                      @ DW_FORM_flag_present
	.byte	63                      @ DW_AT_external
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	10                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	60                      @ DW_AT_declaration
	.byte	25                      @ DW_FORM_flag_present
	.byte	63                      @ DW_AT_external
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	11                      @ Abbreviation Code
	.byte	36                      @ DW_TAG_base_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	62                      @ DW_AT_encoding
	.byte	11                      @ DW_FORM_data1
	.byte	11                      @ DW_AT_byte_size
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	12                      @ Abbreviation Code
	.byte	15                      @ DW_TAG_pointer_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	13                      @ Abbreviation Code
	.byte	38                      @ DW_TAG_const_type
	.byte	0                       @ DW_CHILDREN_no
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	14                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	64                      @ DW_AT_frame_base
	.byte	24                      @ DW_FORM_exprloc
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	15                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	23                      @ DW_FORM_sec_offset
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	16                      @ Abbreviation Code
	.byte	11                      @ DW_TAG_lexical_block
	.byte	1                       @ DW_CHILDREN_yes
	.byte	85                      @ DW_AT_ranges
	.byte	23                      @ DW_FORM_sec_offset
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	17                      @ Abbreviation Code
	.byte	52                      @ DW_TAG_variable
	.byte	0                       @ DW_CHILDREN_no
	.byte	28                      @ DW_AT_const_value
	.byte	13                      @ DW_FORM_sdata
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	18                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	64                      @ DW_AT_frame_base
	.byte	24                      @ DW_FORM_exprloc
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	110                     @ DW_AT_linkage_name
	.byte	14                      @ DW_FORM_strp
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	19                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	24                      @ DW_FORM_exprloc
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	52                      @ DW_AT_artificial
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	20                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	32                      @ DW_AT_inline
	.byte	11                      @ DW_FORM_data1
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	21                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	52                      @ DW_AT_artificial
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	22                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	23                      @ Abbreviation Code
	.byte	11                      @ DW_TAG_lexical_block
	.byte	1                       @ DW_CHILDREN_yes
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	24                      @ Abbreviation Code
	.byte	52                      @ DW_TAG_variable
	.byte	0                       @ DW_CHILDREN_no
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	25                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	23                      @ DW_FORM_sec_offset
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	52                      @ DW_AT_artificial
	.byte	25                      @ DW_FORM_flag_present
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	26                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	23                      @ DW_FORM_sec_offset
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	27                      @ Abbreviation Code
	.byte	29                      @ DW_TAG_inlined_subroutine
	.byte	1                       @ DW_CHILDREN_yes
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	88                      @ DW_AT_call_file
	.byte	11                      @ DW_FORM_data1
	.byte	89                      @ DW_AT_call_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	28                      @ Abbreviation Code
	.byte	46                      @ DW_TAG_subprogram
	.byte	1                       @ DW_CHILDREN_yes
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	64                      @ DW_AT_frame_base
	.byte	24                      @ DW_FORM_exprloc
	.byte	100                     @ DW_AT_object_pointer
	.byte	19                      @ DW_FORM_ref4
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	71                      @ DW_AT_specification
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	29                      @ Abbreviation Code
	.byte	52                      @ DW_TAG_variable
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	23                      @ DW_FORM_sec_offset
	.byte	3                       @ DW_AT_name
	.byte	14                      @ DW_FORM_strp
	.byte	58                      @ DW_AT_decl_file
	.byte	11                      @ DW_FORM_data1
	.byte	59                      @ DW_AT_decl_line
	.byte	11                      @ DW_FORM_data1
	.byte	73                      @ DW_AT_type
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	30                      @ Abbreviation Code
	.byte	29                      @ DW_TAG_inlined_subroutine
	.byte	1                       @ DW_CHILDREN_yes
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	85                      @ DW_AT_ranges
	.byte	23                      @ DW_FORM_sec_offset
	.byte	88                      @ DW_AT_call_file
	.byte	11                      @ DW_FORM_data1
	.byte	89                      @ DW_AT_call_line
	.byte	11                      @ DW_FORM_data1
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	31                      @ Abbreviation Code
	.byte	52                      @ DW_TAG_variable
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	23                      @ DW_FORM_sec_offset
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	32                      @ Abbreviation Code
	.byte	52                      @ DW_TAG_variable
	.byte	0                       @ DW_CHILDREN_no
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	33                      @ Abbreviation Code
	.byte	5                       @ DW_TAG_formal_parameter
	.byte	0                       @ DW_CHILDREN_no
	.byte	2                       @ DW_AT_location
	.byte	24                      @ DW_FORM_exprloc
	.byte	49                      @ DW_AT_abstract_origin
	.byte	19                      @ DW_FORM_ref4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	34                      @ Abbreviation Code
	.byte	11                      @ DW_TAG_lexical_block
	.byte	1                       @ DW_CHILDREN_yes
	.byte	17                      @ DW_AT_low_pc
	.byte	1                       @ DW_FORM_addr
	.byte	18                      @ DW_AT_high_pc
	.byte	6                       @ DW_FORM_data4
	.byte	0                       @ EOM(1)
	.byte	0                       @ EOM(2)
	.byte	0                       @ EOM(3)
	.section	.debug_info,"",%progbits
.Lsection_info:
.Lcu_begin0:
	.long	1418                    @ Length of Unit
	.short	4                       @ DWARF version number
	.long	.Lsection_abbrev        @ Offset Into Abbrev. Section
	.byte	4                       @ Address Size (in bytes)
	.byte	1                       @ Abbrev [1] 0xb:0x583 DW_TAG_compile_unit
	.long	.Linfo_string0          @ DW_AT_producer
	.short	4                       @ DW_AT_language
	.long	.Linfo_string1          @ DW_AT_name
	.long	.Lline_table_start0     @ DW_AT_stmt_list
	.long	.Linfo_string2          @ DW_AT_comp_dir
	.long	.Lfunc_begin0           @ DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin0 @ DW_AT_high_pc
	.byte	2                       @ Abbrev [2] 0x26:0x11a DW_TAG_class_type
	.long	.Linfo_string12         @ DW_AT_name
	.byte	32                      @ DW_AT_byte_size
	.byte	2                       @ DW_AT_decl_file
	.byte	4                       @ DW_AT_decl_line
	.byte	3                       @ Abbrev [3] 0x2e:0xc DW_TAG_member
	.long	.Linfo_string3          @ DW_AT_name
	.long	320                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	18                      @ DW_AT_decl_line
	.byte	0                       @ DW_AT_data_member_location
	.byte	3                       @ Abbrev [3] 0x3a:0xc DW_TAG_member
	.long	.Linfo_string5          @ DW_AT_name
	.long	327                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	19                      @ DW_AT_decl_line
	.byte	8                       @ DW_AT_data_member_location
	.byte	3                       @ Abbrev [3] 0x46:0xc DW_TAG_member
	.long	.Linfo_string7          @ DW_AT_name
	.long	327                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	20                      @ DW_AT_decl_line
	.byte	12                      @ DW_AT_data_member_location
	.byte	3                       @ Abbrev [3] 0x52:0xc DW_TAG_member
	.long	.Linfo_string8          @ DW_AT_name
	.long	334                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	21                      @ DW_AT_decl_line
	.byte	16                      @ DW_AT_data_member_location
	.byte	3                       @ Abbrev [3] 0x5e:0xc DW_TAG_member
	.long	.Linfo_string10         @ DW_AT_name
	.long	341                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	22                      @ DW_AT_decl_line
	.byte	20                      @ DW_AT_data_member_location
	.byte	3                       @ Abbrev [3] 0x6a:0xc DW_TAG_member
	.long	.Linfo_string11         @ DW_AT_name
	.long	334                     @ DW_AT_type
	.byte	2                       @ DW_AT_decl_file
	.byte	23                      @ DW_AT_decl_line
	.byte	24                      @ DW_AT_data_member_location
	.byte	4                       @ Abbrev [4] 0x76:0xe DW_TAG_subprogram
	.long	.Linfo_string12         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	7                       @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	5                       @ Abbrev [5] 0x7e:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	4                       @ Abbrev [4] 0x84:0x18 DW_TAG_subprogram
	.long	.Linfo_string12         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	8                       @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	5                       @ Abbrev [5] 0x8c:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	6                       @ Abbrev [6] 0x91:0x5 DW_TAG_formal_parameter
	.long	334                     @ DW_AT_type
	.byte	6                       @ Abbrev [6] 0x96:0x5 DW_TAG_formal_parameter
	.long	327                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	7                       @ Abbrev [7] 0x9c:0x1c DW_TAG_subprogram
	.long	.Linfo_string13         @ DW_AT_linkage_name
	.long	.Linfo_string14         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	9                       @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	5                       @ Abbrev [5] 0xa8:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	6                       @ Abbrev [6] 0xad:0x5 DW_TAG_formal_parameter
	.long	334                     @ DW_AT_type
	.byte	6                       @ Abbrev [6] 0xb2:0x5 DW_TAG_formal_parameter
	.long	327                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	8                       @ Abbrev [8] 0xb8:0x1b DW_TAG_subprogram
	.long	.Linfo_string15         @ DW_AT_linkage_name
	.long	.Linfo_string16         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	10                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	5                       @ Abbrev [5] 0xc8:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	6                       @ Abbrev [6] 0xcd:0x5 DW_TAG_formal_parameter
	.long	351                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	8                       @ Abbrev [8] 0xd3:0x16 DW_TAG_subprogram
	.long	.Linfo_string17         @ DW_AT_linkage_name
	.long	.Linfo_string18         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	11                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	1                       @ DW_AT_accessibility
                                        @ DW_ACCESS_public
	.byte	5                       @ Abbrev [5] 0xe3:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	9                       @ Abbrev [9] 0xe9:0x1a DW_TAG_subprogram
	.long	.Linfo_string19         @ DW_AT_linkage_name
	.long	.Linfo_string20         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	14                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	5                       @ Abbrev [5] 0xf8:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	6                       @ Abbrev [6] 0xfd:0x5 DW_TAG_formal_parameter
	.long	327                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	9                       @ Abbrev [9] 0x103:0x15 DW_TAG_subprogram
	.long	.Linfo_string21         @ DW_AT_linkage_name
	.long	.Linfo_string22         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	15                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	5                       @ Abbrev [5] 0x112:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	10                      @ Abbrev [10] 0x118:0x11 DW_TAG_subprogram
	.long	.Linfo_string23         @ DW_AT_linkage_name
	.long	.Linfo_string24         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	16                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	5                       @ Abbrev [5] 0x123:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	10                      @ Abbrev [10] 0x129:0x16 DW_TAG_subprogram
	.long	.Linfo_string25         @ DW_AT_linkage_name
	.long	.Linfo_string26         @ DW_AT_name
	.byte	2                       @ DW_AT_decl_file
	.byte	17                      @ DW_AT_decl_line
                                        @ DW_AT_declaration
                                        @ DW_AT_external
	.byte	5                       @ Abbrev [5] 0x134:0x5 DW_TAG_formal_parameter
	.long	346                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	6                       @ Abbrev [6] 0x139:0x5 DW_TAG_formal_parameter
	.long	351                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	11                      @ Abbrev [11] 0x140:0x7 DW_TAG_base_type
	.long	.Linfo_string4          @ DW_AT_name
	.byte	4                       @ DW_AT_encoding
	.byte	8                       @ DW_AT_byte_size
	.byte	11                      @ Abbrev [11] 0x147:0x7 DW_TAG_base_type
	.long	.Linfo_string6          @ DW_AT_name
	.byte	5                       @ DW_AT_encoding
	.byte	4                       @ DW_AT_byte_size
	.byte	11                      @ Abbrev [11] 0x14e:0x7 DW_TAG_base_type
	.long	.Linfo_string9          @ DW_AT_name
	.byte	4                       @ DW_AT_encoding
	.byte	4                       @ DW_AT_byte_size
	.byte	12                      @ Abbrev [12] 0x155:0x5 DW_TAG_pointer_type
	.long	334                     @ DW_AT_type
	.byte	12                      @ Abbrev [12] 0x15a:0x5 DW_TAG_pointer_type
	.long	38                      @ DW_AT_type
	.byte	12                      @ Abbrev [12] 0x15f:0x5 DW_TAG_pointer_type
	.long	356                     @ DW_AT_type
	.byte	13                      @ Abbrev [13] 0x164:0x5 DW_TAG_const_type
	.long	334                     @ DW_AT_type
	.byte	14                      @ Abbrev [14] 0x169:0x3b DW_TAG_subprogram
	.long	.Lfunc_begin0           @ DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	91
	.long	380                     @ DW_AT_object_pointer
	.long	457                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x17c:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            @ DW_AT_location
	.long	469                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x185:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc1            @ DW_AT_location
	.long	478                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x18e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            @ DW_AT_location
	.long	489                     @ DW_AT_abstract_origin
	.byte	16                      @ Abbrev [16] 0x197:0xc DW_TAG_lexical_block
	.long	.Ldebug_ranges0         @ DW_AT_ranges
	.byte	17                      @ Abbrev [17] 0x19c:0x6 DW_TAG_variable
	.byte	0                       @ DW_AT_const_value
	.long	501                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	18                      @ Abbrev [18] 0x1a4:0x25 DW_TAG_subprogram
	.long	.Lfunc_begin1           @ DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	445                     @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	16                      @ DW_AT_decl_line
	.long	.Linfo_string44         @ DW_AT_linkage_name
	.long	118                     @ DW_AT_specification
	.byte	19                      @ Abbrev [19] 0x1bd:0xb DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	20                      @ Abbrev [20] 0x1c9:0x39 DW_TAG_subprogram
	.byte	1                       @ DW_AT_decl_file
	.byte	3                       @ DW_AT_decl_line
	.long	156                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	469                     @ DW_AT_object_pointer
	.byte	21                      @ Abbrev [21] 0x1d5:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	22                      @ Abbrev [22] 0x1de:0xb DW_TAG_formal_parameter
	.long	.Linfo_string28         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	3                       @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	22                      @ Abbrev [22] 0x1e9:0xb DW_TAG_formal_parameter
	.long	.Linfo_string29         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	3                       @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	23                      @ Abbrev [23] 0x1f4:0xd DW_TAG_lexical_block
	.byte	24                      @ Abbrev [24] 0x1f5:0xb DW_TAG_variable
	.long	.Linfo_string30         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	11                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	12                      @ Abbrev [12] 0x202:0x5 DW_TAG_pointer_type
	.long	38                      @ DW_AT_type
	.byte	18                      @ Abbrev [18] 0x207:0x7c DW_TAG_subprogram
	.long	.Lfunc_begin2           @ DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	91
	.long	544                     @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	19                      @ DW_AT_decl_line
	.long	.Linfo_string45         @ DW_AT_linkage_name
	.long	132                     @ DW_AT_specification
	.byte	25                      @ Abbrev [25] 0x220:0xd DW_TAG_formal_parameter
	.long	.Ldebug_loc3            @ DW_AT_location
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	26                      @ Abbrev [26] 0x22d:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc4            @ DW_AT_location
	.long	.Linfo_string28         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	19                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	26                      @ Abbrev [26] 0x23c:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc5            @ DW_AT_location
	.long	.Linfo_string29         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	19                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	27                      @ Abbrev [27] 0x24b:0x37 DW_TAG_inlined_subroutine
	.long	457                     @ DW_AT_abstract_origin
	.long	.Ltmp32                 @ DW_AT_low_pc
	.long	.Ltmp43-.Ltmp32         @ DW_AT_high_pc
	.byte	1                       @ DW_AT_call_file
	.byte	20                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x25a:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc8            @ DW_AT_location
	.long	469                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x263:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc7            @ DW_AT_location
	.long	478                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x26c:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc6            @ DW_AT_location
	.long	489                     @ DW_AT_abstract_origin
	.byte	16                      @ Abbrev [16] 0x275:0xc DW_TAG_lexical_block
	.long	.Ldebug_ranges1         @ DW_AT_ranges
	.byte	17                      @ Abbrev [17] 0x27a:0x6 DW_TAG_variable
	.byte	0                       @ DW_AT_const_value
	.long	501                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	28                      @ Abbrev [28] 0x283:0x21 DW_TAG_subprogram
	.long	.Lfunc_begin3           @ DW_AT_low_pc
	.long	.Lfunc_end3-.Lfunc_begin3 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	664                     @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	23                      @ DW_AT_decl_line
	.long	211                     @ DW_AT_specification
	.byte	19                      @ Abbrev [19] 0x298:0xb DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	0                       @ End Of Children Mark
	.byte	20                      @ Abbrev [20] 0x2a4:0x65 DW_TAG_subprogram
	.byte	1                       @ DW_AT_decl_file
	.byte	48                      @ DW_AT_decl_line
	.long	233                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	688                     @ DW_AT_object_pointer
	.byte	21                      @ Abbrev [21] 0x2b0:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	22                      @ Abbrev [22] 0x2b9:0xb DW_TAG_formal_parameter
	.long	.Linfo_string31         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	48                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x2c4:0xb DW_TAG_variable
	.long	.Linfo_string32         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	49                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x2cf:0xb DW_TAG_variable
	.long	.Linfo_string33         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	50                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x2da:0xb DW_TAG_variable
	.long	.Linfo_string34         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	51                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	23                      @ Abbrev [23] 0x2e5:0x23 DW_TAG_lexical_block
	.byte	24                      @ Abbrev [24] 0x2e6:0xb DW_TAG_variable
	.long	.Linfo_string35         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	82                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x2f1:0xb DW_TAG_variable
	.long	.Linfo_string36         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	82                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x2fc:0xb DW_TAG_variable
	.long	.Linfo_string37         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	82                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	20                      @ Abbrev [20] 0x309:0x4d DW_TAG_subprogram
	.byte	1                       @ DW_AT_decl_file
	.byte	103                     @ DW_AT_decl_line
	.long	297                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	789                     @ DW_AT_object_pointer
	.byte	21                      @ Abbrev [21] 0x315:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	22                      @ Abbrev [22] 0x31e:0xb DW_TAG_formal_parameter
	.long	.Linfo_string38         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	103                     @ DW_AT_decl_line
	.long	351                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x329:0xb DW_TAG_variable
	.long	.Linfo_string39         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	105                     @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x334:0xb DW_TAG_variable
	.long	.Linfo_string40         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	107                     @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x33f:0xb DW_TAG_variable
	.long	.Linfo_string41         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	106                     @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x34a:0xb DW_TAG_variable
	.long	.Linfo_string42         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	104                     @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	20                      @ Abbrev [20] 0x356:0x2c DW_TAG_subprogram
	.byte	1                       @ DW_AT_decl_file
	.byte	93                      @ DW_AT_decl_line
	.long	280                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	866                     @ DW_AT_object_pointer
	.byte	21                      @ Abbrev [21] 0x362:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	24                      @ Abbrev [24] 0x36b:0xb DW_TAG_variable
	.long	.Linfo_string39         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	94                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	24                      @ Abbrev [24] 0x376:0xb DW_TAG_variable
	.long	.Linfo_string43         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	96                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	20                      @ Abbrev [20] 0x382:0x21 DW_TAG_subprogram
	.byte	1                       @ DW_AT_decl_file
	.byte	118                     @ DW_AT_decl_line
	.long	259                     @ DW_AT_specification
	.byte	1                       @ DW_AT_inline
	.long	910                     @ DW_AT_object_pointer
	.byte	21                      @ Abbrev [21] 0x38e:0x9 DW_TAG_formal_parameter
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	24                      @ Abbrev [24] 0x397:0xb DW_TAG_variable
	.long	.Linfo_string39         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	119                     @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	0                       @ End Of Children Mark
	.byte	28                      @ Abbrev [28] 0x3a3:0xf7 DW_TAG_subprogram
	.long	.Lfunc_begin4           @ DW_AT_low_pc
	.long	.Lfunc_end4-.Lfunc_begin4 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	952                     @ DW_AT_object_pointer
	.byte	1                       @ DW_AT_decl_file
	.byte	27                      @ DW_AT_decl_line
	.long	184                     @ DW_AT_specification
	.byte	25                      @ Abbrev [25] 0x3b8:0xd DW_TAG_formal_parameter
	.long	.Ldebug_loc9            @ DW_AT_location
	.long	.Linfo_string27         @ DW_AT_name
	.long	514                     @ DW_AT_type
                                        @ DW_AT_artificial
	.byte	26                      @ Abbrev [26] 0x3c5:0xf DW_TAG_formal_parameter
	.long	.Ldebug_loc10           @ DW_AT_location
	.long	.Linfo_string38         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	27                      @ DW_AT_decl_line
	.long	351                     @ DW_AT_type
	.byte	29                      @ Abbrev [29] 0x3d4:0xf DW_TAG_variable
	.long	.Ldebug_loc11           @ DW_AT_location
	.long	.Linfo_string31         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	28                      @ DW_AT_decl_line
	.long	327                     @ DW_AT_type
	.byte	29                      @ Abbrev [29] 0x3e3:0xf DW_TAG_variable
	.long	.Ldebug_loc12           @ DW_AT_location
	.long	.Linfo_string46         @ DW_AT_name
	.byte	1                       @ DW_AT_decl_file
	.byte	29                      @ DW_AT_decl_line
	.long	334                     @ DW_AT_type
	.byte	30                      @ Abbrev [30] 0x3f2:0x3f DW_TAG_inlined_subroutine
	.long	676                     @ DW_AT_abstract_origin
	.long	.Ldebug_ranges2         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	42                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x3fd:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc23           @ DW_AT_location
	.long	688                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x406:0x9 DW_TAG_variable
	.long	.Ldebug_loc22           @ DW_AT_location
	.long	708                     @ DW_AT_abstract_origin
	.byte	16                      @ Abbrev [16] 0x40f:0x21 DW_TAG_lexical_block
	.long	.Ldebug_ranges3         @ DW_AT_ranges
	.byte	31                      @ Abbrev [31] 0x414:0x9 DW_TAG_variable
	.long	.Ldebug_loc20           @ DW_AT_location
	.long	742                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x41d:0x9 DW_TAG_variable
	.long	.Ldebug_loc21           @ DW_AT_location
	.long	753                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x426:0x9 DW_TAG_variable
	.long	.Ldebug_loc24           @ DW_AT_location
	.long	764                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	30                      @ Abbrev [30] 0x431:0x2c DW_TAG_inlined_subroutine
	.long	777                     @ DW_AT_abstract_origin
	.long	.Ldebug_ranges4         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	32                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x43c:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc13           @ DW_AT_location
	.long	789                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x445:0x9 DW_TAG_variable
	.long	.Ldebug_loc14           @ DW_AT_location
	.long	809                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x44e:0x9 DW_TAG_variable
	.long	.Ldebug_loc15           @ DW_AT_location
	.long	820                     @ DW_AT_abstract_origin
	.byte	32                      @ Abbrev [32] 0x457:0x5 DW_TAG_variable
	.long	831                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	30                      @ Abbrev [30] 0x45d:0x1e DW_TAG_inlined_subroutine
	.long	854                     @ DW_AT_abstract_origin
	.long	.Ldebug_ranges5         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	35                      @ DW_AT_call_line
	.byte	31                      @ Abbrev [31] 0x468:0x9 DW_TAG_variable
	.long	.Ldebug_loc16           @ DW_AT_location
	.long	875                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x471:0x9 DW_TAG_variable
	.long	.Ldebug_loc17           @ DW_AT_location
	.long	886                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	30                      @ Abbrev [30] 0x47b:0x1e DW_TAG_inlined_subroutine
	.long	898                     @ DW_AT_abstract_origin
	.long	.Ldebug_ranges6         @ DW_AT_ranges
	.byte	1                       @ DW_AT_call_file
	.byte	38                      @ DW_AT_call_line
	.byte	15                      @ Abbrev [15] 0x486:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc19           @ DW_AT_location
	.long	910                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x48f:0x9 DW_TAG_variable
	.long	.Ldebug_loc18           @ DW_AT_location
	.long	919                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	14                      @ Abbrev [14] 0x49a:0x44 DW_TAG_subprogram
	.long	.Lfunc_begin5           @ DW_AT_low_pc
	.long	.Lfunc_end5-.Lfunc_begin5 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	1197                    @ DW_AT_object_pointer
	.long	777                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x4ad:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc25           @ DW_AT_location
	.long	789                     @ DW_AT_abstract_origin
	.byte	33                      @ Abbrev [33] 0x4b6:0x7 DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	81
	.long	798                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x4bd:0x9 DW_TAG_variable
	.long	.Ldebug_loc26           @ DW_AT_location
	.long	809                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x4c6:0x9 DW_TAG_variable
	.long	.Ldebug_loc27           @ DW_AT_location
	.long	820                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x4cf:0x9 DW_TAG_variable
	.long	.Ldebug_loc28           @ DW_AT_location
	.long	842                     @ DW_AT_abstract_origin
	.byte	32                      @ Abbrev [32] 0x4d8:0x5 DW_TAG_variable
	.long	831                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	14                      @ Abbrev [14] 0x4de:0x2f DW_TAG_subprogram
	.long	.Lfunc_begin6           @ DW_AT_low_pc
	.long	.Lfunc_end6-.Lfunc_begin6 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	1265                    @ DW_AT_object_pointer
	.long	854                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x4f1:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc29           @ DW_AT_location
	.long	866                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x4fa:0x9 DW_TAG_variable
	.long	.Ldebug_loc30           @ DW_AT_location
	.long	875                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x503:0x9 DW_TAG_variable
	.long	.Ldebug_loc31           @ DW_AT_location
	.long	886                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	14                      @ Abbrev [14] 0x50d:0x24 DW_TAG_subprogram
	.long	.Lfunc_begin7           @ DW_AT_low_pc
	.long	.Lfunc_end7-.Lfunc_begin7 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	1312                    @ DW_AT_object_pointer
	.long	898                     @ DW_AT_abstract_origin
	.byte	33                      @ Abbrev [33] 0x520:0x7 DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	80
	.long	910                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x527:0x9 DW_TAG_variable
	.long	.Ldebug_loc32           @ DW_AT_location
	.long	919                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	14                      @ Abbrev [14] 0x531:0x5c DW_TAG_subprogram
	.long	.Lfunc_begin8           @ DW_AT_low_pc
	.long	.Lfunc_end8-.Lfunc_begin8 @ DW_AT_high_pc
	.byte	1                       @ DW_AT_frame_base
	.byte	93
	.long	1348                    @ DW_AT_object_pointer
	.long	676                     @ DW_AT_abstract_origin
	.byte	15                      @ Abbrev [15] 0x544:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc33           @ DW_AT_location
	.long	688                     @ DW_AT_abstract_origin
	.byte	33                      @ Abbrev [33] 0x54d:0x7 DW_TAG_formal_parameter
	.byte	1                       @ DW_AT_location
	.byte	81
	.long	697                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x554:0x9 DW_TAG_variable
	.long	.Ldebug_loc34           @ DW_AT_location
	.long	708                     @ DW_AT_abstract_origin
	.byte	32                      @ Abbrev [32] 0x55d:0x5 DW_TAG_variable
	.long	719                     @ DW_AT_abstract_origin
	.byte	32                      @ Abbrev [32] 0x562:0x5 DW_TAG_variable
	.long	730                     @ DW_AT_abstract_origin
	.byte	34                      @ Abbrev [34] 0x567:0x25 DW_TAG_lexical_block
	.long	.Ltmp221                @ DW_AT_low_pc
	.long	.Ltmp227-.Ltmp221       @ DW_AT_high_pc
	.byte	31                      @ Abbrev [31] 0x570:0x9 DW_TAG_variable
	.long	.Ldebug_loc35           @ DW_AT_location
	.long	742                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x579:0x9 DW_TAG_variable
	.long	.Ldebug_loc36           @ DW_AT_location
	.long	753                     @ DW_AT_abstract_origin
	.byte	31                      @ Abbrev [31] 0x582:0x9 DW_TAG_variable
	.long	.Ldebug_loc37           @ DW_AT_location
	.long	764                     @ DW_AT_abstract_origin
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.byte	0                       @ End Of Children Mark
	.section	.debug_ranges,"",%progbits
.Ldebug_range:
.Ldebug_ranges0:
	.long	.Ltmp9-.Lfunc_begin0
	.long	.Ltmp10-.Lfunc_begin0
	.long	.Ltmp11-.Lfunc_begin0
	.long	.Ltmp12-.Lfunc_begin0
	.long	.Ltmp13-.Lfunc_begin0
	.long	.Ltmp14-.Lfunc_begin0
	.long	.Ltmp16-.Lfunc_begin0
	.long	.Ltmp20-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges1:
	.long	.Ltmp32-.Lfunc_begin0
	.long	.Ltmp33-.Lfunc_begin0
	.long	.Ltmp34-.Lfunc_begin0
	.long	.Ltmp35-.Lfunc_begin0
	.long	.Ltmp38-.Lfunc_begin0
	.long	.Ltmp43-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges2:
	.long	.Ltmp53-.Lfunc_begin0
	.long	.Ltmp54-.Lfunc_begin0
	.long	.Ltmp102-.Lfunc_begin0
	.long	.Ltmp103-.Lfunc_begin0
	.long	.Ltmp106-.Lfunc_begin0
	.long	.Ltmp119-.Lfunc_begin0
	.long	.Ltmp126-.Lfunc_begin0
	.long	.Ltmp135-.Lfunc_begin0
	.long	.Ltmp136-.Lfunc_begin0
	.long	.Ltmp140-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges3:
	.long	.Ltmp134-.Lfunc_begin0
	.long	.Ltmp135-.Lfunc_begin0
	.long	.Ltmp136-.Lfunc_begin0
	.long	.Ltmp140-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges4:
	.long	.Ltmp54-.Lfunc_begin0
	.long	.Ltmp57-.Lfunc_begin0
	.long	.Ltmp59-.Lfunc_begin0
	.long	.Ltmp60-.Lfunc_begin0
	.long	.Ltmp61-.Lfunc_begin0
	.long	.Ltmp78-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges5:
	.long	.Ltmp78-.Lfunc_begin0
	.long	.Ltmp90-.Lfunc_begin0
	.long	.Ltmp97-.Lfunc_begin0
	.long	.Ltmp100-.Lfunc_begin0
	.long	0
	.long	0
.Ldebug_ranges6:
	.long	.Ltmp90-.Lfunc_begin0
	.long	.Ltmp97-.Lfunc_begin0
	.long	.Ltmp100-.Lfunc_begin0
	.long	.Ltmp102-.Lfunc_begin0
	.long	.Ltmp103-.Lfunc_begin0
	.long	.Ltmp104-.Lfunc_begin0
	.long	.Ltmp121-.Lfunc_begin0
	.long	.Ltmp122-.Lfunc_begin0
	.long	.Ltmp125-.Lfunc_begin0
	.long	.Ltmp126-.Lfunc_begin0
	.long	0
	.long	0
	.section	.debug_macinfo,"",%progbits
.Ldebug_macinfo:
.Lcu_macro_begin0:
	.byte	0                       @ End Of Macro List Mark
	.section	.debug_pubnames,"",%progbits
	.long	.LpubNames_end0-.LpubNames_begin0 @ Length of Public Names Info
.LpubNames_begin0:
	.short	2                       @ DWARF Version
	.long	.Lcu_begin0             @ Offset of Compilation Unit Info
	.long	1422                    @ Compilation Unit Length
	.long	898                     @ DIE offset
	.asciz	"Yin::absoluteThreshold" @ External Name
	.long	854                     @ DIE offset
	.asciz	"Yin::cumulativeMeanNormalizedDifference" @ External Name
	.long	519                     @ DIE offset
	.asciz	"Yin::Yin"              @ External Name
	.long	457                     @ DIE offset
	.asciz	"Yin::initialize"       @ External Name
	.long	643                     @ DIE offset
	.asciz	"Yin::getProbability"   @ External Name
	.long	676                     @ DIE offset
	.asciz	"Yin::parabolicInterpolation" @ External Name
	.long	931                     @ DIE offset
	.asciz	"Yin::getPitch"         @ External Name
	.long	777                     @ DIE offset
	.asciz	"Yin::difference"       @ External Name
	.long	0                       @ End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",%progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 @ Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       @ DWARF Version
	.long	.Lcu_begin0             @ Offset of Compilation Unit Info
	.long	1422                    @ Compilation Unit Length
	.long	38                      @ DIE offset
	.asciz	"Yin"                   @ External Name
	.long	334                     @ DIE offset
	.asciz	"float"                 @ External Name
	.long	320                     @ DIE offset
	.asciz	"double"                @ External Name
	.long	327                     @ DIE offset
	.asciz	"int"                   @ External Name
	.long	0                       @ End Mark
.LpubTypes_end0:
	.cfi_sections .debug_frame

	.globl	_ZN3YinC1Ev
	.type	_ZN3YinC1Ev,%function
_ZN3YinC1Ev = _ZN3YinC2Ev
	.globl	_ZN3YinC1Efi
	.type	_ZN3YinC1Efi,%function
_ZN3YinC1Efi = _ZN3YinC2Efi
	.ident	"clang version 3.9.1-9 (tags/RELEASE_391/rc2)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
	.section	.debug_line,"",%progbits
.Lline_table_start0:
