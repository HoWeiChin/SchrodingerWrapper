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

load "data/CYP3A4-I301F.pdbqt", protein
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

load "data/CYP3A4-I301F.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [725,727,728,729,2168,2170,2172,621,623,3331,785,789,3313,736,719,718,722,723,721,1475,2202,650,1472,1706,620,622,619,629,642,643,640,641,645,648,653,654,647,1621,1541,1560,1564,1594,1596,731,2206,2209,2211,2176,2204,2151,2190,2207,3324,3330,3332,3333,3334,2177,879,883,3329,2180,2182,1214,1238,1246,3364,3365,1247,1243,1272,1968,1969,1965,1273,1237,1471,1495,3637,1465,1468,2718,2726,2734,3631,2239,1461,1463,1464,2258,3634,2719,2722,3638,3641,2724,2727,2739,2754,3269,3270,3278,3279,3312,3318,3282,3302,2237,2238,2720,2721,2677,3263,3276,3277,3323,3268,3319,3322,633,2760,2762,2763,398,631,632,634,1492,1494,1496,1493,1491,2740,228,229,230,231,233,1490,1535,1550,1570,1505,394,396,418,412,413,416,419,1566,1571,1568,403,173,2755,2759,2761,532,2748,2751,2772,3285,2235,2240,2245,3394,2265,3370,3335] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3274,3271,3341,3342,3275,3251,3252,3176,3203,3205,3139,3140,3177,3180,3215,3218,3201,3244,3217,3281,3411,2621,2622,2623,3178,3181,3179,3348,3349,3351,3385,2566,2568,2535,2537,3377,3347,3375,3408,2652,2651,2653,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3644,3073,2703,2707,3605,3606,3586,3592,3600,3604,2954,2988,2990,238,273,3625,3633,213,246,247,3611,2696,3069,3076,3079,3082,2692,223,234,220,3580,2318,3577,3583,3587,2314,3575,3084,2357,2327,2346,2355,2345] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1221,1224,2219,2221,2223,1428,1429,1430,1431,1455,1456,1351,1353,1323,1327,1354,1195,1198,1324,1397,1322,1191,1192,1194,1158,1161,1163,1165,1167,1168,1170,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [688,677,681,682,683,684,685,686,687,2108,1692,1726,2105,693,695,669,674,1654,1675,1676,1677,1678,1650,1751,1784,1787] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1271,1273,1387,1389,1778,1272,1249,1251,1811,2153,2160,1775,2152,2189] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2258,2719,2722,3638,3641,3650,3653,3658,1461,1464,2229,2230,2232,2720,1160,2278,1159,2279,2252,1161,1162,3660,3661,3681,2254,2257] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [1258,1286,963,1940,1941,1943,1300,1288,985,1303,983,961,965,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3194,3195,3197,3122,3172,3168,3171,3041,3042,3047,3048,3127,3126,3040,3204,3192,3193,3199,3036,3038,3020,3043,3018] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,109,289,103,256,100,106,325,314,317,183,207,255,278,279,282] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3281,3283,3286,3288,3290,3291,3317,3218,3220,3217,539,3289,538,3292,3297,510,3228,3232] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1478,1696,1525,1526,1530,1531,1452,1717,1453,1469,1479,1483,1513,1460] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3614,3616,3617,3618,3622,3623,1486,3613,3654,3612,3658,3609,3668,3665,1500,1501,1502,203] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1280,1282,1865,1866,1868,1869,1870,1875,1876,1879,1926,1931,1919,1285,1286,1935,1940,1941,1942,1988,1284,1288] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1549,204,191,200,201,203,177,192,1501,1502,169,175,178,181,171,3617,3623] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3449,2498,2499,2501,3480,3481,3482,3483,3479,3743,3754,2496,2497,1065,1066,1067,1068,1069,3738,3739,3760,3762,1030,1034,1035,3490,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1284,1294,1295,1309,1372,1388,1803,1804,1766,1768,1385,1836,1800,1802,1838,1827,1829] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3107,3108,3109,3116,2372,2378,2379,2406,2606,3118,2402,2403,2404] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,907,909,1990,1996,2017,2020,1992,2021,2015,2016,1947,1952,1987,1929] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1843,1881,2012,1890,2019,2043,1855,1845,1847,1857,2101,1846,2032,2034,2035,2008,2040,2041,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [3352,3350,890,885,888,891,895,896,897,898,889,3349] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [300,301,270,304,305,307,268,271,274,298,3065,2962,2984,2985,2994,3006,3007,3074,272] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1556,1614,1587,1528,1529,1555,1562,1644,1645,1646,1612,1615] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1585,1588,1589,1607,1606,409,144,145,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3147,3117,3145,2607,3118,2603,3151,2594,2441,2605] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2466,2477,2483,2549,2574,2576,2468,2469,2553,2506,2510] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3024,3026,459,339,340,3000,297,461,3014,458,460,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3230,484,507,3213,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [85,2882,442,49] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
