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

load "data/CYP3A4-I369F.pdbqt", protein
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

load "data/CYP3A4-I369F.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,622,725,727,728,729,736,731,718,623,719,785,789,721,722,723,1475,1706,650,653,654,1541,619,629,642,643,640,641,648,645,647,1560,1564,1621,1594,1596,2168,2201,2151,2199,2204,2174,2177,2179,3324,3329,3330,3331,3332,3333,879,2206,1246,1247,2187,2173,883,1969,3364,3365,1965,1968,1272,1273,1214,1237,1238,1243,2724,1495,1465,2715,2723,2726,2734,1471,3637,1468,1472,3631,2234,2235,2236,1461,1463,1464,2712,2716,2721,3634,3638,3641,2727,2739,2754,3269,3270,3278,3279,3312,3318,3282,3302,3313,2203,3276,3277,3323,3268,3319,3322,2674,3263,3334,2755,2759,2760,2761,2762,2763,632,2748,621,2740,634,1492,1494,1496,1493,1490,1491,228,229,230,231,233,1505,1535,1550,532,2751,2772,3285,633,394,396,398,418,631,412,413,416,419,403,1566,1570,1571,1568,173,2208,2232,2237,2242,2255,2262,3394,3370,3335] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3274,3271,3341,3342,3251,3252,3176,3203,3205,3139,3140,3177,3180,3275,3244,3215,3217,3218,3201,3281,3349,2563,2565,2532,2534,3181,3178,3179,2649,2648,2650,3411,3408,2618,2619,2620,3348,3351,3377,3347,3375,3385,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [2689,3073,2700,2704,3069,3586,3605,3606,3592,3600,3644,3604,2954,2988,2990,238,273,213,246,247,3611,3625,3633,2693,3076,3079,3082,223,220,234,2354,2324,2343,2352,2342,2311,2315,3587,3580,3575,3577,3583,3084] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1397,1428,1429,1351,1353,1431,1322,1323,1354,1221,1224,1324,1327,2216,2218,2220,1430,1191,1192,1194,1195,1158,1161,1163,1165,1167,1168,1170,1198,1332,1455,1456] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2108,1675,1676,1678,1726,693,695,669,674,688,677,1692,1654,1677,1650,2105,1751,1784,1787] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1811,2153,2160,1775,1778,1272,1273,2152,2186,1249,1251,1387,1271,1389] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [1160,3660,1159,2276,3661,3681,3686,1161,1162,2251,2253,2277,2282,2284,2286,2275,2249,2255,3650,3653,3658,2283,2285,2287,2227,2229] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [1940,1941,1943,1300,1303,1288,985,961,983,1258,963,964,965,1286] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3038,3041,3042,3043,3047,3048,3122,3126,3194,3195,3197,3172,3168,3171,3040,3204,3127,3036,3192,3193,3020,3018,3199] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [161,186,183,159,278,289,325,103,164,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3281,3283,3286,3288,3290,3291,3317,3217,3218,3220,539,3289,538,3292,3297,510,3228,3232] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1525,1478,1696,1526,1530,1531,1452,1717,1453,1469,1479,1483,1513,1460] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [1486,3622,3623,3614,3616,3617,3618,3613,3654,3609,3612,3658,3668,3665,1502,203,1500,1501] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1282,1285,1286,1935,1988,1926,1280,1284,1865,1866,1868,1875,1876,1879,1931,1869,1870,1940,1941,1942,1919,1288] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1502,203,204,1501,1549,192,169,177,175,178,181,171,3623,3617] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1008,1009,1031,1032,1010,3449,2495,2496,2498,3480,3481,3482,3483,3479,3743,3754,2493,2494,1065,1066,1067,1068,1069,3738,3739,3760,3762,1030,1034,1035,3490] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1284,1388,1295,1838,1385,1836,1827,1829,1294,1309,1372,1804,1766,1768,1800,1802,1803] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3107,3108,3109,2369,2375,2376,3116,2403,2603,3118,2399,2400,2401] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,1987,1929,2020,1947,1952,907,909,1990,1992,1996,2017,2021,2015,2016] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [2008,2012,2019,2040,2041,2043,1845,1847,1855,1857,1843,1846,2101,2032,2034,2035,1878,1890,1881] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [885,891,895,896,897,890,888,889,898,3349,3350,3352] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3074,272,3065,2962,2984,2985,2994,3006,3007] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1529,1556,1562,1612,1614,1615,1644,1645,1646,1528,1555,1587] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1606,1588,1589,1607,144,145,409,1575,1585,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3147,3117,3145,3151,2591,2604,3118,2438,2600,2602] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2503,2507,2474,2463,2480,2546,2571,2573,2465,2466,2550] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3000,3024,3026,297,459,3014,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3230,484,507,3213,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,85,442,2882] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
