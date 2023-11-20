_start:
mov rbx, rdi
jmp START_END
PRINT_OUT:
mov r11, 0x0123456789abcdef
jmp r11
GET_IN:
mov r11, 0x0123456789abcdef
jmp r11
START_END:
add BYTE [rbx+3], 0xff
add BYTE [rbx+4], 0x01
add BYTE [rbx+5], 0x05
add BYTE [rbx+6], 0x0a
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_0
LOOP_START_0:
cmp byte [rbx], 0
je LOOP_END_1
LOOP_START_1:
add BYTE [rbx+3], 0x01
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_1
LOOP_END_1:
add BYTE [rbx+1], 0x05
add BYTE [rbx+2], 0x01
add BYTE [rbx+4], 0x01
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_2
LOOP_START_2:
add BYTE [rbx-2], 0x01
add BYTE [rbx+3], 0x01
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_2
LOOP_END_2:
add BYTE [rbx-1], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_0
LOOP_END_0:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_3
LOOP_START_3:
cmp byte [rbx], 0
je LOOP_END_4
LOOP_START_4:
add BYTE [rbx+3], 0x01
add BYTE [rbx+4], 0x01
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_4
LOOP_END_4:
add BYTE [rbx], 0x03
add BYTE [rbx+2], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_5
LOOP_START_5:
add BYTE [rbx-1], 0x01
add BYTE [rbx+2], 0x01
add BYTE [rbx+3], 0x01
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_5
LOOP_END_5:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_6
LOOP_START_6:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_7
LOOP_START_7:
cmp byte [rbx], 0
je LOOP_END_8
LOOP_START_8:
add BYTE [rbx+3], 0x01
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_8
LOOP_END_8:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_7
LOOP_END_7:
add BYTE [rbx-2], 0x02
add BYTE [rbx-1], 0x01
add BYTE [rbx+5], 0xff
lea rbx,[rbx+5]
cmp byte [rbx], 0
jne LOOP_START_6
LOOP_END_6:
add BYTE [rbx-1], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_3
LOOP_END_3:
add BYTE [rbx], 0x03
add BYTE [rbx+1], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_9
LOOP_START_9:
cmp byte [rbx], 0
je LOOP_END_10
LOOP_START_10:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_10
LOOP_END_10:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_11
LOOP_START_11:
add BYTE [rbx+1], 0x11
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_11
LOOP_END_11:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_9
LOOP_END_9:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_12
LOOP_START_12:
cmp byte [rbx], 0
je LOOP_END_13
LOOP_START_13:
add BYTE [rbx], 0x09
lea rdi, [rbx+0]
call print
add BYTE [rbx], 0xf8
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_13
LOOP_END_13:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_14
LOOP_START_14:
add BYTE [rbx], 0xff
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_14
LOOP_END_14:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_15
LOOP_START_15:
lea rdi, [rbx+2]
call input
add BYTE [rbx+2], 0xf6
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_16
LOOP_START_16:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_16
LOOP_END_16:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_15
LOOP_END_15:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_17
LOOP_START_17:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_18
LOOP_START_18:
add BYTE [rbx+1], 0xfe
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_19
LOOP_START_19:
add BYTE [rbx-1], 0xff
add BYTE [rbx+1], 0x01
add BYTE [rbx+2], 0xff
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_19
LOOP_END_19:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_20
LOOP_START_20:
cmp byte [rbx], 0
je LOOP_END_21
LOOP_START_21:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_21
LOOP_END_21:
add BYTE [rbx], 0x01
add BYTE [rbx+1], 0xff
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_22
LOOP_START_22:
add BYTE [rbx], 0x01
add BYTE [rbx+2], 0x01
add BYTE [rbx+3], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_22
LOOP_END_22:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_23
LOOP_START_23:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_23
LOOP_END_23:
add BYTE [rbx-1], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_20
LOOP_END_20:
add BYTE [rbx+1], 0x02
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_24
LOOP_START_24:
add BYTE [rbx-1], 0x01
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_24
LOOP_END_24:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_25
LOOP_START_25:
cmp byte [rbx], 0
je LOOP_END_26
LOOP_START_26:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_26
LOOP_END_26:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_27
LOOP_START_27:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_27
LOOP_END_27:
add BYTE [rbx+3], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_25
LOOP_END_25:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_28
LOOP_START_28:
add BYTE [rbx], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_28
LOOP_END_28:
add BYTE [rbx-1], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_29
LOOP_START_29:
add BYTE [rbx], 0x02
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_29
LOOP_END_29:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_30
LOOP_START_30:
add BYTE [rbx], 0xfa
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_30
LOOP_END_30:
add BYTE [rbx+1], 0x03
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_31
LOOP_START_31:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_31
LOOP_END_31:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_18
LOOP_END_18:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_17
LOOP_END_17:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_32
LOOP_START_32:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_33
LOOP_START_33:
add BYTE [rbx], 0x01
add BYTE [rbx+2], 0x01
add BYTE [rbx+3], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_33
LOOP_END_33:
add BYTE [rbx], 0x01
add BYTE [rbx+2], 0x01
add BYTE [rbx+5], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_34
LOOP_START_34:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_34
LOOP_END_34:
add BYTE [rbx+1], 0xff
add BYTE [rbx+2], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_35
LOOP_START_35:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_36
LOOP_START_36:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
add BYTE [rbx+2], 0x03
add BYTE [rbx+4], 0x02
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_37
LOOP_START_37:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_37
LOOP_END_37:
add BYTE [rbx], 0x03
add BYTE [rbx-3], 0x02
add BYTE [rbx-6], 0x02
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_38
LOOP_START_38:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_38
LOOP_END_38:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_36
LOOP_END_36:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_39
LOOP_START_39:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_40
LOOP_START_40:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_40
LOOP_END_40:
add BYTE [rbx], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_39
LOOP_END_39:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_41
LOOP_START_41:
add BYTE [rbx-2], 0x02
add BYTE [rbx-3], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_42
LOOP_START_42:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_42
LOOP_END_42:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x02
add BYTE [rbx+4], 0x02
add BYTE [rbx+7], 0x02
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_41
LOOP_END_41:
add BYTE [rbx-3], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_43
LOOP_START_43:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_43
LOOP_END_43:
add BYTE [rbx], 0x01
add BYTE [rbx+1], 0xff
add BYTE [rbx+3], 0xff
lea rbx,[rbx+5]
cmp byte [rbx], 0
jne LOOP_START_35
LOOP_END_35:
add BYTE [rbx-2], 0x01
add BYTE [rbx-4], 0x01
add BYTE [rbx-7], 0x01
add BYTE [rbx-9], 0xff
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_44
LOOP_START_44:
add BYTE [rbx], 0x01
add BYTE [rbx-1], 0x01
add BYTE [rbx-3], 0xff
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_44
LOOP_END_44:
add BYTE [rbx], 0x01
add BYTE [rbx-1], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_45
LOOP_START_45:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_46
LOOP_START_46:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_47
LOOP_START_47:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_47
LOOP_END_47:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_48
LOOP_START_48:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_49
LOOP_START_49:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_49
LOOP_END_49:
add BYTE [rbx-2], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_50
LOOP_START_50:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_50
LOOP_END_50:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_48
LOOP_END_48:
cmp byte [rbx], 0
jne LOOP_START_46
LOOP_END_46:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_51
LOOP_START_51:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_52
LOOP_START_52:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_53
LOOP_START_53:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_53
LOOP_END_53:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_54
LOOP_START_54:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_54
LOOP_END_54:
add BYTE [rbx-2], 0xff
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_52
LOOP_END_52:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_55
LOOP_START_55:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_55
LOOP_END_55:
cmp byte [rbx], 0
jne LOOP_START_51
LOOP_END_51:
add BYTE [rbx+3], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_56
LOOP_START_56:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_56
LOOP_END_56:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_45
LOOP_END_45:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_57
LOOP_START_57:
add BYTE [rbx], 0xff
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_58
LOOP_START_58:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_58
LOOP_END_58:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_57
LOOP_END_57:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_59
LOOP_START_59:
cmp byte [rbx], 0
je LOOP_END_60
LOOP_START_60:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_60
LOOP_END_60:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_61
LOOP_START_61:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_62
LOOP_START_62:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_62
LOOP_END_62:
add BYTE [rbx+5], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_63
LOOP_START_63:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_63
LOOP_END_63:
add BYTE [rbx-1], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_61
LOOP_END_61:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_64
LOOP_START_64:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_65
LOOP_START_65:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_65
LOOP_END_65:
add BYTE [rbx-4], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_66
LOOP_START_66:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_66
LOOP_END_66:
add BYTE [rbx+2], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
jne LOOP_START_64
LOOP_END_64:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_59
LOOP_END_59:
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_67
LOOP_START_67:
add BYTE [rbx], 0xfd
add BYTE [rbx-1], 0xfb
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_68
LOOP_START_68:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_69
LOOP_START_69:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_70
LOOP_START_70:
add BYTE [rbx-1], 0xff
add BYTE [rbx+1], 0x03
add BYTE [rbx], 0x07
cmp byte [rbx], 0
je LOOP_END_71
LOOP_START_71:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_71
LOOP_END_71:
cmp byte [rbx], 0
jne LOOP_START_70
LOOP_END_70:
cmp byte [rbx], 0
jne LOOP_START_69
LOOP_END_69:
cmp byte [rbx], 0
jne LOOP_START_68
LOOP_END_68:
add BYTE [rbx-1], 0x01
add BYTE [rbx-2], 0x01
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_67
LOOP_END_67:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_32
LOOP_END_32:
lea rbx,[rbx+2]
cmp byte [rbx], 0
jne LOOP_START_12
LOOP_END_12:
cmp byte [rbx], 0
je LOOP_END_72
LOOP_START_72:
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call input
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call input
lea rdi, [rbx+0]
call input
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
add BYTE [rbx], 0xff
lea rdi, [rbx+0]
call print
add BYTE [rbx], 0xff
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
add BYTE [rbx], 0xff
lea rdi, [rbx+0]
call print
lea rdi, [rbx+0]
call print
cmp byte [rbx], 0
jne LOOP_START_72
LOOP_END_72:
ret
