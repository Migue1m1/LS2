{-# OPTIONS_GHC -w #-}
module ParserLs2 where
import LexLs2
import qualified Data.Map as M
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21
	| HappyAbsSyn22 t22
	| HappyAbsSyn23 t23
	| HappyAbsSyn24 t24
	| HappyAbsSyn25 t25
	| HappyAbsSyn26 t26
	| HappyAbsSyn27 t27
	| HappyAbsSyn28 t28
	| HappyAbsSyn29 t29
	| HappyAbsSyn30 t30
	| HappyAbsSyn31 t31
	| HappyAbsSyn32 t32

action_0 (33) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail

action_1 (33) = happyShift action_2
action_1 _ = happyFail

action_2 (37) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyFail

action_3 (76) = happyAccept
action_3 _ = happyFail

action_4 (34) = happyShift action_7
action_4 _ = happyFail

action_5 (37) = happyShift action_6
action_5 _ = happyReduce_3

action_6 _ = happyReduce_4

action_7 (42) = happyShift action_14
action_7 (43) = happyShift action_15
action_7 (7) = happyGoto action_8
action_7 (8) = happyGoto action_9
action_7 (9) = happyGoto action_10
action_7 (10) = happyGoto action_11
action_7 (11) = happyGoto action_12
action_7 (12) = happyGoto action_13
action_7 _ = happyFail

action_8 (37) = happyShift action_23
action_8 _ = happyFail

action_9 _ = happyReduce_5

action_10 (43) = happyShift action_15
action_10 (8) = happyGoto action_22
action_10 (9) = happyGoto action_10
action_10 _ = happyReduce_7

action_11 _ = happyReduce_6

action_12 (43) = happyShift action_21
action_12 (13) = happyGoto action_19
action_12 (14) = happyGoto action_20
action_12 _ = happyFail

action_13 (42) = happyShift action_14
action_13 (11) = happyGoto action_18
action_13 (12) = happyGoto action_13
action_13 _ = happyReduce_11

action_14 (44) = happyShift action_17
action_14 _ = happyFail

action_15 (45) = happyShift action_16
action_15 _ = happyFail

action_16 _ = happyReduce_9

action_17 (67) = happyShift action_27
action_17 _ = happyFail

action_18 _ = happyReduce_12

action_19 _ = happyReduce_10

action_20 (43) = happyShift action_21
action_20 (13) = happyGoto action_26
action_20 (14) = happyGoto action_20
action_20 _ = happyReduce_15

action_21 (45) = happyShift action_25
action_21 _ = happyFail

action_22 _ = happyReduce_8

action_23 (35) = happyShift action_24
action_23 _ = happyFail

action_24 (46) = happyShift action_32
action_24 (5) = happyGoto action_31
action_24 _ = happyFail

action_25 (63) = happyShift action_30
action_25 (15) = happyGoto action_29
action_25 _ = happyFail

action_26 _ = happyReduce_16

action_27 (53) = happyShift action_28
action_27 _ = happyFail

action_28 (49) = happyShift action_36
action_28 (69) = happyShift action_37
action_28 _ = happyFail

action_29 _ = happyReduce_17

action_30 (44) = happyShift action_35
action_30 _ = happyFail

action_31 (37) = happyShift action_34
action_31 _ = happyFail

action_32 (50) = happyShift action_33
action_32 _ = happyFail

action_33 (47) = happyShift action_51
action_33 _ = happyFail

action_34 (38) = happyShift action_50
action_34 (16) = happyGoto action_49
action_34 _ = happyFail

action_35 (64) = happyShift action_47
action_35 (65) = happyShift action_48
action_35 _ = happyFail

action_36 (50) = happyShift action_41
action_36 (51) = happyShift action_42
action_36 (52) = happyShift action_43
action_36 (31) = happyGoto action_46
action_36 _ = happyFail

action_37 (44) = happyShift action_40
action_37 (50) = happyShift action_41
action_37 (51) = happyShift action_42
action_37 (52) = happyShift action_43
action_37 (59) = happyShift action_44
action_37 (63) = happyShift action_45
action_37 (30) = happyGoto action_38
action_37 (31) = happyGoto action_39
action_37 _ = happyFail

action_38 (54) = happyShift action_60
action_38 (55) = happyShift action_61
action_38 (56) = happyShift action_62
action_38 (57) = happyShift action_63
action_38 (58) = happyShift action_64
action_38 _ = happyReduce_14

action_39 _ = happyReduce_68

action_40 _ = happyReduce_67

action_41 _ = happyReduce_69

action_42 _ = happyReduce_70

action_43 _ = happyReduce_71

action_44 (44) = happyShift action_40
action_44 (50) = happyShift action_41
action_44 (51) = happyShift action_42
action_44 (52) = happyShift action_43
action_44 (59) = happyShift action_44
action_44 (63) = happyShift action_45
action_44 (30) = happyGoto action_59
action_44 (31) = happyGoto action_39
action_44 _ = happyFail

action_45 (44) = happyShift action_40
action_45 (50) = happyShift action_41
action_45 (51) = happyShift action_42
action_45 (52) = happyShift action_43
action_45 (59) = happyShift action_44
action_45 (63) = happyShift action_45
action_45 (30) = happyGoto action_58
action_45 (31) = happyGoto action_39
action_45 _ = happyFail

action_46 _ = happyReduce_13

action_47 _ = happyReduce_19

action_48 (44) = happyShift action_57
action_48 _ = happyFail

action_49 (37) = happyShift action_56
action_49 _ = happyFail

action_50 (70) = happyShift action_54
action_50 (71) = happyShift action_55
action_50 (17) = happyGoto action_53
action_50 _ = happyFail

action_51 (50) = happyShift action_52
action_51 _ = happyFail

action_52 (48) = happyShift action_76
action_52 _ = happyFail

action_53 _ = happyReduce_20

action_54 (45) = happyShift action_75
action_54 _ = happyFail

action_55 (45) = happyShift action_74
action_55 _ = happyFail

action_56 (39) = happyShift action_73
action_56 (18) = happyGoto action_72
action_56 _ = happyFail

action_57 (64) = happyShift action_71
action_57 _ = happyFail

action_58 (54) = happyShift action_60
action_58 (55) = happyShift action_61
action_58 (56) = happyShift action_62
action_58 (57) = happyShift action_63
action_58 (58) = happyShift action_64
action_58 (64) = happyShift action_70
action_58 _ = happyFail

action_59 _ = happyReduce_65

action_60 (44) = happyShift action_40
action_60 (50) = happyShift action_41
action_60 (51) = happyShift action_42
action_60 (52) = happyShift action_43
action_60 (59) = happyShift action_44
action_60 (63) = happyShift action_45
action_60 (30) = happyGoto action_69
action_60 (31) = happyGoto action_39
action_60 _ = happyFail

action_61 (44) = happyShift action_40
action_61 (50) = happyShift action_41
action_61 (51) = happyShift action_42
action_61 (52) = happyShift action_43
action_61 (59) = happyShift action_44
action_61 (63) = happyShift action_45
action_61 (30) = happyGoto action_68
action_61 (31) = happyGoto action_39
action_61 _ = happyFail

action_62 (44) = happyShift action_40
action_62 (50) = happyShift action_41
action_62 (51) = happyShift action_42
action_62 (52) = happyShift action_43
action_62 (59) = happyShift action_44
action_62 (63) = happyShift action_45
action_62 (30) = happyGoto action_67
action_62 (31) = happyGoto action_39
action_62 _ = happyFail

action_63 (44) = happyShift action_40
action_63 (50) = happyShift action_41
action_63 (51) = happyShift action_42
action_63 (52) = happyShift action_43
action_63 (59) = happyShift action_44
action_63 (63) = happyShift action_45
action_63 (30) = happyGoto action_66
action_63 (31) = happyGoto action_39
action_63 _ = happyFail

action_64 (44) = happyShift action_40
action_64 (50) = happyShift action_41
action_64 (51) = happyShift action_42
action_64 (52) = happyShift action_43
action_64 (59) = happyShift action_44
action_64 (63) = happyShift action_45
action_64 (30) = happyGoto action_65
action_64 (31) = happyGoto action_39
action_64 _ = happyFail

action_65 _ = happyReduce_64

action_66 _ = happyReduce_63

action_67 _ = happyReduce_62

action_68 (56) = happyShift action_62
action_68 (57) = happyShift action_63
action_68 (58) = happyShift action_64
action_68 _ = happyReduce_61

action_69 (56) = happyShift action_62
action_69 (57) = happyShift action_63
action_69 (58) = happyShift action_64
action_69 _ = happyReduce_60

action_70 _ = happyReduce_66

action_71 _ = happyReduce_18

action_72 (37) = happyShift action_84
action_72 _ = happyFail

action_73 (45) = happyShift action_83
action_73 (19) = happyGoto action_82
action_73 _ = happyFail

action_74 (63) = happyShift action_80
action_74 (68) = happyShift action_81
action_74 _ = happyReduce_24

action_75 (63) = happyShift action_78
action_75 (68) = happyShift action_79
action_75 _ = happyReduce_23

action_76 (63) = happyShift action_77
action_76 _ = happyFail

action_77 (51) = happyShift action_100
action_77 _ = happyFail

action_78 (44) = happyShift action_40
action_78 (50) = happyShift action_41
action_78 (51) = happyShift action_42
action_78 (52) = happyShift action_43
action_78 (59) = happyShift action_44
action_78 (63) = happyShift action_45
action_78 (27) = happyGoto action_99
action_78 (30) = happyGoto action_97
action_78 (31) = happyGoto action_39
action_78 _ = happyFail

action_79 (70) = happyShift action_91
action_79 (71) = happyShift action_92
action_79 (72) = happyShift action_93
action_79 (73) = happyShift action_94
action_79 (74) = happyShift action_95
action_79 (29) = happyGoto action_98
action_79 _ = happyFail

action_80 (44) = happyShift action_40
action_80 (50) = happyShift action_41
action_80 (51) = happyShift action_42
action_80 (52) = happyShift action_43
action_80 (59) = happyShift action_44
action_80 (63) = happyShift action_45
action_80 (27) = happyGoto action_96
action_80 (30) = happyGoto action_97
action_80 (31) = happyGoto action_39
action_80 _ = happyFail

action_81 (70) = happyShift action_91
action_81 (71) = happyShift action_92
action_81 (72) = happyShift action_93
action_81 (73) = happyShift action_94
action_81 (74) = happyShift action_95
action_81 (29) = happyGoto action_90
action_81 _ = happyFail

action_82 _ = happyReduce_29

action_83 (63) = happyShift action_88
action_83 (66) = happyShift action_89
action_83 (20) = happyGoto action_86
action_83 (25) = happyGoto action_87
action_83 _ = happyFail

action_84 (36) = happyShift action_85
action_84 _ = happyFail

action_85 _ = happyReduce_1

action_86 _ = happyReduce_30

action_87 (66) = happyShift action_115
action_87 _ = happyFail

action_88 (44) = happyShift action_114
action_88 (26) = happyGoto action_113
action_88 _ = happyFail

action_89 (40) = happyShift action_112
action_89 (70) = happyShift action_91
action_89 (71) = happyShift action_92
action_89 (72) = happyShift action_93
action_89 (73) = happyShift action_94
action_89 (74) = happyShift action_95
action_89 (21) = happyGoto action_110
action_89 (29) = happyGoto action_111
action_89 _ = happyFail

action_90 _ = happyReduce_28

action_91 (45) = happyShift action_109
action_91 _ = happyFail

action_92 (45) = happyShift action_108
action_92 _ = happyFail

action_93 (68) = happyShift action_107
action_93 _ = happyFail

action_94 (68) = happyShift action_106
action_94 _ = happyFail

action_95 (70) = happyShift action_91
action_95 (71) = happyShift action_92
action_95 (72) = happyShift action_93
action_95 (73) = happyShift action_94
action_95 (74) = happyShift action_95
action_95 (29) = happyGoto action_105
action_95 _ = happyFail

action_96 (64) = happyShift action_104
action_96 _ = happyFail

action_97 (54) = happyShift action_60
action_97 (55) = happyShift action_61
action_97 (56) = happyShift action_62
action_97 (57) = happyShift action_63
action_97 (58) = happyShift action_64
action_97 (65) = happyShift action_103
action_97 _ = happyReduce_45

action_98 _ = happyReduce_27

action_99 (64) = happyShift action_102
action_99 _ = happyFail

action_100 (65) = happyShift action_101
action_100 _ = happyFail

action_101 (51) = happyShift action_135
action_101 _ = happyFail

action_102 (68) = happyShift action_134
action_102 _ = happyReduce_21

action_103 (44) = happyShift action_40
action_103 (50) = happyShift action_41
action_103 (51) = happyShift action_42
action_103 (52) = happyShift action_43
action_103 (59) = happyShift action_44
action_103 (63) = happyShift action_45
action_103 (30) = happyGoto action_133
action_103 (31) = happyGoto action_39
action_103 _ = happyFail

action_104 (68) = happyShift action_132
action_104 _ = happyReduce_22

action_105 (75) = happyShift action_131
action_105 _ = happyFail

action_106 (70) = happyShift action_91
action_106 (71) = happyShift action_92
action_106 (72) = happyShift action_93
action_106 (73) = happyShift action_94
action_106 (74) = happyShift action_95
action_106 (29) = happyGoto action_130
action_106 _ = happyFail

action_107 (70) = happyShift action_91
action_107 (71) = happyShift action_92
action_107 (72) = happyShift action_93
action_107 (73) = happyShift action_94
action_107 (74) = happyShift action_95
action_107 (29) = happyGoto action_129
action_107 _ = happyFail

action_108 (68) = happyShift action_128
action_108 _ = happyReduce_56

action_109 (68) = happyShift action_127
action_109 _ = happyReduce_55

action_110 _ = happyReduce_31

action_111 (45) = happyShift action_126
action_111 (22) = happyGoto action_125
action_111 _ = happyReduce_35

action_112 (51) = happyShift action_124
action_112 _ = happyFail

action_113 (64) = happyShift action_123
action_113 _ = happyFail

action_114 (65) = happyShift action_122
action_114 _ = happyReduce_43

action_115 (70) = happyShift action_117
action_115 (71) = happyShift action_118
action_115 (72) = happyShift action_119
action_115 (73) = happyShift action_120
action_115 (74) = happyShift action_121
action_115 (28) = happyGoto action_116
action_115 _ = happyFail

action_116 (45) = happyShift action_152
action_116 (23) = happyGoto action_151
action_116 _ = happyReduce_37

action_117 (45) = happyShift action_150
action_117 _ = happyFail

action_118 (45) = happyShift action_149
action_118 _ = happyFail

action_119 (68) = happyShift action_148
action_119 _ = happyFail

action_120 (68) = happyShift action_147
action_120 _ = happyFail

action_121 (70) = happyShift action_117
action_121 (71) = happyShift action_118
action_121 (72) = happyShift action_119
action_121 (73) = happyShift action_120
action_121 (74) = happyShift action_121
action_121 (28) = happyGoto action_146
action_121 _ = happyFail

action_122 (44) = happyShift action_145
action_122 _ = happyFail

action_123 (67) = happyShift action_144
action_123 _ = happyFail

action_124 (70) = happyShift action_91
action_124 (71) = happyShift action_92
action_124 (72) = happyShift action_93
action_124 (73) = happyShift action_94
action_124 (74) = happyShift action_95
action_124 (29) = happyGoto action_143
action_124 _ = happyFail

action_125 _ = happyReduce_34

action_126 (66) = happyShift action_142
action_126 _ = happyFail

action_127 (70) = happyShift action_91
action_127 (71) = happyShift action_92
action_127 (72) = happyShift action_93
action_127 (73) = happyShift action_94
action_127 (74) = happyShift action_95
action_127 (29) = happyGoto action_141
action_127 _ = happyFail

action_128 (70) = happyShift action_91
action_128 (71) = happyShift action_92
action_128 (72) = happyShift action_93
action_128 (73) = happyShift action_94
action_128 (74) = happyShift action_95
action_128 (29) = happyGoto action_140
action_128 _ = happyFail

action_129 _ = happyReduce_57

action_130 _ = happyReduce_58

action_131 (68) = happyShift action_139
action_131 _ = happyFail

action_132 (70) = happyShift action_117
action_132 (71) = happyShift action_118
action_132 (72) = happyShift action_119
action_132 (73) = happyShift action_120
action_132 (74) = happyShift action_121
action_132 (28) = happyGoto action_138
action_132 _ = happyFail

action_133 (54) = happyShift action_60
action_133 (55) = happyShift action_61
action_133 (56) = happyShift action_62
action_133 (57) = happyShift action_63
action_133 (58) = happyShift action_64
action_133 _ = happyReduce_44

action_134 (70) = happyShift action_117
action_134 (71) = happyShift action_118
action_134 (72) = happyShift action_119
action_134 (73) = happyShift action_120
action_134 (74) = happyShift action_121
action_134 (28) = happyGoto action_137
action_134 _ = happyFail

action_135 (64) = happyShift action_136
action_135 _ = happyFail

action_136 (50) = happyShift action_165
action_136 _ = happyFail

action_137 _ = happyReduce_25

action_138 _ = happyReduce_26

action_139 (70) = happyShift action_91
action_139 (71) = happyShift action_92
action_139 (72) = happyShift action_93
action_139 (73) = happyShift action_94
action_139 (74) = happyShift action_95
action_139 (29) = happyGoto action_164
action_139 _ = happyFail

action_140 _ = happyReduce_54

action_141 _ = happyReduce_53

action_142 (70) = happyShift action_91
action_142 (71) = happyShift action_92
action_142 (72) = happyShift action_93
action_142 (73) = happyShift action_94
action_142 (74) = happyShift action_95
action_142 (29) = happyGoto action_163
action_142 _ = happyFail

action_143 (45) = happyShift action_162
action_143 (24) = happyGoto action_161
action_143 _ = happyReduce_39

action_144 (44) = happyShift action_40
action_144 (50) = happyShift action_41
action_144 (51) = happyShift action_42
action_144 (52) = happyShift action_43
action_144 (59) = happyShift action_44
action_144 (63) = happyShift action_45
action_144 (30) = happyGoto action_159
action_144 (31) = happyGoto action_39
action_144 (32) = happyGoto action_160
action_144 _ = happyFail

action_145 _ = happyReduce_42

action_146 (75) = happyShift action_158
action_146 _ = happyFail

action_147 (70) = happyShift action_117
action_147 (71) = happyShift action_118
action_147 (72) = happyShift action_119
action_147 (73) = happyShift action_120
action_147 (74) = happyShift action_121
action_147 (28) = happyGoto action_157
action_147 _ = happyFail

action_148 (70) = happyShift action_117
action_148 (71) = happyShift action_118
action_148 (72) = happyShift action_119
action_148 (73) = happyShift action_120
action_148 (74) = happyShift action_121
action_148 (28) = happyGoto action_156
action_148 _ = happyFail

action_149 (63) = happyShift action_155
action_149 _ = happyFail

action_150 (63) = happyShift action_154
action_150 _ = happyFail

action_151 _ = happyReduce_32

action_152 (63) = happyShift action_88
action_152 (25) = happyGoto action_153
action_152 _ = happyFail

action_153 (66) = happyShift action_172
action_153 _ = happyFail

action_154 (44) = happyShift action_40
action_154 (50) = happyShift action_41
action_154 (51) = happyShift action_42
action_154 (52) = happyShift action_43
action_154 (59) = happyShift action_44
action_154 (63) = happyShift action_45
action_154 (27) = happyGoto action_171
action_154 (30) = happyGoto action_97
action_154 (31) = happyGoto action_39
action_154 _ = happyFail

action_155 (44) = happyShift action_40
action_155 (50) = happyShift action_41
action_155 (51) = happyShift action_42
action_155 (52) = happyShift action_43
action_155 (59) = happyShift action_44
action_155 (63) = happyShift action_45
action_155 (27) = happyGoto action_170
action_155 (30) = happyGoto action_97
action_155 (31) = happyGoto action_39
action_155 _ = happyFail

action_156 _ = happyReduce_50

action_157 _ = happyReduce_51

action_158 (68) = happyShift action_169
action_158 _ = happyFail

action_159 (54) = happyShift action_60
action_159 (55) = happyShift action_61
action_159 (56) = happyShift action_62
action_159 (57) = happyShift action_63
action_159 (58) = happyShift action_64
action_159 (60) = happyShift action_168
action_159 _ = happyFail

action_160 _ = happyReduce_41

action_161 _ = happyReduce_33

action_162 (66) = happyShift action_167
action_162 _ = happyFail

action_163 (45) = happyShift action_126
action_163 (22) = happyGoto action_166
action_163 _ = happyReduce_35

action_164 _ = happyReduce_59

action_165 _ = happyReduce_2

action_166 _ = happyReduce_36

action_167 (40) = happyShift action_178
action_167 _ = happyFail

action_168 (44) = happyShift action_40
action_168 (50) = happyShift action_41
action_168 (51) = happyShift action_42
action_168 (52) = happyShift action_43
action_168 (59) = happyShift action_44
action_168 (63) = happyShift action_45
action_168 (30) = happyGoto action_177
action_168 (31) = happyGoto action_39
action_168 _ = happyFail

action_169 (70) = happyShift action_117
action_169 (71) = happyShift action_118
action_169 (72) = happyShift action_119
action_169 (73) = happyShift action_120
action_169 (74) = happyShift action_121
action_169 (28) = happyGoto action_176
action_169 _ = happyFail

action_170 (64) = happyShift action_175
action_170 _ = happyFail

action_171 (64) = happyShift action_174
action_171 _ = happyFail

action_172 (70) = happyShift action_117
action_172 (71) = happyShift action_118
action_172 (72) = happyShift action_119
action_172 (73) = happyShift action_120
action_172 (74) = happyShift action_121
action_172 (28) = happyGoto action_173
action_172 _ = happyFail

action_173 (45) = happyShift action_152
action_173 (23) = happyGoto action_182
action_173 _ = happyReduce_37

action_174 (68) = happyShift action_181
action_174 _ = happyReduce_48

action_175 (68) = happyShift action_180
action_175 _ = happyReduce_49

action_176 _ = happyReduce_52

action_177 (54) = happyShift action_60
action_177 (55) = happyShift action_61
action_177 (56) = happyShift action_62
action_177 (57) = happyShift action_63
action_177 (58) = happyShift action_64
action_177 _ = happyReduce_72

action_178 (51) = happyShift action_179
action_178 _ = happyFail

action_179 (70) = happyShift action_91
action_179 (71) = happyShift action_92
action_179 (72) = happyShift action_93
action_179 (73) = happyShift action_94
action_179 (74) = happyShift action_95
action_179 (29) = happyGoto action_185
action_179 _ = happyFail

action_180 (70) = happyShift action_117
action_180 (71) = happyShift action_118
action_180 (72) = happyShift action_119
action_180 (73) = happyShift action_120
action_180 (74) = happyShift action_121
action_180 (28) = happyGoto action_184
action_180 _ = happyFail

action_181 (70) = happyShift action_117
action_181 (71) = happyShift action_118
action_181 (72) = happyShift action_119
action_181 (73) = happyShift action_120
action_181 (74) = happyShift action_121
action_181 (28) = happyGoto action_183
action_181 _ = happyFail

action_182 _ = happyReduce_38

action_183 _ = happyReduce_46

action_184 _ = happyReduce_47

action_185 (45) = happyShift action_162
action_185 (24) = happyGoto action_186
action_185 _ = happyReduce_39

action_186 _ = happyReduce_40

happyReduce_1 = happyReduce 13 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_11) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenTit happy_var_1 _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Dat { title = happy_var_1,  gram = happy_var_4, cond = happy_var_7, mat = happy_var_9, gen = happy_var_11}
	) `HappyStk` happyRest

happyReduce_2 = happyReduce 11 5 happyReduction_2
happyReduction_2 ((HappyTerminal (TokenEnt happy_var_11 _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenReal happy_var_9 _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenReal happy_var_7 _)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenEnt happy_var_4 _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenEnt happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (if happy_var_2 < 0  then error "Error Semantico: Numero de pasos negativos."
                else if happy_var_4 < 0 || happy_var_4 > 90 then error "Error Semantico: Angulo fuera de rango [0 < x < 90]."
                else if happy_var_11 < 0 || happy_var_11 > 180 then error "Error Semantico: Angulo de posicion fuera de rango [0 < x < 180]" 
                else (happy_var_2, degToRad(intToFloat happy_var_4), ((happy_var_7, happy_var_9), degToRad (intToFloat happy_var_11)))
	) `HappyStk` happyRest

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 _
	 =  HappyAbsSyn6
		 ([]
	)

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 _
	_
	 =  HappyAbsSyn6
		 ([]
	)

happyReduce_5 = happySpecReduce_1  7 happyReduction_5
happyReduction_5 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (([], happy_var_1)
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  8 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  8 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 : happy_var_2
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_2  9 happyReduction_9
happyReduction_9 (HappyTerminal (TokenIdSym happy_var_2 _))
	_
	 =  HappyAbsSyn9
		 (Sim happy_var_2
	)
happyReduction_9 _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  10 happyReduction_10
happyReduction_10 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 ((happy_var_1, happy_var_2)
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  11 happyReduction_11
happyReduction_11 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_2  11 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1 : happy_var_2
	)
happyReduction_12 _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 6 12 happyReduction_13
happyReduction_13 ((HappyAbsSyn31  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenType happy_var_4 _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdPar happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (if valdTypes happy_var_4 happy_var_6 then P1 happy_var_2 (extrType happy_var_4) happy_var_6 else error "Error Semantico: Tipos incompatibles."
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 6 12 happyReduction_14
happyReduction_14 ((HappyAbsSyn30  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenType happy_var_4 _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdPar happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (P2 happy_var_2 (extrType happy_var_4) happy_var_6
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  13 happyReduction_15
happyReduction_15 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  13 happyReduction_16
happyReduction_16 (HappyAbsSyn13  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 : happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  14 happyReduction_17
happyReduction_17 (HappyAbsSyn15  happy_var_3)
	(HappyTerminal (TokenIdSym happy_var_2 _))
	_
	 =  HappyAbsSyn14
		 (Def happy_var_2 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 5 15 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyTerminal (TokenIdPar happy_var_4 _)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdPar happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 ([happy_var_2, happy_var_4]
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  15 happyReduction_19
happyReduction_19 _
	(HappyTerminal (TokenIdPar happy_var_2 _))
	_
	 =  HappyAbsSyn15
		 ([happy_var_2]
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  16 happyReduction_20
happyReduction_20 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happyReduce 5 17 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Tr Num (Inv happy_var_2 happy_var_4)
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 5 17 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Tr Arr (Inv happy_var_2 happy_var_4)
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  17 happyReduction_23
happyReduction_23 (HappyTerminal (TokenIdSym happy_var_2 _))
	_
	 =  HappyAbsSyn17
		 (Tr Num (Sim happy_var_2)
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  17 happyReduction_24
happyReduction_24 (HappyTerminal (TokenIdSym happy_var_2 _))
	_
	 =  HappyAbsSyn17
		 (Tr Arr (Sim happy_var_2)
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 7 17 happyReduction_25
happyReduction_25 ((HappyAbsSyn28  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Tr Num (Inv happy_var_2 happy_var_4) :--: happy_var_7
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 7 17 happyReduction_26
happyReduction_26 ((HappyAbsSyn28  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Tr Arr (Inv happy_var_2 happy_var_4) :--: happy_var_7
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 4 17 happyReduction_27
happyReduction_27 ((HappyAbsSyn29  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Tr Num (Sim happy_var_2) :--: happy_var_4
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 4 17 happyReduction_28
happyReduction_28 ((HappyAbsSyn29  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Tr Arr (Sim happy_var_2) :--: happy_var_4
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_2  18 happyReduction_29
happyReduction_29 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn18
		 (happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  19 happyReduction_30
happyReduction_30 (HappyAbsSyn20  happy_var_2)
	(HappyTerminal (TokenIdSym happy_var_1 _))
	 =  HappyAbsSyn19
		 (putSimb happy_var_2 happy_var_1
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  20 happyReduction_31
happyReduction_31 (HappyAbsSyn21  happy_var_2)
	_
	 =  HappyAbsSyn20
		 (happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 4 20 happyReduction_32
happyReduction_32 ((HappyAbsSyn23  happy_var_4) `HappyStk`
	(HappyAbsSyn28  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn20
		 ((Def "" (fst happy_var_1), G1 (snd happy_var_1), happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 4 21 happyReduction_33
happyReduction_33 ((HappyAbsSyn24  happy_var_4) `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	(HappyTerminal (TokenReal happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn21
		 ((Sim "", G2 happy_var_2, happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_2  21 happyReduction_34
happyReduction_34 (HappyAbsSyn22  happy_var_2)
	(HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn21
		 ((Sim "", G1 (V True),  happy_var_1) : happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_0  22 happyReduction_35
happyReduction_35  =  HappyAbsSyn22
		 ([]
	)

happyReduce_36 = happyReduce 4 22 happyReduction_36
happyReduction_36 ((HappyAbsSyn22  happy_var_4) `HappyStk`
	(HappyAbsSyn29  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_1 _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn22
		 ((Sim happy_var_1, G1 (V True), happy_var_3) : happy_var_4
	) `HappyStk` happyRest

happyReduce_37 = happySpecReduce_0  23 happyReduction_37
happyReduction_37  =  HappyAbsSyn23
		 ([]
	)

happyReduce_38 = happyReduce 5 23 happyReduction_38
happyReduction_38 ((HappyAbsSyn23  happy_var_5) `HappyStk`
	(HappyAbsSyn28  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_1 _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn23
		 (((Def happy_var_1 (fst happy_var_2)), G1 (snd happy_var_2), happy_var_4) : happy_var_5
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_0  24 happyReduction_39
happyReduction_39  =  HappyAbsSyn24
		 ([]
	)

happyReduce_40 = happyReduce 6 24 happyReduction_40
happyReduction_40 ((HappyAbsSyn24  happy_var_6) `HappyStk`
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	(HappyTerminal (TokenReal happy_var_4 _)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_1 _)) `HappyStk`
	happyRest)
	 = HappyAbsSyn24
		 ((Sim happy_var_1, G2 happy_var_4, happy_var_5) : happy_var_6
	) `HappyStk` happyRest

happyReduce_41 = happyReduce 5 25 happyReduction_41
happyReduction_41 ((HappyAbsSyn32  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn25
		 ((happy_var_2, happy_var_5)
	) `HappyStk` happyRest

happyReduce_42 = happySpecReduce_3  26 happyReduction_42
happyReduction_42 (HappyTerminal (TokenIdPar happy_var_3 _))
	_
	(HappyTerminal (TokenIdPar happy_var_1 _))
	 =  HappyAbsSyn26
		 ([happy_var_1 , happy_var_3]
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  26 happyReduction_43
happyReduction_43 (HappyTerminal (TokenIdPar happy_var_1 _))
	 =  HappyAbsSyn26
		 ([happy_var_1]
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  27 happyReduction_44
happyReduction_44 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn27
		 ([happy_var_1, happy_var_3]
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  27 happyReduction_45
happyReduction_45 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn27
		 ([happy_var_1]
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happyReduce 7 28 happyReduction_46
happyReduction_46 ((HappyAbsSyn28  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (Tr Num (Inv happy_var_2 happy_var_4) :--: happy_var_7
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 7 28 happyReduction_47
happyReduction_47 ((HappyAbsSyn28  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (Tr Arr (Inv happy_var_2 happy_var_4) :--: happy_var_7
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 5 28 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (Tr Num (Inv happy_var_2 happy_var_4)
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 5 28 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (Tr Arr (Inv happy_var_2 happy_var_4)
	) `HappyStk` happyRest

happyReduce_50 = happySpecReduce_3  28 happyReduction_50
happyReduction_50 (HappyAbsSyn28  happy_var_3)
	_
	_
	 =  HappyAbsSyn28
		 (Gr Der :--: happy_var_3
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  28 happyReduction_51
happyReduction_51 (HappyAbsSyn28  happy_var_3)
	_
	_
	 =  HappyAbsSyn28
		 (Gr Izq :--: happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happyReduce 5 28 happyReduction_52
happyReduction_52 ((HappyAbsSyn28  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (Rm happy_var_2 :--: happy_var_5
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 4 29 happyReduction_53
happyReduction_53 ((HappyAbsSyn29  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (Tr Num (Sim happy_var_2) :--: happy_var_4
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 4 29 happyReduction_54
happyReduction_54 ((HappyAbsSyn29  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdSym happy_var_2 _)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (Tr Arr (Sim happy_var_2) :--: happy_var_4
	) `HappyStk` happyRest

happyReduce_55 = happySpecReduce_2  29 happyReduction_55
happyReduction_55 (HappyTerminal (TokenIdSym happy_var_2 _))
	_
	 =  HappyAbsSyn29
		 (Tr Num (Sim happy_var_2)
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  29 happyReduction_56
happyReduction_56 (HappyTerminal (TokenIdSym happy_var_2 _))
	_
	 =  HappyAbsSyn29
		 (Tr Arr (Sim happy_var_2)
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  29 happyReduction_57
happyReduction_57 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn29
		 (Gr Der :--: happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  29 happyReduction_58
happyReduction_58 (HappyAbsSyn29  happy_var_3)
	_
	_
	 =  HappyAbsSyn29
		 (Gr Izq :--: happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happyReduce 5 29 happyReduction_59
happyReduction_59 ((HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (Rm happy_var_2 :--: happy_var_5
	) `HappyStk` happyRest

happyReduce_60 = happySpecReduce_3  30 happyReduction_60
happyReduction_60 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (Term Mas happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  30 happyReduction_61
happyReduction_61 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (Term Rest happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  30 happyReduction_62
happyReduction_62 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (Fact Por happy_var_1 happy_var_3
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  30 happyReduction_63
happyReduction_63 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (Fact Div happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_3  30 happyReduction_64
happyReduction_64 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (E happy_var_1 happy_var_3
	)
happyReduction_64 _ _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  30 happyReduction_65
happyReduction_65 (HappyAbsSyn30  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (Neg happy_var_2
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  30 happyReduction_66
happyReduction_66 _
	(HappyAbsSyn30  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (SubExp happy_var_2
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_1  30 happyReduction_67
happyReduction_67 (HappyTerminal (TokenIdPar happy_var_1 _))
	 =  HappyAbsSyn30
		 (Var happy_var_1
	)
happyReduction_67 _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  30 happyReduction_68
happyReduction_68 (HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn30
		 (Numer happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  31 happyReduction_69
happyReduction_69 (HappyTerminal (TokenEnt happy_var_1 _))
	 =  HappyAbsSyn31
		 (L happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  31 happyReduction_70
happyReduction_70 (HappyTerminal (TokenReal happy_var_1 _))
	 =  HappyAbsSyn31
		 (R happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  31 happyReduction_71
happyReduction_71 (HappyTerminal (TokenBoole happy_var_1 _))
	 =  HappyAbsSyn31
		 (B happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  32 happyReduction_72
happyReduction_72 (HappyAbsSyn30  happy_var_3)
	(HappyTerminal (TokenOrder happy_var_2 _))
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn32
		 (Cond (extrOrdn happy_var_2) happy_var_1 happy_var_3
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 76 76 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenTit happy_dollar_dollar _ -> cont 33;
	TokenGram _ -> cont 34;
	TokenConds _ -> cont 35;
	TokenFin _ -> cont 36;
	TokenLin _ -> cont 37;
	TokenMatriz _ -> cont 38;
	TokenGentrz _ -> cont 39;
	TokenProbld _ -> cont 40;
	TokenDerivs _ -> cont 41;
	TokenPar _ -> cont 42;
	TokenSym _ -> cont 43;
	TokenIdPar happy_dollar_dollar _ -> cont 44;
	TokenIdSym happy_dollar_dollar _ -> cont 45;
	TokenPasos _ -> cont 46;
	TokenAng _ -> cont 47;
	TokenPos _ -> cont 48;
	TokenVal _ -> cont 49;
	TokenEnt happy_dollar_dollar _ -> cont 50;
	TokenReal happy_dollar_dollar _ -> cont 51;
	TokenBoole happy_dollar_dollar _ -> cont 52;
	TokenType happy_dollar_dollar _ -> cont 53;
	TokenPlus _ -> cont 54;
	TokenMinus _ -> cont 55;
	TokenMult _ -> cont 56;
	TokenDivs _ -> cont 57;
	TokenPot _ -> cont 58;
	TokenUnOp happy_dollar_dollar _ -> cont 59;
	TokenOrder happy_dollar_dollar _ -> cont 60;
	TokenLogic happy_dollar_dollar _ -> cont 61;
	LexicalErr _ -> cont 62;
	TokenLP _ -> cont 63;
	TokenRP _ -> cont 64;
	TokenCOMMA _ -> cont 65;
	TokenSubs _ -> cont 66;
	TokenSepAs _ -> cont 67;
	TokenMovSep _ -> cont 68;
	TokenAssign _ -> cont 69;
	TokenMovNum _ -> cont 70;
	TokenMovArr _ -> cont 71;
	TokenMovIzq _ -> cont 72;
	TokenMovDer _ -> cont 73;
	TokenRmPush _ -> cont 74;
	TokenRmPop _ -> cont 75;
	_ -> happyError' (tk:tks)
	}

happyError_ 76 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => P a -> (a -> P b) -> P b
happyThen = (thenP)
happyReturn :: () => a -> P a
happyReturn = (returnP)
happyThen1 m k tks = (thenP) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> P a
happyReturn1 = \a tks -> (returnP) a
happyError' :: () => [(Token)] -> P a
happyError' = happyError

parserLs2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


{- Manejo de errores -}
dataToken :: Token -> String
dataToken = str

dataTokens :: [Token] -> String
dataTokens (x:xs) = show (dataToken x)
dataTokens [] = "el final del archivo"
happyError = \tks i -> ParseFail ("Error de sintaxis por " ++ (dataTokens tks))

data ParseResult a
                  = ParseOk a
                  | ParseFail String
type P a = Int -> ParseResult a

thenP :: P a -> (a -> P b) -> P b
m `thenP` k = \l -> 
                   case m l of
                        ParseFail s -> ParseFail s
                        ParseOk a -> k a l

returnP :: a -> P a
returnP a = \l -> ParseOk a

{- Tipos de dato -}

--Tipo de dato del programa, usado por el analizador semántico
data Datos =  Dat {
                    title :: String,
                    gram  :: ([Par], [Simb]),
                    cond  :: (Int, Float, ((Float, Float), Float)),
                    mat   :: Movs,
                    gen   :: Gen
                  } 
             deriving Show
-- Tipo sinónimo de las generatrices
type Gen = [(Simb, Guard, Movs)]
-- Tipo expresion aritmetica
data Exp = Term Oper Exp Exp       -- Términos en suma o resta
         | Fact Oper Exp Exp       -- Factores en producto o división
         | E Exp Exp              -- Exponenciación base exponente
         | SubExp Exp              -- Subexpresión en paréntesis
         | Neg Exp                 -- Expresión en signo negativo 
         | Numer Valor             -- Número (entero o real)
         | Var String              -- Variable
         deriving (Show, Eq)
-- Tipo de operadores aritméticos (más, menos, por, entre)
data Oper = Mas | Rest | Por | Div deriving (Show, Eq)

-- Tipo de los tipos de parámetros
data Tipo  = Ent | Real | Boole deriving Show        -- Entero o real

-- Tipos de valor numérico                   -- Int o Float
data Valor = L Int | R Float | B Bool deriving (Show, Eq) 

-- Tipo de expresiones lógicas
data Log = No Log                  -- Negación
         | Bin Conect Log Log      -- Opreador lógico binario (conector)
         | SubLog Log              -- Subexpresión en paréntesis
         | Cond Ordn Exp Exp       -- Expresión condicional de orden
         | V Bool                  -- Valores booleanos
         deriving (Show, Eq)

-- Tipo de conectores lógicos
data Conect = O              -- disyunción
            | Y              -- conjunción
            | Imp            -- implicación
            | Sii            -- Equivalencia
        deriving (Eq,Show)

-- Tipo de relaciones de orden (LE,GE,LT,GT,EQ,NEQ)
data Ordn = Meni | Mayi | Men | May | Igl | Dif deriving (Show, Eq)

-- Tipo de guarda para generatrices
data Guard = G1 Log                -- Guarda lógica
           | G2 Float              -- Guarda probabilística
           deriving Show

data Par = P1 String Tipo Valor      -- Nombre tipo valor
         | P2 String Tipo Exp        -- Nombre tipo expresión
         deriving Show

data Movs = Tr Op Simb         -- Movimiento de avance de segmento
          | Gr Dir               -- Movimiento de giro
          | Rm Movs              -- Rama de movimientos
          | Movs :--: Movs       -- Secuencia de movimientos
          deriving Show
data Simb = Sim String               -- Simple y probabilistico
          | Def String [String]      -- Definición con parámetros formales
          | Inv String [Exp]         -- Invocación con parámetros reales
          deriving (Show, Eq)
-- Tipo de operadores
data Op = Num | Arr deriving Show    -- Numeral | Arroba

-- Tipo de dirección de giro
data Dir = Der                   -- Giro derecha con valor global
         | Izq                   -- Giro izquierda con valor global
         | D Exp                 -- Giro derecha con parámetros
         | I Exp                 -- Giro derecha con parámetros
         deriving Show 

-- Tipo de ángulos en grados
type Deg    = Float

-- Tipo de ángulos en radianes
type Rad    = Float

-- Función que inserta un símbolo
-- Es usada por la gramática de las generatrices, debido a que
-- al no poder usarse gramática de atributos, 
-- no hay forma de heredar el primer simbolo reconocido. Ej: la "F" de F -> #...
-- Además, evalua si la suma de las probabilidades de una generatriz es igual a 1.0
putSimb :: [(Simb, Guard, Movs)] -> String -> [(Simb, Guard, Movs)]
putSimb ((Sim _, (G1 v), b):cs) s = ((Sim s, (G1 v), b):cs)
putSimb css@((Sim _, (G2 v), b):cs) s = case checkProbs css of
                                    1.0 -> ((Sim s, (G2 v), b):cs)
                                    _ -> error "Error Semantico: Suma de probabilidades distinto de 1.0"
putSimb ((Def _ ls, g, b):cs) s = ((Def s ls, g, b):cs)

--Devuelve la suma de las probabilidades dada una lista de generatrices
checkProbs :: [(Simb, Guard, Movs)] -> Float
checkProbs ((Sim _, G2 n, b):cs) = n + checkProbs cs
checkProbs [] = 0

-- Dado un String, devuelve un Tipo
extrType :: String -> Tipo
extrType "Ent"   = Ent
extrType "Real"  = Real
extrType "Boole" = Boole

--Dado un tipo y un valor, 
-- devuelve verdadero si son del mismo tipo, falso de lo contrario.
-- Usada para verificar la asignación de dos tipos. Ej: "c:Real Valor 10" devuelve False
valdTypes :: String -> Valor -> Bool
valdTypes "Ent" (L _)   = True
valdTypes "Real" (R _)  = True
valdTypes "Boole" (B _) = True
valdTypes _ _           = False

-- Dado un orden devuelve su tipo correspondiente
extrOrdn :: String -> Ordn
extrOrdn "<"  = Men
extrOrdn ">"  = May
extrOrdn "=<" = Meni
extrOrdn ">=" = Mayi
extrOrdn "/=" = Dif
extrOrdn "="  = Igl

-- Función que convierte entero en real
intToFloat :: Int -> Float
intToFloat x = fromInteger (toInteger x) 

-- Función que convierte grados en radianes
degToRad :: Float -> Float
degToRad d = d * (pi / 180.0)

--Funcion Parser
--ParseOk en caso de análisis correcto
--ParseFail en caso de análisis incorrecto
parser s = case parserLs2 (lexer s) 1 of
                ParseOk e   -> Right e
                ParseFail s -> Left s
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







{-# LINE 1 "G:\\GitHub\\haskell-platform\\build\\ghc-bindist\\local\\lib/include\\ghcversion.h" #-}

















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "C:\\Users\\randy\\AppData\\Local\\Temp\\ghc14308_0\\ghc_2.h" #-}






















































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates\\GenericTemplate.hs" #-}

{-# LINE 46 "templates\\GenericTemplate.hs" #-}








{-# LINE 67 "templates\\GenericTemplate.hs" #-}

{-# LINE 77 "templates\\GenericTemplate.hs" #-}

{-# LINE 86 "templates\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates\\GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
