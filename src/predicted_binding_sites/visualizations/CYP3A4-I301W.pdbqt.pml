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

load "data/CYP3A4-I301W.pdbqt", protein
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

load "data/CYP3A4-I301W.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [2169,2173,620,725,727,728,729,736,731,621,718,623,719,785,3316,721,722,723,3334,789,1475,1706,2201,2205,650,654,1472,622,619,629,642,643,640,641,645,648,653,647,1621,1541,1560,1564,1594,1596,2209,2214,2179,2207,2212,2151,2193,2210,3327,3333,3335,3336,3337,2180,879,883,3332,2183,2185,1214,1238,1246,3367,3368,1247,1243,1272,1968,1969,1965,1273,1237,1471,1495,3640,1465,1468,2721,2729,2737,3634,2242,1461,1463,1464,2261,3637,2722,2725,3641,3644,2727,2730,2742,2757,3272,3273,3281,3282,3315,3321,3285,3305,2724,2240,2241,2723,2680,3266,3279,3280,3326,3271,3322,3325,633,2763,2765,2766,398,631,632,634,1492,1494,1496,1493,1491,2743,228,229,230,231,233,1490,1535,1550,1570,1505,394,396,418,412,413,416,419,1566,1571,1568,403,173,2758,2762,2764,532,2751,2754,2775,3288,2238,2243,2248,3397,2268,3373,3338] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3277,3274,3344,3345,3278,3254,3255,3179,3206,3208,3142,3143,3180,3183,3218,3221,3204,3247,3220,3284,3414,2624,2625,2626,3181,3184,3182,3351,3352,3354,3388,2569,2571,2538,2540,3380,3350,3378,3411,2655,2654,2656,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3647,3076,2706,2710,3608,3609,3589,3595,3603,3607,2957,2991,2993,238,273,3628,3636,213,246,247,3614,2699,3072,3079,3082,3085,2695,223,234,220,3583,2321,3580,3586,3590,2317,3578,3087,2360,2330,2349,2358,2348] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1221,1224,2222,2224,2226,1428,1429,1430,1431,1455,1456,1351,1353,1323,1327,1354,1195,1198,1324,1397,1322,1191,1192,1194,1158,1161,1163,1165,1167,1168,1170,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [2105,681,682,683,684,685,686,687,2108,1726,669,674,1692,693,695,688,677,1654,1675,1676,1677,1678,1650,1751,1784,1787] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1271,1273,1387,1389,1778,1272,1249,1251,1811,2153,2160,1775,2152,2192] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2261,2722,2725,3641,3644,3653,3656,3661,1461,1464,2232,2233,2235,2723,1160,2281,1159,2282,2255,1161,1162,3663,3664,3684,2257,2260] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [1258,1286,963,1940,1941,1943,1300,1288,985,1303,983,961,965,964] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3197,3198,3200,3125,3175,3171,3174,3044,3045,3050,3051,3130,3129,3043,3207,3195,3196,3202,3039,3041,3023,3046,3021] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,109,289,103,256,100,106,325,314,317,183,207,255,278,279,282] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3284,3286,3289,3291,3293,3294,3320,3221,3223,3220,539,3292,538,3295,3300,510,3231,3235] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1478,1696,1525,1526,1530,1531,1452,1717,1453,1469,1479,1483,1513,1460] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3617,3619,3620,3621,3625,3626,1486,3616,3657,3615,3661,3612,3671,3668,1500,1501,1502,203] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1280,1282,1865,1866,1868,1869,1870,1875,1876,1879,1926,1931,1919,1285,1286,1935,1940,1941,1942,1988,1284,1288] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1549,204,191,200,201,203,177,192,1501,1502,169,175,178,181,171,3620,3626] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3452,2501,2502,2504,3483,3484,3485,3486,3482,3746,3757,2499,2500,1065,1066,1067,1068,1069,3741,3742,3763,3765,1030,1034,1035,3493,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1284,1294,1295,1309,1372,1388,1803,1804,1766,1768,1385,1836,1800,1802,1838,1827,1829] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3110,3111,3112,3119,2375,2381,2382,2409,2609,3121,2405,2406,2407] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1984,907,909,1990,1996,2017,2020,1992,2021,2015,2016,1947,1952,1987,1929] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1843,1881,2012,1890,2019,2043,1855,1845,1847,1857,2101,1846,2032,2034,2035,2008,2040,2041,1878] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [3355,3353,890,885,888,891,895,896,897,898,889,3352] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [300,301,270,304,305,307,268,271,274,298,3068,2965,2987,2988,2997,3009,3010,3077,272] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1556,1612,1614,1587,1528,1529,1555,1562,1615,1644,1645,1646] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1585,1588,1589,1607,1606,409,144,145,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3150,3120,3148,2610,3121,2606,3154,2597,2444,2608] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2469,2480,2486,2552,2577,2579,2471,2472,2556,2509,2513] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3027,3029,459,339,340,3003,297,461,3017,458,460,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3233,484,507,3216,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [85,2885,442,49] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
