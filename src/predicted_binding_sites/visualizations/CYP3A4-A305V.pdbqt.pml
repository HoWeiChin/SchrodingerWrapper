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

load "data/CYP3A4-A305V.pdbqt", protein
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

load "data/CYP3A4-A305V.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,725,727,728,729,736,731,621,718,3330,623,789,3312,719,785,721,722,723,1475,2199,650,654,1472,1706,622,619,629,642,643,640,641,645,648,653,647,1621,1541,1560,1564,1594,1596,2203,2208,2173,2201,2204,2205,2206,879,883,3323,3328,3329,3331,3332,3333,2177,2210,1214,1246,1247,1969,3363,3364,2151,2174,2179,1243,1272,2187,1273,1965,1968,1237,1238,1471,1495,3636,1465,1468,2717,2725,2733,3630,2238,1461,1463,1464,2257,3633,2718,2721,3637,3640,2723,2726,2738,2753,3268,3269,3277,3278,3311,3317,3281,3301,2236,2237,2719,2720,2676,3262,3275,3276,3322,3267,3318,3321,633,2759,2761,2762,398,631,632,634,1492,1494,1496,1493,1491,2739,228,229,230,231,233,1490,1535,1550,1570,1505,394,396,418,412,413,416,419,1566,1571,1568,403,173,2754,2758,2760,532,2747,2750,2771,3284,2234,2239,2244,3393,2264,3369,3334] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3273,3270,3340,3341,3274,3250,3251,3175,3202,3204,3138,3139,3176,3179,3214,3217,3200,3243,3216,3280,3410,2620,2621,2622,3177,3180,3178,3347,3348,3350,3384,2565,2567,2534,2536,3376,3346,3374,3407,2651,2650,2652,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3643,3072,2702,2706,3604,3605,3585,3591,3599,3603,2953,2987,2989,238,273,3624,3632,213,246,247,3610,2695,3068,3075,3078,3081,2691,223,234,220,3579,2317,3576,3582,3586,2313,3574,3083,2356,2326,2345,2354,2344] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1224,2218,2220,2222,1428,1429,1430,1431,1455,1456,1397,1351,1353,1322,1323,1327,1354,1221,1195,1198,1324,1191,1192,1194,1158,1161,1163,1165,1167,1168,1170,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [2105,681,682,683,684,685,686,687,2108,1726,669,674,1692,693,695,688,677,1654,1675,1676,1677,1678,1650,1784,1787,1751] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1272,1271,1273,2153,1387,1389,1778,2186,2152,2160,1775,1811,1251,1249] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2257,2718,2721,3637,3640,3649,3652,3657,1461,1464,2228,2229,2231,2719,1160,2277,1159,2278,2251,1161,1162,3659,3660,3680,2253,2256] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [985,1300,1303,983,961,1940,1941,1943,1258,1286,963,1288,965,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3193,3194,3196,3121,3171,3167,3170,3040,3041,3046,3047,3126,3125,3039,3203,3191,3192,3198,3035,3037,3019,3042,3017] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,109,289,103,256,100,106,325,314,317,183,207,255,278,279,282] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3280,3282,3285,3287,3289,3290,3316,3217,3219,3216,539,3288,538,3291,3296,510,3227,3231] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1478,1696,1525,1526,1530,1531,1452,1453,1717,1469,1479,1483,1513,1460] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3613,3615,3616,3617,3621,3622,1486,3612,3653,3611,3657,3608,3667,3664,1500,1501,1502,203] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1280,1282,1865,1868,1869,1870,1875,1876,1879,1926,1931,1919,1866,1285,1286,1935,1942,1988,1284,1288,1940,1941] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1549,204,191,200,201,203,177,192,1501,1502,169,175,178,181,171,3616,3622] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3448,2497,2498,2500,3479,3480,3481,3482,3478,3742,3753,2495,2496,1065,1066,1067,1068,1069,3737,3738,3759,3761,1030,1034,1035,3489,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1309,1372,1385,1284,1294,1295,1800,1802,1803,1804,1838,1829,1766,1768,1836,1827,1388] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3106,3107,3108,3115,2371,2377,2378,2405,2605,3117,2401,2402,2403] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,1992,2017,2020,2021,2015,2016,907,909,1990,1996,1947,1952,1987,1929] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1855,1857,1843,1881,1890,2040,2041,2043,2008,2012,2019,1845,1847,2101,1846,2034,2035,2032,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [885,888,891,895,896,897,898,890,3351,3349,889,3348] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [300,301,270,304,305,307,268,271,274,298,3064,2961,2983,2984,2993,3005,3006,3073,272] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1556,1612,1614,1587,1528,1529,1555,1562,1615,1644,1645,1646] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1585,1588,1589,1607,1606,409,144,145,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3146,3116,3144,2606,3117,2602,3150,2593,2440,2604] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2465,2476,2482,2548,2573,2575,2467,2468,2552,2505,2509] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3023,3025,459,339,340,2999,297,461,3013,458,460,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3229,484,507,3212,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [85,2881,442,49] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1017,1232] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
