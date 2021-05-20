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

load "data/CYP3A4-T309F.pdbqt", protein
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

load "data/CYP3A4-T309F.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,725,727,728,729,736,731,621,718,623,719,785,789,3314,721,722,723,1475,1706,650,653,654,1472,1541,622,619,629,642,643,640,641,645,648,647,1621,1594,1564,1560,1596,2203,2168,2173,2199,2204,2174,2177,3325,3331,3332,3333,3334,3335,879,883,3330,2206,1246,1247,2187,1243,1969,3365,3366,1968,2151,2179,1272,1273,1965,1214,1237,1238,2725,2728,2740,1495,1465,2719,2727,2735,1471,3638,1468,3270,3271,3313,3319,3283,3303,3279,3280,2755,2234,2236,2239,2240,2721,2722,1463,3277,3278,3324,3269,3320,3323,3264,2678,2756,2760,2761,2762,2763,2764,632,2749,2741,634,1492,1494,1496,1493,1490,1491,228,229,230,231,233,1505,1535,1550,532,2752,2773,3286,633,394,396,398,418,631,412,413,416,419,403,1566,1570,1571,1568,173,2208,2232,2246,3395,2266,3371,3336] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3275,3272,3342,3343,3276,3204,3140,3178,3177,3181,3252,3253,3141,3282,3245,3216,3218,3219,3202,3206,3412,2622,2623,2624,3179,3182,3180,3349,3350,3352,3386,2567,2569,2536,2538,2653,2652,2654,3409,3378,3348,3376,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [2693,3074,2704,2708,3070,3645,3587,3593,3601,3605,3606,3607,2697,3077,3080,3083,2955,2989,2991,238,273,3626,3634,213,246,247,3612,223,220,234,3581,2315,2319,3576,3578,3584,3588,2346,3085,2358,2328,2347,2356] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1461,1464,2226,2227,3635,2229,3639,3642,3651,3654,3659,2237,2721,1463,2238,2259,2720,2723,3638,3632,2719,2735,2253,2255,2258,2279,3661,3662,1160,1161,1162,1159,3682,2280] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [2216,2220,1456,1428,1429,1430,1431,2218,1455,1397,1351,1353,1322,1323,1354,1221,1224,1195,1324,1327,1191,1192,1194,1158,1165,1167,1168,1170,1161,1163,1198,1332] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [681,682,683,684,685,686,687,2108,1675,1678,1726,674,1692,693,695,669,688,677,1654,1676,1677,1650,1784,1787,1751,2105] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [1272,1271,1273,1811,2153,2186,1387,1389,1775,1778,2152,2160,1249,1251] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [985,1300,1303,983,961,1940,1941,1943,1258,1286,1288,965,963,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3205,3123,3173,3169,3172,3196,3198,3042,3128,3127,3048,3049,3041,3043,3193,3194,3200,3195,3021,3044,3019,3037,3039] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3284,3289,3291,3292,3318,3282,3287,3218,3219,3221,539,3290,538,3293,3298,510,3229,3233] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1525,1478,1696,1526,1530,1531,1452,1717,1453,1469,1479,1483,1513,1460] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3615,3617,3618,3619,3623,3624,1486,3614,3655,3613,3659,3610,3669,3666,1502,203,1500,1501] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1280,1282,1284,1868,1869,1935,1988,1926,1931,1919,1865,1866,1870,1875,1876,1879,1285,1286,1288,1940,1941,1942] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1502,203,204,1501,1549,192,177,175,178,181,169,171,3618,3624] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3450,2499,2500,2502,3481,3482,3483,3484,3480,3744,3755,2497,2498,1065,1066,1067,1068,1069,3739,3740,3761,3763,1030,1034,1035,3491,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1836,1284,1295,1294,1309,1385,1372,1388,1800,1802,1803,1804,1766,1768,1838,1827,1829] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3108,3109,3110,3117,2373,2379,2380,2407,2607,3119,2403,2404,2405] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,907,909,1990,1992,1996,2017,2020,2021,2015,2016,1987,1929,1947,1952] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1846,2008,2012,1890,2019,2040,2041,2043,1845,1847,1855,1857,1843,2101,2032,2034,2035,1881,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [890,885,888,891,895,896,3351,897,898,889,3353,3350] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3075,2986,272,3066,2985,2995,3007,3008,2963] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1528,1529,1555,1556,1562,1612,1614,1644,1645,1646,1615,1587] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1606,1585,1588,1589,1607,144,145,409,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3148,3118,3146,2608,3119,2604,3152,2595,2442,2606] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2467,2478,2484,2550,2575,2577,2469,2470,2554,2507,2511] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3001,3025,3027,297,459,3015,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3231,484,507,3214,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2883,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
