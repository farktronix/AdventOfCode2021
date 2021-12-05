//
//  Day5Data.swift
//  AoC2021
//
//  Created by Jacob Farkas on 12/4/21.
//

import Foundation

struct Day5Data {
    static let lines = """
720,475 -> 720,669
268,784 -> 595,784
163,778 -> 149,778
856,917 -> 856,114
929,964 -> 433,964
344,924 -> 332,912
73,923 -> 73,568
714,501 -> 714,903
95,968 -> 95,696
575,615 -> 575,218
233,182 -> 233,295
90,752 -> 90,278
683,21 -> 419,21
714,172 -> 60,172
836,248 -> 836,39
770,53 -> 284,539
528,682 -> 528,583
407,360 -> 708,59
451,671 -> 293,671
418,446 -> 418,113
948,283 -> 504,727
975,494 -> 669,494
911,896 -> 911,963
843,855 -> 14,26
558,340 -> 984,766
260,909 -> 333,909
127,864 -> 903,864
896,174 -> 896,773
989,981 -> 27,19
525,907 -> 525,36
226,276 -> 938,988
285,694 -> 422,831
985,857 -> 674,546
559,436 -> 133,862
12,70 -> 12,961
412,185 -> 412,922
94,174 -> 874,954
435,840 -> 688,587
43,405 -> 43,724
494,826 -> 494,350
591,985 -> 591,936
440,251 -> 401,251
341,816 -> 920,237
80,901 -> 80,361
962,544 -> 962,252
26,732 -> 105,653
821,54 -> 15,860
519,731 -> 952,731
723,869 -> 826,869
752,176 -> 110,818
849,163 -> 71,163
136,748 -> 136,796
301,390 -> 234,390
87,896 -> 968,15
603,388 -> 515,476
866,345 -> 866,742
477,263 -> 477,635
391,675 -> 391,613
460,925 -> 162,627
12,841 -> 12,246
712,964 -> 712,887
18,984 -> 972,30
931,85 -> 217,799
591,848 -> 978,848
87,210 -> 840,963
816,645 -> 816,619
183,710 -> 348,710
39,861 -> 877,23
233,529 -> 233,717
20,43 -> 935,958
979,988 -> 12,21
941,241 -> 855,241
416,507 -> 422,501
410,978 -> 971,978
883,574 -> 883,440
458,865 -> 912,865
113,814 -> 952,814
942,654 -> 545,654
512,78 -> 582,78
102,927 -> 910,119
157,874 -> 76,793
309,987 -> 760,536
74,956 -> 981,49
733,913 -> 496,676
32,776 -> 32,556
676,890 -> 676,709
18,568 -> 18,725
708,531 -> 167,531
240,33 -> 240,356
804,380 -> 804,735
925,85 -> 925,74
692,287 -> 692,526
570,451 -> 570,379
521,13 -> 521,226
249,598 -> 677,170
739,804 -> 353,418
785,138 -> 375,548
913,161 -> 286,788
179,914 -> 158,935
208,250 -> 208,29
953,506 -> 953,84
904,328 -> 347,885
743,311 -> 980,311
897,988 -> 981,988
269,660 -> 534,660
180,443 -> 125,443
101,713 -> 513,713
491,523 -> 265,749
33,165 -> 140,272
813,544 -> 305,36
735,556 -> 605,556
227,252 -> 942,967
67,69 -> 942,944
623,118 -> 920,118
681,764 -> 745,764
182,499 -> 884,499
51,921 -> 787,185
632,232 -> 577,232
887,112 -> 12,987
943,881 -> 255,881
655,293 -> 163,785
453,96 -> 517,160
581,870 -> 581,481
473,936 -> 638,771
264,719 -> 137,592
659,336 -> 659,75
781,29 -> 365,445
93,677 -> 240,530
798,566 -> 594,566
108,244 -> 108,634
69,879 -> 592,879
763,700 -> 763,351
227,108 -> 916,797
149,328 -> 149,641
809,586 -> 776,619
177,308 -> 319,166
970,880 -> 156,66
427,765 -> 427,433
483,771 -> 39,771
813,895 -> 416,895
808,151 -> 808,823
412,797 -> 412,673
368,965 -> 368,191
269,776 -> 409,636
509,895 -> 509,281
873,863 -> 873,746
622,788 -> 623,788
274,212 -> 301,212
335,804 -> 172,641
661,864 -> 620,864
506,951 -> 178,951
611,609 -> 611,508
255,79 -> 255,479
443,788 -> 441,790
548,738 -> 616,738
535,407 -> 535,845
365,469 -> 622,469
541,670 -> 534,670
49,52 -> 922,925
433,412 -> 917,412
475,494 -> 78,891
377,47 -> 377,384
401,22 -> 479,22
642,889 -> 642,988
788,334 -> 788,375
533,327 -> 217,327
529,934 -> 529,368
917,491 -> 280,491
922,510 -> 922,483
695,104 -> 695,783
884,197 -> 192,889
175,956 -> 956,175
384,711 -> 384,181
28,931 -> 28,732
768,522 -> 762,522
816,964 -> 541,689
192,423 -> 668,899
742,133 -> 139,133
829,708 -> 915,708
927,989 -> 72,134
819,851 -> 819,470
326,699 -> 112,699
166,82 -> 370,286
801,621 -> 219,39
392,332 -> 392,375
170,526 -> 549,526
296,907 -> 296,378
912,456 -> 912,814
869,346 -> 648,346
545,224 -> 622,224
626,657 -> 221,657
829,313 -> 829,626
565,758 -> 565,298
113,810 -> 89,834
729,418 -> 679,418
626,794 -> 805,794
811,568 -> 811,564
902,600 -> 735,600
776,519 -> 448,519
874,890 -> 321,337
479,96 -> 479,153
331,396 -> 158,396
420,413 -> 73,413
845,949 -> 49,153
55,624 -> 55,413
349,761 -> 116,761
429,252 -> 429,384
310,340 -> 208,340
208,692 -> 726,174
648,66 -> 648,685
567,580 -> 858,871
747,57 -> 430,57
97,951 -> 850,198
420,670 -> 420,518
583,308 -> 367,308
240,983 -> 219,983
404,901 -> 135,901
118,126 -> 118,166
981,316 -> 727,62
512,262 -> 512,761
445,758 -> 747,758
320,505 -> 252,437
739,379 -> 556,562
509,791 -> 587,713
747,271 -> 196,822
70,132 -> 906,968
90,580 -> 90,881
273,529 -> 273,886
786,443 -> 830,443
116,903 -> 116,130
822,597 -> 822,430
585,875 -> 736,875
470,649 -> 740,649
814,533 -> 814,20
235,468 -> 921,468
413,262 -> 413,37
963,761 -> 963,389
919,445 -> 919,112
788,800 -> 513,525
770,783 -> 262,275
601,330 -> 504,330
882,668 -> 760,790
450,431 -> 675,431
599,400 -> 344,400
887,19 -> 17,889
420,86 -> 420,202
95,871 -> 726,240
337,558 -> 571,558
493,555 -> 934,114
804,112 -> 88,828
785,673 -> 785,304
27,285 -> 27,865
200,379 -> 238,341
303,383 -> 140,546
245,757 -> 33,757
960,526 -> 516,526
303,933 -> 986,250
571,848 -> 571,781
812,804 -> 28,804
752,877 -> 752,278
855,847 -> 63,55
720,740 -> 645,740
872,789 -> 206,123
189,618 -> 189,567
952,141 -> 952,235
81,523 -> 81,577
859,139 -> 449,139
977,978 -> 551,978
30,15 -> 855,840
344,65 -> 842,65
435,414 -> 318,414
324,813 -> 902,235
18,20 -> 977,979
606,373 -> 827,152
678,881 -> 277,480
81,196 -> 81,176
652,528 -> 546,528
673,310 -> 673,503
413,494 -> 413,859
393,310 -> 139,310
485,157 -> 368,157
152,611 -> 362,401
929,346 -> 929,220
577,102 -> 577,589
20,843 -> 882,843
261,69 -> 988,796
417,37 -> 90,37
368,469 -> 149,250
651,785 -> 179,313
953,759 -> 953,31
534,215 -> 534,199
375,908 -> 375,11
408,571 -> 408,224
146,88 -> 146,16
923,843 -> 923,11
885,605 -> 908,605
383,288 -> 698,288
955,409 -> 379,409
10,579 -> 10,143
487,277 -> 918,708
240,800 -> 508,532
655,121 -> 655,956
277,208 -> 277,395
242,430 -> 654,430
518,982 -> 143,982
626,758 -> 626,125
90,67 -> 963,940
57,11 -> 979,933
777,29 -> 777,669
747,672 -> 516,672
915,878 -> 915,964
678,941 -> 678,738
967,645 -> 967,814
356,293 -> 356,143
282,710 -> 585,710
210,126 -> 210,836
77,122 -> 270,122
976,956 -> 655,956
129,394 -> 697,962
621,94 -> 621,265
431,619 -> 431,349
551,990 -> 551,666
379,681 -> 109,411
713,94 -> 832,94
800,776 -> 437,413
261,517 -> 261,551
245,963 -> 245,807
890,888 -> 890,269
591,455 -> 591,494
243,756 -> 166,756
372,303 -> 805,303
22,459 -> 22,138
44,248 -> 44,689
219,629 -> 219,646
444,633 -> 777,300
679,102 -> 679,945
950,123 -> 250,823
485,264 -> 485,963
313,355 -> 445,355
791,823 -> 895,823
914,193 -> 495,612
174,932 -> 351,932
509,989 -> 813,685
830,559 -> 830,65
762,779 -> 84,101
66,432 -> 129,432
224,705 -> 777,152
377,280 -> 93,280
799,313 -> 713,313
972,496 -> 972,250
321,978 -> 488,978
74,227 -> 682,835
434,827 -> 122,827
206,329 -> 536,659
591,355 -> 591,967
838,436 -> 892,382
62,889 -> 878,73
146,948 -> 530,564
308,510 -> 308,783
158,355 -> 158,469
375,239 -> 375,961
754,281 -> 774,281
818,554 -> 818,922
204,38 -> 344,38
689,283 -> 587,283
642,820 -> 862,600
865,821 -> 865,335
51,870 -> 51,117
628,769 -> 129,270
860,300 -> 860,666
626,47 -> 626,915
222,733 -> 449,733
284,842 -> 284,717
965,834 -> 697,834
159,826 -> 159,732
710,679 -> 907,482
356,355 -> 36,355
736,289 -> 577,130
589,319 -> 96,319
967,20 -> 31,956
138,871 -> 138,446
272,174 -> 272,753
958,228 -> 958,842
159,115 -> 576,532
244,986 -> 244,662
191,160 -> 191,376
979,987 -> 11,19
588,700 -> 588,819
76,933 -> 404,605
142,656 -> 142,906
390,429 -> 859,898
802,499 -> 380,499
18,988 -> 969,37
61,154 -> 61,569
803,47 -> 803,963
148,597 -> 148,454
368,221 -> 174,27
416,351 -> 510,351
27,979 -> 950,979
861,937 -> 103,937
49,889 -> 876,62
429,737 -> 555,737
940,704 -> 940,663
644,379 -> 661,379
956,589 -> 956,423
836,119 -> 237,119
841,211 -> 154,898
743,438 -> 743,370
691,155 -> 990,155
531,768 -> 56,293
853,103 -> 110,846
411,673 -> 411,126
824,876 -> 406,876
516,639 -> 98,639
583,353 -> 901,353
64,898 -> 858,898
874,233 -> 874,551
294,830 -> 294,244
921,27 -> 86,862
695,747 -> 56,108
442,552 -> 442,624
731,431 -> 905,431
320,56 -> 139,56
450,96 -> 510,156
628,803 -> 65,803
102,855 -> 782,175
399,877 -> 940,877
766,664 -> 757,664
705,455 -> 407,753
924,458 -> 408,458
302,272 -> 536,38
269,274 -> 269,196
368,124 -> 935,124
151,686 -> 151,629
171,857 -> 171,62
81,895 -> 953,23
150,95 -> 150,955
325,16 -> 102,16
148,775 -> 144,775
742,449 -> 742,715
706,284 -> 706,865
857,309 -> 754,206
866,818 -> 140,92
13,768 -> 956,768
775,514 -> 132,514
868,407 -> 868,516
13,11 -> 989,987
428,296 -> 19,705
544,665 -> 376,497
371,619 -> 371,512
657,551 -> 907,551
571,324 -> 765,324
555,539 -> 295,799
854,956 -> 854,85
152,255 -> 719,822
162,519 -> 868,519
276,235 -> 276,693
58,870 -> 739,189
731,229 -> 613,347
469,378 -> 469,44
30,909 -> 929,10
474,423 -> 256,205
810,263 -> 810,545
230,244 -> 741,244
892,709 -> 394,709
141,87 -> 912,858
280,820 -> 907,193
935,897 -> 101,63
283,15 -> 283,170
122,749 -> 761,110
265,475 -> 265,390
286,464 -> 891,464
793,819 -> 793,659
372,96 -> 372,591
436,732 -> 436,527
48,301 -> 429,301
696,298 -> 696,294
757,553 -> 438,872
635,856 -> 239,856
312,987 -> 989,987
388,599 -> 546,599
235,391 -> 581,391
696,340 -> 696,215
852,485 -> 105,485
931,586 -> 803,714
956,164 -> 198,922
305,274 -> 305,979
363,774 -> 363,81
431,957 -> 431,460
118,439 -> 512,833
193,318 -> 494,619
796,819 -> 332,819
911,764 -> 865,810
282,482 -> 128,482
551,244 -> 694,244
947,142 -> 45,142
653,57 -> 131,57
822,720 -> 721,720
861,871 -> 125,135
950,698 -> 597,698
"""
}
