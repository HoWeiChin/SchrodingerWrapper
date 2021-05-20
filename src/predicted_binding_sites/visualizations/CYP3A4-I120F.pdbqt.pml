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

load "data/CYP3A4-I120F.pdbqt", protein
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

load "data/CYP3A4-I120F.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [739,1478,740,1475,620,725,728,729,621,623,719,718,723,788,792,3313,721,722,622,619,629,642,643,640,641,645,648,653,647,1624,1544,1567,1563,1597,1599,2206,2171,2176,2204,2202,2207,2177,2180,3324,3330,3331,3332,3333,3334,882,886,3329,2209,1249,1250,2190,1246,1972,3364,3365,1971,2154,2182,1275,1276,1968,1217,1240,1241,1474,1498,3637,1468,1471,2718,2726,2734,3631,2239,1464,1466,1467,2258,3634,2719,2722,3638,3641,2724,2727,2739,2754,3269,3270,3278,3279,3312,3318,3282,3302,2237,2238,2720,2721,2677,3263,3276,3277,3323,3268,3319,3322,2755,2759,2760,2761,2762,2763,632,2748,2740,634,1495,1497,1499,1496,1493,1494,228,229,230,231,233,1508,1538,1553,532,2751,2772,3285,633,394,396,398,418,631,412,413,416,419,403,1569,1573,1574,1571,173,2211,2235,2240,2245,3394,2265,3370,3335] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3274,3271,3341,3342,3275,3251,3252,3176,3203,3205,3139,3140,3177,3180,3215,3218,3201,3244,3217,3281,3411,2621,2622,2623,3178,3181,3179,3348,3349,3351,3385,2566,2568,2535,2537,2652,2651,2653,3408,3377,3347,3375,899,920] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3644,3073,2703,2707,3605,3606,3586,3592,3600,3604,2954,2988,2990,238,273,3625,3633,213,246,247,3611,2696,3069,3076,3079,3082,2692,223,220,234,3580,2314,2318,3575,3577,3583,3587,2345,3084,2357,2327,2346,2355] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2219,2223,1459,1431,1432,1433,1434,2221,1458,1400,1354,1356,1325,1326,1357,1224,1227,1198,1327,1330,1194,1195,1197,1161,1168,1170,1171,1173,1164,1166,1201,1335] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2111,1729,669,674,677,1695,693,695,688,1657,1678,1679,1680,1681,1653,1787,1790,1754,2108] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1275,1274,1276,1814,2156,2189,1390,1392,1778,1781,2155,2163,1252,1254] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2258,2719,2722,3638,3641,3650,3653,3658,1464,1467,2229,2230,2232,2720,2252,2254,2257,2278,3660,3661,1163,1164,1165,1162,3681,2279] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [988,1303,1306,986,964,1943,1944,1946,1261,1289,1291,968,966,967] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3194,3195,3197,3122,3172,3168,3171,3041,3042,3047,3048,3127,3126,3040,3204,3192,3193,3199,3036,3038,3020,3043,3018] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3281,3283,3286,3288,3290,3291,3317,3218,3220,3217,539,3289,538,3292,3297,510,3228,3232] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1480,1541,1543,1528,1481,1699,1529,1533,1534,1455,1720,1456,1472,1482,1486,1516,1463] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3614,3616,3617,3618,3622,3623,1489,3613,3654,3612,3658,3609,3668,3665,1505,203,1503,1504] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1283,1285,1287,1871,1872,1938,1991,1929,1934,1922,1868,1869,1873,1878,1879,1882,1288,1289,1291,1943,1944,1945] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1505,203,204,1504,1552,192,177,175,178,181,169,171,3617,3623] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1008,1010,1012,1034,1035,1013,3449,2498,2499,2501,3480,3481,3482,3483,3479,3743,3754,2496,2497,1068,1069,1070,1071,1072,3738,3739,3760,3762,1033,1037,1038,3490,1011] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1839,1287,1298,1297,1312,1388,1375,1391,1803,1805,1806,1807,1769,1771,1841,1830,1832] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3107,3108,3109,3116,2372,2378,2379,2406,2606,3118,2402,2403,2404] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1987,910,912,1993,1995,1999,2020,2023,2024,2018,2019,1990,1932,1950,1955] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1849,2011,2015,1893,2022,2043,2044,2046,1848,1850,1858,1860,1846,2104,2035,2037,2038,1884,1881] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [893,888,891,894,898,899,3350,900,901,892,3352,3349] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3065,2962,2984,2985,2994,3006,3007,3074,272] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1559,1615,1617,1531,1532,1558,1565,1618,1647,1648,1649,1590] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1588,1591,1592,1610,1609,144,145,409,1578,1580] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3147,3117,3145,2607,3118,2603,3151,2594,2441,2605] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2466,2477,2483,2549,2574,2576,2468,2469,2553,2506,2510] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3000,3024,3026,297,459,3014,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3230,484,507,3213,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2882,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1178,1023,1336,1022,1055,1235,1020] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
