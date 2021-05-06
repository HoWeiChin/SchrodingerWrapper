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

load "data/CYP3A4.7.pdbqt", protein
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

load "data/CYP3A4.7.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [624,729,731,732,733,740,735,625,722,627,723,789,793,3314,725,726,727,1479,1710,654,657,658,1476,1545,626,623,633,646,647,644,645,649,652,651,1625,1598,1568,1564,1600,2207,2172,2177,2205,2203,2208,2178,2181,3325,3331,3332,3333,3334,3335,883,887,3330,2210,1250,1251,2191,1247,1973,3365,3366,1972,2155,2183,1276,1277,1969,1218,1241,1242,1475,1499,3638,1469,1472,2719,2727,2735,3632,2240,1465,1467,1468,2259,3635,2720,2723,3639,3642,2725,2728,2740,2755,3270,3271,3279,3280,3313,3319,3283,3303,2238,2239,2721,2722,2678,3264,3277,3278,3324,3269,3320,3323,2756,2760,2761,2762,2763,2764,636,2749,2741,638,1496,1498,1500,1497,1494,1495,232,233,234,235,237,1509,1539,1554,536,2752,2773,3286,637,398,400,402,422,635,416,417,420,423,407,1570,1574,1575,1572,173,2212,2236,2241,2246,3395,2266,3371,3336] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.400,0.702]
select surf_pocket2, protein and id [3275,3272,3342,3343,3276,3252,3253,3177,3204,3206,3140,3141,3178,3181,3216,3219,3202,3245,3218,3282,3412,2622,2623,2624,3179,3182,3180,3349,3350,3352,3386,2567,2569,2536,2538,2653,2652,2654,3409,3378,3348,3376,900,921] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.451,0.902]
select surf_pocket3, protein and id [3074,2704,2708,3606,3607,3587,3593,3601,2955,2989,2991,277,250,251,2697,3070,3077,3080,3083,2693,2315,3578,3581,3584,3576,2319,3588,2346,3085,2358,2328,2347,2356] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.302,0.702]
select surf_pocket4, protein and id [2220,2224,1460,1432,1433,1434,1435,2222,1459,1401,1355,1357,1326,1327,1358,1225,1228,1199,1328,1331,1195,1196,1198,1162,1169,1171,1172,1174,1165,1167,1202,1336] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.396,0.361,0.902]
select surf_pocket5, protein and id [685,686,687,688,689,690,691,2112,1679,1682,1730,678,1696,697,699,673,692,681,1658,1680,1681,1654,1788,1791,1755,2109] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.357,0.278,0.702]
select surf_pocket6, protein and id [1276,1275,1277,1815,2157,2190,1391,1393,1779,1782,2156,2164,1253,1255] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.522,0.361,0.902]
select surf_pocket7, protein and id [2259,2720,2723,3639,3642,3651,3654,3659,1465,1468,2230,2231,2233,2721,2253,1164,1165,1166,2255,2258,2279,1163,3661,3662,3682,2280] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.455,0.278,0.702]
select surf_pocket8, protein and id [989,1304,1307,987,965,1944,1945,1947,1262,1290,1292,969,967,968] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.647,0.361,0.902]
select surf_pocket9, protein and id [3195,3196,3198,3123,3173,3169,3172,3042,3043,3048,3049,3128,3127,3041,3205,3193,3194,3200,3037,3039,3021,3044,3019] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.549,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,282,293,329,103,259,260,318,321,100,106,109,283,286,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.773,0.361,0.902]
select surf_pocket11, protein and id [3615,3617,3618,3619,3623,3624,1490,1511,1514,3655,3614,3613,3659,3610,3669,3666,1506,203,1504,1505] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.647,0.278,0.702]
select surf_pocket12, protein and id [3282,3284,3287,3289,3291,3292,3318,3219,3221,3218,543,3290,542,3293,3298,514,3229,3233] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.898,0.361,0.902]
select surf_pocket13, protein and id [1481,1542,1544,1529,1482,1700,1530,1534,1535,1456,1721,1457,1473,1483,1487,1517,1464] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.655]
select surf_pocket14, protein and id [1284,1286,1288,1872,1873,1939,1992,1930,1935,1923,1869,1870,1874,1879,1880,1883,1289,1290,1292,1944,1945,1946] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.776]
select surf_pocket15, protein and id [1009,1011,1013,1035,1036,1014,3450,2499,2500,2502,3481,3482,3483,3484,3480,3744,3755,2497,2498,1069,1070,1071,1072,1073,3739,3740,3761,3763,1034,1038,1039,3491,1012] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.557]
select surf_pocket16, protein and id [191,200,201,203,204,1505,1553,192,177,175,178,181,169,171] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.651]
select surf_pocket17, protein and id [1840,1288,1299,1298,1313,1389,1376,1392,1804,1806,1807,1808,1770,1772,1842,1831,1833] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.459]
select surf_pocket18, protein and id [3108,3109,3110,3117,2373,2379,2380,2407,2607,3119,2403,2404,2405] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.525]
select surf_pocket19, protein and id [1988,911,913,1994,1996,2000,2021,2024,2025,2019,2020,1991,1933,1951,1956] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.361]
select surf_pocket20, protein and id [1850,2012,2016,1894,2023,2044,2045,2047,1849,1851,1859,1861,1847,2105,2036,2038,2039,1885,1882] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.400]
select surf_pocket21, protein and id [191,200,201,1506,203,204,1505,1553,192,3618,3619,3624,3621] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.298,0.278]
select surf_pocket22, protein and id [894,889,892,895,899,900,3351,901,902,893,3353,3350] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.443,0.361]
select surf_pocket23, protein and id [272,275,278,302,274,308,309,311,304,305,3066,2963,2985,2986,2995,3007,3008,3075,276] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.392,0.278]
select surf_pocket24, protein and id [1532,1533,1559,1560,1566,1616,1618,1648,1649,1650,1619,1591] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.569,0.361]
select surf_pocket25, protein and id [1610,1589,1592,1593,1611,144,145,413,1579,1581] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.490,0.278]
select surf_pocket26, protein and id [3148,3118,3146,2608,3119,2604,3152,2595,2442,2606] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.694,0.361]
select surf_pocket27, protein and id [2467,2478,2484,2550,2575,2577,2469,2470,2554,2507,2511] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.588,0.278]
select surf_pocket28, protein and id [3001,3025,3027,301,463,3015,462,464,465,343,344,345] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.820,0.361]
select surf_pocket29, protein and id [3231,488,511,3214,479,481] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.686,0.278]
select surf_pocket30, protein and id [49,446,2883,85] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.855,0.902,0.361]
select surf_pocket31, protein and id [1179,1024,1337,1023,1056,1236,1021] 
set surface_color,  pcol31, surf_pocket31 


deselect

orient
