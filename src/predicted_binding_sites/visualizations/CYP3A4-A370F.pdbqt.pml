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

load "data/CYP3A4-A370F.pdbqt", protein
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

load "data/CYP3A4-A370F.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,725,727,728,729,736,731,621,718,623,719,785,789,3316,721,722,723,1475,1706,650,653,654,1472,1541,619,629,642,643,640,641,645,648,647,1621,1594,1564,1560,1596,2203,2168,2173,2201,2199,2204,2174,2177,3327,3333,3334,3335,3336,3337,879,883,3332,2206,1246,1247,2187,1243,1969,3367,3368,1968,2151,2179,1272,1273,1965,1214,1237,1238,2726,2727,2728,2730,2742,1495,1493,2723,2737,1492,1494,1496,1491,231,230,3282,2754,2757,3285,3288,3305,2718,2721,2724,1463,1464,1465,2715,2716,1461,1471,3640,1468,3637,3634,3641,3326,3271,3272,3273,3281,3315,3321,3322,3325,3266,633,2763,2765,2766,396,398,631,632,634,2743,228,229,233,1490,1535,1550,1566,1570,1571,1505,173,418,412,413,416,419,394,1568,403,532,2775,2208,2232,2234,2235,2236,2237,2717,2242,3397,2674,2719,2262,3279,3280,3373,3338,2255,3644] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3277,3344,3345,3351,3352,3354,3380,2649,3278,3180,3181,3182,3183,2648,2650,3206,3142,3143,3388,2565,2532,2534,2618,2619,2620,3184,3350,3378,3414,3411,2563,3179,3204,3208,3247,3254,3255,3274,3284,3218,3220,3221,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [2700,2704,2343,2342,2311,2315,3583,3589,3580,3586,3578,3595,3590,2693,3087,2324,2352,3072,3079,3082,3085,2354,3647,2689,2957,2991,2993,3076,3636,3603,3607,3608,3609,3614,238,273,234,3628,223,213,220,246,247] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2216,2220,1456,1428,1429,1430,1431,2218,1455,1397,1351,1353,1322,1323,1354,1221,1224,1195,1324,1327,1158,1161,1163,1170,1191,1192,1194,1198,1165,1167,1168,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2108,1675,1678,1726,674,1692,693,695,669,688,677,1654,1676,1677,1650,1784,1787,1751,2105] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1272,1271,1273,1811,2153,2186,1387,1389,1775,1778,2152,2160,1249,1251] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2226,1160,1161,1162,2229,1159,3653,3656,3663,3664,3661,3684,2227,2249,2255,2251,2254,2275,3644,2276,2717,2719,1461,3641,1464,2716] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [985,1300,1303,983,961,1940,1941,1943,1258,1286,1288,965,963,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3195,3196,3202,3207,3197,3198,3200,3039,3041,3043,3023,3044,3045,3046,3050,3051,3021,3130,3125,3129,3175,3171,3174] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,164,106,109,325,103,100,282,186,317,183,207,161,278,289,279,255,256,314] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3286,3289,3291,3292,3293,3294,3295,3300,3220,3221,3223,3231,3235,3284,3320,539,538,510] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1525,1478,1696,1526,1530,1531,1452,1717,1453,1460,1469,1483,1513,1479] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3616,3612,3615,3617,3625,1486,3657,1500,1501,3621,203,3619,3620,3626,1502,3661,3668,3671] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1280,1282,1284,1868,1869,1935,1988,1926,1931,1919,1865,1866,1870,1875,1876,1879,1285,1286,1288,1940,1941,1942] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1549,204,178,181,169,192,171,175,191,200,201,177,1501,203,3620,3626,1502] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3452,2495,2496,2498,3485,3746,3482,3757,2494,3483,3484,3486,2493,1035,1065,1066,1067,1068,1069,3493,3741,3742,3763,3765,1030,1034,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1836,1284,1295,1294,1309,1385,1372,1388,1800,1802,1803,1804,1766,1768,1838,1827,1829] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3110,3111,3112,3119,3121,2376,2369,2375,2403,2399,2400,2401,2603] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,907,909,1990,1992,1996,2017,2020,2021,2015,2016,1987,1929,1947,1952] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1846,2008,2012,1890,2019,2040,2041,2043,1845,1847,1855,1857,1843,2101,2032,2034,2035,1881,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [890,885,888,891,895,896,3353,897,898,889,3355,3352] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [271,272,274,2965,2987,2988,2997,3009,3010,3077,3068,301,304,305,307,268,298,300,270] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1528,1529,1555,1556,1562,1612,1614,1644,1645,1646,1615,1587] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1606,1585,1588,1589,1607,144,145,409,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [2438,2591,2604,2600,2602,3150,3154,3120,3148,3121] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2550,2503,2507,2474,2465,2466,2463,2480,2571,2573,2546] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3003,3027,3029,297,3017,339,341,458,459,460,461,340] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [484,507,475,477,3233,3216] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,85,442,2885] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1019,1020,1052,1333,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
