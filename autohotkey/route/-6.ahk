global routes := [
    {monster: [6, 1], pos: [157, 758], pos2K: [209, 1015], pos25K: [6, 1326], pos4K: [319, 1525], narrow: 3, name: "起点"}, ; 1
    {monster: [6, 1], pos: [563, 202], pos2K: [753, 272], pos25K: [698, 298], pos4K: [1131, 405], fastNarrow: 3, fastPos2K: [2885, 157], fastPos4K: [2890, 160], name: "雷丘"}, ; 2
    {monster: [6, 1], pos: [1536, 241], pos2K: [2045, 326], pos25K: [2126, 359], pos4K: [3062, 493], fastPos2K: [2464, 840], fastPos4K: [3030, 1199], name: "大宝"}, ; 3
    {monster: [6, 1], pos: [1500, 571], pos2K: [2004, 761], pos25K: [2080, 839], pos4K: [3000, 1140], fastPos2K: [1495, 919], fastPos4K: [2244, 1381], name: "机兵"}, ; 4
    {monster: [6, 1], pos: [820, 1010], pos2K: [1100, 1328], pos25K: [1033, 1452], pos4K: [1652, 1991], narrow: 1, fastPos2K: [903, 1223], fastPos4K: [1359, 1831], name: "渊下宫最后一个点"}, ; 5
    {monster: [6, 2], pos: [1053, 264], pos2K: [1405, 353], pos25K: [1418, 390], pos4K: [2108, 529], qm: false, name: "层岩起点"}, ; 6 -> 层岩
    {monster: [6, 2], pos: [1065, 498], pos2K: [1414, 666], pos25K: [1430, 740], pos4K: [2120, 998], fastPos2K: [1222, 1083], selectionWait: 120, fastPos4K: [1838, 1628], name: "层岩第二个点"}, ; 7
    {monster: [6, 2], pos: [1065, 498], pos2K: [1414, 666], pos25K: [1430, 740], pos4K: [2120, 998], fastPos2K: [1437, 772], fastPos4K: [2154, 1165], name: "层岩第二个点2"}, ; 8
    {monster: [6, 2], pos: [1140, 899], pos2K: [1522, 1199], pos25K: [1547, 1332], pos4K: [2282, 1795], fastPos2K: [1418, 1205], fastPos4K: [2131, 1823], name: "岩龙蜥"}, ; 9
    {monster: [6, 2], pos: [1389, 901], pos2K: [1930, 1265], pos25K: [1876, 1553], pos4K: [2895, 1899], fastPos2K: [1862, 862], narrow: 1, fastPos4K: [2797, 1294], name: "层岩最后一个点"}, ; 10
    {monster: [10, 2], pos: [1044, 807], pos2K: [1391, 1077], pos25K: [1405, 1196], pos4K: [2088, 1611], selectionWait: 120, name: "枫丹起点"}, ; 11 -> 枫丹
    {monster: [10, 2], pos: [1044, 807], pos2K: [1391, 1077], pos25K: [1405, 1196], pos4K: [2088, 1611], selectionWait: 120, name: "枫丹起点2"}, ; 12
    {monster: [10, 2], pos: [1147, 955], pos2K: [1528, 1279], pos25K: [1559, 1423], pos4K: [2296, 1919], fastPos2K: [1389, 738], fastPos4K: [2034, 1098], name: "跳崖"}, ; 13
    {monster: [9, 2], pos: [1275, 265], pos2K: [1702, 354], pos25K: [1747, 393], pos4K: [2550, 531], fastPos4K: [3363, 1143], name: "藏镜侍女"}, ; 14
    {monster: [10, 3], pos: [683, 461], pos2K: [910, 613], pos25K: [867, 682], pos4K: [1365, 922], name: "岩丘丘王"}, ; 15
    {monster: [10, 3], pos: [961, 648], pos2K: [1285, 846], pos25K: [1285, 963], pos4K: [1927, 1297], fastPos4K: [2468, 1231], name: "蜥蜴"}, ; 16
    {monster: [10, 3], pos: [1590, 442], pos2K: [2119, 587], pos25K: [2214, 652], pos4K: [3171, 873], fastPos4K: [3095, 605], try: 2, name: "薄荷岛"}, ; 17
    {monster: [7, 1], pos: [1315, 1019], wait: 100, pos2K: [1754, 1356], pos25K: [1803, 1507], pos4K: [2629, 2032], name: "童梦的切片"}, ; 18 -> 须弥鸡哥
    {monster: [7, 1], pos: [921, 579], pos2K: [1232, 769], pos25K: [1226, 852], pos4K: [1817, 1188], narrow: -1, qm: false, name: "鸡哥老巢"}, ; 19
    {monster: [7, 1], pos: [187, 587], pos2K: [290, 785], pos25K: [248, 895], pos4K: [438, 1179], narrow: 1, name: "沙漠大宝"}, ; 20
    {monster: [7, 1], pos: [94, 800], pos2K: [124, 1070], pos25K: [3, 1183], pos4K: [185, 1601], fastPos4K: [2015, 1400], name: "遗迹机兵"}, ; 21
    {monster: [7, 1], pos: [851, 948], pos2K: [1134, 1270], pos25K: [1115, 1403], pos4K: [1702, 1901], fastPos4K: [3037, 1227], qm: false, name: "往昔的桓纳兰纳"}, ; 22
    {monster: [8, 1], pos: [1186, 242], pos2K: [1585, 324], pos25K: [1614, 356], pos4K: [2376, 482], name: "双丘丘王"}, ; 23
    {monster: [7, 2], pos: [650, 593], pos2K: [869, 788], pos25K: [821, 878], pos4K: [1303, 1181], fastPos4K: [3286, 296], name: "神像"}, ; 24
    {monster: [7, 2], pos: [1190, 223], pos2K: [1590, 299], pos25K: [1618, 334], pos4K: [2383, 447], fastPos4K: [3046, 353], name: "层岩上1"}, ; 25
    {monster: [7, 2], pos: [1229, 32], pos2K: [1556, 193], pos25K: [1673, 45], pos4K: [2333, 285], fastPos4K: [2119, 665], narrow: 1, name: "层岩上2"}, ; 26
    {monster: [4, 3], pos: [793, 720], pos2K: [1060, 961], pos25K: [1038, 1072], pos4K: [1587, 1436], name: "稻妻"}, ; 27
    {monster: [4, 1], pos: [1504, 503], pos2K: [2294, 656], pos25K: [2085, 743], pos4K: [3442, 982], narrow: -1, name: "踏贝沙"}, ; 28
    {monster: [5, 2], pos: [954, 597], pos2K: [1272, 794], pos25K: [1272, 882], pos4K: [1903, 1192], qm: false, name: "最后一个点"}, ; 29
    ; 带传奇
    {monster: [9, 1], pos: [1460, 430], pos2K: [1949, 577], pos25K: [], pos4K: [2919, 866], qm: false, name: ""}, ; 30
    {monster: [10, 3], pos: [1195, 420], pos2K: [1592, 562], pos25K: [], pos4K: [2388, 837], name: ""}, ; 31 龙蜥
]
