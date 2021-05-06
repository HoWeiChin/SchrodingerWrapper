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

load "data/CYP3A4.16.pdbqtqt", protein
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

load "data/CYP3A4.16.pdbqtqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [1467,2194,2197,2198,654,1471,1474,1492,1496,1540,620,727,728,3308,3315,3327,621,623,789,3298,3309,826,3291,3296,2720,2723,2735,1493,1494,2714,2722,2730,1495,1470,1490,1491,3633,3264,3265,3266,3274,3275,3314,2744,2747,2750,3259,3278,3281,2167,725,729,731,736,719,785,718,721,722,723,825,1705,650,619,2759,629,643,2768,645,647,648,653,640,641,632,1620,1534,1563,419,631,1565,1559,1567,1593,1595,2751,2756,2757,2758,2755,2919,2738,2740,396,398,634,2737,374,232,1489,1549,1569,229,233,1504,532,412,413,416,394,395,1570,403,2202,1246,2200,2203,2205,2172,2173,2186,1247,879,883,3320,3325,3326,3328,3329,3330,2176,1970,3360,3361,1969,1271,1272,2150,2178,1964,2233,2234,2235,2716,1460,1461,1463,2717,2207,2231,2236,2241,3272,3273,3319,3366,3318,3331,2673,2261,3390,1214,1237,1238,1265,1243] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.392,0.702]
select surf_pocket2, protein and id [3270,2648,3247,3248,2647,2649,2616,2617,2618,2619,3199,3136,3135,3172,3173,3174,3177,3267,3337,3338,3344,3345,3347,3373,3343,3371,3271,896,916,3277,3240,3211,3213,3214,3197,3201,2556,3379,3382,2555,3380,3407,3404,2590,2561,2527,2558,2562,2564,2531,2532,2533,2559] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.431,0.902]
select surf_pocket3, protein and id [3069,3065,3582,2688,2699,2703,3601,3602,3600,3588,3596,3599,2320,2322,2323,2351,2353,2310,2314,3573,3576,3579,3583,3571,2692,3080,3072,3075,3078,2984,2986,245,246,247,3617,2342,2341] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.278,0.702]
select surf_pocket4, protein and id [1271,1272,1810,2151,2152,2185,2159,1774,1777,1247,1249,1251,1253,1386,1243,1270,1388] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.431,0.361,0.902]
select surf_pocket5, protein and id [688,674,676,1750,2108,675,677,681,682,683,684,685,686,687,1786,1725,2104,2102,693,695,669,1691,1654,1675,1676,2130,2131,1783,1785] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.392,0.278,0.702]
select surf_pocket6, protein and id [1158,1165,1167,1168,1170,1331,1326,1192,1194,1195,1198,1191,1224,1323,1322,1350,1352,1353,1396,1430,1321,1221,2215,2217,2219,1427,1428,1429,1455,1161,1162] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.576,0.361,0.902]
select surf_pocket7, protein and id [1163,1160,1161,1162,2250,2253,2274,3656,1159,3677,3682,3680,3657,3646,3647,3649,3654,2228] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.506,0.278,0.702]
select surf_pocket8, protein and id [1482,1485,1510,1511,1512,1499,1500,1518,1501,3610,3612,3613,3614,3618,3619,203,3609,3608,3650,3632,3605,3661,3664] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.722,0.361,0.902]
select surf_pocket9, protein and id [103,164,317,106,109,159,161,325,314,100,282,207,186,255,256,183,251,278,289,279] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.616,0.278,0.702]
select surf_pocket10, protein and id [3016,3190,3191,3044,3014,3188,3189,3195,3032,3034,3039,3036,3200,3037,3038,3043,3122,3118,3168,3193,3164,3167,3123] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.863,0.361,0.902]
select surf_pocket11, protein and id [985,1302,1299,961,983,1939,1940,1942,1257,963,964,965,1285,1287] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.671]
select surf_pocket12, protein and id [3277,539,3279,3282,3284,3285,3286,3287,3313,510,3213,3214,3216,3224,3228,3288,3293,538] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.792]
select surf_pocket13, protein and id [1031,1032,3445,2494,2495,2497,3476,3477,3478,3479,3750,1005,1007,1008,1009,1010,2492,2493,1065,1067,1068,3486,3734,3735,3756,3758,1030,1034,1035,1066,1069] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.561]
select surf_pocket14, protein and id [1284,1285,1281,1934,1987,1925,1283,1287,1279,1864,1865,1867,1868,1869,1874,1875,1878,1930,1918,1939,1940,1941] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.647]
select surf_pocket15, protein and id [3621,3629,223,213,220,3607,245,247,3617,3640,238,234,3600,3599,3602] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.447]
select surf_pocket16, protein and id [1537,1539,1524,1477,1525,1529,1468,1476,1512,1509,1459,1478,1695,1526,1527,1528,1530,1451,1452,1716] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.506]
select surf_pocket17, protein and id [885,888,890,891,895,896,897,889,901,3348,898,899,935] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.337]
select surf_pocket18, protein and id [1283,1384,1387,1294,1837,1828,1835,1293,1799,1802,1803,1801,1826,1765,1767] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.361]
select surf_pocket19, protein and id [1983,1986,1928,2019,1946,1951,2016,2020,2014,2015,907,909,1991,1995,1989] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.337,0.278]
select surf_pocket20, protein and id [2007,2011,1889,2018,2039,2040,2042,1844,1846,1854,1856,1842,2100,1845,2031,2033,2034,1877,1880] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.506,0.361]
select surf_pocket21, protein and id [191,200,201,204,177,175,1548,169,178,180,181,203] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.447,0.278]
select surf_pocket22, protein and id [1584,1587,1588,1606,1574,1605,144,145,409,1576] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.647,0.361]
select surf_pocket23, protein and id [3114,2602,2603,2398,2399,2402,2375,2374,3103,3111,3112,3105] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.561,0.278]
select surf_pocket24, protein and id [1527,1528,1554,1555,1561,1613,1586,1643,1644,1645,1611,1614] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.792,0.361]
select surf_pocket25, protein and id [2996,3020,458,459,460,461,3009,3010,3012,297,299,339,341,3022] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.671,0.278]
select surf_pocket26, protein and id [484,507,475,477,485,3209,3226] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.863,0.902,0.361]
select surf_pocket27, protein and id [2878,85,49,442] 
set surface_color,  pcol27, surf_pocket27 


deselect

orient
