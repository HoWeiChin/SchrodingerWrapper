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

load "data/CYP3A4-P107S.pdbqt", protein
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

load "data/CYP3A4-P107S.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,724,726,727,728,735,730,621,717,623,718,784,788,3309,720,721,722,1474,1705,649,652,653,1471,1540,622,619,629,630,640,641,644,647,646,1620,1593,1563,1559,1595,2202,2167,2172,2200,2198,2203,2173,2176,3320,3326,3327,3328,3329,3330,878,882,3325,2205,1245,1246,2186,1242,1968,3360,3361,1967,2150,2178,1271,1272,1964,1213,1236,1237,2717,2720,1460,1462,1463,1464,2714,2715,2722,2730,3634,1470,3633,1467,3630,3627,2723,3319,3318,2750,3259,3264,3265,3266,3274,3275,3308,3314,3315,3278,3298,2231,2233,2234,2235,2236,2716,2254,2718,2261,3637,3272,3273,3366,3331,2673,2756,2758,2759,632,1491,1493,1494,1495,1492,1490,2736,228,229,230,231,233,1489,1534,1549,1504,2735,2751,2755,2757,2744,2747,2768,532,3281,633,394,396,398,418,631,634,412,413,416,419,1565,1569,1570,1567,173,403,2207,2241,3390] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.400,0.702]
select surf_pocket2, protein and id [3270,3337,3338,3344,3345,3347,3373,3271,2648,2647,2649,3199,3135,3136,3173,3174,3175,3176,3240,3247,3248,3211,3213,3201,3214,3172,3197,3267,3277,3407,2617,2618,2619,3177,3381,2562,2564,2531,2533,3343,3371,3404,895,916] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.451,0.902]
select surf_pocket3, protein and id [2692,2699,2703,3582,3588,3583,3065,3072,3078,3080,3576,3573,3579,3075,2950,2984,2986,3069,273,3640,2688,238,3601,3602,3596,3600,246,3607,3621,3629,234,247,223,213,220,2353,2323,2342,2351,2341,2310,2314,3571] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.302,0.702]
select surf_pocket4, protein and id [2215,2219,1455,1427,1428,1429,1430,2217,1454,1396,1350,1352,1321,1322,1353,1220,1223,1194,1323,1326,1190,1191,1193,1157,1160,1164,1166,1167,1169,1197,1331,1162] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.396,0.361,0.902]
select surf_pocket5, protein and id [680,681,682,683,684,685,686,2107,1674,1677,1725,673,1691,692,694,668,687,676,1653,1675,1676,1649,1783,1786,1750,2104] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.357,0.278,0.702]
select surf_pocket6, protein and id [1271,1270,1272,1810,2152,2185,1386,1388,1774,1777,2151,2159,1248,1250] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.522,0.361,0.902]
select surf_pocket7, protein and id [2716,2225,2226,2254,2228,2718,2253,3637,3646,3649,3656,3657,3654,1460,1463,2715,3634,1159,1160,1161,1158,3677,2248,2250,2274,2275] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.455,0.278,0.702]
select surf_pocket8, protein and id [984,1299,1302,982,960,1939,1940,1942,1257,1285,1287,964,962,963] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.647,0.361,0.902]
select surf_pocket9, protein and id [3032,3034,3036,3200,3016,3037,3038,3039,3043,3044,3014,3188,3189,3195,3190,3191,3193,3123,3122,3168,3167,3118,3164] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.549,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,207,282,279] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.773,0.361,0.902]
select surf_pocket11, protein and id [3277,3279,3282,3287,3313,3214,3216,3213,539,3284,3285,3286,538,3288,3293,510,3224,3228] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.647,0.278,0.702]
select surf_pocket12, protein and id [1476,1537,1539,1524,1477,1695,1525,1529,1530,1451,1716,1452,1459,1468,1478,1482,1512] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.898,0.361,0.902]
select surf_pocket13, protein and id [1485,3609,3650,3608,3613,3618,3619,3605,3610,3612,3614,3654,3664,3661,1499,1500,1501,203] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.655]
select surf_pocket14, protein and id [1279,1281,1283,1867,1868,1934,1987,1925,1930,1918,1864,1865,1869,1874,1875,1878,1284,1285,1287,1939,1940,1941] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.776]
select surf_pocket15, protein and id [1548,204,191,200,201,203,192,1500,1501,177,175,178,181,169,171,3613,3619] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.557]
select surf_pocket16, protein and id [1004,1006,1008,1030,1031,1009,3445,2494,2495,2497,3476,3477,3478,3479,3475,3739,3750,2492,2493,1064,1065,1066,1067,1068,3734,3735,3756,3758,1029,1033,1034,3486,1007] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.651]
select surf_pocket17, protein and id [1835,1283,1294,1293,1308,1384,1371,1387,1799,1801,1802,1803,1765,1767,1837,1826,1828] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.459]
select surf_pocket18, protein and id [3103,3104,3105,2368,2374,2375,2402,3112,2602,3114,2398,2399,2400] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.525]
select surf_pocket19, protein and id [1983,906,908,1989,1991,1995,2016,2019,2020,2014,2015,1986,1928,1946,1951] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.361]
select surf_pocket20, protein and id [1845,2007,2011,1889,2018,2039,2040,2042,1844,1846,1854,1856,1842,2100,2031,2033,2034,1880,1877] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.400]
select surf_pocket21, protein and id [889,884,887,890,894,895,3346,896,897,888,3348,3345] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.298,0.278]
select surf_pocket22, protein and id [270,305,268,271,274,2990,3002,3003,2958,298,300,301,304,307,3070,272,3061,2980,2981] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.443,0.361]
select surf_pocket23, protein and id [1527,1528,1554,1555,1561,1611,1613,1643,1644,1645,1614,1586] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.392,0.278]
select surf_pocket24, protein and id [1605,1584,1587,1588,1606,144,145,409,1574,1576] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.569,0.361]
select surf_pocket25, protein and id [3113,3141,2603,3114,2599,3143,3147,2590,2437,2601] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.490,0.278]
select surf_pocket26, protein and id [2775,2776,2791,2792,2781,618,750,2777,611,614,637,642,749] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.694,0.361]
select surf_pocket27, protein and id [2462,2473,2479,2545,2570,2572,2464,2465,2549,2502,2506] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.588,0.278]
select surf_pocket28, protein and id [3020,3022,459,2996,297,3010,458,460,461,339,340,341] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.820,0.361]
select surf_pocket29, protein and id [3226,484,507,3209,475,477] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.686,0.278]
select surf_pocket30, protein and id [49,442,2878,85] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.855,0.902,0.361]
select surf_pocket31, protein and id [1018,1019,1051,1332,1174,1231,1016] 
set surface_color,  pcol31, surf_pocket31 


deselect

orient
