require "ostruct"

TEST = <<EOS
0 <-> 2
1 <-> 1
2 <-> 0, 3, 4
3 <-> 2, 4
4 <-> 2, 3, 6
5 <-> 6
6 <-> 4, 5
EOS

testmode = ARGV.delete("-t")
verbose = ARGV.delete("-v")

input = (testmode ? TEST : DATA).each_line.map do |line|
  line.chomp.split(" <-> ")[1].split(",").map(&:chomp).map(&:to_i)
end

traveled = []
pipes = [0]
until (pipes - traveled).length.zero?
  traveled = (traveled + pipes).uniq
  pipes = pipes.map { |i| input[i] }.flatten - traveled
end

puts traveled.length

groups = 1

until (input - traveled).length.zero?
  i = 0
  until !input[i] || input[i].length == 1 && !traveled.include?(i)
    i += 1
  end
  break if i >= input.length
  inner_traveled = []
  pipes = [i]
  until (pipes - inner_traveled).length.zero?
    inner_traveled = (inner_traveled + pipes).uniq
    pipes = pipes.map { |i| input[i] }.flatten - inner_traveled
  end
  traveled.concat(inner_traveled)
  groups += 1
end

puts groups

__END__
0 <-> 795
1 <-> 156
2 <-> 715
3 <-> 1361, 1698
4 <-> 551, 672
5 <-> 514
6 <-> 1806
7 <-> 1700
8 <-> 599, 1068, 1850
9 <-> 580, 1517
10 <-> 521
11 <-> 461
12 <-> 896
13 <-> 464
14 <-> 526
15 <-> 15
16 <-> 627, 997
17 <-> 725
18 <-> 1803
19 <-> 129, 1608, 1712
20 <-> 1005
21 <-> 252, 386, 1818
22 <-> 32, 1168, 1266, 1757
23 <-> 212, 664
24 <-> 983
25 <-> 1271, 1356
26 <-> 545
27 <-> 639
28 <-> 509
29 <-> 686, 959, 1521
30 <-> 172
31 <-> 1721
32 <-> 22
33 <-> 436
34 <-> 96, 116, 661, 1102
35 <-> 827, 1274, 1533
36 <-> 483, 586
37 <-> 556
38 <-> 709
39 <-> 551, 1196
40 <-> 42
41 <-> 485
42 <-> 40, 475, 930
43 <-> 121
44 <-> 202, 759
45 <-> 45, 721, 764
46 <-> 903
47 <-> 616, 1053
48 <-> 1933
49 <-> 334, 476, 516, 1212
50 <-> 717, 1412
51 <-> 331
52 <-> 1953
53 <-> 53, 853
54 <-> 430
55 <-> 1635
56 <-> 826, 1985
57 <-> 1375
58 <-> 868, 1887
59 <-> 908, 1307
60 <-> 582
61 <-> 1298
62 <-> 1373
63 <-> 1200, 1644
64 <-> 547, 771, 1443
65 <-> 235, 340, 522, 1472, 1597
66 <-> 1605
67 <-> 75
68 <-> 365
69 <-> 69
70 <-> 1781
71 <-> 1519
72 <-> 1355
73 <-> 73, 176
74 <-> 1155
75 <-> 67, 769, 1080
76 <-> 470, 474, 1115
77 <-> 1564
78 <-> 78, 1128, 1351
79 <-> 784
80 <-> 80, 962, 1566
81 <-> 1784
82 <-> 1977
83 <-> 892
84 <-> 705, 892, 958, 1717
85 <-> 493, 644, 714, 1624
86 <-> 1079, 1547
87 <-> 1186, 1240
88 <-> 215, 250, 1918
89 <-> 485
90 <-> 595, 786, 1419, 1825, 1870
91 <-> 1366, 1874
92 <-> 217, 225
93 <-> 577, 1734
94 <-> 94
95 <-> 1476
96 <-> 34, 560, 1061
97 <-> 199
98 <-> 1311
99 <-> 1040
100 <-> 1397
101 <-> 1578
102 <-> 1719
103 <-> 1268, 1663
104 <-> 106, 677, 846
105 <-> 650
106 <-> 104, 1315
107 <-> 1802
108 <-> 1723, 1885
109 <-> 658
110 <-> 646
111 <-> 124, 710, 1819
112 <-> 841
113 <-> 696
114 <-> 1685, 1923
115 <-> 1565
116 <-> 34, 1116
117 <-> 1532, 1842
118 <-> 1058, 1225, 1495
119 <-> 224, 1536
120 <-> 542, 1229
121 <-> 43, 986
122 <-> 921
123 <-> 345, 1655, 1848, 1974
124 <-> 111, 1259
125 <-> 1797
126 <-> 126
127 <-> 127, 260, 732, 1117, 1251
128 <-> 1151
129 <-> 19, 782
130 <-> 130
131 <-> 1582
132 <-> 505, 592, 1545
133 <-> 953
134 <-> 1567
135 <-> 559, 591, 1791
136 <-> 868, 1449, 1470, 1954
137 <-> 374
138 <-> 303, 1601, 1710
139 <-> 1011
140 <-> 140, 1947
141 <-> 252
142 <-> 803, 1706
143 <-> 1622
144 <-> 832
145 <-> 145
146 <-> 904, 921, 1720
147 <-> 611, 1788
148 <-> 188
149 <-> 264
150 <-> 746, 1850
151 <-> 151, 347
152 <-> 393
153 <-> 182
154 <-> 154, 349, 673, 1039
155 <-> 697, 1258
156 <-> 1, 384, 453, 1232, 1995
157 <-> 1492
158 <-> 1245
159 <-> 1194
160 <-> 222, 1241
161 <-> 1377
162 <-> 162
163 <-> 1825
164 <-> 1837
165 <-> 955, 1811
166 <-> 825, 1817
167 <-> 1338
168 <-> 1037, 1290
169 <-> 169
170 <-> 1490
171 <-> 553
172 <-> 30, 308
173 <-> 1573, 1604
174 <-> 1297
175 <-> 265, 1070, 1960
176 <-> 73, 497
177 <-> 1639, 1697
178 <-> 494, 1490
179 <-> 623
180 <-> 185, 1056
181 <-> 181
182 <-> 153, 1678
183 <-> 504, 601
184 <-> 635, 1246
185 <-> 180, 621
186 <-> 1798
187 <-> 1375
188 <-> 148, 405, 950, 1322
189 <-> 534, 1908
190 <-> 1582
191 <-> 361, 1879
192 <-> 1814
193 <-> 533, 1307, 1389
194 <-> 1262
195 <-> 1450
196 <-> 335
197 <-> 750
198 <-> 285, 297, 671
199 <-> 97, 199, 280, 1292
200 <-> 200, 1584
201 <-> 1519
202 <-> 44, 1492, 1605, 1857, 1888
203 <-> 363, 416, 504
204 <-> 832
205 <-> 350, 1385
206 <-> 206
207 <-> 584
208 <-> 889, 1254, 1596
209 <-> 996, 1402
210 <-> 691, 977
211 <-> 463
212 <-> 23, 1318
213 <-> 600, 933
214 <-> 1657
215 <-> 88, 274, 1264
216 <-> 216, 301
217 <-> 92, 217, 766
218 <-> 986, 1439
219 <-> 1217, 1294
220 <-> 368, 736, 1543, 1704
221 <-> 367, 806, 1273, 1804
222 <-> 160, 682, 1257, 1660
223 <-> 223
224 <-> 119, 259
225 <-> 92
226 <-> 482, 1472
227 <-> 1325
228 <-> 379, 1914
229 <-> 529, 765
230 <-> 534
231 <-> 1456
232 <-> 924, 952
233 <-> 1423, 1661, 1715
234 <-> 429
235 <-> 65
236 <-> 1134, 1613
237 <-> 237
238 <-> 1728
239 <-> 1543
240 <-> 698, 832, 1022
241 <-> 948, 1066, 1172, 1552
242 <-> 594, 888
243 <-> 965
244 <-> 739, 1428
245 <-> 1039
246 <-> 471
247 <-> 1414, 1650
248 <-> 254, 1152
249 <-> 383, 976
250 <-> 88
251 <-> 941, 1484
252 <-> 21, 141, 803
253 <-> 253
254 <-> 248, 395
255 <-> 909, 1334
256 <-> 1001
257 <-> 558, 1050, 1946
258 <-> 516, 961
259 <-> 224, 564, 630
260 <-> 127, 1041, 1938
261 <-> 697, 761
262 <-> 262, 1928
263 <-> 1068
264 <-> 149, 818
265 <-> 175
266 <-> 1767, 1955
267 <-> 326
268 <-> 553
269 <-> 1557, 1907
270 <-> 971
271 <-> 1039
272 <-> 1053, 1176
273 <-> 1248
274 <-> 215
275 <-> 590, 1539
276 <-> 479, 749
277 <-> 434, 827, 1014
278 <-> 1219
279 <-> 931, 1971
280 <-> 199, 559
281 <-> 1079
282 <-> 996, 1746
283 <-> 1970
284 <-> 1376, 1692
285 <-> 198, 1521, 1977
286 <-> 623, 857, 1446
287 <-> 1781, 1920
288 <-> 417
289 <-> 1073
290 <-> 1411
291 <-> 759, 1267, 1931
292 <-> 448
293 <-> 1426, 1675
294 <-> 947, 1749
295 <-> 1489, 1702
296 <-> 791
297 <-> 198
298 <-> 372, 539, 566, 1183
299 <-> 306, 1799
300 <-> 300, 1762
301 <-> 216
302 <-> 1671
303 <-> 138, 867
304 <-> 671, 1553
305 <-> 1018, 1186
306 <-> 299, 321
307 <-> 1125, 1976
308 <-> 172, 383
309 <-> 1037, 1766
310 <-> 1345
311 <-> 849, 1989
312 <-> 312
313 <-> 1052, 1595
314 <-> 1405, 1923
315 <-> 426, 543
316 <-> 536, 968, 1363, 1529, 1572, 1906
317 <-> 317, 747
318 <-> 495, 1658
319 <-> 556, 910
320 <-> 845, 1225
321 <-> 306, 321, 399, 1248, 1951
322 <-> 1409
323 <-> 323, 1046, 1287
324 <-> 1103
325 <-> 1681
326 <-> 267, 758, 901
327 <-> 411, 1475
328 <-> 1789
329 <-> 473, 1361
330 <-> 639, 1763
331 <-> 51, 331
332 <-> 492, 1526, 1552
333 <-> 888, 1362
334 <-> 49
335 <-> 196, 335, 1914
336 <-> 457
337 <-> 1452
338 <-> 426
339 <-> 339, 689, 928, 1037
340 <-> 65, 1403, 1516, 1559
341 <-> 1393
342 <-> 380, 452
343 <-> 1126, 1267, 1823
344 <-> 1429
345 <-> 123
346 <-> 364, 1898
347 <-> 151, 515, 1114
348 <-> 621, 1263, 1501, 1907
349 <-> 154
350 <-> 205, 596, 775, 1627
351 <-> 755, 1186
352 <-> 644
353 <-> 943, 1117
354 <-> 917, 1980
355 <-> 1036, 1858
356 <-> 900, 1210, 1940
357 <-> 489
358 <-> 1611
359 <-> 359
360 <-> 360, 1838
361 <-> 191, 1729
362 <-> 1090, 1692
363 <-> 203, 363
364 <-> 346, 1373
365 <-> 68, 365
366 <-> 469, 873
367 <-> 221
368 <-> 220
369 <-> 1594, 1712
370 <-> 1150
371 <-> 1705
372 <-> 298, 974, 1206, 1882
373 <-> 1044, 1753
374 <-> 137, 697, 1902
375 <-> 510, 722
376 <-> 1431, 1502
377 <-> 377, 1098
378 <-> 552, 971, 1054
379 <-> 228, 684, 1256
380 <-> 342
381 <-> 1896
382 <-> 967, 1146, 1224, 1816
383 <-> 249, 308
384 <-> 156, 807
385 <-> 510
386 <-> 21, 1184, 1756
387 <-> 440, 1016, 1505
388 <-> 938, 1418, 1810
389 <-> 1300
390 <-> 1305, 1863
391 <-> 458, 1911
392 <-> 506, 808, 924
393 <-> 152, 1258
394 <-> 394
395 <-> 254
396 <-> 656
397 <-> 1872
398 <-> 1679
399 <-> 321
400 <-> 528, 1560
401 <-> 1527
402 <-> 464, 1145, 1496
403 <-> 477
404 <-> 627
405 <-> 188, 1866
406 <-> 720, 1174, 1272
407 <-> 1048
408 <-> 674
409 <-> 1869
410 <-> 1548
411 <-> 327, 836, 1622, 1967
412 <-> 1803, 1978
413 <-> 523, 1511
414 <-> 414, 694
415 <-> 1022, 1988
416 <-> 203
417 <-> 288, 449, 1758
418 <-> 418, 778, 900, 1062, 1639, 1789
419 <-> 419, 1764
420 <-> 991
421 <-> 690
422 <-> 567, 883, 1182, 1921
423 <-> 870
424 <-> 503
425 <-> 1014
426 <-> 315, 338, 901, 1336
427 <-> 1966
428 <-> 1606
429 <-> 234, 1567, 1682
430 <-> 54, 1157, 1177, 1894
431 <-> 798, 926
432 <-> 1683
433 <-> 523, 854
434 <-> 277
435 <-> 471, 1002
436 <-> 33, 810, 873, 1011
437 <-> 1327, 1534
438 <-> 1470, 1825
439 <-> 1293, 1566
440 <-> 387, 1006
441 <-> 560, 1690
442 <-> 442, 587
443 <-> 1324, 1450
444 <-> 1655
445 <-> 1387, 1499
446 <-> 1637, 1663
447 <-> 447
448 <-> 292, 1407, 1533, 1874
449 <-> 417
450 <-> 878, 1780
451 <-> 451
452 <-> 342, 960, 1981
453 <-> 156
454 <-> 1215
455 <-> 647, 1336
456 <-> 675, 1080, 1792
457 <-> 336, 626, 1002
458 <-> 391
459 <-> 619
460 <-> 695, 997, 1181
461 <-> 11, 795, 1020
462 <-> 1433
463 <-> 211, 1038, 1361
464 <-> 13, 402
465 <-> 1159, 1674
466 <-> 1386, 1405, 1493
467 <-> 581, 1677
468 <-> 911
469 <-> 366
470 <-> 76, 676
471 <-> 246, 435, 1331, 1685
472 <-> 938, 1136, 1755
473 <-> 329
474 <-> 76, 856, 1645
475 <-> 42, 804, 1546
476 <-> 49
477 <-> 403, 854, 1165, 1962
478 <-> 1254
479 <-> 276
480 <-> 1364
481 <-> 623
482 <-> 226, 949
483 <-> 36, 993
484 <-> 484
485 <-> 41, 89, 880, 1008, 1994
486 <-> 1523, 1588
487 <-> 1122
488 <-> 728
489 <-> 357, 573
490 <-> 717, 841, 1020, 1280
491 <-> 1920
492 <-> 332
493 <-> 85, 1585
494 <-> 178, 1800
495 <-> 318, 631, 897, 1482
496 <-> 1649
497 <-> 176
498 <-> 1828
499 <-> 499, 1134
500 <-> 657, 1331
501 <-> 809
502 <-> 628, 787, 1358
503 <-> 424, 503
504 <-> 183, 203
505 <-> 132, 1402
506 <-> 392, 990
507 <-> 1027, 1638, 1684
508 <-> 710, 716
509 <-> 28, 509
510 <-> 375, 385, 629, 1814
511 <-> 892
512 <-> 1175
513 <-> 513, 1737
514 <-> 5, 699, 1610, 1935
515 <-> 347, 1471
516 <-> 49, 258, 1514
517 <-> 1361
518 <-> 1174
519 <-> 927
520 <-> 520, 1456
521 <-> 10, 1581
522 <-> 65, 1448
523 <-> 413, 433, 1215
524 <-> 524
525 <-> 1540
526 <-> 14, 798
527 <-> 527, 753
528 <-> 400
529 <-> 229
530 <-> 1475, 1620
531 <-> 531
532 <-> 1286
533 <-> 193, 1727
534 <-> 189, 230
535 <-> 991, 1366
536 <-> 316
537 <-> 1833
538 <-> 970, 1270
539 <-> 298, 704, 723
540 <-> 623
541 <-> 1160, 1498, 1909
542 <-> 120
543 <-> 315
544 <-> 842, 1289, 1365
545 <-> 26, 1550
546 <-> 1722, 1886
547 <-> 64, 796, 1612
548 <-> 1582, 1945
549 <-> 549, 1084
550 <-> 1041
551 <-> 4, 39
552 <-> 378, 1257
553 <-> 171, 268, 1160, 1493
554 <-> 1190
555 <-> 1050
556 <-> 37, 319, 1551
557 <-> 557
558 <-> 257, 1779
559 <-> 135, 280
560 <-> 96, 441
561 <-> 1244, 1986
562 <-> 1209, 1820
563 <-> 1215
564 <-> 259, 1817
565 <-> 565
566 <-> 298, 1203
567 <-> 422, 884, 1113
568 <-> 760, 1768
569 <-> 1449
570 <-> 598, 759, 1728
571 <-> 571
572 <-> 1821
573 <-> 489, 930, 942, 1459
574 <-> 1872
575 <-> 813, 1073, 1335
576 <-> 653, 1111, 1616
577 <-> 93, 1316
578 <-> 837, 1645, 1683
579 <-> 906, 1113
580 <-> 9, 1318, 1657
581 <-> 467, 1286, 1720
582 <-> 60, 582
583 <-> 1678
584 <-> 207, 891, 1115
585 <-> 624
586 <-> 36, 586, 1501, 1512
587 <-> 442, 823, 1620, 1853
588 <-> 1147
589 <-> 1096, 1641, 1730
590 <-> 275, 654, 726, 1981
591 <-> 135
592 <-> 132
593 <-> 820
594 <-> 242, 611, 1743
595 <-> 90, 630, 719, 1977
596 <-> 350, 878, 1401
597 <-> 781, 848, 1854
598 <-> 570
599 <-> 8, 1070
600 <-> 213, 779, 1118, 1483, 1886, 1957
601 <-> 183
602 <-> 1265
603 <-> 1860
604 <-> 641, 1512
605 <-> 1001
606 <-> 900
607 <-> 1302
608 <-> 885
609 <-> 837
610 <-> 610, 1659
611 <-> 147, 594
612 <-> 922, 1560
613 <-> 1381
614 <-> 1071, 1893
615 <-> 629, 741, 1865
616 <-> 47
617 <-> 896
618 <-> 1721, 1754, 1902
619 <-> 459, 619, 1032
620 <-> 679, 1449
621 <-> 185, 348, 1301
622 <-> 1244
623 <-> 179, 286, 481, 540
624 <-> 585, 1009, 1134
625 <-> 1181, 1433
626 <-> 457, 626, 1500, 1932
627 <-> 16, 404
628 <-> 502
629 <-> 510, 615, 927
630 <-> 259, 595
631 <-> 495, 976, 1228
632 <-> 1912
633 <-> 694, 894
634 <-> 1657
635 <-> 184
636 <-> 911, 1730, 1945
637 <-> 981, 1909
638 <-> 907
639 <-> 27, 330, 639, 1663
640 <-> 1229, 1939
641 <-> 604
642 <-> 896
643 <-> 850
644 <-> 85, 352, 735, 1025
645 <-> 783
646 <-> 110, 1825
647 <-> 455
648 <-> 1043
649 <-> 1532
650 <-> 105, 833, 1060, 1371
651 <-> 1437, 1751
652 <-> 1019
653 <-> 576, 1314, 1393
654 <-> 590
655 <-> 716, 779
656 <-> 396, 773, 1603
657 <-> 500
658 <-> 109, 738
659 <-> 1527, 1951
660 <-> 1685
661 <-> 34
662 <-> 1196, 1252
663 <-> 1729
664 <-> 23
665 <-> 1224
666 <-> 1213
667 <-> 1786, 1919
668 <-> 1369
669 <-> 669, 785
670 <-> 926, 1642
671 <-> 198, 304
672 <-> 4
673 <-> 154
674 <-> 408, 1062
675 <-> 456
676 <-> 470, 1194
677 <-> 104
678 <-> 821
679 <-> 620
680 <-> 687, 931
681 <-> 959, 1711
682 <-> 222, 1941
683 <-> 1594
684 <-> 379
685 <-> 1200, 1897
686 <-> 29, 1399
687 <-> 680
688 <-> 722
689 <-> 339, 1391
690 <-> 421, 1666
691 <-> 210
692 <-> 1165
693 <-> 923, 1761
694 <-> 414, 633, 757
695 <-> 460, 726, 1880
696 <-> 113, 1228, 1240
697 <-> 155, 261, 374, 1477
698 <-> 240
699 <-> 514, 706
700 <-> 746
701 <-> 905, 1064
702 <-> 952, 1097
703 <-> 703, 1875
704 <-> 539, 1328
705 <-> 84, 1621
706 <-> 699, 1604
707 <-> 707
708 <-> 708
709 <-> 38, 1064
710 <-> 111, 508, 1362
711 <-> 1545
712 <-> 899, 1139
713 <-> 1228
714 <-> 85, 1297
715 <-> 2, 754, 1808
716 <-> 508, 655
717 <-> 50, 490
718 <-> 1382, 1648
719 <-> 595, 1024
720 <-> 406, 1096, 1261
721 <-> 45, 1213
722 <-> 375, 688, 1632
723 <-> 539
724 <-> 891
725 <-> 17, 1045
726 <-> 590, 695, 1958
727 <-> 747
728 <-> 488, 728
729 <-> 729, 1150
730 <-> 730
731 <-> 1181, 1273
732 <-> 127, 1269
733 <-> 1803
734 <-> 1005, 1496
735 <-> 644
736 <-> 220
737 <-> 1383
738 <-> 658, 1259, 1687
739 <-> 244
740 <-> 946, 1163, 1279
741 <-> 615, 1690
742 <-> 800, 878, 1609
743 <-> 1647
744 <-> 744, 1778
745 <-> 1181
746 <-> 150, 700, 1082, 1727
747 <-> 317, 727
748 <-> 877
749 <-> 276, 1040
750 <-> 197, 750, 1201
751 <-> 1159, 1479
752 <-> 1642
753 <-> 527
754 <-> 715, 1809
755 <-> 351, 1088, 1560
756 <-> 756
757 <-> 694
758 <-> 326, 954, 1988
759 <-> 44, 291, 570, 1038
760 <-> 568, 1304, 1620
761 <-> 261, 1537
762 <-> 1943
763 <-> 948, 1232, 1375
764 <-> 45, 1839
765 <-> 229, 1066
766 <-> 217
767 <-> 1501, 1587, 1640
768 <-> 868, 1911
769 <-> 75
770 <-> 1724
771 <-> 64, 1124, 1606
772 <-> 1721
773 <-> 656, 1197, 1756
774 <-> 1422, 1835
775 <-> 350, 844
776 <-> 1204
777 <-> 1073, 1448
778 <-> 418
779 <-> 600, 655
780 <-> 1111, 1274
781 <-> 597
782 <-> 129, 1600
783 <-> 645, 1627
784 <-> 79, 947
785 <-> 669
786 <-> 90
787 <-> 502, 816, 1625, 1821
788 <-> 943
789 <-> 1835
790 <-> 1625
791 <-> 296, 1092, 1930
792 <-> 830
793 <-> 1876
794 <-> 1156, 1626, 1813
795 <-> 0, 461
796 <-> 547
797 <-> 1565, 1589, 1669
798 <-> 431, 526, 1278
799 <-> 1643
800 <-> 742, 1761
801 <-> 858
802 <-> 1367
803 <-> 142, 252
804 <-> 475, 1268, 1758, 1991
805 <-> 1218, 1832
806 <-> 221
807 <-> 384, 1140, 1460, 1872, 1999
808 <-> 392, 1417
809 <-> 501, 884
810 <-> 436
811 <-> 1813
812 <-> 819
813 <-> 575
814 <-> 1282, 1966
815 <-> 815, 1579
816 <-> 787, 1676
817 <-> 1051, 1671
818 <-> 264, 928, 1065
819 <-> 812, 819
820 <-> 593, 868, 1107, 1919
821 <-> 678, 879, 1551, 1681, 1774
822 <-> 822
823 <-> 587
824 <-> 1092, 1412, 1992
825 <-> 166
826 <-> 56, 1073
827 <-> 35, 277
828 <-> 1847
829 <-> 1028
830 <-> 792, 1007
831 <-> 1799
832 <-> 144, 204, 240, 1329
833 <-> 650, 1685
834 <-> 1379
835 <-> 1355, 1844
836 <-> 411
837 <-> 578, 609, 1489
838 <-> 1144, 1441
839 <-> 1593
840 <-> 1045
841 <-> 112, 490, 1436
842 <-> 544
843 <-> 1371
844 <-> 775
845 <-> 320, 1556, 1591
846 <-> 104, 1094
847 <-> 847, 1654
848 <-> 597, 1090
849 <-> 311, 1773
850 <-> 643, 1875
851 <-> 858, 1524
852 <-> 1504, 1541, 1990
853 <-> 53
854 <-> 433, 477
855 <-> 1502, 1860
856 <-> 474
857 <-> 286, 857
858 <-> 801, 851, 858, 1547, 1652
859 <-> 1969
860 <-> 1181
861 <-> 955
862 <-> 1350, 1624
863 <-> 863
864 <-> 1457
865 <-> 1355, 1491
866 <-> 1373
867 <-> 303, 987
868 <-> 58, 136, 768, 820
869 <-> 1426, 1744
870 <-> 423, 1608
871 <-> 1312
872 <-> 872, 1226
873 <-> 366, 436
874 <-> 1983
875 <-> 1138, 1232
876 <-> 1324
877 <-> 748, 1464, 1846
878 <-> 450, 596, 742
879 <-> 821
880 <-> 485
881 <-> 1246, 1286
882 <-> 946, 1221
883 <-> 422, 886, 1830
884 <-> 567, 809
885 <-> 608, 1856
886 <-> 883, 1787
887 <-> 1035, 1331, 1438, 1604
888 <-> 242, 333
889 <-> 208, 935
890 <-> 1211, 1847
891 <-> 584, 724
892 <-> 83, 84, 511, 1478, 1530, 1983
893 <-> 1494
894 <-> 633
895 <-> 1045, 1124, 1745
896 <-> 12, 617, 642, 896
897 <-> 495
898 <-> 898, 1586
899 <-> 712
900 <-> 356, 418, 606, 1026, 1074
901 <-> 326, 426
902 <-> 1790
903 <-> 46, 969, 1715
904 <-> 146, 1964
905 <-> 701, 1273, 1410
906 <-> 579, 1713, 1878
907 <-> 638, 907
908 <-> 59, 1195
909 <-> 255, 1669
910 <-> 319
911 <-> 468, 636
912 <-> 1076
913 <-> 1067, 1101, 1397, 1790
914 <-> 1383, 1825
915 <-> 1827
916 <-> 1938
917 <-> 354, 991
918 <-> 1013
919 <-> 1086
920 <-> 995
921 <-> 122, 146
922 <-> 612
923 <-> 693, 1916
924 <-> 232, 392, 1782
925 <-> 1553
926 <-> 431, 670
927 <-> 519, 629
928 <-> 339, 818
929 <-> 1220
930 <-> 42, 573
931 <-> 279, 680, 1593
932 <-> 1470, 1534
933 <-> 213
934 <-> 1205, 1387
935 <-> 889
936 <-> 1984
937 <-> 937, 1817
938 <-> 388, 472, 1133, 1808
939 <-> 1147, 1750, 1884
940 <-> 1097
941 <-> 251
942 <-> 573, 1994
943 <-> 353, 788
944 <-> 1103, 1979
945 <-> 1824
946 <-> 740, 882, 1716
947 <-> 294, 784, 1381, 1960
948 <-> 241, 763, 1368
949 <-> 482
950 <-> 188
951 <-> 1711
952 <-> 232, 702
953 <-> 133, 1028, 1375, 1519
954 <-> 758, 1733
955 <-> 165, 861, 1442, 1664
956 <-> 956, 1590
957 <-> 957
958 <-> 84
959 <-> 29, 681
960 <-> 452
961 <-> 258
962 <-> 80
963 <-> 963
964 <-> 1742
965 <-> 243, 965
966 <-> 1515, 1745
967 <-> 382, 1712, 1754
968 <-> 316
969 <-> 903, 1777
970 <-> 538, 1278, 1463
971 <-> 270, 378
972 <-> 1985
973 <-> 1565
974 <-> 372, 1738
975 <-> 1734
976 <-> 249, 631
977 <-> 210, 1846
978 <-> 1171
979 <-> 1786
980 <-> 1871
981 <-> 637
982 <-> 1449
983 <-> 24, 1567
984 <-> 1372
985 <-> 985, 1285
986 <-> 121, 218, 988, 1836
987 <-> 867
988 <-> 986, 1276, 1526
989 <-> 1268, 1709
990 <-> 506, 990
991 <-> 420, 535, 917, 1390
992 <-> 1628
993 <-> 483, 1765
994 <-> 1068
995 <-> 920, 995
996 <-> 209, 282
997 <-> 16, 460, 1122, 1769
998 <-> 1076, 1602
999 <-> 1001, 1697
1000 <-> 1648, 1915
1001 <-> 256, 605, 999, 1091
1002 <-> 435, 457
1003 <-> 1382
1004 <-> 1254
1005 <-> 20, 734, 1651
1006 <-> 440
1007 <-> 830, 1007
1008 <-> 485
1009 <-> 624
1010 <-> 1353
1011 <-> 139, 436, 1675
1012 <-> 1836
1013 <-> 918, 1891
1014 <-> 277, 425
1015 <-> 1191
1016 <-> 387
1017 <-> 1483
1018 <-> 305
1019 <-> 652, 1798
1020 <-> 461, 490, 1843
1021 <-> 1021
1022 <-> 240, 415, 1507
1023 <-> 1919
1024 <-> 719, 1925
1025 <-> 644, 1735
1026 <-> 900
1027 <-> 507, 1432
1028 <-> 829, 953, 1927
1029 <-> 1029
1030 <-> 1923
1031 <-> 1505
1032 <-> 619, 1151
1033 <-> 1949
1034 <-> 1115
1035 <-> 887
1036 <-> 355
1037 <-> 168, 309, 339, 1835
1038 <-> 463, 759
1039 <-> 154, 245, 271
1040 <-> 99, 749, 1153, 1477
1041 <-> 260, 550
1042 <-> 1814
1043 <-> 648, 1091
1044 <-> 373, 1614
1045 <-> 725, 840, 895, 1309
1046 <-> 323
1047 <-> 1238, 1499, 1569
1048 <-> 407, 1533
1049 <-> 1856
1050 <-> 257, 555
1051 <-> 817, 1051
1052 <-> 313
1053 <-> 47, 272
1054 <-> 378, 1648
1055 <-> 1055
1056 <-> 180, 1387
1057 <-> 1057, 1793, 1924
1058 <-> 118, 1474
1059 <-> 1566, 1851
1060 <-> 650
1061 <-> 96, 1063
1062 <-> 418, 674
1063 <-> 1061
1064 <-> 701, 709, 1867, 1963
1065 <-> 818
1066 <-> 241, 765
1067 <-> 913
1068 <-> 8, 263, 994
1069 <-> 1555
1070 <-> 175, 599, 1070
1071 <-> 614, 1245
1072 <-> 1086, 1685
1073 <-> 289, 575, 777, 826
1074 <-> 900, 1434
1075 <-> 1492
1076 <-> 912, 998, 1119
1077 <-> 1183
1078 <-> 1771, 1792
1079 <-> 86, 281, 1167
1080 <-> 75, 456, 1168, 1337
1081 <-> 1741
1082 <-> 746
1083 <-> 1378
1084 <-> 549, 1199
1085 <-> 1085
1086 <-> 919, 1072
1087 <-> 1087, 1726
1088 <-> 755
1089 <-> 1089
1090 <-> 362, 848, 1474
1091 <-> 1001, 1043
1092 <-> 791, 824, 1933
1093 <-> 1190
1094 <-> 846
1095 <-> 1095
1096 <-> 589, 720, 1096
1097 <-> 702, 940
1098 <-> 377
1099 <-> 1099
1100 <-> 1212
1101 <-> 913, 1543
1102 <-> 34, 1392, 1626, 1985
1103 <-> 324, 944, 1348, 1494, 1981
1104 <-> 1104
1105 <-> 1400
1106 <-> 1678, 1842, 1974
1107 <-> 820
1108 <-> 1202
1109 <-> 1219, 1539
1110 <-> 1144, 1179
1111 <-> 576, 780
1112 <-> 1357
1113 <-> 567, 579
1114 <-> 347, 1696
1115 <-> 76, 584, 1034, 1981
1116 <-> 116
1117 <-> 127, 353, 1635
1118 <-> 600
1119 <-> 1076, 1445
1120 <-> 1735, 1946
1121 <-> 1778
1122 <-> 487, 997, 1253
1123 <-> 1792
1124 <-> 771, 895, 1266
1125 <-> 307
1126 <-> 343
1127 <-> 1127, 1164
1128 <-> 78, 1700
1129 <-> 1149, 1625
1130 <-> 1871
1131 <-> 1131
1132 <-> 1207, 1208, 1861
1133 <-> 938
1134 <-> 236, 499, 624
1135 <-> 1489, 1607
1136 <-> 472
1137 <-> 1298
1138 <-> 875
1139 <-> 712, 1139
1140 <-> 807
1141 <-> 1329
1142 <-> 1170, 1559
1143 <-> 1143
1144 <-> 838, 1110, 1223
1145 <-> 402, 1145
1146 <-> 382, 1364
1147 <-> 588, 939
1148 <-> 1421, 1831
1149 <-> 1129, 1905, 1959
1150 <-> 370, 729
1151 <-> 128, 1032, 1233
1152 <-> 248, 1152, 1708, 1803
1153 <-> 1040, 1377
1154 <-> 1209
1155 <-> 74, 1787
1156 <-> 794
1157 <-> 430, 1975
1158 <-> 1158, 1592
1159 <-> 465, 751, 1454
1160 <-> 541, 553, 1175
1161 <-> 1786, 1824
1162 <-> 1262, 1321, 1876
1163 <-> 740, 1283, 1903
1164 <-> 1127
1165 <-> 477, 692
1166 <-> 1344, 1967
1167 <-> 1079
1168 <-> 22, 1080
1169 <-> 1172, 1647
1170 <-> 1142
1171 <-> 978, 1171
1172 <-> 241, 1169, 1723
1173 <-> 1375
1174 <-> 406, 518, 1323
1175 <-> 512, 1160, 1343, 1982
1176 <-> 272, 1176
1177 <-> 430
1178 <-> 1910
1179 <-> 1110
1180 <-> 1596
1181 <-> 460, 625, 731, 745, 860, 1647
1182 <-> 422
1183 <-> 298, 1077
1184 <-> 386
1185 <-> 1729, 1972
1186 <-> 87, 305, 351
1187 <-> 1454, 1670
1188 <-> 1779, 1976
1189 <-> 1731, 1794, 1980
1190 <-> 554, 1093, 1326, 1332, 1999
1191 <-> 1015, 1784, 1920, 1998
1192 <-> 1923, 1937
1193 <-> 1333
1194 <-> 159, 676
1195 <-> 908, 1311, 1805
1196 <-> 39, 662
1197 <-> 773
1198 <-> 1468
1199 <-> 1084, 1826
1200 <-> 63, 685, 1490
1201 <-> 750
1202 <-> 1108, 1618
1203 <-> 566
1204 <-> 776, 1204
1205 <-> 934
1206 <-> 372
1207 <-> 1132, 1207, 1342
1208 <-> 1132
1209 <-> 562, 1154, 1840
1210 <-> 356
1211 <-> 890, 1259
1212 <-> 49, 1100, 1385
1213 <-> 666, 721, 1469, 1583, 1984
1214 <-> 1734
1215 <-> 454, 523, 563
1216 <-> 1583
1217 <-> 219, 1749
1218 <-> 805, 1611
1219 <-> 278, 1109
1220 <-> 929, 1904, 1919
1221 <-> 882
1222 <-> 1462
1223 <-> 1144, 1223, 1384
1224 <-> 382, 665
1225 <-> 118, 320
1226 <-> 872, 1744, 1895
1227 <-> 1601
1228 <-> 631, 696, 713
1229 <-> 120, 640, 1642, 1993
1230 <-> 1400, 1494
1231 <-> 1942
1232 <-> 156, 763, 875
1233 <-> 1151
1234 <-> 1234
1235 <-> 1510, 1888
1236 <-> 1591
1237 <-> 1912
1238 <-> 1047
1239 <-> 1371
1240 <-> 87, 696, 1799
1241 <-> 160, 1915
1242 <-> 1242, 1900
1243 <-> 1303
1244 <-> 561, 622, 1942
1245 <-> 158, 1071
1246 <-> 184, 881, 1899
1247 <-> 1539
1248 <-> 273, 321
1249 <-> 1324
1250 <-> 1354
1251 <-> 127
1252 <-> 662, 1304, 1374
1253 <-> 1122
1254 <-> 208, 478, 1004, 1378
1255 <-> 1995
1256 <-> 379, 1349
1257 <-> 222, 552
1258 <-> 155, 393, 1574, 1647
1259 <-> 124, 738, 1211, 1409
1260 <-> 1862
1261 <-> 720
1262 <-> 194, 1162, 1349, 1458
1263 <-> 348
1264 <-> 215
1265 <-> 602, 1265, 1970
1266 <-> 22, 1124
1267 <-> 291, 343, 1729, 1918
1268 <-> 103, 804, 989
1269 <-> 732
1270 <-> 538
1271 <-> 25, 1285
1272 <-> 406, 1629
1273 <-> 221, 731, 905
1274 <-> 35, 780
1275 <-> 1752
1276 <-> 988
1277 <-> 1788
1278 <-> 798, 970
1279 <-> 740
1280 <-> 490, 1763
1281 <-> 1281
1282 <-> 814, 1341
1283 <-> 1163
1284 <-> 1447, 1494
1285 <-> 985, 1271
1286 <-> 532, 581, 881
1287 <-> 323
1288 <-> 1681
1289 <-> 544, 1665, 1928
1290 <-> 168
1291 <-> 1435
1292 <-> 199
1293 <-> 439
1294 <-> 219
1295 <-> 1526
1296 <-> 1296, 1411
1297 <-> 174, 714
1298 <-> 61, 1137, 1416, 1724, 1979
1299 <-> 1673
1300 <-> 389, 1464
1301 <-> 621
1302 <-> 607, 1788
1303 <-> 1243, 1303
1304 <-> 760, 1252
1305 <-> 390, 1452
1306 <-> 1728
1307 <-> 59, 193
1308 <-> 1943
1309 <-> 1045, 1403
1310 <-> 1938
1311 <-> 98, 1195
1312 <-> 871, 1478, 1834
1313 <-> 1379
1314 <-> 653
1315 <-> 106, 1955, 1968
1316 <-> 577, 1523
1317 <-> 1826
1318 <-> 212, 580
1319 <-> 1371
1320 <-> 1406
1321 <-> 1162
1322 <-> 188
1323 <-> 1174, 1633
1324 <-> 443, 876, 1249, 1832
1325 <-> 227, 1569
1326 <-> 1190
1327 <-> 437
1328 <-> 704, 1689
1329 <-> 832, 1141, 1330
1330 <-> 1329, 1330
1331 <-> 471, 500, 887
1332 <-> 1190, 1429
1333 <-> 1193, 1792
1334 <-> 255, 1345
1335 <-> 575
1336 <-> 426, 455, 1913
1337 <-> 1080
1338 <-> 167, 1338
1339 <-> 1517
1340 <-> 1866
1341 <-> 1282
1342 <-> 1207
1343 <-> 1175
1344 <-> 1166
1345 <-> 310, 1334
1346 <-> 1346, 1719
1347 <-> 1375
1348 <-> 1103
1349 <-> 1256, 1262
1350 <-> 862, 1350
1351 <-> 78, 1444
1352 <-> 1845
1353 <-> 1010, 1922
1354 <-> 1250, 1363
1355 <-> 72, 835, 865, 1936
1356 <-> 25
1357 <-> 1112, 1357
1358 <-> 502
1359 <-> 1814
1360 <-> 1468
1361 <-> 3, 329, 463, 517
1362 <-> 333, 710
1363 <-> 316, 1354, 1759
1364 <-> 480, 1146
1365 <-> 544
1366 <-> 91, 535
1367 <-> 802, 1543, 1609
1368 <-> 948, 1631, 1864
1369 <-> 668, 1964
1370 <-> 1370
1371 <-> 650, 843, 1239, 1319, 1528
1372 <-> 984, 1447
1373 <-> 62, 364, 866, 1884
1374 <-> 1252
1375 <-> 57, 187, 763, 953, 1173, 1347
1376 <-> 284, 1878
1377 <-> 161, 1153
1378 <-> 1083, 1254, 1378, 1856
1379 <-> 834, 1313, 1792
1380 <-> 1967
1381 <-> 613, 947, 1523
1382 <-> 718, 1003, 1796
1383 <-> 737, 914
1384 <-> 1223
1385 <-> 205, 1212
1386 <-> 466, 1623
1387 <-> 445, 934, 1056
1388 <-> 1456
1389 <-> 193, 1427, 1701
1390 <-> 991
1391 <-> 689
1392 <-> 1102
1393 <-> 341, 653, 1513
1394 <-> 1509
1395 <-> 1409
1396 <-> 1593, 1982
1397 <-> 100, 913
1398 <-> 1668
1399 <-> 686
1400 <-> 1105, 1230
1401 <-> 596, 1506
1402 <-> 209, 505, 1628
1403 <-> 340, 1309
1404 <-> 1754
1405 <-> 314, 466
1406 <-> 1320, 1796, 1883
1407 <-> 448, 1542
1408 <-> 1616
1409 <-> 322, 1259, 1395, 1462
1410 <-> 905
1411 <-> 290, 1296
1412 <-> 50, 824
1413 <-> 1943, 1955, 1997
1414 <-> 247
1415 <-> 1415
1416 <-> 1298
1417 <-> 808
1418 <-> 388, 1487, 1666
1419 <-> 90
1420 <-> 1435, 1486, 1947
1421 <-> 1148, 1679
1422 <-> 774
1423 <-> 233
1424 <-> 1670
1425 <-> 1910
1426 <-> 293, 869
1427 <-> 1389, 1634, 1740
1428 <-> 244, 1428, 1831
1429 <-> 344, 1332
1430 <-> 1985
1431 <-> 376
1432 <-> 1027
1433 <-> 462, 625
1434 <-> 1074
1435 <-> 1291, 1420
1436 <-> 841
1437 <-> 651, 1616
1438 <-> 887
1439 <-> 218
1440 <-> 1770, 1809
1441 <-> 838
1442 <-> 955, 1714
1443 <-> 64
1444 <-> 1351
1445 <-> 1119, 1445
1446 <-> 286
1447 <-> 1284, 1372
1448 <-> 522, 777, 1969
1449 <-> 136, 569, 620, 982
1450 <-> 195, 443, 1516
1451 <-> 1451
1452 <-> 337, 1305, 1552
1453 <-> 1801, 1906
1454 <-> 1159, 1187
1455 <-> 1562
1456 <-> 231, 520, 1388, 1775, 1833
1457 <-> 864, 1905
1458 <-> 1262
1459 <-> 573
1460 <-> 807
1461 <-> 1599, 1706
1462 <-> 1222, 1409
1463 <-> 970, 1937
1464 <-> 877, 1300, 1677
1465 <-> 1602
1466 <-> 1919
1467 <-> 1467
1468 <-> 1198, 1360, 1987
1469 <-> 1213, 1896
1470 <-> 136, 438, 932
1471 <-> 515, 1952
1472 <-> 65, 226
1473 <-> 1585
1474 <-> 1058, 1090
1475 <-> 327, 530
1476 <-> 95, 1627, 1866
1477 <-> 697, 1040, 1827
1478 <-> 892, 1312, 1478
1479 <-> 751
1480 <-> 1480
1481 <-> 1481
1482 <-> 495
1483 <-> 600, 1017
1484 <-> 251, 1717, 1920
1485 <-> 1618, 1797
1486 <-> 1420
1487 <-> 1418, 1828
1488 <-> 1545
1489 <-> 295, 837, 1135, 1859
1490 <-> 170, 178, 1200
1491 <-> 865, 1500, 1858
1492 <-> 157, 202, 1075
1493 <-> 466, 553
1494 <-> 893, 1103, 1230, 1284
1495 <-> 118
1496 <-> 402, 734
1497 <-> 1953
1498 <-> 541, 1662
1499 <-> 445, 1047
1500 <-> 626, 1491, 1922
1501 <-> 348, 586, 767
1502 <-> 376, 855, 1960, 1965
1503 <-> 1755
1504 <-> 852
1505 <-> 387, 1031, 1854
1506 <-> 1401
1507 <-> 1022
1508 <-> 1853
1509 <-> 1394, 1509, 1732
1510 <-> 1235
1511 <-> 413, 1990
1512 <-> 586, 604, 1862
1513 <-> 1393
1514 <-> 516
1515 <-> 966, 1716
1516 <-> 340, 1450
1517 <-> 9, 1339, 1587
1518 <-> 1518, 1912, 1956
1519 <-> 71, 201, 953
1520 <-> 1520
1521 <-> 29, 285, 1906
1522 <-> 1538, 1994
1523 <-> 486, 1316, 1381
1524 <-> 851
1525 <-> 1737
1526 <-> 332, 988, 1295
1527 <-> 401, 659
1528 <-> 1371
1529 <-> 316
1530 <-> 892
1531 <-> 1531
1532 <-> 117, 649
1533 <-> 35, 448, 1048
1534 <-> 437, 932
1535 <-> 1630
1536 <-> 119
1537 <-> 761, 1869
1538 <-> 1522
1539 <-> 275, 1109, 1247
1540 <-> 525, 1540
1541 <-> 852, 1541
1542 <-> 1407, 1694
1543 <-> 220, 239, 1101, 1367
1544 <-> 1972
1545 <-> 132, 711, 1488
1546 <-> 475
1547 <-> 86, 858
1548 <-> 410, 1616
1549 <-> 1852
1550 <-> 545, 1711
1551 <-> 556, 821
1552 <-> 241, 332, 1452, 1987
1553 <-> 304, 925
1554 <-> 1554
1555 <-> 1069, 1727
1556 <-> 845, 1561
1557 <-> 269
1558 <-> 1558
1559 <-> 340, 1142
1560 <-> 400, 612, 755
1561 <-> 1556
1562 <-> 1455, 1697
1563 <-> 1563, 1736
1564 <-> 77, 1564
1565 <-> 115, 797, 973
1566 <-> 80, 439, 1059
1567 <-> 134, 429, 983
1568 <-> 1570
1569 <-> 1047, 1325
1570 <-> 1568, 1932
1571 <-> 1628, 1755
1572 <-> 316
1573 <-> 173
1574 <-> 1258
1575 <-> 1856
1576 <-> 1708
1577 <-> 1577
1578 <-> 101, 1660
1579 <-> 815
1580 <-> 1580
1581 <-> 521, 1689
1582 <-> 131, 190, 548
1583 <-> 1213, 1216
1584 <-> 200
1585 <-> 493, 1473
1586 <-> 898
1587 <-> 767, 1517
1588 <-> 486
1589 <-> 797, 1822
1590 <-> 956
1591 <-> 845, 1236, 1688
1592 <-> 1158
1593 <-> 839, 931, 1396
1594 <-> 369, 683
1595 <-> 313, 1731
1596 <-> 208, 1180
1597 <-> 65
1598 <-> 1598
1599 <-> 1461
1600 <-> 782
1601 <-> 138, 1227, 1837, 1932
1602 <-> 998, 1465
1603 <-> 656
1604 <-> 173, 706, 887
1605 <-> 66, 202
1606 <-> 428, 771
1607 <-> 1135
1608 <-> 19, 870, 1608
1609 <-> 742, 1367
1610 <-> 514, 1703
1611 <-> 358, 1218
1612 <-> 547
1613 <-> 236
1614 <-> 1044
1615 <-> 1697
1616 <-> 576, 1408, 1437, 1548
1617 <-> 1617
1618 <-> 1202, 1485
1619 <-> 1910
1620 <-> 530, 587, 760
1621 <-> 705
1622 <-> 143, 411
1623 <-> 1386
1624 <-> 85, 862, 1691
1625 <-> 787, 790, 1129
1626 <-> 794, 1102
1627 <-> 350, 783, 1476, 1822
1628 <-> 992, 1402, 1571
1629 <-> 1272, 1783
1630 <-> 1535, 1630
1631 <-> 1368, 1973
1632 <-> 722
1633 <-> 1323
1634 <-> 1427
1635 <-> 55, 1117
1636 <-> 1636
1637 <-> 446
1638 <-> 507
1639 <-> 177, 418
1640 <-> 767, 1989
1641 <-> 589
1642 <-> 670, 752, 1229
1643 <-> 799, 1977
1644 <-> 63
1645 <-> 474, 578
1646 <-> 1829
1647 <-> 743, 1169, 1181, 1258
1648 <-> 718, 1000, 1054
1649 <-> 496, 1649
1650 <-> 247, 1806
1651 <-> 1005
1652 <-> 858
1653 <-> 1684, 1747, 1949
1654 <-> 847
1655 <-> 123, 444, 1771
1656 <-> 1705
1657 <-> 214, 580, 634
1658 <-> 318
1659 <-> 610
1660 <-> 222, 1578
1661 <-> 233, 1661
1662 <-> 1498
1663 <-> 103, 446, 639
1664 <-> 955, 1874
1665 <-> 1289
1666 <-> 690, 1418
1667 <-> 1792
1668 <-> 1398, 1668
1669 <-> 797, 909, 1709
1670 <-> 1187, 1424
1671 <-> 302, 817
1672 <-> 1851
1673 <-> 1299, 1673
1674 <-> 465, 1730
1675 <-> 293, 1011
1676 <-> 816, 1891
1677 <-> 467, 1464, 1787
1678 <-> 182, 583, 1106, 1852
1679 <-> 398, 1421
1680 <-> 1680
1681 <-> 325, 821, 1288
1682 <-> 429, 1682
1683 <-> 432, 578
1684 <-> 507, 1653, 1806, 1841
1685 <-> 114, 471, 660, 833, 1072
1686 <-> 1691
1687 <-> 738
1688 <-> 1591
1689 <-> 1328, 1581, 1795
1690 <-> 441, 741, 1854
1691 <-> 1624, 1686
1692 <-> 284, 362
1693 <-> 1781
1694 <-> 1542
1695 <-> 1775
1696 <-> 1114
1697 <-> 177, 999, 1562, 1615, 1996
1698 <-> 3, 1809
1699 <-> 1761
1700 <-> 7, 1128
1701 <-> 1389, 1802
1702 <-> 295
1703 <-> 1610
1704 <-> 220
1705 <-> 371, 1656, 1867
1706 <-> 142, 1461
1707 <-> 1960
1708 <-> 1152, 1576, 1961
1709 <-> 989, 1669
1710 <-> 138
1711 <-> 681, 951, 1550
1712 <-> 19, 369, 967
1713 <-> 906, 1812
1714 <-> 1442, 1785
1715 <-> 233, 903
1716 <-> 946, 1515
1717 <-> 84, 1484
1718 <-> 1718
1719 <-> 102, 1346
1720 <-> 146, 581
1721 <-> 31, 618, 772
1722 <-> 546
1723 <-> 108, 1172
1724 <-> 770, 1298
1725 <-> 1896
1726 <-> 1087
1727 <-> 533, 746, 1555
1728 <-> 238, 570, 1306
1729 <-> 361, 663, 1185, 1267
1730 <-> 589, 636, 1674
1731 <-> 1189, 1595
1732 <-> 1509
1733 <-> 954
1734 <-> 93, 975, 1214
1735 <-> 1025, 1120
1736 <-> 1563
1737 <-> 513, 1525
1738 <-> 974
1739 <-> 1742
1740 <-> 1427
1741 <-> 1081, 1950
1742 <-> 964, 1739, 1923
1743 <-> 594, 1921
1744 <-> 869, 1226
1745 <-> 895, 966, 1829
1746 <-> 282
1747 <-> 1653, 1747, 1910
1748 <-> 1982
1749 <-> 294, 1217
1750 <-> 939
1751 <-> 651
1752 <-> 1275, 1752
1753 <-> 373, 1969
1754 <-> 618, 967, 1404
1755 <-> 472, 1503, 1571
1756 <-> 386, 773, 1777
1757 <-> 22
1758 <-> 417, 804
1759 <-> 1363
1760 <-> 1935
1761 <-> 693, 800, 1699
1762 <-> 300
1763 <-> 330, 1280
1764 <-> 419
1765 <-> 993
1766 <-> 309
1767 <-> 266, 1821
1768 <-> 568
1769 <-> 997
1770 <-> 1440
1771 <-> 1078, 1655, 1873
1772 <-> 1772
1773 <-> 849
1774 <-> 821, 1783
1775 <-> 1456, 1695
1776 <-> 1889, 1943
1777 <-> 969, 1756
1778 <-> 744, 1121
1779 <-> 558, 1188
1780 <-> 450
1781 <-> 70, 287, 1693
1782 <-> 924
1783 <-> 1629, 1774
1784 <-> 81, 1191
1785 <-> 1714
1786 <-> 667, 979, 1161
1787 <-> 886, 1155, 1677
1788 <-> 147, 1277, 1302, 1950
1789 <-> 328, 418
1790 <-> 902, 913
1791 <-> 135
1792 <-> 456, 1078, 1123, 1333, 1379, 1667
1793 <-> 1057
1794 <-> 1189, 1794
1795 <-> 1689
1796 <-> 1382, 1406, 1953
1797 <-> 125, 1485, 1797
1798 <-> 186, 1019, 1798
1799 <-> 299, 831, 1240
1800 <-> 494
1801 <-> 1453
1802 <-> 107, 1701
1803 <-> 18, 412, 733, 1152
1804 <-> 221
1805 <-> 1195
1806 <-> 6, 1650, 1684
1807 <-> 1807
1808 <-> 715, 938, 1985
1809 <-> 754, 1440, 1698
1810 <-> 388
1811 <-> 165
1812 <-> 1713
1813 <-> 794, 811
1814 <-> 192, 510, 1042, 1359
1815 <-> 1941
1816 <-> 382
1817 <-> 166, 564, 937
1818 <-> 21
1819 <-> 111
1820 <-> 562
1821 <-> 572, 787, 1767
1822 <-> 1589, 1627
1823 <-> 343
1824 <-> 945, 1161
1825 <-> 90, 163, 438, 646, 914
1826 <-> 1199, 1317, 1881
1827 <-> 915, 1477
1828 <-> 498, 1487
1829 <-> 1646, 1745
1830 <-> 883
1831 <-> 1148, 1428, 1882
1832 <-> 805, 1324
1833 <-> 537, 1456
1834 <-> 1312
1835 <-> 774, 789, 1037
1836 <-> 986, 1012
1837 <-> 164, 1601
1838 <-> 360
1839 <-> 764
1840 <-> 1209, 1888
1841 <-> 1684
1842 <-> 117, 1106, 1948
1843 <-> 1020
1844 <-> 835, 1890
1845 <-> 1352, 1845
1846 <-> 877, 977, 1878
1847 <-> 828, 890
1848 <-> 123, 1926
1849 <-> 1849
1850 <-> 8, 150
1851 <-> 1059, 1672
1852 <-> 1549, 1678
1853 <-> 587, 1508
1854 <-> 597, 1505, 1690
1855 <-> 1855
1856 <-> 885, 1049, 1378, 1575
1857 <-> 202
1858 <-> 355, 1491
1859 <-> 1489
1860 <-> 603, 855
1861 <-> 1132
1862 <-> 1260, 1512
1863 <-> 390
1864 <-> 1368
1865 <-> 615
1866 <-> 405, 1340, 1476
1867 <-> 1064, 1705
1868 <-> 1868
1869 <-> 409, 1537
1870 <-> 90
1871 <-> 980, 1130, 1958
1872 <-> 397, 574, 807
1873 <-> 1771
1874 <-> 91, 448, 1664
1875 <-> 703, 850
1876 <-> 793, 1162
1877 <-> 1877
1878 <-> 906, 1376, 1846, 1884
1879 <-> 191
1880 <-> 695
1881 <-> 1826
1882 <-> 372, 1831
1883 <-> 1406
1884 <-> 939, 1373, 1878
1885 <-> 108
1886 <-> 546, 600
1887 <-> 58
1888 <-> 202, 1235, 1840
1889 <-> 1776
1890 <-> 1844
1891 <-> 1013, 1676
1892 <-> 1892
1893 <-> 614, 1893
1894 <-> 430
1895 <-> 1226
1896 <-> 381, 1469, 1725
1897 <-> 685, 1956
1898 <-> 346
1899 <-> 1246
1900 <-> 1242
1901 <-> 1901
1902 <-> 374, 618
1903 <-> 1163
1904 <-> 1220
1905 <-> 1149, 1457
1906 <-> 316, 1453, 1521
1907 <-> 269, 348
1908 <-> 189, 1908
1909 <-> 541, 637
1910 <-> 1178, 1425, 1619, 1747
1911 <-> 391, 768
1912 <-> 632, 1237, 1518
1913 <-> 1336
1914 <-> 228, 335
1915 <-> 1000, 1241
1916 <-> 923
1917 <-> 1974
1918 <-> 88, 1267
1919 <-> 667, 820, 1023, 1220, 1466
1920 <-> 287, 491, 1191, 1484
1921 <-> 422, 1743
1922 <-> 1353, 1500
1923 <-> 114, 314, 1030, 1192, 1742
1924 <-> 1057
1925 <-> 1024
1926 <-> 1848
1927 <-> 1028
1928 <-> 262, 1289
1929 <-> 1929
1930 <-> 791, 1986
1931 <-> 291, 1975
1932 <-> 626, 1570, 1601
1933 <-> 48, 1092
1934 <-> 1934
1935 <-> 514, 1760
1936 <-> 1355
1937 <-> 1192, 1463
1938 <-> 260, 916, 1310
1939 <-> 640
1940 <-> 356
1941 <-> 682, 1815
1942 <-> 1231, 1244
1943 <-> 762, 1308, 1413, 1776
1944 <-> 1944
1945 <-> 548, 636
1946 <-> 257, 1120
1947 <-> 140, 1420
1948 <-> 1842
1949 <-> 1033, 1653
1950 <-> 1741, 1788
1951 <-> 321, 659
1952 <-> 1471
1953 <-> 52, 1497, 1796
1954 <-> 136
1955 <-> 266, 1315, 1413, 1955
1956 <-> 1518, 1897
1957 <-> 600
1958 <-> 726, 1871
1959 <-> 1149
1960 <-> 175, 947, 1502, 1707
1961 <-> 1708
1962 <-> 477
1963 <-> 1064
1964 <-> 904, 1369
1965 <-> 1502
1966 <-> 427, 814, 1966
1967 <-> 411, 1166, 1380
1968 <-> 1315
1969 <-> 859, 1448, 1753
1970 <-> 283, 1265
1971 <-> 279
1972 <-> 1185, 1544
1973 <-> 1631
1974 <-> 123, 1106, 1917
1975 <-> 1157, 1931
1976 <-> 307, 1188
1977 <-> 82, 285, 595, 1643
1978 <-> 412
1979 <-> 944, 1298
1980 <-> 354, 1189
1981 <-> 452, 590, 1103, 1115
1982 <-> 1175, 1396, 1748
1983 <-> 874, 892
1984 <-> 936, 1213
1985 <-> 56, 972, 1102, 1430, 1808
1986 <-> 561, 1930
1987 <-> 1468, 1552
1988 <-> 415, 758
1989 <-> 311, 1640
1990 <-> 852, 1511
1991 <-> 804
1992 <-> 824
1993 <-> 1229
1994 <-> 485, 942, 1522
1995 <-> 156, 1255
1996 <-> 1697
1997 <-> 1413
1998 <-> 1191
1999 <-> 807, 1190
