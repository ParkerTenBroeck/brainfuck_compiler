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
add BYTE [rbx], 0x0d
cmp byte [rbx], 0
je LOOP_END_0
LOOP_START_0:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x02
add BYTE [rbx+4], 0x05
add BYTE [rbx+5], 0x02
add BYTE [rbx+6], 0x01
cmp byte [rbx], 0
jne LOOP_START_0
LOOP_END_0:
add BYTE [rbx+5], 0x06
add BYTE [rbx+6], 0xfd
add BYTE [rbx+16], 0x0f
lea rbx,[rbx+16]
cmp byte [rbx], 0
je LOOP_END_1
LOOP_START_1:
cmp byte [rbx], 0
je LOOP_END_2
LOOP_START_2:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_2
LOOP_END_2:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_3
LOOP_START_3:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_3
LOOP_END_3:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_1
LOOP_END_1:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_4
LOOP_START_4:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_5
LOOP_START_5:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_5
LOOP_END_5:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_4
LOOP_END_4:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_6
LOOP_START_6:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_6
LOOP_END_6:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_7
LOOP_START_7:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_7
LOOP_END_7:
add BYTE [rbx], 0x01
add BYTE [rbx-7], 0x05
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_8
LOOP_START_8:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_9
LOOP_START_9:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_9
LOOP_END_9:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_8
LOOP_END_8:
add BYTE [rbx+7], 0x01
add BYTE [rbx+34], 0x01
lea rbx,[rbx+17]
cmp byte [rbx], 0
je LOOP_END_10
LOOP_START_10:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_10
LOOP_END_10:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_11
LOOP_START_11:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_11
LOOP_END_11:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_12
LOOP_START_12:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_13
LOOP_START_13:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_14
LOOP_START_14:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_14
LOOP_END_14:
lea rbx,[rbx+2]
cmp byte [rbx], 0
jne LOOP_START_13
LOOP_END_13:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_15
LOOP_START_15:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_15
LOOP_END_15:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_16
LOOP_START_16:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_16
LOOP_END_16:
add BYTE [rbx], 0x01
add BYTE [rbx-6], 0x04
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_17
LOOP_START_17:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_18
LOOP_START_18:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_18
LOOP_END_18:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_17
LOOP_END_17:
add BYTE [rbx+6], 0x01
add BYTE [rbx], 0x07
cmp byte [rbx], 0
je LOOP_END_19
LOOP_START_19:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_20
LOOP_START_20:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_20
LOOP_END_20:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_19
LOOP_END_19:
add BYTE [rbx+6], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
je LOOP_END_21
LOOP_START_21:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_21
LOOP_END_21:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_22
LOOP_START_22:
cmp byte [rbx], 0
je LOOP_END_23
LOOP_START_23:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_23
LOOP_END_23:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_24
LOOP_START_24:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_25
LOOP_START_25:
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_25
LOOP_END_25:
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_26
LOOP_START_26:
add BYTE [rbx], 0xff
add BYTE [rbx+6], 0x01
add BYTE [rbx+4], 0x01
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_26
LOOP_END_26:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_24
LOOP_END_24:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_27
LOOP_START_27:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_27
LOOP_END_27:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_28
LOOP_START_28:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_29
LOOP_START_29:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_29
LOOP_END_29:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_30
LOOP_START_30:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
add BYTE [rbx+5], 0x01
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_30
LOOP_END_30:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_28
LOOP_END_28:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_31
LOOP_START_31:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_31
LOOP_END_31:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_32
LOOP_START_32:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_32
LOOP_END_32:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_33
LOOP_START_33:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
add BYTE [rbx+5], 0x01
cmp byte [rbx], 0
jne LOOP_START_33
LOOP_END_33:
add BYTE [rbx+9], 0x0f
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_34
LOOP_START_34:
cmp byte [rbx], 0
je LOOP_END_35
LOOP_START_35:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_35
LOOP_END_35:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_36
LOOP_START_36:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_36
LOOP_END_36:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_37
LOOP_START_37:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_37
LOOP_END_37:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_38
LOOP_START_38:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_38
LOOP_END_38:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_39
LOOP_START_39:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_39
LOOP_END_39:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_40
LOOP_START_40:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_40
LOOP_END_40:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_41
LOOP_START_41:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_41
LOOP_END_41:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_42
LOOP_START_42:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_42
LOOP_END_42:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_43
LOOP_START_43:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_43
LOOP_END_43:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_44
LOOP_START_44:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_44
LOOP_END_44:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_45
LOOP_START_45:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_45
LOOP_END_45:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_34
LOOP_END_34:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_46
LOOP_START_46:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_46
LOOP_END_46:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_47
LOOP_START_47:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_47
LOOP_END_47:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_48
LOOP_START_48:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_49
LOOP_START_49:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_49
LOOP_END_49:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_50
LOOP_START_50:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_51
LOOP_START_51:
add BYTE [rbx], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_52
LOOP_START_52:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_52
LOOP_END_52:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_53
LOOP_START_53:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_53
LOOP_END_53:
add BYTE [rbx], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_51
LOOP_END_51:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_54
LOOP_START_54:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_54
LOOP_END_54:
cmp byte [rbx], 0
jne LOOP_START_50
LOOP_END_50:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_55
LOOP_START_55:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_55
LOOP_END_55:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_56
LOOP_START_56:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_57
LOOP_START_57:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_57
LOOP_END_57:
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_56
LOOP_END_56:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_58
LOOP_START_58:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_58
LOOP_END_58:
add BYTE [rbx-1], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_48
LOOP_END_48:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_59
LOOP_START_59:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_60
LOOP_START_60:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_60
LOOP_END_60:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_61
LOOP_START_61:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_62
LOOP_START_62:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_62
LOOP_END_62:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_63
LOOP_START_63:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_63
LOOP_END_63:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_61
LOOP_END_61:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_64
LOOP_START_64:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_64
LOOP_END_64:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_59
LOOP_END_59:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_65
LOOP_START_65:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_65
LOOP_END_65:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_66
LOOP_START_66:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_66
LOOP_END_66:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_67
LOOP_START_67:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_68
LOOP_START_68:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_68
LOOP_END_68:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_69
LOOP_START_69:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_70
LOOP_START_70:
add BYTE [rbx], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_71
LOOP_START_71:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_71
LOOP_END_71:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_72
LOOP_START_72:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_72
LOOP_END_72:
add BYTE [rbx], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_70
LOOP_END_70:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_73
LOOP_START_73:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_73
LOOP_END_73:
cmp byte [rbx], 0
jne LOOP_START_69
LOOP_END_69:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_74
LOOP_START_74:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_74
LOOP_END_74:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_75
LOOP_START_75:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_76
LOOP_START_76:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_76
LOOP_END_76:
lea rbx,[rbx-11]
cmp byte [rbx], 0
jne LOOP_START_75
LOOP_END_75:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_77
LOOP_START_77:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_77
LOOP_END_77:
add BYTE [rbx-2], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
jne LOOP_START_67
LOOP_END_67:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_78
LOOP_START_78:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_79
LOOP_START_79:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_79
LOOP_END_79:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_80
LOOP_START_80:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_81
LOOP_START_81:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_81
LOOP_END_81:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_82
LOOP_START_82:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_82
LOOP_END_82:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_80
LOOP_END_80:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_83
LOOP_START_83:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_83
LOOP_END_83:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_78
LOOP_END_78:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_84
LOOP_START_84:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_85
LOOP_START_85:
add BYTE [rbx], 0xff
add BYTE [rbx-36], 0x01
cmp byte [rbx], 0
jne LOOP_START_85
LOOP_END_85:
lea rbx,[rbx+5]
cmp byte [rbx], 0
jne LOOP_START_84
LOOP_END_84:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_86
LOOP_START_86:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_86
LOOP_END_86:
add BYTE [rbx+9], 0x0f
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_87
LOOP_START_87:
cmp byte [rbx], 0
je LOOP_END_88
LOOP_START_88:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_88
LOOP_END_88:
add BYTE [rbx-9], 0xff
lea rbx,[rbx-18]
cmp byte [rbx], 0
je LOOP_END_89
LOOP_START_89:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_89
LOOP_END_89:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_87
LOOP_END_87:
add BYTE [rbx], 0x01
add BYTE [rbx+21], 0x01
lea rbx,[rbx+18]
cmp byte [rbx], 0
je LOOP_END_90
LOOP_START_90:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_90
LOOP_END_90:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_91
LOOP_START_91:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_92
LOOP_START_92:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0xff
cmp byte [rbx], 0
jne LOOP_START_92
LOOP_END_92:
add BYTE [rbx], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_93
LOOP_START_93:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_94
LOOP_START_94:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_94
LOOP_END_94:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_95
LOOP_START_95:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_96
LOOP_START_96:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_96
LOOP_END_96:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_97
LOOP_START_97:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_97
LOOP_END_97:
add BYTE [rbx], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_98
LOOP_START_98:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_98
LOOP_END_98:
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_95
LOOP_END_95:
cmp byte [rbx], 0
jne LOOP_START_93
LOOP_END_93:
add BYTE [rbx], 0x01
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_99
LOOP_START_99:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0xff
cmp byte [rbx], 0
jne LOOP_START_99
LOOP_END_99:
add BYTE [rbx], 0x01
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_100
LOOP_START_100:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_101
LOOP_START_101:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_101
LOOP_END_101:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_102
LOOP_START_102:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_103
LOOP_START_103:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_103
LOOP_END_103:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_104
LOOP_START_104:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_104
LOOP_END_104:
add BYTE [rbx], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_105
LOOP_START_105:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_105
LOOP_END_105:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_106
LOOP_START_106:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_106
LOOP_END_106:
add BYTE [rbx], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_102
LOOP_END_102:
cmp byte [rbx], 0
jne LOOP_START_100
LOOP_END_100:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_107
LOOP_START_107:
add BYTE [rbx], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_108
LOOP_START_108:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_108
LOOP_END_108:
lea rbx,[rbx-8]
cmp byte [rbx], 0
jne LOOP_START_107
LOOP_END_107:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_91
LOOP_END_91:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_109
LOOP_START_109:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_109
LOOP_END_109:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_110
LOOP_START_110:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
add BYTE [rbx+4], 0xff
cmp byte [rbx], 0
jne LOOP_START_110
LOOP_END_110:
add BYTE [rbx+9], 0x13
add BYTE [rbx+9], 0x07
lea rbx,[rbx+11]
cmp byte [rbx], 0
je LOOP_END_111
LOOP_START_111:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_111
LOOP_END_111:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_112
LOOP_START_112:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_113
LOOP_START_113:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_113
LOOP_END_113:
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_112
LOOP_END_112:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_114
LOOP_START_114:
add BYTE [rbx-7], 0x01
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_115
LOOP_START_115:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0x01
add BYTE [rbx+3], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_116
LOOP_START_116:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_116
LOOP_END_116:
cmp byte [rbx], 0
jne LOOP_START_115
LOOP_END_115:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_117
LOOP_START_117:
add BYTE [rbx], 0xff
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_118
LOOP_START_118:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
add BYTE [rbx+4], 0xff
cmp byte [rbx], 0
jne LOOP_START_118
LOOP_END_118:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_117
LOOP_END_117:
lea rbx,[rbx+13]
cmp byte [rbx], 0
je LOOP_END_119
LOOP_START_119:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_120
LOOP_START_120:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_120
LOOP_END_120:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_121
LOOP_START_121:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_121
LOOP_END_121:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_122
LOOP_START_122:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_122
LOOP_END_122:
lea rbx,[rbx+5]
cmp byte [rbx], 0
jne LOOP_START_119
LOOP_END_119:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_123
LOOP_START_123:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_123
LOOP_END_123:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_124
LOOP_START_124:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_124
LOOP_END_124:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_125
LOOP_START_125:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_126
LOOP_START_126:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_126
LOOP_END_126:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_127
LOOP_START_127:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_127
LOOP_END_127:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_125
LOOP_END_125:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_128
LOOP_START_128:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_128
LOOP_END_128:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_129
LOOP_START_129:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_130
LOOP_START_130:
add BYTE [rbx], 0xff
add BYTE [rbx-9], 0x01
cmp byte [rbx], 0
jne LOOP_START_130
LOOP_END_130:
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_129
LOOP_END_129:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_131
LOOP_START_131:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_131
LOOP_END_131:
add BYTE [rbx+9], 0x0f
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_132
LOOP_START_132:
cmp byte [rbx], 0
je LOOP_END_133
LOOP_START_133:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_133
LOOP_END_133:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_134
LOOP_START_134:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_134
LOOP_END_134:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_135
LOOP_START_135:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_135
LOOP_END_135:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_136
LOOP_START_136:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_136
LOOP_END_136:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_137
LOOP_START_137:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_137
LOOP_END_137:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_138
LOOP_START_138:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_138
LOOP_END_138:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_139
LOOP_START_139:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_139
LOOP_END_139:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_140
LOOP_START_140:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_140
LOOP_END_140:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_141
LOOP_START_141:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_141
LOOP_END_141:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_142
LOOP_START_142:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_142
LOOP_END_142:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_143
LOOP_START_143:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_143
LOOP_END_143:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_132
LOOP_END_132:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_144
LOOP_START_144:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_144
LOOP_END_144:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_145
LOOP_START_145:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_145
LOOP_END_145:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_146
LOOP_START_146:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_147
LOOP_START_147:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_147
LOOP_END_147:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_148
LOOP_START_148:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_149
LOOP_START_149:
add BYTE [rbx], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_150
LOOP_START_150:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_150
LOOP_END_150:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_151
LOOP_START_151:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_151
LOOP_END_151:
add BYTE [rbx], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_149
LOOP_END_149:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_152
LOOP_START_152:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_152
LOOP_END_152:
cmp byte [rbx], 0
jne LOOP_START_148
LOOP_END_148:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_153
LOOP_START_153:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_153
LOOP_END_153:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_154
LOOP_START_154:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_155
LOOP_START_155:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_155
LOOP_END_155:
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_154
LOOP_END_154:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_156
LOOP_START_156:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_156
LOOP_END_156:
add BYTE [rbx-1], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_146
LOOP_END_146:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_157
LOOP_START_157:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_158
LOOP_START_158:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_158
LOOP_END_158:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_159
LOOP_START_159:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_160
LOOP_START_160:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_160
LOOP_END_160:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_161
LOOP_START_161:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_161
LOOP_END_161:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_159
LOOP_END_159:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_162
LOOP_START_162:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_162
LOOP_END_162:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_157
LOOP_END_157:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_163
LOOP_START_163:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_164
LOOP_START_164:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_164
LOOP_END_164:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_165
LOOP_START_165:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_165
LOOP_END_165:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_163
LOOP_END_163:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_166
LOOP_START_166:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_166
LOOP_END_166:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_167
LOOP_START_167:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_167
LOOP_END_167:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_168
LOOP_START_168:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_168
LOOP_END_168:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_169
LOOP_START_169:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_170
LOOP_START_170:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_170
LOOP_END_170:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_171
LOOP_START_171:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_172
LOOP_START_172:
add BYTE [rbx], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_173
LOOP_START_173:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_173
LOOP_END_173:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_174
LOOP_START_174:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_174
LOOP_END_174:
add BYTE [rbx], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_172
LOOP_END_172:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_175
LOOP_START_175:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_175
LOOP_END_175:
cmp byte [rbx], 0
jne LOOP_START_171
LOOP_END_171:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_176
LOOP_START_176:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_176
LOOP_END_176:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_177
LOOP_START_177:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_178
LOOP_START_178:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_178
LOOP_END_178:
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_177
LOOP_END_177:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_179
LOOP_START_179:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_179
LOOP_END_179:
add BYTE [rbx-1], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_169
LOOP_END_169:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_180
LOOP_START_180:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_181
LOOP_START_181:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_181
LOOP_END_181:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_182
LOOP_START_182:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_183
LOOP_START_183:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_183
LOOP_END_183:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_184
LOOP_START_184:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_184
LOOP_END_184:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_182
LOOP_END_182:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_185
LOOP_START_185:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_185
LOOP_END_185:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_180
LOOP_END_180:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_186
LOOP_START_186:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_187
LOOP_START_187:
add BYTE [rbx], 0xff
add BYTE [rbx-36], 0x01
cmp byte [rbx], 0
jne LOOP_START_187
LOOP_END_187:
lea rbx,[rbx+5]
cmp byte [rbx], 0
jne LOOP_START_186
LOOP_END_186:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_188
LOOP_START_188:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_188
LOOP_END_188:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_189
LOOP_START_189:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_190
LOOP_START_190:
add BYTE [rbx], 0xff
add BYTE [rbx-36], 0x01
cmp byte [rbx], 0
jne LOOP_START_190
LOOP_END_190:
lea rbx,[rbx+6]
cmp byte [rbx], 0
jne LOOP_START_189
LOOP_END_189:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_191
LOOP_START_191:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_191
LOOP_END_191:
add BYTE [rbx+9], 0x08
add BYTE [rbx+9], 0x07
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_192
LOOP_START_192:
cmp byte [rbx], 0
je LOOP_END_193
LOOP_START_193:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_193
LOOP_END_193:
add BYTE [rbx-9], 0xff
lea rbx,[rbx-18]
cmp byte [rbx], 0
je LOOP_END_194
LOOP_START_194:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_194
LOOP_END_194:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_192
LOOP_END_192:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_195
LOOP_START_195:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_196
LOOP_START_196:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_196
LOOP_END_196:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_197
LOOP_START_197:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_197
LOOP_END_197:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_195
LOOP_END_195:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_198
LOOP_START_198:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_198
LOOP_END_198:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_199
LOOP_START_199:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_200
LOOP_START_200:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_200
LOOP_END_200:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_199
LOOP_END_199:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_201
LOOP_START_201:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_201
LOOP_END_201:
add BYTE [rbx+4], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_202
LOOP_START_202:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_202
LOOP_END_202:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_203
LOOP_START_203:
add BYTE [rbx], 0xff
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_204
LOOP_START_204:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
add BYTE [rbx+4], 0x02
cmp byte [rbx], 0
jne LOOP_START_204
LOOP_END_204:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_205
LOOP_START_205:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_205
LOOP_END_205:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_203
LOOP_END_203:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_206
LOOP_START_206:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_206
LOOP_END_206:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_207
LOOP_START_207:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
cmp byte [rbx], 0
jne LOOP_START_207
LOOP_END_207:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_208
LOOP_START_208:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_208
LOOP_END_208:
add BYTE [rbx-6], 0x01
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_209
LOOP_START_209:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0xff
cmp byte [rbx], 0
jne LOOP_START_209
LOOP_END_209:
add BYTE [rbx], 0x01
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_210
LOOP_START_210:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_211
LOOP_START_211:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_212
LOOP_START_212:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
cmp byte [rbx], 0
jne LOOP_START_212
LOOP_END_212:
add BYTE [rbx], 0x01
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_213
LOOP_START_213:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_214
LOOP_START_214:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_214
LOOP_END_214:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_215
LOOP_START_215:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_216
LOOP_START_216:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_216
LOOP_END_216:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_217
LOOP_START_217:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_217
LOOP_END_217:
add BYTE [rbx], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_218
LOOP_START_218:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_218
LOOP_END_218:
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_215
LOOP_END_215:
cmp byte [rbx], 0
jne LOOP_START_213
LOOP_END_213:
add BYTE [rbx], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_219
LOOP_START_219:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0xff
cmp byte [rbx], 0
jne LOOP_START_219
LOOP_END_219:
add BYTE [rbx], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_220
LOOP_START_220:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_221
LOOP_START_221:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_221
LOOP_END_221:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_222
LOOP_START_222:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_223
LOOP_START_223:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_223
LOOP_END_223:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_224
LOOP_START_224:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_224
LOOP_END_224:
add BYTE [rbx], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_225
LOOP_START_225:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_225
LOOP_END_225:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_226
LOOP_START_226:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_226
LOOP_END_226:
add BYTE [rbx], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_222
LOOP_END_222:
cmp byte [rbx], 0
jne LOOP_START_220
LOOP_END_220:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_227
LOOP_START_227:
add BYTE [rbx], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_228
LOOP_START_228:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_228
LOOP_END_228:
lea rbx,[rbx-8]
cmp byte [rbx], 0
jne LOOP_START_227
LOOP_END_227:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_211
LOOP_END_211:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_229
LOOP_START_229:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_229
LOOP_END_229:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_230
LOOP_START_230:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_230
LOOP_END_230:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_231
LOOP_START_231:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_232
LOOP_START_232:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_233
LOOP_START_233:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
cmp byte [rbx], 0
jne LOOP_START_233
LOOP_END_233:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_234
LOOP_START_234:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_234
LOOP_END_234:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_232
LOOP_END_232:
add BYTE [rbx-8], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_235
LOOP_START_235:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_236
LOOP_START_236:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_237
LOOP_START_237:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
add BYTE [rbx-10], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_238
LOOP_START_238:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_238
LOOP_END_238:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_237
LOOP_END_237:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_239
LOOP_START_239:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_239
LOOP_END_239:
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_236
LOOP_END_236:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_240
LOOP_START_240:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_241
LOOP_START_241:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_241
LOOP_END_241:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_240
LOOP_END_240:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_242
LOOP_START_242:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_242
LOOP_END_242:
lea rbx,[rbx-12]
cmp byte [rbx], 0
jne LOOP_START_235
LOOP_END_235:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_243
LOOP_START_243:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_243
LOOP_END_243:
lea rbx,[rbx-4]
cmp byte [rbx], 0
jne LOOP_START_231
LOOP_END_231:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_244
LOOP_START_244:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_244
LOOP_END_244:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_245
LOOP_START_245:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_246
LOOP_START_246:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_247
LOOP_START_247:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
cmp byte [rbx], 0
jne LOOP_START_247
LOOP_END_247:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_248
LOOP_START_248:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_248
LOOP_END_248:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_246
LOOP_END_246:
add BYTE [rbx-8], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_249
LOOP_START_249:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_250
LOOP_START_250:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_251
LOOP_START_251:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-11], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_252
LOOP_START_252:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_252
LOOP_END_252:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_251
LOOP_END_251:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_253
LOOP_START_253:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
add BYTE [rbx-10], 0x01
cmp byte [rbx], 0
jne LOOP_START_253
LOOP_END_253:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_250
LOOP_END_250:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_254
LOOP_START_254:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_255
LOOP_START_255:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
add BYTE [rbx-10], 0x01
cmp byte [rbx], 0
jne LOOP_START_255
LOOP_END_255:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_254
LOOP_END_254:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_256
LOOP_START_256:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_256
LOOP_END_256:
lea rbx,[rbx-11]
cmp byte [rbx], 0
jne LOOP_START_249
LOOP_END_249:
add BYTE [rbx+6], 0x01
cmp byte [rbx], 0
jne LOOP_START_245
LOOP_END_245:
cmp byte [rbx], 0
jne LOOP_START_210
LOOP_END_210:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_257
LOOP_START_257:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_257
LOOP_END_257:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_258
LOOP_START_258:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_259
LOOP_START_259:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_259
LOOP_END_259:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_260
LOOP_START_260:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_261
LOOP_START_261:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_262
LOOP_START_262:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
add BYTE [rbx-10], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_263
LOOP_START_263:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_263
LOOP_END_263:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_262
LOOP_END_262:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_264
LOOP_START_264:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_264
LOOP_END_264:
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_261
LOOP_END_261:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_265
LOOP_START_265:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_266
LOOP_START_266:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_266
LOOP_END_266:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_265
LOOP_END_265:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_267
LOOP_START_267:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_267
LOOP_END_267:
lea rbx,[rbx-12]
cmp byte [rbx], 0
jne LOOP_START_260
LOOP_END_260:
cmp byte [rbx], 0
jne LOOP_START_258
LOOP_END_258:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_268
LOOP_START_268:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_268
LOOP_END_268:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_269
LOOP_START_269:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_269
LOOP_END_269:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_270
LOOP_START_270:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_270
LOOP_END_270:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_271
LOOP_START_271:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_272
LOOP_START_272:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_272
LOOP_END_272:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_273
LOOP_START_273:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_273
LOOP_END_273:
lea rbx,[rbx+6]
cmp byte [rbx], 0
jne LOOP_START_271
LOOP_END_271:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_274
LOOP_START_274:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_274
LOOP_END_274:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_275
LOOP_START_275:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_276
LOOP_START_276:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_276
LOOP_END_276:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_277
LOOP_START_277:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_277
LOOP_END_277:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_275
LOOP_END_275:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_278
LOOP_START_278:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_278
LOOP_END_278:
add BYTE [rbx+9], 0x0f
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_279
LOOP_START_279:
cmp byte [rbx], 0
je LOOP_END_280
LOOP_START_280:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_280
LOOP_END_280:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_281
LOOP_START_281:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_281
LOOP_END_281:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_282
LOOP_START_282:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_282
LOOP_END_282:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_283
LOOP_START_283:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_283
LOOP_END_283:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_284
LOOP_START_284:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_284
LOOP_END_284:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_285
LOOP_START_285:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_285
LOOP_END_285:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_286
LOOP_START_286:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_286
LOOP_END_286:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_287
LOOP_START_287:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_287
LOOP_END_287:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_288
LOOP_START_288:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_288
LOOP_END_288:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_289
LOOP_START_289:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_289
LOOP_END_289:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_290
LOOP_START_290:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_290
LOOP_END_290:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_279
LOOP_END_279:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_291
LOOP_START_291:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_291
LOOP_END_291:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_292
LOOP_START_292:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_292
LOOP_END_292:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_293
LOOP_START_293:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_294
LOOP_START_294:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_294
LOOP_END_294:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_295
LOOP_START_295:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_296
LOOP_START_296:
add BYTE [rbx], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_297
LOOP_START_297:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_297
LOOP_END_297:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_298
LOOP_START_298:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_298
LOOP_END_298:
add BYTE [rbx], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_296
LOOP_END_296:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_299
LOOP_START_299:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_299
LOOP_END_299:
cmp byte [rbx], 0
jne LOOP_START_295
LOOP_END_295:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_300
LOOP_START_300:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_300
LOOP_END_300:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_301
LOOP_START_301:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_302
LOOP_START_302:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_302
LOOP_END_302:
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_301
LOOP_END_301:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_303
LOOP_START_303:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_303
LOOP_END_303:
add BYTE [rbx-1], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_293
LOOP_END_293:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_304
LOOP_START_304:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_305
LOOP_START_305:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_305
LOOP_END_305:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_306
LOOP_START_306:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_307
LOOP_START_307:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_307
LOOP_END_307:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_308
LOOP_START_308:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_308
LOOP_END_308:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_306
LOOP_END_306:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_309
LOOP_START_309:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_309
LOOP_END_309:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_304
LOOP_END_304:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_310
LOOP_START_310:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_311
LOOP_START_311:
add BYTE [rbx], 0xff
add BYTE [rbx-36], 0x01
cmp byte [rbx], 0
jne LOOP_START_311
LOOP_END_311:
lea rbx,[rbx+6]
cmp byte [rbx], 0
jne LOOP_START_310
LOOP_END_310:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_312
LOOP_START_312:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_312
LOOP_END_312:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_313
LOOP_START_313:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_313
LOOP_END_313:
add BYTE [rbx+4], 0x0f
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_314
LOOP_START_314:
cmp byte [rbx], 0
je LOOP_END_315
LOOP_START_315:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_315
LOOP_END_315:
add BYTE [rbx-9], 0xff
lea rbx,[rbx-18]
cmp byte [rbx], 0
je LOOP_END_316
LOOP_START_316:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_316
LOOP_END_316:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_314
LOOP_END_314:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_317
LOOP_START_317:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_318
LOOP_START_318:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0xff
cmp byte [rbx], 0
jne LOOP_START_318
LOOP_END_318:
add BYTE [rbx], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_319
LOOP_START_319:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_320
LOOP_START_320:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_320
LOOP_END_320:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_321
LOOP_START_321:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_322
LOOP_START_322:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_322
LOOP_END_322:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_323
LOOP_START_323:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_323
LOOP_END_323:
add BYTE [rbx], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_324
LOOP_START_324:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_324
LOOP_END_324:
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_321
LOOP_END_321:
cmp byte [rbx], 0
jne LOOP_START_319
LOOP_END_319:
add BYTE [rbx], 0x01
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_325
LOOP_START_325:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0xff
cmp byte [rbx], 0
jne LOOP_START_325
LOOP_END_325:
add BYTE [rbx], 0x01
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_326
LOOP_START_326:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_327
LOOP_START_327:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_327
LOOP_END_327:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_328
LOOP_START_328:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_329
LOOP_START_329:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_329
LOOP_END_329:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_330
LOOP_START_330:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_330
LOOP_END_330:
add BYTE [rbx], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_331
LOOP_START_331:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_331
LOOP_END_331:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_332
LOOP_START_332:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_332
LOOP_END_332:
add BYTE [rbx], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_328
LOOP_END_328:
cmp byte [rbx], 0
jne LOOP_START_326
LOOP_END_326:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_333
LOOP_START_333:
add BYTE [rbx], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_334
LOOP_START_334:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_334
LOOP_END_334:
lea rbx,[rbx-8]
cmp byte [rbx], 0
jne LOOP_START_333
LOOP_END_333:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_317
LOOP_END_317:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_335
LOOP_START_335:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_335
LOOP_END_335:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_336
LOOP_START_336:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_336
LOOP_END_336:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_337
LOOP_START_337:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_338
LOOP_START_338:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_339
LOOP_START_339:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0xff
cmp byte [rbx], 0
jne LOOP_START_339
LOOP_END_339:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_340
LOOP_START_340:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_340
LOOP_END_340:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_338
LOOP_END_338:
add BYTE [rbx-8], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_341
LOOP_START_341:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_342
LOOP_START_342:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_343
LOOP_START_343:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
add BYTE [rbx-11], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_344
LOOP_START_344:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_344
LOOP_END_344:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_343
LOOP_END_343:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_345
LOOP_START_345:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
add BYTE [rbx-12], 0x01
cmp byte [rbx], 0
jne LOOP_START_345
LOOP_END_345:
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_342
LOOP_END_342:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_346
LOOP_START_346:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_347
LOOP_START_347:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
add BYTE [rbx-12], 0x01
cmp byte [rbx], 0
jne LOOP_START_347
LOOP_END_347:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_346
LOOP_END_346:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_348
LOOP_START_348:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_348
LOOP_END_348:
lea rbx,[rbx-13]
cmp byte [rbx], 0
jne LOOP_START_341
LOOP_END_341:
cmp byte [rbx], 0
jne LOOP_START_337
LOOP_END_337:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_349
LOOP_START_349:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_349
LOOP_END_349:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_350
LOOP_START_350:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_351
LOOP_START_351:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_352
LOOP_START_352:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
cmp byte [rbx], 0
jne LOOP_START_352
LOOP_END_352:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_353
LOOP_START_353:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_353
LOOP_END_353:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_351
LOOP_END_351:
add BYTE [rbx-8], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_354
LOOP_START_354:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_355
LOOP_START_355:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_356
LOOP_START_356:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
add BYTE [rbx-12], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_357
LOOP_START_357:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0x01
cmp byte [rbx], 0
jne LOOP_START_357
LOOP_END_357:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_356
LOOP_END_356:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_358
LOOP_START_358:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_358
LOOP_END_358:
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_355
LOOP_END_355:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_359
LOOP_START_359:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_360
LOOP_START_360:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_360
LOOP_END_360:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_359
LOOP_END_359:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_361
LOOP_START_361:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0x01
cmp byte [rbx], 0
jne LOOP_START_361
LOOP_END_361:
lea rbx,[rbx-12]
cmp byte [rbx], 0
jne LOOP_START_354
LOOP_END_354:
add BYTE [rbx+5], 0x01
cmp byte [rbx], 0
jne LOOP_START_350
LOOP_END_350:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_362
LOOP_START_362:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_363
LOOP_START_363:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_363
LOOP_END_363:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_364
LOOP_START_364:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_364
LOOP_END_364:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_365
LOOP_START_365:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_365
LOOP_END_365:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_362
LOOP_END_362:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_366
LOOP_START_366:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_366
LOOP_END_366:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_367
LOOP_START_367:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_367
LOOP_END_367:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_368
LOOP_START_368:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_368
LOOP_END_368:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_369
LOOP_START_369:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_370
LOOP_START_370:
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_370
LOOP_END_370:
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_371
LOOP_START_371:
add BYTE [rbx], 0xff
add BYTE [rbx+6], 0x01
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_371
LOOP_END_371:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_369
LOOP_END_369:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_372
LOOP_START_372:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_372
LOOP_END_372:
add BYTE [rbx+4], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_373
LOOP_START_373:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_373
LOOP_END_373:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_374
LOOP_START_374:
add BYTE [rbx], 0xff
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_375
LOOP_START_375:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
add BYTE [rbx+4], 0x02
cmp byte [rbx], 0
jne LOOP_START_375
LOOP_END_375:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_376
LOOP_START_376:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_376
LOOP_END_376:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
jne LOOP_START_374
LOOP_END_374:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_377
LOOP_START_377:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_377
LOOP_END_377:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_378
LOOP_START_378:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
cmp byte [rbx], 0
jne LOOP_START_378
LOOP_END_378:
add BYTE [rbx], 0x01
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_379
LOOP_START_379:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0xff
cmp byte [rbx], 0
jne LOOP_START_379
LOOP_END_379:
add BYTE [rbx], 0x01
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_380
LOOP_START_380:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_381
LOOP_START_381:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_382
LOOP_START_382:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0xff
cmp byte [rbx], 0
jne LOOP_START_382
LOOP_END_382:
add BYTE [rbx], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_383
LOOP_START_383:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_384
LOOP_START_384:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_384
LOOP_END_384:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_385
LOOP_START_385:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_386
LOOP_START_386:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_386
LOOP_END_386:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_387
LOOP_START_387:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_387
LOOP_END_387:
add BYTE [rbx], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_388
LOOP_START_388:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_388
LOOP_END_388:
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_385
LOOP_END_385:
cmp byte [rbx], 0
jne LOOP_START_383
LOOP_END_383:
add BYTE [rbx], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_389
LOOP_START_389:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
cmp byte [rbx], 0
jne LOOP_START_389
LOOP_END_389:
add BYTE [rbx], 0x01
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_390
LOOP_START_390:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_391
LOOP_START_391:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_391
LOOP_END_391:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_392
LOOP_START_392:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_393
LOOP_START_393:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_393
LOOP_END_393:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_394
LOOP_START_394:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_394
LOOP_END_394:
add BYTE [rbx], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_395
LOOP_START_395:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_395
LOOP_END_395:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_396
LOOP_START_396:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_396
LOOP_END_396:
add BYTE [rbx], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_392
LOOP_END_392:
cmp byte [rbx], 0
jne LOOP_START_390
LOOP_END_390:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_397
LOOP_START_397:
add BYTE [rbx], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_398
LOOP_START_398:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_398
LOOP_END_398:
lea rbx,[rbx-8]
cmp byte [rbx], 0
jne LOOP_START_397
LOOP_END_397:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_381
LOOP_END_381:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_399
LOOP_START_399:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_399
LOOP_END_399:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_400
LOOP_START_400:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_400
LOOP_END_400:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_401
LOOP_START_401:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_402
LOOP_START_402:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_403
LOOP_START_403:
add BYTE [rbx], 0xff
add BYTE [rbx-1], 0xff
cmp byte [rbx], 0
jne LOOP_START_403
LOOP_END_403:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_404
LOOP_START_404:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_404
LOOP_END_404:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_402
LOOP_END_402:
add BYTE [rbx-8], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_405
LOOP_START_405:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_406
LOOP_START_406:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_407
LOOP_START_407:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0xff
add BYTE [rbx-11], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_408
LOOP_START_408:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_408
LOOP_END_408:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_407
LOOP_END_407:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_409
LOOP_START_409:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-10], 0x01
cmp byte [rbx], 0
jne LOOP_START_409
LOOP_END_409:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_406
LOOP_END_406:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_410
LOOP_START_410:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_411
LOOP_START_411:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-10], 0x01
cmp byte [rbx], 0
jne LOOP_START_411
LOOP_END_411:
lea rbx,[rbx+1]
cmp byte [rbx], 0
jne LOOP_START_410
LOOP_END_410:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_412
LOOP_START_412:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_412
LOOP_END_412:
lea rbx,[rbx-11]
cmp byte [rbx], 0
jne LOOP_START_405
LOOP_END_405:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_413
LOOP_START_413:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_413
LOOP_END_413:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_414
LOOP_START_414:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_414
LOOP_END_414:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_415
LOOP_START_415:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
add BYTE [rbx+5], 0x01
cmp byte [rbx], 0
jne LOOP_START_415
LOOP_END_415:
cmp byte [rbx], 0
jne LOOP_START_401
LOOP_END_401:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_416
LOOP_START_416:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_416
LOOP_END_416:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_417
LOOP_START_417:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_418
LOOP_START_418:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_419
LOOP_START_419:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0xff
cmp byte [rbx], 0
jne LOOP_START_419
LOOP_END_419:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_420
LOOP_START_420:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_420
LOOP_END_420:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_418
LOOP_END_418:
add BYTE [rbx-8], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_421
LOOP_START_421:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_422
LOOP_START_422:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_423
LOOP_START_423:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-10], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_424
LOOP_START_424:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_424
LOOP_END_424:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_423
LOOP_END_423:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_425
LOOP_START_425:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_425
LOOP_END_425:
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_422
LOOP_END_422:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_426
LOOP_START_426:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_427
LOOP_START_427:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_427
LOOP_END_427:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_426
LOOP_END_426:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_428
LOOP_START_428:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_428
LOOP_END_428:
lea rbx,[rbx-12]
cmp byte [rbx], 0
jne LOOP_START_421
LOOP_END_421:
cmp byte [rbx], 0
jne LOOP_START_417
LOOP_END_417:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_429
LOOP_START_429:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_429
LOOP_END_429:
lea rbx,[rbx-4]
cmp byte [rbx], 0
jne LOOP_START_380
LOOP_END_380:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_430
LOOP_START_430:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_430
LOOP_END_430:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_431
LOOP_START_431:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_432
LOOP_START_432:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_432
LOOP_END_432:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_433
LOOP_START_433:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_433
LOOP_END_433:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_434
LOOP_START_434:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
add BYTE [rbx+5], 0x01
cmp byte [rbx], 0
jne LOOP_START_434
LOOP_END_434:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_435
LOOP_START_435:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_435
LOOP_END_435:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_436
LOOP_START_436:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_437
LOOP_START_437:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_438
LOOP_START_438:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
add BYTE [rbx-10], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_439
LOOP_START_439:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_439
LOOP_END_439:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_438
LOOP_END_438:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_440
LOOP_START_440:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_440
LOOP_END_440:
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_437
LOOP_END_437:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_441
LOOP_START_441:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_442
LOOP_START_442:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0xff
add BYTE [rbx-11], 0x01
cmp byte [rbx], 0
jne LOOP_START_442
LOOP_END_442:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_441
LOOP_END_441:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_443
LOOP_START_443:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_443
LOOP_END_443:
lea rbx,[rbx-12]
cmp byte [rbx], 0
jne LOOP_START_436
LOOP_END_436:
cmp byte [rbx], 0
jne LOOP_START_431
LOOP_END_431:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_444
LOOP_START_444:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_445
LOOP_START_445:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_445
LOOP_END_445:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_446
LOOP_START_446:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_446
LOOP_END_446:
lea rbx,[rbx+6]
cmp byte [rbx], 0
jne LOOP_START_444
LOOP_END_444:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_447
LOOP_START_447:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_447
LOOP_END_447:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_448
LOOP_START_448:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_448
LOOP_END_448:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_449
LOOP_START_449:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_449
LOOP_END_449:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_450
LOOP_START_450:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_451
LOOP_START_451:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_451
LOOP_END_451:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_452
LOOP_START_452:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_452
LOOP_END_452:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_450
LOOP_END_450:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_453
LOOP_START_453:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_453
LOOP_END_453:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_454
LOOP_START_454:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_455
LOOP_START_455:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_455
LOOP_END_455:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_456
LOOP_START_456:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_456
LOOP_END_456:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_454
LOOP_END_454:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_457
LOOP_START_457:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_457
LOOP_END_457:
add BYTE [rbx+9], 0x0f
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_458
LOOP_START_458:
cmp byte [rbx], 0
je LOOP_END_459
LOOP_START_459:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_459
LOOP_END_459:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_460
LOOP_START_460:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_460
LOOP_END_460:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_461
LOOP_START_461:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_461
LOOP_END_461:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_462
LOOP_START_462:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_462
LOOP_END_462:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_463
LOOP_START_463:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_463
LOOP_END_463:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_464
LOOP_START_464:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_464
LOOP_END_464:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_465
LOOP_START_465:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_465
LOOP_END_465:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_466
LOOP_START_466:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_466
LOOP_END_466:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_467
LOOP_START_467:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_467
LOOP_END_467:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_468
LOOP_START_468:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_468
LOOP_END_468:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_469
LOOP_START_469:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_469
LOOP_END_469:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_458
LOOP_END_458:
add BYTE [rbx], 0x01
cmp byte [rbx], 0
je LOOP_END_470
LOOP_START_470:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_470
LOOP_END_470:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_471
LOOP_START_471:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_471
LOOP_END_471:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_472
LOOP_START_472:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_473
LOOP_START_473:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_473
LOOP_END_473:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_474
LOOP_START_474:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_475
LOOP_START_475:
add BYTE [rbx], 0xff
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_476
LOOP_START_476:
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_476
LOOP_END_476:
lea rbx,[rbx-2]
cmp byte [rbx], 0
je LOOP_END_477
LOOP_START_477:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_477
LOOP_END_477:
add BYTE [rbx], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_475
LOOP_END_475:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_478
LOOP_START_478:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_478
LOOP_END_478:
cmp byte [rbx], 0
jne LOOP_START_474
LOOP_END_474:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_479
LOOP_START_479:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_479
LOOP_END_479:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_480
LOOP_START_480:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_481
LOOP_START_481:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_481
LOOP_END_481:
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_480
LOOP_END_480:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_482
LOOP_START_482:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_482
LOOP_END_482:
add BYTE [rbx-1], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_472
LOOP_END_472:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_483
LOOP_START_483:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_484
LOOP_START_484:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_484
LOOP_END_484:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_485
LOOP_START_485:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_486
LOOP_START_486:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_486
LOOP_END_486:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_487
LOOP_START_487:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_487
LOOP_END_487:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_485
LOOP_END_485:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_488
LOOP_START_488:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_488
LOOP_END_488:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_483
LOOP_END_483:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_489
LOOP_START_489:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_489
LOOP_END_489:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_490
LOOP_START_490:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_490
LOOP_END_490:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_491
LOOP_START_491:
add BYTE [rbx+1], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_492
LOOP_START_492:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_492
LOOP_END_492:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_493
LOOP_START_493:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_494
LOOP_START_494:
add BYTE [rbx], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_495
LOOP_START_495:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_495
LOOP_END_495:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_496
LOOP_START_496:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_496
LOOP_END_496:
add BYTE [rbx], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_494
LOOP_END_494:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_497
LOOP_START_497:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_497
LOOP_END_497:
cmp byte [rbx], 0
jne LOOP_START_493
LOOP_END_493:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_498
LOOP_START_498:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_498
LOOP_END_498:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_499
LOOP_START_499:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_500
LOOP_START_500:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_500
LOOP_END_500:
lea rbx,[rbx-11]
cmp byte [rbx], 0
jne LOOP_START_499
LOOP_END_499:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_501
LOOP_START_501:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_501
LOOP_END_501:
add BYTE [rbx-2], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
jne LOOP_START_491
LOOP_END_491:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_502
LOOP_START_502:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_503
LOOP_START_503:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_503
LOOP_END_503:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_504
LOOP_START_504:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_505
LOOP_START_505:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_505
LOOP_END_505:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_506
LOOP_START_506:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_506
LOOP_END_506:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_504
LOOP_END_504:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_507
LOOP_START_507:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
cmp byte [rbx], 0
jne LOOP_START_507
LOOP_END_507:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_502
LOOP_END_502:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_508
LOOP_START_508:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_509
LOOP_START_509:
add BYTE [rbx], 0xff
add BYTE [rbx-36], 0x01
cmp byte [rbx], 0
jne LOOP_START_509
LOOP_END_509:
lea rbx,[rbx+5]
cmp byte [rbx], 0
jne LOOP_START_508
LOOP_END_508:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_510
LOOP_START_510:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_510
LOOP_END_510:
add BYTE [rbx+9], 0x0f
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_511
LOOP_START_511:
cmp byte [rbx], 0
je LOOP_END_512
LOOP_START_512:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_512
LOOP_END_512:
add BYTE [rbx-9], 0xff
lea rbx,[rbx-18]
cmp byte [rbx], 0
je LOOP_END_513
LOOP_START_513:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_513
LOOP_END_513:
add BYTE [rbx+9], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_511
LOOP_END_511:
add BYTE [rbx], 0x01
add BYTE [rbx+21], 0x01
lea rbx,[rbx+18]
cmp byte [rbx], 0
je LOOP_END_514
LOOP_START_514:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_514
LOOP_END_514:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_515
LOOP_START_515:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_516
LOOP_START_516:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0xff
cmp byte [rbx], 0
jne LOOP_START_516
LOOP_END_516:
add BYTE [rbx], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_517
LOOP_START_517:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0xff
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_518
LOOP_START_518:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_518
LOOP_END_518:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_519
LOOP_START_519:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_520
LOOP_START_520:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_520
LOOP_END_520:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_521
LOOP_START_521:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_521
LOOP_END_521:
add BYTE [rbx], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_522
LOOP_START_522:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_522
LOOP_END_522:
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_519
LOOP_END_519:
cmp byte [rbx], 0
jne LOOP_START_517
LOOP_END_517:
add BYTE [rbx], 0x01
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_523
LOOP_START_523:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0xff
cmp byte [rbx], 0
jne LOOP_START_523
LOOP_END_523:
add BYTE [rbx], 0x01
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_524
LOOP_START_524:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_525
LOOP_START_525:
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_525
LOOP_END_525:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_526
LOOP_START_526:
add BYTE [rbx], 0xff
add BYTE [rbx+3], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_527
LOOP_START_527:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_527
LOOP_END_527:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_528
LOOP_START_528:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_528
LOOP_END_528:
add BYTE [rbx], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_529
LOOP_START_529:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_529
LOOP_END_529:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_530
LOOP_START_530:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_530
LOOP_END_530:
add BYTE [rbx], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_526
LOOP_END_526:
cmp byte [rbx], 0
jne LOOP_START_524
LOOP_END_524:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_531
LOOP_START_531:
add BYTE [rbx], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_532
LOOP_START_532:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_532
LOOP_END_532:
lea rbx,[rbx-8]
cmp byte [rbx], 0
jne LOOP_START_531
LOOP_END_531:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_515
LOOP_END_515:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_533
LOOP_START_533:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_533
LOOP_END_533:
add BYTE [rbx+2], 0xff
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_534
LOOP_START_534:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0x01
cmp byte [rbx], 0
jne LOOP_START_534
LOOP_END_534:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_535
LOOP_START_535:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_536
LOOP_START_536:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_536
LOOP_END_536:
lea rbx,[rbx-2]
cmp byte [rbx], 0
jne LOOP_START_535
LOOP_END_535:
lea rbx,[rbx+2]
cmp byte [rbx], 0
jne LOOP_START_114
LOOP_END_114:
add BYTE [rbx-2], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_537
LOOP_START_537:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0xff
cmp byte [rbx], 0
jne LOOP_START_537
LOOP_END_537:
add BYTE [rbx], 0x01
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_538
LOOP_START_538:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0xff
lea rdi, [rbx-2]
call print
cmp byte [rbx], 0
jne LOOP_START_538
LOOP_END_538:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_539
LOOP_START_539:
add BYTE [rbx], 0xff
lea rdi, [rbx-7]
call print
cmp byte [rbx], 0
jne LOOP_START_539
LOOP_END_539:
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_540
LOOP_START_540:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_540
LOOP_END_540:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_541
LOOP_START_541:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_541
LOOP_END_541:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_542
LOOP_START_542:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_542
LOOP_END_542:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_543
LOOP_START_543:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_543
LOOP_END_543:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_544
LOOP_START_544:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_544
LOOP_END_544:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_545
LOOP_START_545:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_545
LOOP_END_545:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_546
LOOP_START_546:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_547
LOOP_START_547:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_547
LOOP_END_547:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_548
LOOP_START_548:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_548
LOOP_END_548:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_549
LOOP_START_549:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_549
LOOP_END_549:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_550
LOOP_START_550:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_550
LOOP_END_550:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_551
LOOP_START_551:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_551
LOOP_END_551:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_552
LOOP_START_552:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_552
LOOP_END_552:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_546
LOOP_END_546:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_553
LOOP_START_553:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_553
LOOP_END_553:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_554
LOOP_START_554:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_555
LOOP_START_555:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_555
LOOP_END_555:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_554
LOOP_END_554:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_556
LOOP_START_556:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_556
LOOP_END_556:
add BYTE [rbx+1], 0x0b
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_557
LOOP_START_557:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_558
LOOP_START_558:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_558
LOOP_END_558:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_557
LOOP_END_557:
add BYTE [rbx+4], 0x01
add BYTE [rbx+13], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_559
LOOP_START_559:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_559
LOOP_END_559:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_560
LOOP_START_560:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_560
LOOP_END_560:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_561
LOOP_START_561:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_562
LOOP_START_562:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_562
LOOP_END_562:
lea rbx,[rbx+2]
cmp byte [rbx], 0
je LOOP_END_563
LOOP_START_563:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_563
LOOP_END_563:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_564
LOOP_START_564:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_565
LOOP_START_565:
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_565
LOOP_END_565:
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_566
LOOP_START_566:
add BYTE [rbx], 0xff
add BYTE [rbx+6], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_567
LOOP_START_567:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_567
LOOP_END_567:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_568
LOOP_START_568:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_568
LOOP_END_568:
add BYTE [rbx], 0x01
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_566
LOOP_END_566:
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_564
LOOP_END_564:
cmp byte [rbx], 0
jne LOOP_START_561
LOOP_END_561:
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_569
LOOP_START_569:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_569
LOOP_END_569:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_570
LOOP_START_570:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_571
LOOP_START_571:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_572
LOOP_START_572:
add BYTE [rbx], 0xff
add BYTE [rbx-4], 0xff
cmp byte [rbx], 0
jne LOOP_START_572
LOOP_END_572:
lea rbx,[rbx-4]
cmp byte [rbx], 0
je LOOP_END_573
LOOP_START_573:
add BYTE [rbx], 0xff
add BYTE [rbx+4], 0x01
cmp byte [rbx], 0
jne LOOP_START_573
LOOP_END_573:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_571
LOOP_END_571:
add BYTE [rbx-2], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_574
LOOP_START_574:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_575
LOOP_START_575:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_575
LOOP_END_575:
lea rbx,[rbx-14]
cmp byte [rbx], 0
jne LOOP_START_574
LOOP_END_574:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_576
LOOP_START_576:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_576
LOOP_END_576:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_577
LOOP_START_577:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_578
LOOP_START_578:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_578
LOOP_END_578:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_579
LOOP_START_579:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_580
LOOP_START_580:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_580
LOOP_END_580:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_581
LOOP_START_581:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_581
LOOP_END_581:
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_579
LOOP_END_579:
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_582
LOOP_START_582:
add BYTE [rbx], 0xff
add BYTE [rbx+6], 0x01
cmp byte [rbx], 0
jne LOOP_START_582
LOOP_END_582:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_577
LOOP_END_577:
add BYTE [rbx+7], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_583
LOOP_START_583:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_583
LOOP_END_583:
add BYTE [rbx], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_570
LOOP_END_570:
add BYTE [rbx], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_584
LOOP_START_584:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0xff
cmp byte [rbx], 0
jne LOOP_START_584
LOOP_END_584:
add BYTE [rbx], 0x01
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_585
LOOP_START_585:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_586
LOOP_START_586:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_587
LOOP_START_587:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_587
LOOP_END_587:
lea rbx,[rbx+4]
cmp byte [rbx], 0
jne LOOP_START_586
LOOP_END_586:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_588
LOOP_START_588:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_589
LOOP_START_589:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_589
LOOP_END_589:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_590
LOOP_START_590:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_591
LOOP_START_591:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-3], 0x01
cmp byte [rbx], 0
jne LOOP_START_591
LOOP_END_591:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_592
LOOP_START_592:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_592
LOOP_END_592:
lea rbx,[rbx+7]
cmp byte [rbx], 0
jne LOOP_START_590
LOOP_END_590:
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_593
LOOP_START_593:
add BYTE [rbx], 0xff
add BYTE [rbx+6], 0x01
cmp byte [rbx], 0
jne LOOP_START_593
LOOP_END_593:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_588
LOOP_END_588:
add BYTE [rbx+1], 0x05
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_594
LOOP_START_594:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_595
LOOP_START_595:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_595
LOOP_END_595:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_594
LOOP_END_594:
add BYTE [rbx+4], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_596
LOOP_START_596:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_596
LOOP_END_596:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_597
LOOP_START_597:
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_598
LOOP_START_598:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0xff
cmp byte [rbx], 0
jne LOOP_START_598
LOOP_END_598:
add BYTE [rbx], 0x01
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_599
LOOP_START_599:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0xff
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_600
LOOP_START_600:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_600
LOOP_END_600:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_601
LOOP_START_601:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_602
LOOP_START_602:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_602
LOOP_END_602:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_603
LOOP_START_603:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_603
LOOP_END_603:
add BYTE [rbx], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_604
LOOP_START_604:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_604
LOOP_END_604:
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_601
LOOP_END_601:
cmp byte [rbx], 0
jne LOOP_START_599
LOOP_END_599:
add BYTE [rbx], 0x01
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_605
LOOP_START_605:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0xff
cmp byte [rbx], 0
jne LOOP_START_605
LOOP_END_605:
add BYTE [rbx], 0x01
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_606
LOOP_START_606:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0xff
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_607
LOOP_START_607:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0x01
cmp byte [rbx], 0
jne LOOP_START_607
LOOP_END_607:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_608
LOOP_START_608:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_609
LOOP_START_609:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_609
LOOP_END_609:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_610
LOOP_START_610:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_610
LOOP_END_610:
add BYTE [rbx], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_611
LOOP_START_611:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_611
LOOP_END_611:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_612
LOOP_START_612:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_612
LOOP_END_612:
add BYTE [rbx], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_608
LOOP_END_608:
cmp byte [rbx], 0
jne LOOP_START_606
LOOP_END_606:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_613
LOOP_START_613:
add BYTE [rbx], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_614
LOOP_START_614:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_614
LOOP_END_614:
lea rbx,[rbx-8]
cmp byte [rbx], 0
jne LOOP_START_613
LOOP_END_613:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_597
LOOP_END_597:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_615
LOOP_START_615:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_615
LOOP_END_615:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_616
LOOP_START_616:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_616
LOOP_END_616:
add BYTE [rbx-3], 0x05
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_617
LOOP_START_617:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_618
LOOP_START_618:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_618
LOOP_END_618:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_617
LOOP_END_617:
add BYTE [rbx+4], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_619
LOOP_START_619:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_619
LOOP_END_619:
cmp byte [rbx], 0
jne LOOP_START_585
LOOP_END_585:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_22
LOOP_END_22:
lea rdi, [rbx-4]
call print
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_620
LOOP_START_620:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_621
LOOP_START_621:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_621
LOOP_END_621:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_620
LOOP_END_620:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_622
LOOP_START_622:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_622
LOOP_END_622:
add BYTE [rbx+1], 0x0a
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_623
LOOP_START_623:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_624
LOOP_START_624:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_624
LOOP_END_624:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_623
LOOP_END_623:
add BYTE [rbx+5], 0x01
add BYTE [rbx+14], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_625
LOOP_START_625:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_625
LOOP_END_625:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_626
LOOP_START_626:
add BYTE [rbx], 0xff
add BYTE [rbx-8], 0x01
cmp byte [rbx], 0
jne LOOP_START_626
LOOP_END_626:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_627
LOOP_START_627:
add BYTE [rbx], 0xff
add BYTE [rbx+8], 0x01
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_628
LOOP_START_628:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_628
LOOP_END_628:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_629
LOOP_START_629:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_629
LOOP_END_629:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_630
LOOP_START_630:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_631
LOOP_START_631:
add BYTE [rbx], 0xff
add BYTE [rbx-7], 0x01
cmp byte [rbx], 0
jne LOOP_START_631
LOOP_END_631:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_632
LOOP_START_632:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_633
LOOP_START_633:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_633
LOOP_END_633:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_634
LOOP_START_634:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_634
LOOP_END_634:
add BYTE [rbx], 0x01
lea rbx,[rbx+2]
cmp byte [rbx], 0
jne LOOP_START_632
LOOP_END_632:
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_630
LOOP_END_630:
cmp byte [rbx], 0
jne LOOP_START_627
LOOP_END_627:
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_635
LOOP_START_635:
add BYTE [rbx], 0xff
add BYTE [rbx-8], 0x01
cmp byte [rbx], 0
jne LOOP_START_635
LOOP_END_635:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_636
LOOP_START_636:
add BYTE [rbx], 0xff
add BYTE [rbx+8], 0x01
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_637
LOOP_START_637:
add BYTE [rbx+1], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_638
LOOP_START_638:
add BYTE [rbx], 0xff
add BYTE [rbx-5], 0xff
cmp byte [rbx], 0
jne LOOP_START_638
LOOP_END_638:
lea rbx,[rbx-5]
cmp byte [rbx], 0
je LOOP_END_639
LOOP_START_639:
add BYTE [rbx], 0xff
add BYTE [rbx+5], 0x01
cmp byte [rbx], 0
jne LOOP_START_639
LOOP_END_639:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_637
LOOP_END_637:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_640
LOOP_START_640:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_641
LOOP_START_641:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_641
LOOP_END_641:
lea rbx,[rbx-15]
cmp byte [rbx], 0
jne LOOP_START_640
LOOP_END_640:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_642
LOOP_START_642:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_642
LOOP_END_642:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_643
LOOP_START_643:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_644
LOOP_START_644:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_644
LOOP_END_644:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_645
LOOP_START_645:
add BYTE [rbx], 0xff
add BYTE [rbx-8], 0x01
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_646
LOOP_START_646:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_646
LOOP_END_646:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_647
LOOP_START_647:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_647
LOOP_END_647:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_645
LOOP_END_645:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_648
LOOP_START_648:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
cmp byte [rbx], 0
jne LOOP_START_648
LOOP_END_648:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_643
LOOP_END_643:
add BYTE [rbx+8], 0xff
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_649
LOOP_START_649:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_649
LOOP_END_649:
add BYTE [rbx], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
jne LOOP_START_636
LOOP_END_636:
add BYTE [rbx], 0x01
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_650
LOOP_START_650:
add BYTE [rbx], 0xff
add BYTE [rbx-8], 0xff
cmp byte [rbx], 0
jne LOOP_START_650
LOOP_END_650:
add BYTE [rbx], 0x01
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_651
LOOP_START_651:
add BYTE [rbx], 0xff
add BYTE [rbx+8], 0xff
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_652
LOOP_START_652:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_653
LOOP_START_653:
add BYTE [rbx], 0xff
add BYTE [rbx+2], 0x01
cmp byte [rbx], 0
jne LOOP_START_653
LOOP_END_653:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_652
LOOP_END_652:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_654
LOOP_START_654:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_655
LOOP_START_655:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_655
LOOP_END_655:
add BYTE [rbx-1], 0xff
lea rbx,[rbx+7]
cmp byte [rbx], 0
je LOOP_END_656
LOOP_START_656:
add BYTE [rbx], 0xff
add BYTE [rbx-8], 0x01
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_657
LOOP_START_657:
add BYTE [rbx-1], 0xff
add BYTE [rbx], 0xff
add BYTE [rbx-2], 0x01
cmp byte [rbx], 0
jne LOOP_START_657
LOOP_END_657:
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_658
LOOP_START_658:
add BYTE [rbx], 0xff
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_658
LOOP_END_658:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_656
LOOP_END_656:
lea rbx,[rbx-7]
cmp byte [rbx], 0
je LOOP_END_659
LOOP_START_659:
add BYTE [rbx], 0xff
add BYTE [rbx+7], 0x01
cmp byte [rbx], 0
jne LOOP_START_659
LOOP_END_659:
add BYTE [rbx-1], 0x01
lea rbx,[rbx-10]
cmp byte [rbx], 0
jne LOOP_START_654
LOOP_END_654:
add BYTE [rbx+1], 0x05
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_660
LOOP_START_660:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_661
LOOP_START_661:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_661
LOOP_END_661:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_660
LOOP_END_660:
add BYTE [rbx+5], 0x01
add BYTE [rbx+32], 0x01
lea rbx,[rbx+26]
cmp byte [rbx], 0
je LOOP_END_662
LOOP_START_662:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_662
LOOP_END_662:
lea rbx,[rbx+9]
cmp byte [rbx], 0
je LOOP_END_663
LOOP_START_663:
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_664
LOOP_START_664:
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0xff
cmp byte [rbx], 0
jne LOOP_START_664
LOOP_END_664:
add BYTE [rbx], 0x01
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_665
LOOP_START_665:
add BYTE [rbx], 0xff
add BYTE [rbx+6], 0xff
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_666
LOOP_START_666:
add BYTE [rbx], 0xff
add BYTE [rbx-8], 0x01
cmp byte [rbx], 0
jne LOOP_START_666
LOOP_END_666:
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_667
LOOP_START_667:
add BYTE [rbx], 0xff
add BYTE [rbx+8], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_668
LOOP_START_668:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_668
LOOP_END_668:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_669
LOOP_START_669:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_669
LOOP_END_669:
add BYTE [rbx], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_670
LOOP_START_670:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_670
LOOP_END_670:
add BYTE [rbx+1], 0x01
cmp byte [rbx], 0
jne LOOP_START_667
LOOP_END_667:
cmp byte [rbx], 0
jne LOOP_START_665
LOOP_END_665:
add BYTE [rbx], 0x01
lea rbx,[rbx+8]
cmp byte [rbx], 0
je LOOP_END_671
LOOP_START_671:
add BYTE [rbx], 0xff
add BYTE [rbx-8], 0xff
cmp byte [rbx], 0
jne LOOP_START_671
LOOP_END_671:
add BYTE [rbx], 0x01
lea rbx,[rbx-8]
cmp byte [rbx], 0
je LOOP_END_672
LOOP_START_672:
add BYTE [rbx], 0xff
add BYTE [rbx+8], 0xff
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_673
LOOP_START_673:
add BYTE [rbx], 0xff
add BYTE [rbx-6], 0x01
cmp byte [rbx], 0
jne LOOP_START_673
LOOP_END_673:
lea rbx,[rbx-6]
cmp byte [rbx], 0
je LOOP_END_674
LOOP_START_674:
add BYTE [rbx], 0xff
add BYTE [rbx+6], 0x01
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_675
LOOP_START_675:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_675
LOOP_END_675:
lea rbx,[rbx+3]
cmp byte [rbx], 0
je LOOP_END_676
LOOP_START_676:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_676
LOOP_END_676:
add BYTE [rbx], 0x01
lea rbx,[rbx+6]
cmp byte [rbx], 0
je LOOP_END_677
LOOP_START_677:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_677
LOOP_END_677:
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_678
LOOP_START_678:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_678
LOOP_END_678:
add BYTE [rbx], 0x01
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_674
LOOP_END_674:
cmp byte [rbx], 0
jne LOOP_START_672
LOOP_END_672:
add BYTE [rbx], 0x01
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_679
LOOP_START_679:
add BYTE [rbx], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
je LOOP_END_680
LOOP_START_680:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_680
LOOP_END_680:
lea rbx,[rbx-8]
cmp byte [rbx], 0
jne LOOP_START_679
LOOP_END_679:
lea rbx,[rbx+8]
cmp byte [rbx], 0
jne LOOP_START_663
LOOP_END_663:
lea rbx,[rbx-9]
cmp byte [rbx], 0
je LOOP_END_681
LOOP_START_681:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_681
LOOP_END_681:
lea rbx,[rbx+4]
cmp byte [rbx], 0
je LOOP_END_682
LOOP_START_682:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_682
LOOP_END_682:
add BYTE [rbx-3], 0x04
add BYTE [rbx-3], 0x01
lea rbx,[rbx-3]
cmp byte [rbx], 0
je LOOP_END_683
LOOP_START_683:
add BYTE [rbx], 0xff
cmp byte [rbx], 0
je LOOP_END_684
LOOP_START_684:
add BYTE [rbx], 0xff
add BYTE [rbx+9], 0x01
cmp byte [rbx], 0
jne LOOP_START_684
LOOP_END_684:
lea rbx,[rbx+9]
cmp byte [rbx], 0
jne LOOP_START_683
LOOP_END_683:
add BYTE [rbx+5], 0xff
add BYTE [rbx+32], 0xff
lea rbx,[rbx+26]
cmp byte [rbx], 0
je LOOP_END_685
LOOP_START_685:
lea rbx,[rbx-9]
cmp byte [rbx], 0
jne LOOP_START_685
LOOP_END_685:
cmp byte [rbx], 0
jne LOOP_START_651
LOOP_END_651:
lea rbx,[rbx+3]
cmp byte [rbx], 0
jne LOOP_START_12
LOOP_END_12:
ret
