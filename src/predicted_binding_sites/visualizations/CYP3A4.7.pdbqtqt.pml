from pymol import cmd,stored

set depth_cue, 1
set fog_start, 0.4

set_color b_col, [36,36,85]
set_color t_col, [10,10,10]
set bg_rgb_bottom, b_col
set bg_rgb_top, t_col      
set bg_gradient

set  spec_power  =  200
set  spec_refl   =  0

load "data/CYP3A4.7.pdbqtqt", protein
create ligands, protein and organic
select xlig, protein and organic
delete xlig

hide everything, all

color white, elem c
color bluewhite, protein
#show_as cartoon, protein
show surface, protein
#set transparency, 0.15

show sticks, ligands
set stick_color, magenta

load "data/CYP3A4.7.pdbqtqt_points.pdb.gz", points
hide nonbonded, points
show nb_spheres, points
set sphere_scale, 0.2, points
cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)


stored.list=[]
cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
lastSTP=stored.list[-1] # get the index of the last residue
hide lines, resn STP

cmd.select("rest", "resn STP and resi 0")

for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))



set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [1472,2199,2202,2203,658,1476,1479,1497,1501,1545,624,731,732,3313,3320,3332,625,627,793,3303,3314,830,3296,3301,2725,2728,2740,1498,1499,2719,2727,2735,1500,1475,1495,1496,3638,3269,3270,3271,3279,3280,3319,2749,2752,2755,3264,3283,3286,2172,729,733,735,740,723,789,722,725,726,727,829,1710,654,623,2764,633,647,2773,649,651,652,657,644,645,636,1625,1539,1568,423,635,1570,1564,1572,1598,1600,2756,2761,2762,2763,2760,2924,2743,2745,400,402,638,2742,378,236,1494,1554,1574,233,237,1509,536,416,417,420,398,399,1575,407,2207,1250,2205,2208,2210,2177,2178,2191,1251,883,887,3325,3330,3331,3333,3334,3335,2181,1973,3365,3366,1972,1276,1277,2155,2183,1969,2238,2239,2240,2721,1465,1466,1468,2722,2212,2236,2241,2246,3277,3278,3324,3371,3323,3336,2678,2266,3395,1218,1241,1242,1247] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.392,0.702]
select surf_pocket2, protein and id [3275,2653,3252,3253,2652,2654,2621,2622,2623,2624,3204,3141,3140,3177,3178,3179,3182,3272,3342,3343,3349,3350,3352,3378,3348,3376,3276,900,920,3282,3245,3216,3218,3219,3202,3206,2561,3384,3387,2560,3385,3412,3409,2595,2566,2532,2563,2567,2569,2536,2537,2538,2564] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.431,0.902]
select surf_pocket3, protein and id [3074,3070,3587,2693,2704,2708,3606,3607,3593,3601,3605,3604,2325,2327,2328,2356,2358,2319,3578,3581,3584,2315,3576,3588,2697,3085,3077,3080,3083,2989,2991,249,250,251,3622,2347,2346] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.278,0.702]
select surf_pocket4, protein and id [692,678,680,1755,2113,679,681,685,686,687,688,689,690,691,1791,1730,2109,2107,697,699,673,1696,1659,1680,1681,2135,2136,1788,1790] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.431,0.361,0.902]
select surf_pocket5, protein and id [1162,1169,1171,1172,1174,1336,1331,1196,1198,1199,1202,1195,1228,1328,1327,1355,1357,1358,1401,1435,1326,1225,2220,2222,2224,1432,1433,1434,1460,1165,1166] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.392,0.278,0.702]
select surf_pocket6, protein and id [1276,1277,1815,2156,2157,2190,2164,1779,1782,1253,1255,1275,1391,1393] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.576,0.361,0.902]
select surf_pocket7, protein and id [1487,1490,1515,1516,1517,1504,1505,1523,1506,3615,3617,3618,3619,3623,3624,203,3620,3614,3613,3655,3637,3610,3666,3669] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.506,0.278,0.702]
select surf_pocket8, protein and id [1167,1164,1165,1166,2255,2258,2279,3661,1163,3682,3687,3685,3662,3651,3652,3654,3659,2233] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.722,0.361,0.902]
select surf_pocket9, protein and id [103,164,321,106,109,159,161,329,318,100,286,207,186,259,260,183,255,282,293,283] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.616,0.278,0.702]
select surf_pocket10, protein and id [989,1307,1304,965,987,1944,1945,1947,1262,967,968,969,1290,1292] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.863,0.361,0.902]
select surf_pocket11, protein and id [3021,3195,3196,3049,3019,3193,3194,3200,3037,3039,3044,3041,3205,3042,3043,3048,3127,3123,3173,3198,3169,3172,3128] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.671]
select surf_pocket12, protein and id [3282,543,3284,3287,3289,3290,3291,3292,3318,514,3218,3219,3221,3229,3233,3293,3298,542] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.792]
select surf_pocket13, protein and id [1035,1036,3450,2499,2500,2502,3481,3482,3483,3484,3755,1009,1011,1012,1013,1014,2497,2498,1069,1071,1072,3491,3739,3740,3761,3763,1034,1038,1039,1070,1073] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.561]
select surf_pocket14, protein and id [1289,1290,1286,1939,1992,1930,1288,1292,1284,1869,1870,1872,1873,1874,1879,1880,1883,1935,1923,1944,1945,1946] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.647]
select surf_pocket15, protein and id [1553,169,192,191,200,201,204,177,175,178,180,181,171,203,1505] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.447]
select surf_pocket16, protein and id [1542,1544,1529,1482,1530,1534,1473,1481,1517,1514,1464,1483,1700,1531,1532,1533,1535,1456,1457,1721] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.506]
select surf_pocket17, protein and id [1288,1389,1392,1299,1842,1833,1840,1298,1313,1376,1804,1807,1808,1806,1831,1770,1772] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.337]
select surf_pocket18, protein and id [889,892,894,895,899,900,901,893,905,3353,902,903,939] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.361]
select surf_pocket19, protein and id [3618,3619,3624,203,3621,1505,1506,1553,192,191,200,201,204] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.337,0.278]
select surf_pocket20, protein and id [1988,1991,1933,2024,1951,1956,2021,2025,2019,2020,911,913,1996,2000,1994] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.506,0.361]
select surf_pocket21, protein and id [2012,2016,1894,2023,2044,2045,2047,1849,1851,1859,1861,1847,2105,1850,2036,2038,2039,1882,1885] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.447,0.278]
select surf_pocket22, protein and id [1589,1592,1593,1611,1579,1610,144,145,413,1581] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.647,0.361]
select surf_pocket23, protein and id [3119,2607,2608,2403,2404,2407,2380,2379,3108,3116,3117,3110] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.561,0.278]
select surf_pocket24, protein and id [1532,1533,1559,1560,1566,1618,1591,1648,1649,1650,1616,1619] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.792,0.361]
select surf_pocket25, protein and id [3001,3025,462,463,464,465,3014,3015,3017,301,303,343,345,3027] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.671,0.278]
select surf_pocket26, protein and id [488,511,479,481,489,3214,3231] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.863,0.902,0.361]
select surf_pocket27, protein and id [2883,85,49,446] 
set surface_color,  pcol27, surf_pocket27 


deselect

orient
