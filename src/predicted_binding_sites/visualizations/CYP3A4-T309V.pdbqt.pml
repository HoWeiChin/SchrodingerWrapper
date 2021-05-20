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

load "data/CYP3A4-T309V.pdbqt", protein
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

load "data/CYP3A4-T309V.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [2168,620,725,727,728,729,736,731,621,718,3328,623,789,3310,719,785,721,722,723,1475,2199,650,654,1472,1706,622,619,629,642,643,640,641,645,648,653,647,1621,1541,1560,1564,1594,1596,2721,1495,1465,1493,2715,2720,2723,2731,2737,1471,3634,1468,1492,1494,1496,1490,1491,229,231,228,230,233,1505,2752,3266,3276,3315,2769,3299,2724,2736,3275,2745,2748,2751,3267,3309,532,3279,3282,633,2756,2757,2758,2759,2760,398,631,632,634,396,1566,1570,1571,173,1535,1550,394,418,412,413,416,419,403,1568,2203,2173,2201,2151,2204,3321,3327,3329,3330,3331,2174,879,883,3326,2177,2179,2206,1246,1247,2187,1969,3361,3362,1965,1968,1272,1273,2208,2235,2236,1463,2719,2712,2716,2262,2242,3273,3274,3320,3367,3265,3316,3319,3332,2674,3260,1214,3391,1237,1238,1243] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3271,2649,3248,3249,2648,2650,2618,2619,2620,3178,3200,3202,3136,3137,3175,3176,3177,3173,3174,3268,3338,3339,3345,3346,3348,3374,3344,3372,3272,896,917,3382,3408,3405,2563,2565,2532,2534,3212,3215,3198,3278,3241,3214] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [2689,3070,2700,2704,3066,2354,2324,2352,2315,3641,3583,3589,3597,3602,3603,2311,3584,3577,3572,3574,3580,3601,2693,3081,3073,3076,3079,2343,2342,2951,2985,2987,238,273,234,3622,3630,246,3608,223,213,220,247] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1167,1429,1431,1332,1327,1158,1165,1168,1170,1191,1192,1194,1195,1198,1397,1428,1351,1353,1322,1323,1354,1221,1224,1324,2216,2218,2220,1456,1430,1455,1161,1163] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [2105,681,682,683,684,685,686,687,2108,1726,669,674,1692,693,695,688,677,1654,1675,1676,1677,1678,1650,1751,1784,1787] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1811,2153,2160,1775,1778,1272,1273,2152,2186,1249,1251,1271,1387,1389] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [3657,1159,3658,3678,3647,3650,3655,2227,1160,1161,1162,2229,2251,2275,2249,2255,2276] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [985,1300,1303,961,983,1940,1941,1943,1258,1286,1288,963,965,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3194,3044,3045,3169,3168,3037,3201,3038,3039,3119,3123,3191,3192,3165,3124,3189,3190,3196,3035,3017,3015,3040,3033] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [282,317,207,161,186,255,256,183,278,289,279,314,325,159,103,164,100,106,109] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [539,3285,3286,3287,3288,538,3289,3294,510,3215,3217,3225,3229,3278,3280,3283,3314,3214] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1478,1696,1525,1526,1530,1531,1469,1479,1483,1513,1452,1717,1453,1460] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3611,3613,3615,3619,3620,1486,1500,1501,203,3614,1502,3610,3651,3606,3609,3655,3665,3662] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1280,1282,1284,1869,1935,1988,1926,1931,1919,1866,1875,1876,1879,1865,1868,1870,1285,1286,1288,1940,1941,1942] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1501,201,203,204,191,3614,1502,3620,200,169,177,175,178,181,192,1549,171] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [2495,2496,2498,3477,3478,3479,3480,2494,3740,3476,3751,1031,1032,1005,1007,1008,1009,1010,3446,2493,1030,1034,1035,1066,1069,1065,1068,3487,3735,3736,1067,3757,3759] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1836,1284,1838,1827,1829,1388,1294,1295,1309,1385,1372,1804,1766,1768,1800,1802,1803] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [2369,2376,2375,2399,2403,2603,3115,2400,2401,3104,3113,3105,3106] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,1987,1929,2020,1947,1952,907,909,1990,1992,1996,2017,2021,2015,2016] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [2008,2012,1890,2019,2040,2041,2043,1845,1847,1855,1857,1843,1846,2101,2032,2034,2035,1881,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [890,885,888,891,895,896,3347,897,889,3349,3346,898] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [3071,268,271,272,274,3062,2982,2991,3003,3004,2959,2981,301,304,305,307,298,300,270] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1556,1612,1614,1528,1529,1555,1562,1615,1644,1645,1646,1587] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1585,1588,1589,1607,1606,1575,1577,144,145,409] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [2591,2438,2604,3115,2600,2602,3144,3148,3142,3114] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2503,2507,2474,2463,2480,2546,2550,2465,2466,2571,2573] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [297,458,459,460,461,3011,339,340,341,3021,3023,2997] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3210,475,477,3227,507,484] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,85,442,2879] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1019,1020,1017,1052,1333,1175,1232] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
