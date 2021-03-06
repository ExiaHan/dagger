# RUN: llvm-mc -triple x86_64--darwin -filetype=obj -o - %s | llvm-dec - -dc-translate-unknown-to-undef -enable-dc-reg-mock-intrin | FileCheck %s

## VPSHUFBYrm
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 7
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[YMM9_0:%.+]] = call <8 x float> @llvm.dc.getreg.v8f32(metadata !"YMM9")
# CHECK-NEXT: [[V1:%.+]] = bitcast <8 x float> [[YMM9_0]] to i256
# CHECK-NEXT: [[V2:%.+]] = bitcast i256 [[V1]] to <32 x i8>
# CHECK-NEXT: [[R14_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R14")
# CHECK-NEXT: [[R15_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R15")
# CHECK-NEXT: [[V3:%.+]] = mul i64 [[R15_0]], 2
# CHECK-NEXT: [[V4:%.+]] = add i64 [[V3]], 2
# CHECK-NEXT: [[V5:%.+]] = add i64 [[R14_0]], [[V4]]
# CHECK-NEXT: [[V6:%.+]] = inttoptr i64 [[V5]] to <4 x i64>*
# CHECK-NEXT: [[V7:%.+]] = load <4 x i64>, <4 x i64>* [[V6]], align 1
# CHECK-NEXT: [[V8:%.+]] = bitcast <4 x i64> [[V7]] to <32 x i8>
# CHECK-NEXT: [[V9:%.+]] = icmp uge <32 x i8> [[V8]], <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>
# CHECK-NEXT: [[V10:%.+]] = select <32 x i1> [[V9]], <32 x i8> zeroinitializer, <32 x i8> [[V8]]
# CHECK-NEXT: [[V11:%.+]] = and <32 x i8> [[V10]], <i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15>
# CHECK-NEXT: [[V12:%.+]] = shufflevector <32 x i8> [[V2]], <32 x i8> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
# CHECK-NEXT: [[V13:%.+]] = shufflevector <32 x i8> [[V2]], <32 x i8> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
# CHECK-NEXT: [[V14:%.+]] = shufflevector <32 x i8> [[V11]], <32 x i8> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
# CHECK-NEXT: [[V15:%.+]] = shufflevector <32 x i8> [[V11]], <32 x i8> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
# CHECK-NEXT: [[V16:%.+]] = extractelement <16 x i8> [[V12]], i32 0
# CHECK-NEXT: [[V17:%.+]] = extractelement <16 x i8> [[V14]], i32 0
# CHECK-NEXT: [[V18:%.+]] = insertelement <16 x i8> undef, i8 [[V16]], i8 [[V17]]
# CHECK-NEXT: [[V19:%.+]] = extractelement <16 x i8> [[V12]], i32 1
# CHECK-NEXT: [[V20:%.+]] = extractelement <16 x i8> [[V14]], i32 1
# CHECK-NEXT: [[V21:%.+]] = insertelement <16 x i8> [[V18]], i8 [[V19]], i8 [[V20]]
# CHECK-NEXT: [[V22:%.+]] = extractelement <16 x i8> [[V12]], i32 2
# CHECK-NEXT: [[V23:%.+]] = extractelement <16 x i8> [[V14]], i32 2
# CHECK-NEXT: [[V24:%.+]] = insertelement <16 x i8> [[V21]], i8 [[V22]], i8 [[V23]]
# CHECK-NEXT: [[V25:%.+]] = extractelement <16 x i8> [[V12]], i32 3
# CHECK-NEXT: [[V26:%.+]] = extractelement <16 x i8> [[V14]], i32 3
# CHECK-NEXT: [[V27:%.+]] = insertelement <16 x i8> [[V24]], i8 [[V25]], i8 [[V26]]
# CHECK-NEXT: [[V28:%.+]] = extractelement <16 x i8> [[V12]], i32 4
# CHECK-NEXT: [[V29:%.+]] = extractelement <16 x i8> [[V14]], i32 4
# CHECK-NEXT: [[V30:%.+]] = insertelement <16 x i8> [[V27]], i8 [[V28]], i8 [[V29]]
# CHECK-NEXT: [[V31:%.+]] = extractelement <16 x i8> [[V12]], i32 5
# CHECK-NEXT: [[V32:%.+]] = extractelement <16 x i8> [[V14]], i32 5
# CHECK-NEXT: [[V33:%.+]] = insertelement <16 x i8> [[V30]], i8 [[V31]], i8 [[V32]]
# CHECK-NEXT: [[V34:%.+]] = extractelement <16 x i8> [[V12]], i32 6
# CHECK-NEXT: [[V35:%.+]] = extractelement <16 x i8> [[V14]], i32 6
# CHECK-NEXT: [[V36:%.+]] = insertelement <16 x i8> [[V33]], i8 [[V34]], i8 [[V35]]
# CHECK-NEXT: [[V37:%.+]] = extractelement <16 x i8> [[V12]], i32 7
# CHECK-NEXT: [[V38:%.+]] = extractelement <16 x i8> [[V14]], i32 7
# CHECK-NEXT: [[V39:%.+]] = insertelement <16 x i8> [[V36]], i8 [[V37]], i8 [[V38]]
# CHECK-NEXT: [[V40:%.+]] = extractelement <16 x i8> [[V12]], i32 8
# CHECK-NEXT: [[V41:%.+]] = extractelement <16 x i8> [[V14]], i32 8
# CHECK-NEXT: [[V42:%.+]] = insertelement <16 x i8> [[V39]], i8 [[V40]], i8 [[V41]]
# CHECK-NEXT: [[V43:%.+]] = extractelement <16 x i8> [[V12]], i32 9
# CHECK-NEXT: [[V44:%.+]] = extractelement <16 x i8> [[V14]], i32 9
# CHECK-NEXT: [[V45:%.+]] = insertelement <16 x i8> [[V42]], i8 [[V43]], i8 [[V44]]
# CHECK-NEXT: [[V46:%.+]] = extractelement <16 x i8> [[V12]], i32 10
# CHECK-NEXT: [[V47:%.+]] = extractelement <16 x i8> [[V14]], i32 10
# CHECK-NEXT: [[V48:%.+]] = insertelement <16 x i8> [[V45]], i8 [[V46]], i8 [[V47]]
# CHECK-NEXT: [[V49:%.+]] = extractelement <16 x i8> [[V12]], i32 11
# CHECK-NEXT: [[V50:%.+]] = extractelement <16 x i8> [[V14]], i32 11
# CHECK-NEXT: [[V51:%.+]] = insertelement <16 x i8> [[V48]], i8 [[V49]], i8 [[V50]]
# CHECK-NEXT: [[V52:%.+]] = extractelement <16 x i8> [[V12]], i32 12
# CHECK-NEXT: [[V53:%.+]] = extractelement <16 x i8> [[V14]], i32 12
# CHECK-NEXT: [[V54:%.+]] = insertelement <16 x i8> [[V51]], i8 [[V52]], i8 [[V53]]
# CHECK-NEXT: [[V55:%.+]] = extractelement <16 x i8> [[V12]], i32 13
# CHECK-NEXT: [[V56:%.+]] = extractelement <16 x i8> [[V14]], i32 13
# CHECK-NEXT: [[V57:%.+]] = insertelement <16 x i8> [[V54]], i8 [[V55]], i8 [[V56]]
# CHECK-NEXT: [[V58:%.+]] = extractelement <16 x i8> [[V12]], i32 14
# CHECK-NEXT: [[V59:%.+]] = extractelement <16 x i8> [[V14]], i32 14
# CHECK-NEXT: [[V60:%.+]] = insertelement <16 x i8> [[V57]], i8 [[V58]], i8 [[V59]]
# CHECK-NEXT: [[V61:%.+]] = extractelement <16 x i8> [[V12]], i32 15
# CHECK-NEXT: [[V62:%.+]] = extractelement <16 x i8> [[V14]], i32 15
# CHECK-NEXT: [[V63:%.+]] = insertelement <16 x i8> [[V60]], i8 [[V61]], i8 [[V62]]
# CHECK-NEXT: [[V64:%.+]] = extractelement <16 x i8> [[V13]], i32 0
# CHECK-NEXT: [[V65:%.+]] = extractelement <16 x i8> [[V15]], i32 0
# CHECK-NEXT: [[V66:%.+]] = insertelement <16 x i8> undef, i8 [[V64]], i8 [[V65]]
# CHECK-NEXT: [[V67:%.+]] = extractelement <16 x i8> [[V13]], i32 1
# CHECK-NEXT: [[V68:%.+]] = extractelement <16 x i8> [[V15]], i32 1
# CHECK-NEXT: [[V69:%.+]] = insertelement <16 x i8> [[V66]], i8 [[V67]], i8 [[V68]]
# CHECK-NEXT: [[V70:%.+]] = extractelement <16 x i8> [[V13]], i32 2
# CHECK-NEXT: [[V71:%.+]] = extractelement <16 x i8> [[V15]], i32 2
# CHECK-NEXT: [[V72:%.+]] = insertelement <16 x i8> [[V69]], i8 [[V70]], i8 [[V71]]
# CHECK-NEXT: [[V73:%.+]] = extractelement <16 x i8> [[V13]], i32 3
# CHECK-NEXT: [[V74:%.+]] = extractelement <16 x i8> [[V15]], i32 3
# CHECK-NEXT: [[V75:%.+]] = insertelement <16 x i8> [[V72]], i8 [[V73]], i8 [[V74]]
# CHECK-NEXT: [[V76:%.+]] = extractelement <16 x i8> [[V13]], i32 4
# CHECK-NEXT: [[V77:%.+]] = extractelement <16 x i8> [[V15]], i32 4
# CHECK-NEXT: [[V78:%.+]] = insertelement <16 x i8> [[V75]], i8 [[V76]], i8 [[V77]]
# CHECK-NEXT: [[V79:%.+]] = extractelement <16 x i8> [[V13]], i32 5
# CHECK-NEXT: [[V80:%.+]] = extractelement <16 x i8> [[V15]], i32 5
# CHECK-NEXT: [[V81:%.+]] = insertelement <16 x i8> [[V78]], i8 [[V79]], i8 [[V80]]
# CHECK-NEXT: [[V82:%.+]] = extractelement <16 x i8> [[V13]], i32 6
# CHECK-NEXT: [[V83:%.+]] = extractelement <16 x i8> [[V15]], i32 6
# CHECK-NEXT: [[V84:%.+]] = insertelement <16 x i8> [[V81]], i8 [[V82]], i8 [[V83]]
# CHECK-NEXT: [[V85:%.+]] = extractelement <16 x i8> [[V13]], i32 7
# CHECK-NEXT: [[V86:%.+]] = extractelement <16 x i8> [[V15]], i32 7
# CHECK-NEXT: [[V87:%.+]] = insertelement <16 x i8> [[V84]], i8 [[V85]], i8 [[V86]]
# CHECK-NEXT: [[V88:%.+]] = extractelement <16 x i8> [[V13]], i32 8
# CHECK-NEXT: [[V89:%.+]] = extractelement <16 x i8> [[V15]], i32 8
# CHECK-NEXT: [[V90:%.+]] = insertelement <16 x i8> [[V87]], i8 [[V88]], i8 [[V89]]
# CHECK-NEXT: [[V91:%.+]] = extractelement <16 x i8> [[V13]], i32 9
# CHECK-NEXT: [[V92:%.+]] = extractelement <16 x i8> [[V15]], i32 9
# CHECK-NEXT: [[V93:%.+]] = insertelement <16 x i8> [[V90]], i8 [[V91]], i8 [[V92]]
# CHECK-NEXT: [[V94:%.+]] = extractelement <16 x i8> [[V13]], i32 10
# CHECK-NEXT: [[V95:%.+]] = extractelement <16 x i8> [[V15]], i32 10
# CHECK-NEXT: [[V96:%.+]] = insertelement <16 x i8> [[V93]], i8 [[V94]], i8 [[V95]]
# CHECK-NEXT: [[V97:%.+]] = extractelement <16 x i8> [[V13]], i32 11
# CHECK-NEXT: [[V98:%.+]] = extractelement <16 x i8> [[V15]], i32 11
# CHECK-NEXT: [[V99:%.+]] = insertelement <16 x i8> [[V96]], i8 [[V97]], i8 [[V98]]
# CHECK-NEXT: [[V100:%.+]] = extractelement <16 x i8> [[V13]], i32 12
# CHECK-NEXT: [[V101:%.+]] = extractelement <16 x i8> [[V15]], i32 12
# CHECK-NEXT: [[V102:%.+]] = insertelement <16 x i8> [[V99]], i8 [[V100]], i8 [[V101]]
# CHECK-NEXT: [[V103:%.+]] = extractelement <16 x i8> [[V13]], i32 13
# CHECK-NEXT: [[V104:%.+]] = extractelement <16 x i8> [[V15]], i32 13
# CHECK-NEXT: [[V105:%.+]] = insertelement <16 x i8> [[V102]], i8 [[V103]], i8 [[V104]]
# CHECK-NEXT: [[V106:%.+]] = extractelement <16 x i8> [[V13]], i32 14
# CHECK-NEXT: [[V107:%.+]] = extractelement <16 x i8> [[V15]], i32 14
# CHECK-NEXT: [[V108:%.+]] = insertelement <16 x i8> [[V105]], i8 [[V106]], i8 [[V107]]
# CHECK-NEXT: [[V109:%.+]] = extractelement <16 x i8> [[V13]], i32 15
# CHECK-NEXT: [[V110:%.+]] = extractelement <16 x i8> [[V15]], i32 15
# CHECK-NEXT: [[V111:%.+]] = insertelement <16 x i8> [[V108]], i8 [[V109]], i8 [[V110]]
# CHECK-NEXT: [[V112:%.+]] = shufflevector <16 x i8> [[V63]], <16 x i8> [[V111]], <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
# CHECK-NEXT: [[V113:%.+]] = bitcast <32 x i8> [[V112]] to i256
# CHECK-NEXT: call void @llvm.dc.setreg.i256(i256 [[V113]], metadata !"YMM8")
vpshufb	2(%r14,%r15,2), %ymm9, %ymm8

## VPSHUFBYrr
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 5
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[YMM9_0:%.+]] = call <8 x float> @llvm.dc.getreg.v8f32(metadata !"YMM9")
# CHECK-NEXT: [[V1:%.+]] = bitcast <8 x float> [[YMM9_0]] to i256
# CHECK-NEXT: [[V2:%.+]] = bitcast i256 [[V1]] to <32 x i8>
# CHECK-NEXT: [[YMM10_0:%.+]] = call <8 x float> @llvm.dc.getreg.v8f32(metadata !"YMM10")
# CHECK-NEXT: [[V3:%.+]] = bitcast <8 x float> [[YMM10_0]] to i256
# CHECK-NEXT: [[V4:%.+]] = bitcast i256 [[V3]] to <32 x i8>
# CHECK-NEXT: [[V5:%.+]] = icmp uge <32 x i8> [[V4]], <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>
# CHECK-NEXT: [[V6:%.+]] = select <32 x i1> [[V5]], <32 x i8> zeroinitializer, <32 x i8> [[V4]]
# CHECK-NEXT: [[V7:%.+]] = and <32 x i8> [[V6]], <i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15>
# CHECK-NEXT: [[V8:%.+]] = shufflevector <32 x i8> [[V2]], <32 x i8> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
# CHECK-NEXT: [[V9:%.+]] = shufflevector <32 x i8> [[V2]], <32 x i8> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
# CHECK-NEXT: [[V10:%.+]] = shufflevector <32 x i8> [[V7]], <32 x i8> undef, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
# CHECK-NEXT: [[V11:%.+]] = shufflevector <32 x i8> [[V7]], <32 x i8> undef, <16 x i32> <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
# CHECK-NEXT: [[V12:%.+]] = extractelement <16 x i8> [[V8]], i32 0
# CHECK-NEXT: [[V13:%.+]] = extractelement <16 x i8> [[V10]], i32 0
# CHECK-NEXT: [[V14:%.+]] = insertelement <16 x i8> undef, i8 [[V12]], i8 [[V13]]
# CHECK-NEXT: [[V15:%.+]] = extractelement <16 x i8> [[V8]], i32 1
# CHECK-NEXT: [[V16:%.+]] = extractelement <16 x i8> [[V10]], i32 1
# CHECK-NEXT: [[V17:%.+]] = insertelement <16 x i8> [[V14]], i8 [[V15]], i8 [[V16]]
# CHECK-NEXT: [[V18:%.+]] = extractelement <16 x i8> [[V8]], i32 2
# CHECK-NEXT: [[V19:%.+]] = extractelement <16 x i8> [[V10]], i32 2
# CHECK-NEXT: [[V20:%.+]] = insertelement <16 x i8> [[V17]], i8 [[V18]], i8 [[V19]]
# CHECK-NEXT: [[V21:%.+]] = extractelement <16 x i8> [[V8]], i32 3
# CHECK-NEXT: [[V22:%.+]] = extractelement <16 x i8> [[V10]], i32 3
# CHECK-NEXT: [[V23:%.+]] = insertelement <16 x i8> [[V20]], i8 [[V21]], i8 [[V22]]
# CHECK-NEXT: [[V24:%.+]] = extractelement <16 x i8> [[V8]], i32 4
# CHECK-NEXT: [[V25:%.+]] = extractelement <16 x i8> [[V10]], i32 4
# CHECK-NEXT: [[V26:%.+]] = insertelement <16 x i8> [[V23]], i8 [[V24]], i8 [[V25]]
# CHECK-NEXT: [[V27:%.+]] = extractelement <16 x i8> [[V8]], i32 5
# CHECK-NEXT: [[V28:%.+]] = extractelement <16 x i8> [[V10]], i32 5
# CHECK-NEXT: [[V29:%.+]] = insertelement <16 x i8> [[V26]], i8 [[V27]], i8 [[V28]]
# CHECK-NEXT: [[V30:%.+]] = extractelement <16 x i8> [[V8]], i32 6
# CHECK-NEXT: [[V31:%.+]] = extractelement <16 x i8> [[V10]], i32 6
# CHECK-NEXT: [[V32:%.+]] = insertelement <16 x i8> [[V29]], i8 [[V30]], i8 [[V31]]
# CHECK-NEXT: [[V33:%.+]] = extractelement <16 x i8> [[V8]], i32 7
# CHECK-NEXT: [[V34:%.+]] = extractelement <16 x i8> [[V10]], i32 7
# CHECK-NEXT: [[V35:%.+]] = insertelement <16 x i8> [[V32]], i8 [[V33]], i8 [[V34]]
# CHECK-NEXT: [[V36:%.+]] = extractelement <16 x i8> [[V8]], i32 8
# CHECK-NEXT: [[V37:%.+]] = extractelement <16 x i8> [[V10]], i32 8
# CHECK-NEXT: [[V38:%.+]] = insertelement <16 x i8> [[V35]], i8 [[V36]], i8 [[V37]]
# CHECK-NEXT: [[V39:%.+]] = extractelement <16 x i8> [[V8]], i32 9
# CHECK-NEXT: [[V40:%.+]] = extractelement <16 x i8> [[V10]], i32 9
# CHECK-NEXT: [[V41:%.+]] = insertelement <16 x i8> [[V38]], i8 [[V39]], i8 [[V40]]
# CHECK-NEXT: [[V42:%.+]] = extractelement <16 x i8> [[V8]], i32 10
# CHECK-NEXT: [[V43:%.+]] = extractelement <16 x i8> [[V10]], i32 10
# CHECK-NEXT: [[V44:%.+]] = insertelement <16 x i8> [[V41]], i8 [[V42]], i8 [[V43]]
# CHECK-NEXT: [[V45:%.+]] = extractelement <16 x i8> [[V8]], i32 11
# CHECK-NEXT: [[V46:%.+]] = extractelement <16 x i8> [[V10]], i32 11
# CHECK-NEXT: [[V47:%.+]] = insertelement <16 x i8> [[V44]], i8 [[V45]], i8 [[V46]]
# CHECK-NEXT: [[V48:%.+]] = extractelement <16 x i8> [[V8]], i32 12
# CHECK-NEXT: [[V49:%.+]] = extractelement <16 x i8> [[V10]], i32 12
# CHECK-NEXT: [[V50:%.+]] = insertelement <16 x i8> [[V47]], i8 [[V48]], i8 [[V49]]
# CHECK-NEXT: [[V51:%.+]] = extractelement <16 x i8> [[V8]], i32 13
# CHECK-NEXT: [[V52:%.+]] = extractelement <16 x i8> [[V10]], i32 13
# CHECK-NEXT: [[V53:%.+]] = insertelement <16 x i8> [[V50]], i8 [[V51]], i8 [[V52]]
# CHECK-NEXT: [[V54:%.+]] = extractelement <16 x i8> [[V8]], i32 14
# CHECK-NEXT: [[V55:%.+]] = extractelement <16 x i8> [[V10]], i32 14
# CHECK-NEXT: [[V56:%.+]] = insertelement <16 x i8> [[V53]], i8 [[V54]], i8 [[V55]]
# CHECK-NEXT: [[V57:%.+]] = extractelement <16 x i8> [[V8]], i32 15
# CHECK-NEXT: [[V58:%.+]] = extractelement <16 x i8> [[V10]], i32 15
# CHECK-NEXT: [[V59:%.+]] = insertelement <16 x i8> [[V56]], i8 [[V57]], i8 [[V58]]
# CHECK-NEXT: [[V60:%.+]] = extractelement <16 x i8> [[V9]], i32 0
# CHECK-NEXT: [[V61:%.+]] = extractelement <16 x i8> [[V11]], i32 0
# CHECK-NEXT: [[V62:%.+]] = insertelement <16 x i8> undef, i8 [[V60]], i8 [[V61]]
# CHECK-NEXT: [[V63:%.+]] = extractelement <16 x i8> [[V9]], i32 1
# CHECK-NEXT: [[V64:%.+]] = extractelement <16 x i8> [[V11]], i32 1
# CHECK-NEXT: [[V65:%.+]] = insertelement <16 x i8> [[V62]], i8 [[V63]], i8 [[V64]]
# CHECK-NEXT: [[V66:%.+]] = extractelement <16 x i8> [[V9]], i32 2
# CHECK-NEXT: [[V67:%.+]] = extractelement <16 x i8> [[V11]], i32 2
# CHECK-NEXT: [[V68:%.+]] = insertelement <16 x i8> [[V65]], i8 [[V66]], i8 [[V67]]
# CHECK-NEXT: [[V69:%.+]] = extractelement <16 x i8> [[V9]], i32 3
# CHECK-NEXT: [[V70:%.+]] = extractelement <16 x i8> [[V11]], i32 3
# CHECK-NEXT: [[V71:%.+]] = insertelement <16 x i8> [[V68]], i8 [[V69]], i8 [[V70]]
# CHECK-NEXT: [[V72:%.+]] = extractelement <16 x i8> [[V9]], i32 4
# CHECK-NEXT: [[V73:%.+]] = extractelement <16 x i8> [[V11]], i32 4
# CHECK-NEXT: [[V74:%.+]] = insertelement <16 x i8> [[V71]], i8 [[V72]], i8 [[V73]]
# CHECK-NEXT: [[V75:%.+]] = extractelement <16 x i8> [[V9]], i32 5
# CHECK-NEXT: [[V76:%.+]] = extractelement <16 x i8> [[V11]], i32 5
# CHECK-NEXT: [[V77:%.+]] = insertelement <16 x i8> [[V74]], i8 [[V75]], i8 [[V76]]
# CHECK-NEXT: [[V78:%.+]] = extractelement <16 x i8> [[V9]], i32 6
# CHECK-NEXT: [[V79:%.+]] = extractelement <16 x i8> [[V11]], i32 6
# CHECK-NEXT: [[V80:%.+]] = insertelement <16 x i8> [[V77]], i8 [[V78]], i8 [[V79]]
# CHECK-NEXT: [[V81:%.+]] = extractelement <16 x i8> [[V9]], i32 7
# CHECK-NEXT: [[V82:%.+]] = extractelement <16 x i8> [[V11]], i32 7
# CHECK-NEXT: [[V83:%.+]] = insertelement <16 x i8> [[V80]], i8 [[V81]], i8 [[V82]]
# CHECK-NEXT: [[V84:%.+]] = extractelement <16 x i8> [[V9]], i32 8
# CHECK-NEXT: [[V85:%.+]] = extractelement <16 x i8> [[V11]], i32 8
# CHECK-NEXT: [[V86:%.+]] = insertelement <16 x i8> [[V83]], i8 [[V84]], i8 [[V85]]
# CHECK-NEXT: [[V87:%.+]] = extractelement <16 x i8> [[V9]], i32 9
# CHECK-NEXT: [[V88:%.+]] = extractelement <16 x i8> [[V11]], i32 9
# CHECK-NEXT: [[V89:%.+]] = insertelement <16 x i8> [[V86]], i8 [[V87]], i8 [[V88]]
# CHECK-NEXT: [[V90:%.+]] = extractelement <16 x i8> [[V9]], i32 10
# CHECK-NEXT: [[V91:%.+]] = extractelement <16 x i8> [[V11]], i32 10
# CHECK-NEXT: [[V92:%.+]] = insertelement <16 x i8> [[V89]], i8 [[V90]], i8 [[V91]]
# CHECK-NEXT: [[V93:%.+]] = extractelement <16 x i8> [[V9]], i32 11
# CHECK-NEXT: [[V94:%.+]] = extractelement <16 x i8> [[V11]], i32 11
# CHECK-NEXT: [[V95:%.+]] = insertelement <16 x i8> [[V92]], i8 [[V93]], i8 [[V94]]
# CHECK-NEXT: [[V96:%.+]] = extractelement <16 x i8> [[V9]], i32 12
# CHECK-NEXT: [[V97:%.+]] = extractelement <16 x i8> [[V11]], i32 12
# CHECK-NEXT: [[V98:%.+]] = insertelement <16 x i8> [[V95]], i8 [[V96]], i8 [[V97]]
# CHECK-NEXT: [[V99:%.+]] = extractelement <16 x i8> [[V9]], i32 13
# CHECK-NEXT: [[V100:%.+]] = extractelement <16 x i8> [[V11]], i32 13
# CHECK-NEXT: [[V101:%.+]] = insertelement <16 x i8> [[V98]], i8 [[V99]], i8 [[V100]]
# CHECK-NEXT: [[V102:%.+]] = extractelement <16 x i8> [[V9]], i32 14
# CHECK-NEXT: [[V103:%.+]] = extractelement <16 x i8> [[V11]], i32 14
# CHECK-NEXT: [[V104:%.+]] = insertelement <16 x i8> [[V101]], i8 [[V102]], i8 [[V103]]
# CHECK-NEXT: [[V105:%.+]] = extractelement <16 x i8> [[V9]], i32 15
# CHECK-NEXT: [[V106:%.+]] = extractelement <16 x i8> [[V11]], i32 15
# CHECK-NEXT: [[V107:%.+]] = insertelement <16 x i8> [[V104]], i8 [[V105]], i8 [[V106]]
# CHECK-NEXT: [[V108:%.+]] = shufflevector <16 x i8> [[V59]], <16 x i8> [[V107]], <32 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
# CHECK-NEXT: [[V109:%.+]] = bitcast <32 x i8> [[V108]] to i256
# CHECK-NEXT: call void @llvm.dc.setreg.i256(i256 [[V109]], metadata !"YMM8")
vpshufb	%ymm10, %ymm9, %ymm8

## VPSHUFBrm
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 7
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[XMM9_0:%.+]] = call <4 x float> @llvm.dc.getreg.v4f32(metadata !"XMM9")
# CHECK-NEXT: [[V1:%.+]] = bitcast <4 x float> [[XMM9_0]] to i128
# CHECK-NEXT: [[V2:%.+]] = bitcast i128 [[V1]] to <16 x i8>
# CHECK-NEXT: [[R14_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R14")
# CHECK-NEXT: [[R15_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"R15")
# CHECK-NEXT: [[V3:%.+]] = mul i64 [[R15_0]], 2
# CHECK-NEXT: [[V4:%.+]] = add i64 [[V3]], 2
# CHECK-NEXT: [[V5:%.+]] = add i64 [[R14_0]], [[V4]]
# CHECK-NEXT: [[V6:%.+]] = inttoptr i64 [[V5]] to <2 x i64>*
# CHECK-NEXT: [[V7:%.+]] = load <2 x i64>, <2 x i64>* [[V6]], align 1
# CHECK-NEXT: [[V8:%.+]] = bitcast <2 x i64> [[V7]] to <16 x i8>
# CHECK-NEXT: [[V9:%.+]] = icmp uge <16 x i8> [[V8]], <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>
# CHECK-NEXT: [[V10:%.+]] = select <16 x i1> [[V9]], <16 x i8> zeroinitializer, <16 x i8> [[V8]]
# CHECK-NEXT: [[V11:%.+]] = and <16 x i8> [[V10]], <i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15>
# CHECK-NEXT: [[V12:%.+]] = extractelement <16 x i8> [[V2]], i32 0
# CHECK-NEXT: [[V13:%.+]] = extractelement <16 x i8> [[V11]], i32 0
# CHECK-NEXT: [[V14:%.+]] = insertelement <16 x i8> undef, i8 [[V12]], i8 [[V13]]
# CHECK-NEXT: [[V15:%.+]] = extractelement <16 x i8> [[V2]], i32 1
# CHECK-NEXT: [[V16:%.+]] = extractelement <16 x i8> [[V11]], i32 1
# CHECK-NEXT: [[V17:%.+]] = insertelement <16 x i8> [[V14]], i8 [[V15]], i8 [[V16]]
# CHECK-NEXT: [[V18:%.+]] = extractelement <16 x i8> [[V2]], i32 2
# CHECK-NEXT: [[V19:%.+]] = extractelement <16 x i8> [[V11]], i32 2
# CHECK-NEXT: [[V20:%.+]] = insertelement <16 x i8> [[V17]], i8 [[V18]], i8 [[V19]]
# CHECK-NEXT: [[V21:%.+]] = extractelement <16 x i8> [[V2]], i32 3
# CHECK-NEXT: [[V22:%.+]] = extractelement <16 x i8> [[V11]], i32 3
# CHECK-NEXT: [[V23:%.+]] = insertelement <16 x i8> [[V20]], i8 [[V21]], i8 [[V22]]
# CHECK-NEXT: [[V24:%.+]] = extractelement <16 x i8> [[V2]], i32 4
# CHECK-NEXT: [[V25:%.+]] = extractelement <16 x i8> [[V11]], i32 4
# CHECK-NEXT: [[V26:%.+]] = insertelement <16 x i8> [[V23]], i8 [[V24]], i8 [[V25]]
# CHECK-NEXT: [[V27:%.+]] = extractelement <16 x i8> [[V2]], i32 5
# CHECK-NEXT: [[V28:%.+]] = extractelement <16 x i8> [[V11]], i32 5
# CHECK-NEXT: [[V29:%.+]] = insertelement <16 x i8> [[V26]], i8 [[V27]], i8 [[V28]]
# CHECK-NEXT: [[V30:%.+]] = extractelement <16 x i8> [[V2]], i32 6
# CHECK-NEXT: [[V31:%.+]] = extractelement <16 x i8> [[V11]], i32 6
# CHECK-NEXT: [[V32:%.+]] = insertelement <16 x i8> [[V29]], i8 [[V30]], i8 [[V31]]
# CHECK-NEXT: [[V33:%.+]] = extractelement <16 x i8> [[V2]], i32 7
# CHECK-NEXT: [[V34:%.+]] = extractelement <16 x i8> [[V11]], i32 7
# CHECK-NEXT: [[V35:%.+]] = insertelement <16 x i8> [[V32]], i8 [[V33]], i8 [[V34]]
# CHECK-NEXT: [[V36:%.+]] = extractelement <16 x i8> [[V2]], i32 8
# CHECK-NEXT: [[V37:%.+]] = extractelement <16 x i8> [[V11]], i32 8
# CHECK-NEXT: [[V38:%.+]] = insertelement <16 x i8> [[V35]], i8 [[V36]], i8 [[V37]]
# CHECK-NEXT: [[V39:%.+]] = extractelement <16 x i8> [[V2]], i32 9
# CHECK-NEXT: [[V40:%.+]] = extractelement <16 x i8> [[V11]], i32 9
# CHECK-NEXT: [[V41:%.+]] = insertelement <16 x i8> [[V38]], i8 [[V39]], i8 [[V40]]
# CHECK-NEXT: [[V42:%.+]] = extractelement <16 x i8> [[V2]], i32 10
# CHECK-NEXT: [[V43:%.+]] = extractelement <16 x i8> [[V11]], i32 10
# CHECK-NEXT: [[V44:%.+]] = insertelement <16 x i8> [[V41]], i8 [[V42]], i8 [[V43]]
# CHECK-NEXT: [[V45:%.+]] = extractelement <16 x i8> [[V2]], i32 11
# CHECK-NEXT: [[V46:%.+]] = extractelement <16 x i8> [[V11]], i32 11
# CHECK-NEXT: [[V47:%.+]] = insertelement <16 x i8> [[V44]], i8 [[V45]], i8 [[V46]]
# CHECK-NEXT: [[V48:%.+]] = extractelement <16 x i8> [[V2]], i32 12
# CHECK-NEXT: [[V49:%.+]] = extractelement <16 x i8> [[V11]], i32 12
# CHECK-NEXT: [[V50:%.+]] = insertelement <16 x i8> [[V47]], i8 [[V48]], i8 [[V49]]
# CHECK-NEXT: [[V51:%.+]] = extractelement <16 x i8> [[V2]], i32 13
# CHECK-NEXT: [[V52:%.+]] = extractelement <16 x i8> [[V11]], i32 13
# CHECK-NEXT: [[V53:%.+]] = insertelement <16 x i8> [[V50]], i8 [[V51]], i8 [[V52]]
# CHECK-NEXT: [[V54:%.+]] = extractelement <16 x i8> [[V2]], i32 14
# CHECK-NEXT: [[V55:%.+]] = extractelement <16 x i8> [[V11]], i32 14
# CHECK-NEXT: [[V56:%.+]] = insertelement <16 x i8> [[V53]], i8 [[V54]], i8 [[V55]]
# CHECK-NEXT: [[V57:%.+]] = extractelement <16 x i8> [[V2]], i32 15
# CHECK-NEXT: [[V58:%.+]] = extractelement <16 x i8> [[V11]], i32 15
# CHECK-NEXT: [[V59:%.+]] = insertelement <16 x i8> [[V56]], i8 [[V57]], i8 [[V58]]
# CHECK-NEXT: [[V60:%.+]] = bitcast <16 x i8> [[V59]] to i128
# CHECK-NEXT: call void @llvm.dc.setreg.i128(i128 [[V60]], metadata !"XMM8")
vpshufb	2(%r14,%r15,2), %xmm9, %xmm8

## VPSHUFBrr
# CHECK-LABEL: call void @llvm.dc.startinst
# CHECK-NEXT: [[RIP_0:%.+]] = call i64 @llvm.dc.getreg.i64(metadata !"RIP")
# CHECK-NEXT: [[V0:%.+]] = add i64 [[RIP_0]], 5
# CHECK-NEXT: call void @llvm.dc.setreg{{.*}} !"RIP")
# CHECK-NEXT: [[XMM9_0:%.+]] = call <4 x float> @llvm.dc.getreg.v4f32(metadata !"XMM9")
# CHECK-NEXT: [[V1:%.+]] = bitcast <4 x float> [[XMM9_0]] to i128
# CHECK-NEXT: [[V2:%.+]] = bitcast i128 [[V1]] to <16 x i8>
# CHECK-NEXT: [[XMM10_0:%.+]] = call <4 x float> @llvm.dc.getreg.v4f32(metadata !"XMM10")
# CHECK-NEXT: [[V3:%.+]] = bitcast <4 x float> [[XMM10_0]] to i128
# CHECK-NEXT: [[V4:%.+]] = bitcast i128 [[V3]] to <16 x i8>
# CHECK-NEXT: [[V5:%.+]] = icmp uge <16 x i8> [[V4]], <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>
# CHECK-NEXT: [[V6:%.+]] = select <16 x i1> [[V5]], <16 x i8> zeroinitializer, <16 x i8> [[V4]]
# CHECK-NEXT: [[V7:%.+]] = and <16 x i8> [[V6]], <i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15, i8 15>
# CHECK-NEXT: [[V8:%.+]] = extractelement <16 x i8> [[V2]], i32 0
# CHECK-NEXT: [[V9:%.+]] = extractelement <16 x i8> [[V7]], i32 0
# CHECK-NEXT: [[V10:%.+]] = insertelement <16 x i8> undef, i8 [[V8]], i8 [[V9]]
# CHECK-NEXT: [[V11:%.+]] = extractelement <16 x i8> [[V2]], i32 1
# CHECK-NEXT: [[V12:%.+]] = extractelement <16 x i8> [[V7]], i32 1
# CHECK-NEXT: [[V13:%.+]] = insertelement <16 x i8> [[V10]], i8 [[V11]], i8 [[V12]]
# CHECK-NEXT: [[V14:%.+]] = extractelement <16 x i8> [[V2]], i32 2
# CHECK-NEXT: [[V15:%.+]] = extractelement <16 x i8> [[V7]], i32 2
# CHECK-NEXT: [[V16:%.+]] = insertelement <16 x i8> [[V13]], i8 [[V14]], i8 [[V15]]
# CHECK-NEXT: [[V17:%.+]] = extractelement <16 x i8> [[V2]], i32 3
# CHECK-NEXT: [[V18:%.+]] = extractelement <16 x i8> [[V7]], i32 3
# CHECK-NEXT: [[V19:%.+]] = insertelement <16 x i8> [[V16]], i8 [[V17]], i8 [[V18]]
# CHECK-NEXT: [[V20:%.+]] = extractelement <16 x i8> [[V2]], i32 4
# CHECK-NEXT: [[V21:%.+]] = extractelement <16 x i8> [[V7]], i32 4
# CHECK-NEXT: [[V22:%.+]] = insertelement <16 x i8> [[V19]], i8 [[V20]], i8 [[V21]]
# CHECK-NEXT: [[V23:%.+]] = extractelement <16 x i8> [[V2]], i32 5
# CHECK-NEXT: [[V24:%.+]] = extractelement <16 x i8> [[V7]], i32 5
# CHECK-NEXT: [[V25:%.+]] = insertelement <16 x i8> [[V22]], i8 [[V23]], i8 [[V24]]
# CHECK-NEXT: [[V26:%.+]] = extractelement <16 x i8> [[V2]], i32 6
# CHECK-NEXT: [[V27:%.+]] = extractelement <16 x i8> [[V7]], i32 6
# CHECK-NEXT: [[V28:%.+]] = insertelement <16 x i8> [[V25]], i8 [[V26]], i8 [[V27]]
# CHECK-NEXT: [[V29:%.+]] = extractelement <16 x i8> [[V2]], i32 7
# CHECK-NEXT: [[V30:%.+]] = extractelement <16 x i8> [[V7]], i32 7
# CHECK-NEXT: [[V31:%.+]] = insertelement <16 x i8> [[V28]], i8 [[V29]], i8 [[V30]]
# CHECK-NEXT: [[V32:%.+]] = extractelement <16 x i8> [[V2]], i32 8
# CHECK-NEXT: [[V33:%.+]] = extractelement <16 x i8> [[V7]], i32 8
# CHECK-NEXT: [[V34:%.+]] = insertelement <16 x i8> [[V31]], i8 [[V32]], i8 [[V33]]
# CHECK-NEXT: [[V35:%.+]] = extractelement <16 x i8> [[V2]], i32 9
# CHECK-NEXT: [[V36:%.+]] = extractelement <16 x i8> [[V7]], i32 9
# CHECK-NEXT: [[V37:%.+]] = insertelement <16 x i8> [[V34]], i8 [[V35]], i8 [[V36]]
# CHECK-NEXT: [[V38:%.+]] = extractelement <16 x i8> [[V2]], i32 10
# CHECK-NEXT: [[V39:%.+]] = extractelement <16 x i8> [[V7]], i32 10
# CHECK-NEXT: [[V40:%.+]] = insertelement <16 x i8> [[V37]], i8 [[V38]], i8 [[V39]]
# CHECK-NEXT: [[V41:%.+]] = extractelement <16 x i8> [[V2]], i32 11
# CHECK-NEXT: [[V42:%.+]] = extractelement <16 x i8> [[V7]], i32 11
# CHECK-NEXT: [[V43:%.+]] = insertelement <16 x i8> [[V40]], i8 [[V41]], i8 [[V42]]
# CHECK-NEXT: [[V44:%.+]] = extractelement <16 x i8> [[V2]], i32 12
# CHECK-NEXT: [[V45:%.+]] = extractelement <16 x i8> [[V7]], i32 12
# CHECK-NEXT: [[V46:%.+]] = insertelement <16 x i8> [[V43]], i8 [[V44]], i8 [[V45]]
# CHECK-NEXT: [[V47:%.+]] = extractelement <16 x i8> [[V2]], i32 13
# CHECK-NEXT: [[V48:%.+]] = extractelement <16 x i8> [[V7]], i32 13
# CHECK-NEXT: [[V49:%.+]] = insertelement <16 x i8> [[V46]], i8 [[V47]], i8 [[V48]]
# CHECK-NEXT: [[V50:%.+]] = extractelement <16 x i8> [[V2]], i32 14
# CHECK-NEXT: [[V51:%.+]] = extractelement <16 x i8> [[V7]], i32 14
# CHECK-NEXT: [[V52:%.+]] = insertelement <16 x i8> [[V49]], i8 [[V50]], i8 [[V51]]
# CHECK-NEXT: [[V53:%.+]] = extractelement <16 x i8> [[V2]], i32 15
# CHECK-NEXT: [[V54:%.+]] = extractelement <16 x i8> [[V7]], i32 15
# CHECK-NEXT: [[V55:%.+]] = insertelement <16 x i8> [[V52]], i8 [[V53]], i8 [[V54]]
# CHECK-NEXT: [[V56:%.+]] = bitcast <16 x i8> [[V55]] to i128
# CHECK-NEXT: call void @llvm.dc.setreg.i128(i128 [[V56]], metadata !"XMM8")
vpshufb	%xmm10, %xmm9, %xmm8

retq
