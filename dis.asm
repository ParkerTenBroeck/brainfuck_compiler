
out.bin:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:	48 89 fb             	mov    %rdi,%rbx
   3:	eb 1a                	jmp    0x1f
   5:	49 bb b0 93 8a cd dd 	movabs $0x55ddcd8a93b0,%r11
   c:	55 00 00 
   f:	41 ff e3             	jmp    *%r11
  12:	49 bb 30 94 8a cd dd 	movabs $0x55ddcd8a9430,%r11
  19:	55 00 00 
  1c:	41 ff e3             	jmp    *%r11
  1f:	80 03 01             	addb   $0x1,(%rbx)
  22:	80 43 02 04          	addb   $0x4,0x2(%rbx)
  26:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
  2a:	80 3b 00             	cmpb   $0x0,(%rbx)
  2d:	74 0c                	je     0x3b
  2f:	80 43 ff 04          	addb   $0x4,-0x1(%rbx)
  33:	80 03 ff             	addb   $0xff,(%rbx)
  36:	80 3b 00             	cmpb   $0x0,(%rbx)
  39:	75 f4                	jne    0x2f
  3b:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
  3f:	80 3b 00             	cmpb   $0x0,(%rbx)
  42:	74 0c                	je     0x50
  44:	80 43 ff 06          	addb   $0x6,-0x1(%rbx)
  48:	80 03 ff             	addb   $0xff,(%rbx)
  4b:	80 3b 00             	cmpb   $0x0,(%rbx)
  4e:	75 f4                	jne    0x44
  50:	80 03 01             	addb   $0x1,(%rbx)
  53:	80 3b 00             	cmpb   $0x0,(%rbx)
  56:	0f 84 31 0e 00 00    	je     0xe8d
  5c:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
  60:	80 3b 00             	cmpb   $0x0,(%rbx)
  63:	74 0c                	je     0x71
  65:	80 43 04 01          	addb   $0x1,0x4(%rbx)
  69:	80 03 ff             	addb   $0xff,(%rbx)
  6c:	80 3b 00             	cmpb   $0x0,(%rbx)
  6f:	75 f4                	jne    0x65
  71:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
  75:	80 3b 00             	cmpb   $0x0,(%rbx)
  78:	74 10                	je     0x8a
  7a:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
  7e:	80 43 02 01          	addb   $0x1,0x2(%rbx)
  82:	80 03 ff             	addb   $0xff,(%rbx)
  85:	80 3b 00             	cmpb   $0x0,(%rbx)
  88:	75 f0                	jne    0x7a
  8a:	80 43 ff 01          	addb   $0x1,-0x1(%rbx)
  8e:	80 43 ff 03          	addb   $0x3,-0x1(%rbx)
  92:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
  96:	80 3b 00             	cmpb   $0x0,(%rbx)
  99:	74 0c                	je     0xa7
  9b:	80 43 01 08          	addb   $0x8,0x1(%rbx)
  9f:	80 03 ff             	addb   $0xff,(%rbx)
  a2:	80 3b 00             	cmpb   $0x0,(%rbx)
  a5:	75 f4                	jne    0x9b
  a7:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
  ab:	e8 55 ff ff ff       	call   0x5
  b0:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
  b4:	80 3b 00             	cmpb   $0x0,(%rbx)
  b7:	74 08                	je     0xc1
  b9:	80 03 ff             	addb   $0xff,(%rbx)
  bc:	80 3b 00             	cmpb   $0x0,(%rbx)
  bf:	75 f8                	jne    0xb9
  c1:	80 43 ff 03          	addb   $0x3,-0x1(%rbx)
  c5:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
  c9:	80 3b 00             	cmpb   $0x0,(%rbx)
  cc:	74 0c                	je     0xda
  ce:	80 43 01 03          	addb   $0x3,0x1(%rbx)
  d2:	80 03 ff             	addb   $0xff,(%rbx)
  d5:	80 3b 00             	cmpb   $0x0,(%rbx)
  d8:	75 f4                	jne    0xce
  da:	80 43 01 01          	addb   $0x1,0x1(%rbx)
  de:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
  e2:	80 3b 00             	cmpb   $0x0,(%rbx)
  e5:	74 15                	je     0xfc
  e7:	48 8d 7b 02          	lea    0x2(%rbx),%rdi
  eb:	e8 15 ff ff ff       	call   0x5
  f0:	80 43 02 01          	addb   $0x1,0x2(%rbx)
  f4:	80 03 ff             	addb   $0xff,(%rbx)
  f7:	80 3b 00             	cmpb   $0x0,(%rbx)
  fa:	75 eb                	jne    0xe7
  fc:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 100:	80 3b 00             	cmpb   $0x0,(%rbx)
 103:	74 08                	je     0x10d
 105:	80 03 ff             	addb   $0xff,(%rbx)
 108:	80 3b 00             	cmpb   $0x0,(%rbx)
 10b:	75 f8                	jne    0x105
 10d:	80 43 fd 02          	addb   $0x2,-0x3(%rbx)
 111:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 115:	80 3b 00             	cmpb   $0x0,(%rbx)
 118:	74 0c                	je     0x126
 11a:	80 43 ff 05          	addb   $0x5,-0x1(%rbx)
 11e:	80 03 ff             	addb   $0xff,(%rbx)
 121:	80 3b 00             	cmpb   $0x0,(%rbx)
 124:	75 f4                	jne    0x11a
 126:	48 8d 7b ff          	lea    -0x1(%rbx),%rdi
 12a:	e8 d6 fe ff ff       	call   0x5
 12f:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 133:	80 3b 00             	cmpb   $0x0,(%rbx)
 136:	74 0c                	je     0x144
 138:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 13c:	80 03 ff             	addb   $0xff,(%rbx)
 13f:	80 3b 00             	cmpb   $0x0,(%rbx)
 142:	75 f4                	jne    0x138
 144:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 148:	80 3b 00             	cmpb   $0x0,(%rbx)
 14b:	74 10                	je     0x15d
 14d:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 151:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 155:	80 03 ff             	addb   $0xff,(%rbx)
 158:	80 3b 00             	cmpb   $0x0,(%rbx)
 15b:	75 f0                	jne    0x14d
 15d:	48 8d 5b fe          	lea    -0x2(%rbx),%rbx
 161:	80 3b 00             	cmpb   $0x0,(%rbx)
 164:	0f 84 de 01 00 00    	je     0x348
 16a:	48 8d 7b 04          	lea    0x4(%rbx),%rdi
 16e:	e8 92 fe ff ff       	call   0x5
 173:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 177:	80 43 01 0a          	addb   $0xa,0x1(%rbx)
 17b:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 17f:	80 3b 00             	cmpb   $0x0,(%rbx)
 182:	0f 84 97 01 00 00    	je     0x31f
 188:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 18c:	80 3b 00             	cmpb   $0x0,(%rbx)
 18f:	74 0c                	je     0x19d
 191:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 195:	80 03 ff             	addb   $0xff,(%rbx)
 198:	80 3b 00             	cmpb   $0x0,(%rbx)
 19b:	75 f4                	jne    0x191
 19d:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 1a1:	80 3b 00             	cmpb   $0x0,(%rbx)
 1a4:	74 14                	je     0x1ba
 1a6:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 1aa:	80 43 03 08          	addb   $0x8,0x3(%rbx)
 1ae:	80 43 03 03          	addb   $0x3,0x3(%rbx)
 1b2:	80 03 ff             	addb   $0xff,(%rbx)
 1b5:	80 3b 00             	cmpb   $0x0,(%rbx)
 1b8:	75 ec                	jne    0x1a6
 1ba:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 1be:	80 3b 00             	cmpb   $0x0,(%rbx)
 1c1:	74 0c                	je     0x1cf
 1c3:	80 43 01 01          	addb   $0x1,0x1(%rbx)
 1c7:	80 03 ff             	addb   $0xff,(%rbx)
 1ca:	80 3b 00             	cmpb   $0x0,(%rbx)
 1cd:	75 f4                	jne    0x1c3
 1cf:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 1d3:	80 3b 00             	cmpb   $0x0,(%rbx)
 1d6:	74 10                	je     0x1e8
 1d8:	80 43 ff 01          	addb   $0x1,-0x1(%rbx)
 1dc:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 1e0:	80 03 ff             	addb   $0xff,(%rbx)
 1e3:	80 3b 00             	cmpb   $0x0,(%rbx)
 1e6:	75 f0                	jne    0x1d8
 1e8:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 1ec:	80 3b 00             	cmpb   $0x0,(%rbx)
 1ef:	74 10                	je     0x201
 1f1:	80 43 0c 01          	addb   $0x1,0xc(%rbx)
 1f5:	80 43 0d 01          	addb   $0x1,0xd(%rbx)
 1f9:	80 03 ff             	addb   $0xff,(%rbx)
 1fc:	80 3b 00             	cmpb   $0x0,(%rbx)
 1ff:	75 f0                	jne    0x1f1
 201:	48 8d 5b 0c          	lea    0xc(%rbx),%rbx
 205:	80 3b 00             	cmpb   $0x0,(%rbx)
 208:	74 32                	je     0x23c
 20a:	80 03 ff             	addb   $0xff,(%rbx)
 20d:	80 3b 00             	cmpb   $0x0,(%rbx)
 210:	74 0c                	je     0x21e
 212:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 216:	80 03 ff             	addb   $0xff,(%rbx)
 219:	80 3b 00             	cmpb   $0x0,(%rbx)
 21c:	75 f4                	jne    0x212
 21e:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 222:	80 3b 00             	cmpb   $0x0,(%rbx)
 225:	74 0c                	je     0x233
 227:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 22b:	80 03 ff             	addb   $0xff,(%rbx)
 22e:	80 3b 00             	cmpb   $0x0,(%rbx)
 231:	75 f4                	jne    0x227
 233:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 237:	80 3b 00             	cmpb   $0x0,(%rbx)
 23a:	75 ce                	jne    0x20a
 23c:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 240:	80 3b 00             	cmpb   $0x0,(%rbx)
 243:	74 0c                	je     0x251
 245:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 249:	80 03 ff             	addb   $0xff,(%rbx)
 24c:	80 3b 00             	cmpb   $0x0,(%rbx)
 24f:	75 f4                	jne    0x245
 251:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 255:	80 3b 00             	cmpb   $0x0,(%rbx)
 258:	74 10                	je     0x26a
 25a:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 25e:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 262:	80 03 ff             	addb   $0xff,(%rbx)
 265:	80 3b 00             	cmpb   $0x0,(%rbx)
 268:	75 f0                	jne    0x25a
 26a:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 26e:	80 3b 00             	cmpb   $0x0,(%rbx)
 271:	74 36                	je     0x2a9
 273:	80 03 ff             	addb   $0xff,(%rbx)
 276:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 27a:	80 3b 00             	cmpb   $0x0,(%rbx)
 27d:	74 0c                	je     0x28b
 27f:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 283:	80 03 ff             	addb   $0xff,(%rbx)
 286:	80 3b 00             	cmpb   $0x0,(%rbx)
 289:	75 f4                	jne    0x27f
 28b:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 28f:	80 3b 00             	cmpb   $0x0,(%rbx)
 292:	74 0c                	je     0x2a0
 294:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 298:	80 03 ff             	addb   $0xff,(%rbx)
 29b:	80 3b 00             	cmpb   $0x0,(%rbx)
 29e:	75 f4                	jne    0x294
 2a0:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 2a4:	80 3b 00             	cmpb   $0x0,(%rbx)
 2a7:	75 ca                	jne    0x273
 2a9:	80 43 ff 06          	addb   $0x6,-0x1(%rbx)
 2ad:	80 43 ff 02          	addb   $0x2,-0x1(%rbx)
 2b1:	80 43 ff 01          	addb   $0x1,-0x1(%rbx)
 2b5:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 2b9:	80 3b 00             	cmpb   $0x0,(%rbx)
 2bc:	74 0c                	je     0x2ca
 2be:	80 43 01 05          	addb   $0x5,0x1(%rbx)
 2c2:	80 03 ff             	addb   $0xff,(%rbx)
 2c5:	80 3b 00             	cmpb   $0x0,(%rbx)
 2c8:	75 f4                	jne    0x2be
 2ca:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 2ce:	80 3b 00             	cmpb   $0x0,(%rbx)
 2d1:	74 0c                	je     0x2df
 2d3:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 2d7:	80 03 ff             	addb   $0xff,(%rbx)
 2da:	80 3b 00             	cmpb   $0x0,(%rbx)
 2dd:	75 f4                	jne    0x2d3
 2df:	48 8d 5b fe          	lea    -0x2(%rbx),%rbx
 2e3:	80 3b 00             	cmpb   $0x0,(%rbx)
 2e6:	74 0c                	je     0x2f4
 2e8:	80 43 01 fd          	addb   $0xfd,0x1(%rbx)
 2ec:	80 03 ff             	addb   $0xff,(%rbx)
 2ef:	80 3b 00             	cmpb   $0x0,(%rbx)
 2f2:	75 f4                	jne    0x2e8
 2f4:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
 2f8:	e8 08 fd ff ff       	call   0x5
 2fd:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 301:	80 3b 00             	cmpb   $0x0,(%rbx)
 304:	74 08                	je     0x30e
 306:	80 03 ff             	addb   $0xff,(%rbx)
 309:	80 3b 00             	cmpb   $0x0,(%rbx)
 30c:	75 f8                	jne    0x306
 30e:	80 43 ef ff          	addb   $0xff,-0x11(%rbx)
 312:	48 8d 5b ef          	lea    -0x11(%rbx),%rbx
 316:	80 3b 00             	cmpb   $0x0,(%rbx)
 319:	0f 85 69 fe ff ff    	jne    0x188
 31f:	80 03 0a             	addb   $0xa,(%rbx)
 322:	48 8d 3b             	lea    (%rbx),%rdi
 325:	e8 db fc ff ff       	call   0x5
 32a:	80 3b 00             	cmpb   $0x0,(%rbx)
 32d:	74 08                	je     0x337
 32f:	80 03 ff             	addb   $0xff,(%rbx)
 332:	80 3b 00             	cmpb   $0x0,(%rbx)
 335:	75 f8                	jne    0x32f
 337:	80 43 ff ff          	addb   $0xff,-0x1(%rbx)
 33b:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 33f:	80 3b 00             	cmpb   $0x0,(%rbx)
 342:	0f 85 22 fe ff ff    	jne    0x16a
 348:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 34c:	80 3b 00             	cmpb   $0x0,(%rbx)
 34f:	74 08                	je     0x359
 351:	80 03 ff             	addb   $0xff,(%rbx)
 354:	80 3b 00             	cmpb   $0x0,(%rbx)
 357:	75 f8                	jne    0x351
 359:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 35d:	80 3b 00             	cmpb   $0x0,(%rbx)
 360:	74 08                	je     0x36a
 362:	80 03 ff             	addb   $0xff,(%rbx)
 365:	80 3b 00             	cmpb   $0x0,(%rbx)
 368:	75 f8                	jne    0x362
 36a:	80 03 05             	addb   $0x5,(%rbx)
 36d:	80 03 03             	addb   $0x3,(%rbx)
 370:	80 3b 00             	cmpb   $0x0,(%rbx)
 373:	74 10                	je     0x385
 375:	80 43 01 04          	addb   $0x4,0x1(%rbx)
 379:	80 43 01 04          	addb   $0x4,0x1(%rbx)
 37d:	80 03 ff             	addb   $0xff,(%rbx)
 380:	80 3b 00             	cmpb   $0x0,(%rbx)
 383:	75 f0                	jne    0x375
 385:	80 43 01 fe          	addb   $0xfe,0x1(%rbx)
 389:	48 8d 7b 01          	lea    0x1(%rbx),%rdi
 38d:	e8 73 fc ff ff       	call   0x5
 392:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 396:	80 3b 00             	cmpb   $0x0,(%rbx)
 399:	74 08                	je     0x3a3
 39b:	80 03 ff             	addb   $0xff,(%rbx)
 39e:	80 3b 00             	cmpb   $0x0,(%rbx)
 3a1:	75 f8                	jne    0x39b
 3a3:	48 8d 7b ff          	lea    -0x1(%rbx),%rdi
 3a7:	e8 66 fc ff ff       	call   0x12
 3ac:	80 43 ff f6          	addb   $0xf6,-0x1(%rbx)
 3b0:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 3b4:	80 3b 00             	cmpb   $0x0,(%rbx)
 3b7:	74 0c                	je     0x3c5
 3b9:	80 43 ff 01          	addb   $0x1,-0x1(%rbx)
 3bd:	80 03 ff             	addb   $0xff,(%rbx)
 3c0:	80 3b 00             	cmpb   $0x0,(%rbx)
 3c3:	75 f4                	jne    0x3b9
 3c5:	80 43 06 01          	addb   $0x1,0x6(%rbx)
 3c9:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 3cd:	80 3b 00             	cmpb   $0x0,(%rbx)
 3d0:	74 26                	je     0x3f8
 3d2:	80 43 01 01          	addb   $0x1,0x1(%rbx)
 3d6:	80 43 06 01          	addb   $0x1,0x6(%rbx)
 3da:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 3de:	80 3b 00             	cmpb   $0x0,(%rbx)
 3e1:	74 08                	je     0x3eb
 3e3:	80 03 ff             	addb   $0xff,(%rbx)
 3e6:	80 3b 00             	cmpb   $0x0,(%rbx)
 3e9:	75 f8                	jne    0x3e3
 3eb:	80 43 f9 ff          	addb   $0xff,-0x7(%rbx)
 3ef:	48 8d 5b f9          	lea    -0x7(%rbx),%rbx
 3f3:	80 3b 00             	cmpb   $0x0,(%rbx)
 3f6:	75 da                	jne    0x3d2
 3f8:	80 43 01 0a          	addb   $0xa,0x1(%rbx)
 3fc:	48 8d 5b 06          	lea    0x6(%rbx),%rbx
 400:	80 3b 00             	cmpb   $0x0,(%rbx)
 403:	0f 84 09 02 00 00    	je     0x612
 409:	80 3b 00             	cmpb   $0x0,(%rbx)
 40c:	74 08                	je     0x416
 40e:	80 03 ff             	addb   $0xff,(%rbx)
 411:	80 3b 00             	cmpb   $0x0,(%rbx)
 414:	75 f8                	jne    0x40e
 416:	48 8d 7b fe          	lea    -0x2(%rbx),%rdi
 41a:	e8 f3 fb ff ff       	call   0x12
 41f:	80 43 f7 ff          	addb   $0xff,-0x9(%rbx)
 423:	48 8d 5b fe          	lea    -0x2(%rbx),%rbx
 427:	80 3b 00             	cmpb   $0x0,(%rbx)
 42a:	74 0c                	je     0x438
 42c:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 430:	80 03 ff             	addb   $0xff,(%rbx)
 433:	80 3b 00             	cmpb   $0x0,(%rbx)
 436:	75 f4                	jne    0x42c
 438:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 43c:	80 3b 00             	cmpb   $0x0,(%rbx)
 43f:	74 10                	je     0x451
 441:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 445:	80 43 05 01          	addb   $0x1,0x5(%rbx)
 449:	80 03 ff             	addb   $0xff,(%rbx)
 44c:	80 3b 00             	cmpb   $0x0,(%rbx)
 44f:	75 f0                	jne    0x441
 451:	80 43 05 f6          	addb   $0xf6,0x5(%rbx)
 455:	48 8d 5b 05          	lea    0x5(%rbx),%rbx
 459:	80 3b 00             	cmpb   $0x0,(%rbx)
 45c:	0f 84 a3 01 00 00    	je     0x605
 462:	80 43 f8 01          	addb   $0x1,-0x8(%rbx)
 466:	48 8d 5b f7          	lea    -0x9(%rbx),%rbx
 46a:	80 3b 00             	cmpb   $0x0,(%rbx)
 46d:	74 0c                	je     0x47b
 46f:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 473:	80 03 ff             	addb   $0xff,(%rbx)
 476:	80 3b 00             	cmpb   $0x0,(%rbx)
 479:	75 f4                	jne    0x46f
 47b:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 47f:	80 3b 00             	cmpb   $0x0,(%rbx)
 482:	74 10                	je     0x494
 484:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 488:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 48c:	80 03 ff             	addb   $0xff,(%rbx)
 48f:	80 3b 00             	cmpb   $0x0,(%rbx)
 492:	75 f0                	jne    0x484
 494:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 498:	80 3b 00             	cmpb   $0x0,(%rbx)
 49b:	74 0c                	je     0x4a9
 49d:	80 43 01 ff          	addb   $0xff,0x1(%rbx)
 4a1:	80 03 ff             	addb   $0xff,(%rbx)
 4a4:	80 3b 00             	cmpb   $0x0,(%rbx)
 4a7:	75 f4                	jne    0x49d
 4a9:	80 43 01 0a          	addb   $0xa,0x1(%rbx)
 4ad:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 4b1:	80 3b 00             	cmpb   $0x0,(%rbx)
 4b4:	74 10                	je     0x4c6
 4b6:	80 43 01 09          	addb   $0x9,0x1(%rbx)
 4ba:	80 43 01 02          	addb   $0x2,0x1(%rbx)
 4be:	80 03 ff             	addb   $0xff,(%rbx)
 4c1:	80 3b 00             	cmpb   $0x0,(%rbx)
 4c4:	75 f0                	jne    0x4b6
 4c6:	48 8d 5b fa          	lea    -0x6(%rbx),%rbx
 4ca:	80 3b 00             	cmpb   $0x0,(%rbx)
 4cd:	74 0c                	je     0x4db
 4cf:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 4d3:	80 03 ff             	addb   $0xff,(%rbx)
 4d6:	80 3b 00             	cmpb   $0x0,(%rbx)
 4d9:	75 f4                	jne    0x4cf
 4db:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 4df:	80 3b 00             	cmpb   $0x0,(%rbx)
 4e2:	74 10                	je     0x4f4
 4e4:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 4e8:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 4ec:	80 03 ff             	addb   $0xff,(%rbx)
 4ef:	80 3b 00             	cmpb   $0x0,(%rbx)
 4f2:	75 f0                	jne    0x4e4
 4f4:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 4f8:	80 3b 00             	cmpb   $0x0,(%rbx)
 4fb:	74 0c                	je     0x509
 4fd:	80 43 fe ff          	addb   $0xff,-0x2(%rbx)
 501:	80 03 ff             	addb   $0xff,(%rbx)
 504:	80 3b 00             	cmpb   $0x0,(%rbx)
 507:	75 f4                	jne    0x4fd
 509:	80 43 fe 0a          	addb   $0xa,-0x2(%rbx)
 50d:	48 8d 5b fe          	lea    -0x2(%rbx),%rbx
 511:	80 3b 00             	cmpb   $0x0,(%rbx)
 514:	74 0c                	je     0x522
 516:	80 43 01 01          	addb   $0x1,0x1(%rbx)
 51a:	80 03 ff             	addb   $0xff,(%rbx)
 51d:	80 3b 00             	cmpb   $0x0,(%rbx)
 520:	75 f4                	jne    0x516
 522:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 526:	80 3b 00             	cmpb   $0x0,(%rbx)
 529:	74 10                	je     0x53b
 52b:	80 43 0c 01          	addb   $0x1,0xc(%rbx)
 52f:	80 43 0d 01          	addb   $0x1,0xd(%rbx)
 533:	80 03 ff             	addb   $0xff,(%rbx)
 536:	80 3b 00             	cmpb   $0x0,(%rbx)
 539:	75 f0                	jne    0x52b
 53b:	48 8d 5b 0c          	lea    0xc(%rbx),%rbx
 53f:	80 3b 00             	cmpb   $0x0,(%rbx)
 542:	74 32                	je     0x576
 544:	80 03 ff             	addb   $0xff,(%rbx)
 547:	80 3b 00             	cmpb   $0x0,(%rbx)
 54a:	74 0c                	je     0x558
 54c:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 550:	80 03 ff             	addb   $0xff,(%rbx)
 553:	80 3b 00             	cmpb   $0x0,(%rbx)
 556:	75 f4                	jne    0x54c
 558:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 55c:	80 3b 00             	cmpb   $0x0,(%rbx)
 55f:	74 0c                	je     0x56d
 561:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 565:	80 03 ff             	addb   $0xff,(%rbx)
 568:	80 3b 00             	cmpb   $0x0,(%rbx)
 56b:	75 f4                	jne    0x561
 56d:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 571:	80 3b 00             	cmpb   $0x0,(%rbx)
 574:	75 ce                	jne    0x544
 576:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 57a:	80 3b 00             	cmpb   $0x0,(%rbx)
 57d:	74 0c                	je     0x58b
 57f:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 583:	80 03 ff             	addb   $0xff,(%rbx)
 586:	80 3b 00             	cmpb   $0x0,(%rbx)
 589:	75 f4                	jne    0x57f
 58b:	80 03 01             	addb   $0x1,(%rbx)
 58e:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 592:	80 3b 00             	cmpb   $0x0,(%rbx)
 595:	74 0c                	je     0x5a3
 597:	80 43 03 ff          	addb   $0xff,0x3(%rbx)
 59b:	80 03 ff             	addb   $0xff,(%rbx)
 59e:	80 3b 00             	cmpb   $0x0,(%rbx)
 5a1:	75 f4                	jne    0x597
 5a3:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 5a7:	80 3b 00             	cmpb   $0x0,(%rbx)
 5aa:	74 36                	je     0x5e2
 5ac:	80 03 ff             	addb   $0xff,(%rbx)
 5af:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 5b3:	80 3b 00             	cmpb   $0x0,(%rbx)
 5b6:	74 0c                	je     0x5c4
 5b8:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 5bc:	80 03 ff             	addb   $0xff,(%rbx)
 5bf:	80 3b 00             	cmpb   $0x0,(%rbx)
 5c2:	75 f4                	jne    0x5b8
 5c4:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 5c8:	80 3b 00             	cmpb   $0x0,(%rbx)
 5cb:	74 0c                	je     0x5d9
 5cd:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 5d1:	80 03 ff             	addb   $0xff,(%rbx)
 5d4:	80 3b 00             	cmpb   $0x0,(%rbx)
 5d7:	75 f4                	jne    0x5cd
 5d9:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 5dd:	80 3b 00             	cmpb   $0x0,(%rbx)
 5e0:	75 ca                	jne    0x5ac
 5e2:	48 8d 7b f5          	lea    -0xb(%rbx),%rdi
 5e6:	e8 27 fa ff ff       	call   0x12
 5eb:	48 8d 5b f5          	lea    -0xb(%rbx),%rbx
 5ef:	80 3b 00             	cmpb   $0x0,(%rbx)
 5f2:	74 08                	je     0x5fc
 5f4:	80 03 ff             	addb   $0xff,(%rbx)
 5f7:	80 3b 00             	cmpb   $0x0,(%rbx)
 5fa:	75 f8                	jne    0x5f4
 5fc:	80 3b 00             	cmpb   $0x0,(%rbx)
 5ff:	0f 85 5d fe ff ff    	jne    0x462
 605:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 609:	80 3b 00             	cmpb   $0x0,(%rbx)
 60c:	0f 85 f7 fd ff ff    	jne    0x409
 612:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 616:	80 3b 00             	cmpb   $0x0,(%rbx)
 619:	0f 84 61 08 00 00    	je     0xe80
 61f:	80 03 ff             	addb   $0xff,(%rbx)
 622:	80 03 03             	addb   $0x3,(%rbx)
 625:	80 03 02             	addb   $0x2,(%rbx)
 628:	80 03 01             	addb   $0x1,(%rbx)
 62b:	80 03 03             	addb   $0x3,(%rbx)
 62e:	80 03 02             	addb   $0x2,(%rbx)
 631:	80 3b 00             	cmpb   $0x0,(%rbx)
 634:	74 1c                	je     0x652
 636:	80 43 01 07          	addb   $0x7,0x1(%rbx)
 63a:	80 43 01 04          	addb   $0x4,0x1(%rbx)
 63e:	80 43 02 09          	addb   $0x9,0x2(%rbx)
 642:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 646:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 64a:	80 03 ff             	addb   $0xff,(%rbx)
 64d:	80 3b 00             	cmpb   $0x0,(%rbx)
 650:	75 e4                	jne    0x636
 652:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 656:	80 3b 00             	cmpb   $0x0,(%rbx)
 659:	0f 84 e6 01 00 00    	je     0x845
 65f:	80 03 ff             	addb   $0xff,(%rbx)
 662:	80 3b 00             	cmpb   $0x0,(%rbx)
 665:	74 0c                	je     0x673
 667:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 66b:	80 03 ff             	addb   $0xff,(%rbx)
 66e:	80 3b 00             	cmpb   $0x0,(%rbx)
 671:	75 f4                	jne    0x667
 673:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 677:	80 3b 00             	cmpb   $0x0,(%rbx)
 67a:	74 14                	je     0x690
 67c:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 680:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 684:	80 43 05 01          	addb   $0x1,0x5(%rbx)
 688:	80 03 ff             	addb   $0xff,(%rbx)
 68b:	80 3b 00             	cmpb   $0x0,(%rbx)
 68e:	75 ec                	jne    0x67c
 690:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 694:	80 3b 00             	cmpb   $0x0,(%rbx)
 697:	74 32                	je     0x6cb
 699:	80 03 ff             	addb   $0xff,(%rbx)
 69c:	80 3b 00             	cmpb   $0x0,(%rbx)
 69f:	74 0c                	je     0x6ad
 6a1:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 6a5:	80 03 ff             	addb   $0xff,(%rbx)
 6a8:	80 3b 00             	cmpb   $0x0,(%rbx)
 6ab:	75 f4                	jne    0x6a1
 6ad:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 6b1:	80 3b 00             	cmpb   $0x0,(%rbx)
 6b4:	74 0c                	je     0x6c2
 6b6:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 6ba:	80 03 ff             	addb   $0xff,(%rbx)
 6bd:	80 3b 00             	cmpb   $0x0,(%rbx)
 6c0:	75 f4                	jne    0x6b6
 6c2:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 6c6:	80 3b 00             	cmpb   $0x0,(%rbx)
 6c9:	75 ce                	jne    0x699
 6cb:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 6cf:	80 3b 00             	cmpb   $0x0,(%rbx)
 6d2:	74 0c                	je     0x6e0
 6d4:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 6d8:	80 03 ff             	addb   $0xff,(%rbx)
 6db:	80 3b 00             	cmpb   $0x0,(%rbx)
 6de:	75 f4                	jne    0x6d4
 6e0:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 6e4:	80 3b 00             	cmpb   $0x0,(%rbx)
 6e7:	74 10                	je     0x6f9
 6e9:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 6ed:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 6f1:	80 03 ff             	addb   $0xff,(%rbx)
 6f4:	80 3b 00             	cmpb   $0x0,(%rbx)
 6f7:	75 f0                	jne    0x6e9
 6f9:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 6fd:	80 3b 00             	cmpb   $0x0,(%rbx)
 700:	74 36                	je     0x738
 702:	80 03 ff             	addb   $0xff,(%rbx)
 705:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 709:	80 3b 00             	cmpb   $0x0,(%rbx)
 70c:	74 0c                	je     0x71a
 70e:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 712:	80 03 ff             	addb   $0xff,(%rbx)
 715:	80 3b 00             	cmpb   $0x0,(%rbx)
 718:	75 f4                	jne    0x70e
 71a:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 71e:	80 3b 00             	cmpb   $0x0,(%rbx)
 721:	74 0c                	je     0x72f
 723:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 727:	80 03 ff             	addb   $0xff,(%rbx)
 72a:	80 3b 00             	cmpb   $0x0,(%rbx)
 72d:	75 f4                	jne    0x723
 72f:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 733:	80 3b 00             	cmpb   $0x0,(%rbx)
 736:	75 ca                	jne    0x702
 738:	48 8d 5b f8          	lea    -0x8(%rbx),%rbx
 73c:	80 3b 00             	cmpb   $0x0,(%rbx)
 73f:	74 0c                	je     0x74d
 741:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 745:	80 03 ff             	addb   $0xff,(%rbx)
 748:	80 3b 00             	cmpb   $0x0,(%rbx)
 74b:	75 f4                	jne    0x741
 74d:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 751:	80 3b 00             	cmpb   $0x0,(%rbx)
 754:	74 14                	je     0x76a
 756:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 75a:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 75e:	80 43 05 01          	addb   $0x1,0x5(%rbx)
 762:	80 03 ff             	addb   $0xff,(%rbx)
 765:	80 3b 00             	cmpb   $0x0,(%rbx)
 768:	75 ec                	jne    0x756
 76a:	48 8d 5b fe          	lea    -0x2(%rbx),%rbx
 76e:	80 3b 00             	cmpb   $0x0,(%rbx)
 771:	74 0c                	je     0x77f
 773:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 777:	80 03 ff             	addb   $0xff,(%rbx)
 77a:	80 3b 00             	cmpb   $0x0,(%rbx)
 77d:	75 f4                	jne    0x773
 77f:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 783:	80 3b 00             	cmpb   $0x0,(%rbx)
 786:	74 14                	je     0x79c
 788:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 78c:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 790:	80 43 05 01          	addb   $0x1,0x5(%rbx)
 794:	80 03 ff             	addb   $0xff,(%rbx)
 797:	80 3b 00             	cmpb   $0x0,(%rbx)
 79a:	75 ec                	jne    0x788
 79c:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 7a0:	80 3b 00             	cmpb   $0x0,(%rbx)
 7a3:	74 47                	je     0x7ec
 7a5:	80 03 ff             	addb   $0xff,(%rbx)
 7a8:	80 3b 00             	cmpb   $0x0,(%rbx)
 7ab:	74 0c                	je     0x7b9
 7ad:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 7b1:	80 03 ff             	addb   $0xff,(%rbx)
 7b4:	80 3b 00             	cmpb   $0x0,(%rbx)
 7b7:	75 f4                	jne    0x7ad
 7b9:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 7bd:	80 3b 00             	cmpb   $0x0,(%rbx)
 7c0:	74 0c                	je     0x7ce
 7c2:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 7c6:	80 03 ff             	addb   $0xff,(%rbx)
 7c9:	80 3b 00             	cmpb   $0x0,(%rbx)
 7cc:	75 f4                	jne    0x7c2
 7ce:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 7d2:	80 3b 00             	cmpb   $0x0,(%rbx)
 7d5:	74 0c                	je     0x7e3
 7d7:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 7db:	80 03 ff             	addb   $0xff,(%rbx)
 7de:	80 3b 00             	cmpb   $0x0,(%rbx)
 7e1:	75 f4                	jne    0x7d7
 7e3:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 7e7:	80 3b 00             	cmpb   $0x0,(%rbx)
 7ea:	75 b9                	jne    0x7a5
 7ec:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 7f0:	80 3b 00             	cmpb   $0x0,(%rbx)
 7f3:	74 08                	je     0x7fd
 7f5:	80 03 ff             	addb   $0xff,(%rbx)
 7f8:	80 3b 00             	cmpb   $0x0,(%rbx)
 7fb:	75 f8                	jne    0x7f5
 7fd:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 801:	80 3b 00             	cmpb   $0x0,(%rbx)
 804:	74 0c                	je     0x812
 806:	80 43 01 01          	addb   $0x1,0x1(%rbx)
 80a:	80 03 ff             	addb   $0xff,(%rbx)
 80d:	80 3b 00             	cmpb   $0x0,(%rbx)
 810:	75 f4                	jne    0x806
 812:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 816:	80 3b 00             	cmpb   $0x0,(%rbx)
 819:	74 1d                	je     0x838
 81b:	80 03 ff             	addb   $0xff,(%rbx)
 81e:	80 3b 00             	cmpb   $0x0,(%rbx)
 821:	74 0c                	je     0x82f
 823:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 827:	80 03 ff             	addb   $0xff,(%rbx)
 82a:	80 3b 00             	cmpb   $0x0,(%rbx)
 82d:	75 f4                	jne    0x823
 82f:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 833:	80 3b 00             	cmpb   $0x0,(%rbx)
 836:	75 e3                	jne    0x81b
 838:	48 8d 5b f8          	lea    -0x8(%rbx),%rbx
 83c:	80 3b 00             	cmpb   $0x0,(%rbx)
 83f:	0f 85 1a fe ff ff    	jne    0x65f
 845:	80 43 f6 04          	addb   $0x4,-0xa(%rbx)
 849:	80 43 f6 01          	addb   $0x1,-0xa(%rbx)
 84d:	80 43 f6 05          	addb   $0x5,-0xa(%rbx)
 851:	48 8d 5b f6          	lea    -0xa(%rbx),%rbx
 855:	80 3b 00             	cmpb   $0x0,(%rbx)
 858:	0f 84 04 06 00 00    	je     0xe62
 85e:	80 43 01 03          	addb   $0x3,0x1(%rbx)
 862:	80 43 01 01          	addb   $0x1,0x1(%rbx)
 866:	80 43 01 06          	addb   $0x6,0x1(%rbx)
 86a:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 86e:	80 3b 00             	cmpb   $0x0,(%rbx)
 871:	0f 84 da 05 00 00    	je     0xe51
 877:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 87b:	80 3b 00             	cmpb   $0x0,(%rbx)
 87e:	74 0c                	je     0x88c
 880:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 884:	80 03 ff             	addb   $0xff,(%rbx)
 887:	80 3b 00             	cmpb   $0x0,(%rbx)
 88a:	75 f4                	jne    0x880
 88c:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 890:	80 3b 00             	cmpb   $0x0,(%rbx)
 893:	74 18                	je     0x8ad
 895:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 899:	80 43 03 08          	addb   $0x8,0x3(%rbx)
 89d:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 8a1:	80 43 03 02          	addb   $0x2,0x3(%rbx)
 8a5:	80 03 ff             	addb   $0xff,(%rbx)
 8a8:	80 3b 00             	cmpb   $0x0,(%rbx)
 8ab:	75 e8                	jne    0x895
 8ad:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 8b1:	80 3b 00             	cmpb   $0x0,(%rbx)
 8b4:	74 0c                	je     0x8c2
 8b6:	80 43 01 01          	addb   $0x1,0x1(%rbx)
 8ba:	80 03 ff             	addb   $0xff,(%rbx)
 8bd:	80 3b 00             	cmpb   $0x0,(%rbx)
 8c0:	75 f4                	jne    0x8b6
 8c2:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 8c6:	80 3b 00             	cmpb   $0x0,(%rbx)
 8c9:	74 10                	je     0x8db
 8cb:	80 43 ff 01          	addb   $0x1,-0x1(%rbx)
 8cf:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 8d3:	80 03 ff             	addb   $0xff,(%rbx)
 8d6:	80 3b 00             	cmpb   $0x0,(%rbx)
 8d9:	75 f0                	jne    0x8cb
 8db:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 8df:	80 3b 00             	cmpb   $0x0,(%rbx)
 8e2:	74 0c                	je     0x8f0
 8e4:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 8e8:	80 03 ff             	addb   $0xff,(%rbx)
 8eb:	80 3b 00             	cmpb   $0x0,(%rbx)
 8ee:	75 f4                	jne    0x8e4
 8f0:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 8f4:	80 3b 00             	cmpb   $0x0,(%rbx)
 8f7:	74 10                	je     0x909
 8f9:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 8fd:	80 43 08 01          	addb   $0x1,0x8(%rbx)
 901:	80 03 ff             	addb   $0xff,(%rbx)
 904:	80 3b 00             	cmpb   $0x0,(%rbx)
 907:	75 f0                	jne    0x8f9
 909:	48 8d 5b 09          	lea    0x9(%rbx),%rbx
 90d:	80 3b 00             	cmpb   $0x0,(%rbx)
 910:	74 0c                	je     0x91e
 912:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 916:	80 03 ff             	addb   $0xff,(%rbx)
 919:	80 3b 00             	cmpb   $0x0,(%rbx)
 91c:	75 f4                	jne    0x912
 91e:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 922:	80 3b 00             	cmpb   $0x0,(%rbx)
 925:	74 10                	je     0x937
 927:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 92b:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 92f:	80 03 ff             	addb   $0xff,(%rbx)
 932:	80 3b 00             	cmpb   $0x0,(%rbx)
 935:	75 f0                	jne    0x927
 937:	80 43 fd fa          	addb   $0xfa,-0x3(%rbx)
 93b:	80 43 fd ff          	addb   $0xff,-0x3(%rbx)
 93f:	80 43 fd fb          	addb   $0xfb,-0x3(%rbx)
 943:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 947:	80 3b 00             	cmpb   $0x0,(%rbx)
 94a:	74 0c                	je     0x958
 94c:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 950:	80 03 ff             	addb   $0xff,(%rbx)
 953:	80 3b 00             	cmpb   $0x0,(%rbx)
 956:	75 f4                	jne    0x94c
 958:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 95c:	80 3b 00             	cmpb   $0x0,(%rbx)
 95f:	74 14                	je     0x975
 961:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 965:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 969:	80 43 05 01          	addb   $0x1,0x5(%rbx)
 96d:	80 03 ff             	addb   $0xff,(%rbx)
 970:	80 3b 00             	cmpb   $0x0,(%rbx)
 973:	75 ec                	jne    0x961
 975:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 979:	80 3b 00             	cmpb   $0x0,(%rbx)
 97c:	74 32                	je     0x9b0
 97e:	80 03 ff             	addb   $0xff,(%rbx)
 981:	80 3b 00             	cmpb   $0x0,(%rbx)
 984:	74 0c                	je     0x992
 986:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 98a:	80 03 ff             	addb   $0xff,(%rbx)
 98d:	80 3b 00             	cmpb   $0x0,(%rbx)
 990:	75 f4                	jne    0x986
 992:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 996:	80 3b 00             	cmpb   $0x0,(%rbx)
 999:	74 0c                	je     0x9a7
 99b:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 99f:	80 03 ff             	addb   $0xff,(%rbx)
 9a2:	80 3b 00             	cmpb   $0x0,(%rbx)
 9a5:	75 f4                	jne    0x99b
 9a7:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 9ab:	80 3b 00             	cmpb   $0x0,(%rbx)
 9ae:	75 ce                	jne    0x97e
 9b0:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 9b4:	80 3b 00             	cmpb   $0x0,(%rbx)
 9b7:	74 0c                	je     0x9c5
 9b9:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 9bd:	80 03 ff             	addb   $0xff,(%rbx)
 9c0:	80 3b 00             	cmpb   $0x0,(%rbx)
 9c3:	75 f4                	jne    0x9b9
 9c5:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 9c9:	80 3b 00             	cmpb   $0x0,(%rbx)
 9cc:	74 10                	je     0x9de
 9ce:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 9d2:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 9d6:	80 03 ff             	addb   $0xff,(%rbx)
 9d9:	80 3b 00             	cmpb   $0x0,(%rbx)
 9dc:	75 f0                	jne    0x9ce
 9de:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 9e2:	80 3b 00             	cmpb   $0x0,(%rbx)
 9e5:	74 0c                	je     0x9f3
 9e7:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 9eb:	80 03 ff             	addb   $0xff,(%rbx)
 9ee:	80 3b 00             	cmpb   $0x0,(%rbx)
 9f1:	75 f4                	jne    0x9e7
 9f3:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 9f7:	80 3b 00             	cmpb   $0x0,(%rbx)
 9fa:	74 10                	je     0xa0c
 9fc:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 a00:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 a04:	80 03 ff             	addb   $0xff,(%rbx)
 a07:	80 3b 00             	cmpb   $0x0,(%rbx)
 a0a:	75 f0                	jne    0x9fc
 a0c:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 a10:	80 3b 00             	cmpb   $0x0,(%rbx)
 a13:	74 0c                	je     0xa21
 a15:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 a19:	80 03 ff             	addb   $0xff,(%rbx)
 a1c:	80 3b 00             	cmpb   $0x0,(%rbx)
 a1f:	75 f4                	jne    0xa15
 a21:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 a25:	80 3b 00             	cmpb   $0x0,(%rbx)
 a28:	74 10                	je     0xa3a
 a2a:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 a2e:	80 43 fa 01          	addb   $0x1,-0x6(%rbx)
 a32:	80 03 ff             	addb   $0xff,(%rbx)
 a35:	80 3b 00             	cmpb   $0x0,(%rbx)
 a38:	75 f0                	jne    0xa2a
 a3a:	48 8d 5b f9          	lea    -0x7(%rbx),%rbx
 a3e:	80 3b 00             	cmpb   $0x0,(%rbx)
 a41:	74 36                	je     0xa79
 a43:	80 03 ff             	addb   $0xff,(%rbx)
 a46:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 a4a:	80 3b 00             	cmpb   $0x0,(%rbx)
 a4d:	74 0c                	je     0xa5b
 a4f:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 a53:	80 03 ff             	addb   $0xff,(%rbx)
 a56:	80 3b 00             	cmpb   $0x0,(%rbx)
 a59:	75 f4                	jne    0xa4f
 a5b:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 a5f:	80 3b 00             	cmpb   $0x0,(%rbx)
 a62:	74 0c                	je     0xa70
 a64:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 a68:	80 03 ff             	addb   $0xff,(%rbx)
 a6b:	80 3b 00             	cmpb   $0x0,(%rbx)
 a6e:	75 f4                	jne    0xa64
 a70:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 a74:	80 3b 00             	cmpb   $0x0,(%rbx)
 a77:	75 ca                	jne    0xa43
 a79:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 a7d:	80 3b 00             	cmpb   $0x0,(%rbx)
 a80:	74 0c                	je     0xa8e
 a82:	80 43 f9 01          	addb   $0x1,-0x7(%rbx)
 a86:	80 03 ff             	addb   $0xff,(%rbx)
 a89:	80 3b 00             	cmpb   $0x0,(%rbx)
 a8c:	75 f4                	jne    0xa82
 a8e:	80 43 f7 0b          	addb   $0xb,-0x9(%rbx)
 a92:	48 8d 5b f7          	lea    -0x9(%rbx),%rbx
 a96:	80 3b 00             	cmpb   $0x0,(%rbx)
 a99:	74 0c                	je     0xaa7
 a9b:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 a9f:	80 03 ff             	addb   $0xff,(%rbx)
 aa2:	80 3b 00             	cmpb   $0x0,(%rbx)
 aa5:	75 f4                	jne    0xa9b
 aa7:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 aab:	80 3b 00             	cmpb   $0x0,(%rbx)
 aae:	74 14                	je     0xac4
 ab0:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 ab4:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 ab8:	80 43 05 01          	addb   $0x1,0x5(%rbx)
 abc:	80 03 ff             	addb   $0xff,(%rbx)
 abf:	80 3b 00             	cmpb   $0x0,(%rbx)
 ac2:	75 ec                	jne    0xab0
 ac4:	48 8d 5b 04          	lea    0x4(%rbx),%rbx
 ac8:	80 3b 00             	cmpb   $0x0,(%rbx)
 acb:	74 32                	je     0xaff
 acd:	80 03 ff             	addb   $0xff,(%rbx)
 ad0:	80 3b 00             	cmpb   $0x0,(%rbx)
 ad3:	74 0c                	je     0xae1
 ad5:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 ad9:	80 03 ff             	addb   $0xff,(%rbx)
 adc:	80 3b 00             	cmpb   $0x0,(%rbx)
 adf:	75 f4                	jne    0xad5
 ae1:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 ae5:	80 3b 00             	cmpb   $0x0,(%rbx)
 ae8:	74 0c                	je     0xaf6
 aea:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 aee:	80 03 ff             	addb   $0xff,(%rbx)
 af1:	80 3b 00             	cmpb   $0x0,(%rbx)
 af4:	75 f4                	jne    0xaea
 af6:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 afa:	80 3b 00             	cmpb   $0x0,(%rbx)
 afd:	75 ce                	jne    0xacd
 aff:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 b03:	80 3b 00             	cmpb   $0x0,(%rbx)
 b06:	74 0c                	je     0xb14
 b08:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 b0c:	80 03 ff             	addb   $0xff,(%rbx)
 b0f:	80 3b 00             	cmpb   $0x0,(%rbx)
 b12:	75 f4                	jne    0xb08
 b14:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 b18:	80 3b 00             	cmpb   $0x0,(%rbx)
 b1b:	74 10                	je     0xb2d
 b1d:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 b21:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 b25:	80 03 ff             	addb   $0xff,(%rbx)
 b28:	80 3b 00             	cmpb   $0x0,(%rbx)
 b2b:	75 f0                	jne    0xb1d
 b2d:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 b31:	80 3b 00             	cmpb   $0x0,(%rbx)
 b34:	74 0c                	je     0xb42
 b36:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 b3a:	80 03 ff             	addb   $0xff,(%rbx)
 b3d:	80 3b 00             	cmpb   $0x0,(%rbx)
 b40:	75 f4                	jne    0xb36
 b42:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 b46:	80 3b 00             	cmpb   $0x0,(%rbx)
 b49:	74 10                	je     0xb5b
 b4b:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 b4f:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 b53:	80 03 ff             	addb   $0xff,(%rbx)
 b56:	80 3b 00             	cmpb   $0x0,(%rbx)
 b59:	75 f0                	jne    0xb4b
 b5b:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 b5f:	80 3b 00             	cmpb   $0x0,(%rbx)
 b62:	74 0c                	je     0xb70
 b64:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 b68:	80 03 ff             	addb   $0xff,(%rbx)
 b6b:	80 3b 00             	cmpb   $0x0,(%rbx)
 b6e:	75 f4                	jne    0xb64
 b70:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 b74:	80 3b 00             	cmpb   $0x0,(%rbx)
 b77:	74 10                	je     0xb89
 b79:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 b7d:	80 43 fa 01          	addb   $0x1,-0x6(%rbx)
 b81:	80 03 ff             	addb   $0xff,(%rbx)
 b84:	80 3b 00             	cmpb   $0x0,(%rbx)
 b87:	75 f0                	jne    0xb79
 b89:	48 8d 5b f9          	lea    -0x7(%rbx),%rbx
 b8d:	80 3b 00             	cmpb   $0x0,(%rbx)
 b90:	74 36                	je     0xbc8
 b92:	80 03 ff             	addb   $0xff,(%rbx)
 b95:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 b99:	80 3b 00             	cmpb   $0x0,(%rbx)
 b9c:	74 0c                	je     0xbaa
 b9e:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 ba2:	80 03 ff             	addb   $0xff,(%rbx)
 ba5:	80 3b 00             	cmpb   $0x0,(%rbx)
 ba8:	75 f4                	jne    0xb9e
 baa:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 bae:	80 3b 00             	cmpb   $0x0,(%rbx)
 bb1:	74 0c                	je     0xbbf
 bb3:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 bb7:	80 03 ff             	addb   $0xff,(%rbx)
 bba:	80 3b 00             	cmpb   $0x0,(%rbx)
 bbd:	75 f4                	jne    0xbb3
 bbf:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 bc3:	80 3b 00             	cmpb   $0x0,(%rbx)
 bc6:	75 ca                	jne    0xb92
 bc8:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 bcc:	80 3b 00             	cmpb   $0x0,(%rbx)
 bcf:	74 0c                	je     0xbdd
 bd1:	80 43 f9 01          	addb   $0x1,-0x7(%rbx)
 bd5:	80 03 ff             	addb   $0xff,(%rbx)
 bd8:	80 3b 00             	cmpb   $0x0,(%rbx)
 bdb:	75 f4                	jne    0xbd1
 bdd:	80 43 f7 0b          	addb   $0xb,-0x9(%rbx)
 be1:	48 8d 5b f7          	lea    -0x9(%rbx),%rbx
 be5:	80 3b 00             	cmpb   $0x0,(%rbx)
 be8:	74 10                	je     0xbfa
 bea:	80 43 07 01          	addb   $0x1,0x7(%rbx)
 bee:	80 43 08 01          	addb   $0x1,0x8(%rbx)
 bf2:	80 03 ff             	addb   $0xff,(%rbx)
 bf5:	80 3b 00             	cmpb   $0x0,(%rbx)
 bf8:	75 f0                	jne    0xbea
 bfa:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 bfe:	80 3b 00             	cmpb   $0x0,(%rbx)
 c01:	74 32                	je     0xc35
 c03:	80 03 ff             	addb   $0xff,(%rbx)
 c06:	80 3b 00             	cmpb   $0x0,(%rbx)
 c09:	74 0c                	je     0xc17
 c0b:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 c0f:	80 03 ff             	addb   $0xff,(%rbx)
 c12:	80 3b 00             	cmpb   $0x0,(%rbx)
 c15:	75 f4                	jne    0xc0b
 c17:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 c1b:	80 3b 00             	cmpb   $0x0,(%rbx)
 c1e:	74 0c                	je     0xc2c
 c20:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 c24:	80 03 ff             	addb   $0xff,(%rbx)
 c27:	80 3b 00             	cmpb   $0x0,(%rbx)
 c2a:	75 f4                	jne    0xc20
 c2c:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 c30:	80 3b 00             	cmpb   $0x0,(%rbx)
 c33:	75 ce                	jne    0xc03
 c35:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 c39:	80 3b 00             	cmpb   $0x0,(%rbx)
 c3c:	74 0c                	je     0xc4a
 c3e:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 c42:	80 03 ff             	addb   $0xff,(%rbx)
 c45:	80 3b 00             	cmpb   $0x0,(%rbx)
 c48:	75 f4                	jne    0xc3e
 c4a:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 c4e:	80 3b 00             	cmpb   $0x0,(%rbx)
 c51:	74 10                	je     0xc63
 c53:	80 43 02 01          	addb   $0x1,0x2(%rbx)
 c57:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 c5b:	80 03 ff             	addb   $0xff,(%rbx)
 c5e:	80 3b 00             	cmpb   $0x0,(%rbx)
 c61:	75 f0                	jne    0xc53
 c63:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 c67:	80 3b 00             	cmpb   $0x0,(%rbx)
 c6a:	74 0c                	je     0xc78
 c6c:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 c70:	80 03 ff             	addb   $0xff,(%rbx)
 c73:	80 3b 00             	cmpb   $0x0,(%rbx)
 c76:	75 f4                	jne    0xc6c
 c78:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 c7c:	80 3b 00             	cmpb   $0x0,(%rbx)
 c7f:	74 10                	je     0xc91
 c81:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 c85:	80 43 fe 01          	addb   $0x1,-0x2(%rbx)
 c89:	80 03 ff             	addb   $0xff,(%rbx)
 c8c:	80 3b 00             	cmpb   $0x0,(%rbx)
 c8f:	75 f0                	jne    0xc81
 c91:	48 8d 5b 07          	lea    0x7(%rbx),%rbx
 c95:	80 3b 00             	cmpb   $0x0,(%rbx)
 c98:	74 0c                	je     0xca6
 c9a:	80 43 fd 01          	addb   $0x1,-0x3(%rbx)
 c9e:	80 03 ff             	addb   $0xff,(%rbx)
 ca1:	80 3b 00             	cmpb   $0x0,(%rbx)
 ca4:	75 f4                	jne    0xc9a
 ca6:	48 8d 5b fd          	lea    -0x3(%rbx),%rbx
 caa:	80 3b 00             	cmpb   $0x0,(%rbx)
 cad:	74 10                	je     0xcbf
 caf:	80 43 03 01          	addb   $0x1,0x3(%rbx)
 cb3:	80 43 fa 01          	addb   $0x1,-0x6(%rbx)
 cb7:	80 03 ff             	addb   $0xff,(%rbx)
 cba:	80 3b 00             	cmpb   $0x0,(%rbx)
 cbd:	75 f0                	jne    0xcaf
 cbf:	48 8d 5b f9          	lea    -0x7(%rbx),%rbx
 cc3:	80 3b 00             	cmpb   $0x0,(%rbx)
 cc6:	74 36                	je     0xcfe
 cc8:	80 03 ff             	addb   $0xff,(%rbx)
 ccb:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 ccf:	80 3b 00             	cmpb   $0x0,(%rbx)
 cd2:	74 0c                	je     0xce0
 cd4:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 cd8:	80 03 ff             	addb   $0xff,(%rbx)
 cdb:	80 3b 00             	cmpb   $0x0,(%rbx)
 cde:	75 f4                	jne    0xcd4
 ce0:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 ce4:	80 3b 00             	cmpb   $0x0,(%rbx)
 ce7:	74 0c                	je     0xcf5
 ce9:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 ced:	80 03 ff             	addb   $0xff,(%rbx)
 cf0:	80 3b 00             	cmpb   $0x0,(%rbx)
 cf3:	75 f4                	jne    0xce9
 cf5:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 cf9:	80 3b 00             	cmpb   $0x0,(%rbx)
 cfc:	75 ca                	jne    0xcc8
 cfe:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 d02:	80 3b 00             	cmpb   $0x0,(%rbx)
 d05:	74 0c                	je     0xd13
 d07:	80 43 f9 01          	addb   $0x1,-0x7(%rbx)
 d0b:	80 03 ff             	addb   $0xff,(%rbx)
 d0e:	80 3b 00             	cmpb   $0x0,(%rbx)
 d11:	75 f4                	jne    0xd07
 d13:	80 43 f9 fc          	addb   $0xfc,-0x7(%rbx)
 d17:	48 8d 5b f9          	lea    -0x7(%rbx),%rbx
 d1b:	80 3b 00             	cmpb   $0x0,(%rbx)
 d1e:	0f 84 0b 01 00 00    	je     0xe2f
 d24:	80 43 07 01          	addb   $0x1,0x7(%rbx)
 d28:	80 03 01             	addb   $0x1,(%rbx)
 d2b:	80 3b 00             	cmpb   $0x0,(%rbx)
 d2e:	74 16                	je     0xd46
 d30:	80 43 07 ff          	addb   $0xff,0x7(%rbx)
 d34:	80 3b 00             	cmpb   $0x0,(%rbx)
 d37:	74 08                	je     0xd41
 d39:	80 03 ff             	addb   $0xff,(%rbx)
 d3c:	80 3b 00             	cmpb   $0x0,(%rbx)
 d3f:	75 f8                	jne    0xd39
 d41:	80 3b 00             	cmpb   $0x0,(%rbx)
 d44:	75 ea                	jne    0xd30
 d46:	48 8d 5b f9          	lea    -0x7(%rbx),%rbx
 d4a:	80 3b 00             	cmpb   $0x0,(%rbx)
 d4d:	74 10                	je     0xd5f
 d4f:	80 43 0c 01          	addb   $0x1,0xc(%rbx)
 d53:	80 43 0d 01          	addb   $0x1,0xd(%rbx)
 d57:	80 03 ff             	addb   $0xff,(%rbx)
 d5a:	80 3b 00             	cmpb   $0x0,(%rbx)
 d5d:	75 f0                	jne    0xd4f
 d5f:	80 3b 00             	cmpb   $0x0,(%rbx)
 d62:	74 15                	je     0xd79
 d64:	48 8d 3b             	lea    (%rbx),%rdi
 d67:	e8 99 f2 ff ff       	call   0x5
 d6c:	48 8d 3b             	lea    (%rbx),%rdi
 d6f:	e8 91 f2 ff ff       	call   0x5
 d74:	80 3b 00             	cmpb   $0x0,(%rbx)
 d77:	75 eb                	jne    0xd64
 d79:	48 8d 5b 0c          	lea    0xc(%rbx),%rbx
 d7d:	80 3b 00             	cmpb   $0x0,(%rbx)
 d80:	74 47                	je     0xdc9
 d82:	80 03 ff             	addb   $0xff,(%rbx)
 d85:	80 3b 00             	cmpb   $0x0,(%rbx)
 d88:	74 0c                	je     0xd96
 d8a:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 d8e:	80 03 ff             	addb   $0xff,(%rbx)
 d91:	80 3b 00             	cmpb   $0x0,(%rbx)
 d94:	75 f4                	jne    0xd8a
 d96:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 d9a:	80 3b 00             	cmpb   $0x0,(%rbx)
 d9d:	74 0c                	je     0xdab
 d9f:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 da3:	80 03 ff             	addb   $0xff,(%rbx)
 da6:	80 3b 00             	cmpb   $0x0,(%rbx)
 da9:	75 f4                	jne    0xd9f
 dab:	48 8d 5b 01          	lea    0x1(%rbx),%rbx
 daf:	80 3b 00             	cmpb   $0x0,(%rbx)
 db2:	74 0c                	je     0xdc0
 db4:	80 43 04 01          	addb   $0x1,0x4(%rbx)
 db8:	80 03 ff             	addb   $0xff,(%rbx)
 dbb:	80 3b 00             	cmpb   $0x0,(%rbx)
 dbe:	75 f4                	jne    0xdb4
 dc0:	48 8d 5b 02          	lea    0x2(%rbx),%rbx
 dc4:	80 3b 00             	cmpb   $0x0,(%rbx)
 dc7:	75 b9                	jne    0xd82
 dc9:	48 8d 5b 03          	lea    0x3(%rbx),%rbx
 dcd:	80 3b 00             	cmpb   $0x0,(%rbx)
 dd0:	74 08                	je     0xdda
 dd2:	80 03 ff             	addb   $0xff,(%rbx)
 dd5:	80 3b 00             	cmpb   $0x0,(%rbx)
 dd8:	75 f8                	jne    0xdd2
 dda:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 dde:	80 3b 00             	cmpb   $0x0,(%rbx)
 de1:	74 0c                	je     0xdef
 de3:	80 43 01 01          	addb   $0x1,0x1(%rbx)
 de7:	80 03 ff             	addb   $0xff,(%rbx)
 dea:	80 3b 00             	cmpb   $0x0,(%rbx)
 ded:	75 f4                	jne    0xde3
 def:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 df3:	80 3b 00             	cmpb   $0x0,(%rbx)
 df6:	74 1d                	je     0xe15
 df8:	80 03 ff             	addb   $0xff,(%rbx)
 dfb:	80 3b 00             	cmpb   $0x0,(%rbx)
 dfe:	74 0c                	je     0xe0c
 e00:	80 43 fc 01          	addb   $0x1,-0x4(%rbx)
 e04:	80 03 ff             	addb   $0xff,(%rbx)
 e07:	80 3b 00             	cmpb   $0x0,(%rbx)
 e0a:	75 f4                	jne    0xe00
 e0c:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 e10:	80 3b 00             	cmpb   $0x0,(%rbx)
 e13:	75 e3                	jne    0xdf8
 e15:	48 8d 5b fa          	lea    -0x6(%rbx),%rbx
 e19:	80 3b 00             	cmpb   $0x0,(%rbx)
 e1c:	74 08                	je     0xe26
 e1e:	80 03 ff             	addb   $0xff,(%rbx)
 e21:	80 3b 00             	cmpb   $0x0,(%rbx)
 e24:	75 f8                	jne    0xe1e
 e26:	80 3b 00             	cmpb   $0x0,(%rbx)
 e29:	0f 85 f5 fe ff ff    	jne    0xd24
 e2f:	48 8d 5b f9          	lea    -0x7(%rbx),%rbx
 e33:	80 3b 00             	cmpb   $0x0,(%rbx)
 e36:	74 08                	je     0xe40
 e38:	80 03 ff             	addb   $0xff,(%rbx)
 e3b:	80 3b 00             	cmpb   $0x0,(%rbx)
 e3e:	75 f8                	jne    0xe38
 e40:	80 43 fc ff          	addb   $0xff,-0x4(%rbx)
 e44:	48 8d 5b fc          	lea    -0x4(%rbx),%rbx
 e48:	80 3b 00             	cmpb   $0x0,(%rbx)
 e4b:	0f 85 26 fa ff ff    	jne    0x877
 e51:	80 43 ff ff          	addb   $0xff,-0x1(%rbx)
 e55:	48 8d 5b ff          	lea    -0x1(%rbx),%rbx
 e59:	80 3b 00             	cmpb   $0x0,(%rbx)
 e5c:	0f 85 fc f9 ff ff    	jne    0x85e
 e62:	48 8d 5b 0b          	lea    0xb(%rbx),%rbx
 e66:	80 3b 00             	cmpb   $0x0,(%rbx)
 e69:	74 08                	je     0xe73
 e6b:	80 03 ff             	addb   $0xff,(%rbx)
 e6e:	80 3b 00             	cmpb   $0x0,(%rbx)
 e71:	75 f8                	jne    0xe6b
 e73:	48 8d 5b fe          	lea    -0x2(%rbx),%rbx
 e77:	80 3b 00             	cmpb   $0x0,(%rbx)
 e7a:	0f 85 9f f7 ff ff    	jne    0x61f
 e80:	48 8d 5b f6          	lea    -0xa(%rbx),%rbx
 e84:	80 3b 00             	cmpb   $0x0,(%rbx)
 e87:	0f 85 cf f1 ff ff    	jne    0x5c
 e8d:	c3                   	ret
