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

load "data/CYP3A4-T309A.pdbqt", protein
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

load "data/CYP3A4-T309A.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,725,727,728,729,736,731,621,718,623,719,785,789,3308,721,722,723,1475,1706,650,653,654,1472,1541,622,619,629,642,643,640,641,645,648,647,1621,1594,1564,1560,1596,1465,2195,2199,2203,2173,2204,3319,3325,3326,3327,3328,3329,2168,2151,2174,2177,2179,879,883,3324,2206,1246,1247,2187,1243,1272,1969,3359,3360,1965,1968,1273,1214,1237,1238,2719,1495,2713,2721,2729,1471,3632,1468,3626,2234,2715,1461,1464,1463,1462,2716,2253,3629,2714,2717,3633,3636,2722,2734,2749,3264,3265,3273,3274,3307,3313,3277,3280,3297,3271,3272,3318,3263,3314,3317,2672,3258,2750,2754,2755,2756,2757,2758,632,2743,2735,634,1492,1494,1496,1493,1490,1491,228,229,230,231,233,1505,1535,1550,532,2746,2767,633,394,396,398,418,631,412,413,416,419,403,1566,1570,1571,1568,173,2208,2232,2240,3389,2260,3365,3330] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3198,3200,3134,3135,3171,3172,3175,3246,3247,3270,3269,3266,3336,3337,3239,3210,3212,3213,3196,3276,3406,2616,2617,2618,3173,3176,3174,3343,3344,3346,3380,2561,2563,2530,2532,2647,2646,2648,3403,3372,3342,3370,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3068,3064,3581,3639,2687,2698,2702,3599,3600,3601,3587,3595,2949,2983,2985,238,273,3620,3628,213,246,247,3606,2691,3071,3074,3077,223,220,234,3575,2309,2313,3570,3572,3578,3582,2340,3079,2352,2322,2341,2350] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2216,2220,1456,1428,1429,1430,1431,2218,1455,1397,1351,1353,1322,1323,1354,1221,1224,1195,1324,1327,1191,1192,1194,1158,1165,1167,1168,1170,1161,1163,1198,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2108,1675,1678,1726,674,1692,693,695,669,688,677,1654,1676,1677,1650,2105,1751,1784,1787] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1811,2153,1387,1389,1775,1778,1271,1273,2186,1272,2152,2160,1249,1251] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2253,2714,2717,3633,3636,3645,3648,3653,2715,1461,1464,2226,2227,2229,2247,2249,2252,2273,3655,3656,1160,1161,1162,1159,3676,2274] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [985,1300,1303,983,961,1940,1941,1943,1258,1286,1288,965,963,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3199,3117,3167,3166,3189,3190,3192,3163,3033,3035,3036,3037,3122,3121,3038,3042,3043,3031,3187,3188,3015,3013,3194] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3276,3278,3281,3283,3285,3286,3312,3212,3213,3215,539,3284,538,3287,3292,510,3223,3227] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [3609,3611,3612,3613,3617,3618,1486,3608,3649,3607,3653,3604,3663,3660,1502,203,1500,1501] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [1477,1538,1540,1525,1478,1696,1526,1530,1531,1452,1717,1453,1469,1479,1483,1513,1460] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1280,1282,1284,1868,1869,1935,1988,1926,1931,1919,1865,1866,1870,1875,1876,1879,1285,1286,1288,1940,1941,1942] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1502,203,204,1501,1549,192,177,175,178,181,169,171,3612,3618] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3444,2493,2494,2496,3475,3476,3477,3478,3474,3738,3749,2491,2492,1065,1066,1067,1068,1069,3733,3734,3755,3757,1030,1034,1035,3485,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1836,1284,1295,1294,1309,1385,1372,1388,1804,1766,1768,1800,1802,1803,1838,1827,1829] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3102,3103,3104,3111,2367,2373,2374,2401,2601,3113,2397,2398,2399] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,907,909,1990,1992,1996,2017,2020,2021,2015,2016,1987,1929,1947,1952] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [2008,2012,1890,2019,2040,2041,2043,1845,1847,1855,1857,1843,1846,2101,2032,2034,2035,1881,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [891,895,896,3345,890,885,888,897,898,889,3347,3344] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3069,272,3060,2957,2979,2980,2989,3001,3002] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1528,1529,1555,1556,1562,1612,1614,1644,1645,1646,1615,1587] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1606,1585,1588,1589,1607,144,145,409,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3142,3112,3140,2602,3113,2598,3146,2589,2436,2600] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2461,2472,2478,2544,2569,2571,2463,2464,2548,2501,2505] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [2995,3019,3021,297,459,3009,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3225,484,507,3208,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2877,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
