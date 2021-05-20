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

load "data/CYP3A4-F304A.pdbqt", protein
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

load "data/CYP3A4-F304A.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [2167,620,725,727,728,729,736,731,621,718,623,719,785,789,3304,721,722,723,1475,1706,1710,650,653,654,1472,1541,622,619,629,642,643,640,641,645,648,647,1621,1594,1564,1560,1596,2197,2173,2195,2193,1452,2198,3315,3320,3321,3322,3323,3324,3325,2168,2151,2174,879,883,2177,2179,2200,1246,1247,2187,1243,1272,1969,3355,3356,1965,1968,1273,1214,1237,1238,2715,2718,2730,1495,1465,2709,2717,2725,1471,3628,1468,3260,3261,3303,3309,3273,3293,3269,3270,2745,2228,2229,2230,2711,1463,1458,1462,2712,3267,3268,3314,3259,3310,3313,3254,2668,2746,2750,2751,2752,2753,2754,632,2739,2731,634,1492,1494,1496,1493,1490,1491,228,229,230,231,233,1505,1535,1550,532,2742,2763,3276,633,394,396,398,418,631,412,413,416,419,403,1566,1570,1571,1568,173,2202,2226,2231,2236,3385,2256,3361,3326] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3265,3262,3332,3333,3266,3194,3130,3168,3167,3171,3242,3243,3131,3272,3235,3206,3208,3209,3192,3196,3402,2612,2613,2614,3169,3172,3170,3339,3340,3342,3376,2557,2559,2526,2528,2643,2642,2644,3399,3368,3338,3366,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [2683,3064,2694,2698,3060,3596,3597,3577,3583,3591,3595,3635,2687,3067,3070,3073,2945,2979,2981,238,273,3616,3624,213,246,247,3602,223,220,234,3571,2305,2309,3566,3568,3574,3578,2336,3075,2348,2318,2337,2346] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2210,2214,1456,1428,1429,1430,1431,2212,1455,1397,1351,1353,1322,1323,1354,1221,1224,1195,1324,1327,1191,1192,1194,1158,1165,1167,1168,1170,1161,1163,1198,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2108,1675,1678,1726,674,1692,693,695,669,688,677,1654,1676,1677,1650,2105,1751,1784,1787] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1811,2153,1387,1389,1775,1778,1271,1273,2186,1272,2152,2160,1249,1251] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [3629,3632,3641,3644,3649,2249,2710,2713,2711,1461,1464,2220,2221,2223,2243,2245,2248,2269,3651,3652,1160,1161,1162,1159,3672,2270] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [985,1300,1303,983,961,1940,1941,1943,1258,1286,1288,965,963,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3195,3113,3163,3159,3162,3186,3188,3032,3118,3117,3038,3039,3031,3033,3183,3184,3190,3185,3011,3034,3009,3027,3029] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3274,3279,3281,3282,3308,3272,3277,3208,3209,3211,539,3280,538,3283,3288,510,3219,3223] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [3605,3607,3608,3609,3613,3614,1486,3604,3645,3600,3603,3649,3659,3656,1502,203,1500,1501] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [1280,1282,1284,1868,1869,1935,1988,1926,1931,1919,1865,1866,1870,1875,1876,1879,1285,1286,1288,1940,1941,1942] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [191,200,201,1502,203,204,1501,1549,192,177,175,178,181,169,171,3608,3614] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1477,1538,1540,1525,1478,1696,1526,1530,1531,1527,1528,1529,1452,1453,1717,1469,1513,1460] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3440,2489,2490,2492,3471,3472,3473,3474,3470,3734,3745,2487,2488,1065,1066,1067,1068,1069,3729,3730,3751,3753,1030,1034,1035,3481,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1836,1284,1295,1294,1309,1385,1372,1388,1804,1766,1768,1800,1802,1803,1838,1827,1829] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3098,3099,3100,3107,2363,2369,2370,2397,2597,3109,2393,2394,2395] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,907,909,1990,1992,1996,2017,2020,2021,2015,2016,1987,1929,1947,1952] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [2008,2012,1890,2019,2040,2041,2043,1845,1847,1855,1857,1843,1846,2101,2032,2034,2035,1881,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [891,895,896,3341,890,885,888,897,898,889,3343,3340] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3065,2976,272,3056,2975,2985,2997,2998,2953] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1528,1529,1555,1556,1562,1612,1614,1644,1645,1646,1615,1587] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1606,1585,1588,1589,1607,144,145,409,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3138,3108,3136,2598,3109,2594,3142,2585,2432,2596] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2457,2468,2474,2540,2565,2567,2459,2460,2544,2497,2501] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [2991,3015,3017,297,459,3005,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3221,484,507,3204,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2873,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
