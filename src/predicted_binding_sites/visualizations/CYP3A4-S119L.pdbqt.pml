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

load "data/CYP3A4-S119L.pdbqt", protein
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

load "data/CYP3A4-S119L.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [731,619,620,621,623,727,728,729,730,787,3301,791,3312,629,642,643,733,738,718,719,721,722,1477,648,650,653,654,1495,1474,1543,645,640,641,419,647,1623,1596,1598,1562,1566,1708,2723,2726,2738,2754,2747,2725,2739,1473,1494,1496,1497,1498,1492,1493,229,231,2733,228,230,233,1507,3277,3278,3311,2750,2753,2771,2759,2760,2761,2762,398,631,632,634,633,396,1568,1572,1573,173,1537,1552,394,418,412,413,416,403,1570,2203,2205,1467,1470,2201,2170,2206,3323,3328,3329,3330,3331,2179,723,2175,2208,2210,2189,2176,881,2181,3332,3333,885,1970,1971,3334,3363,2153,1967,2234,2236,2238,2239,1466,2257,1463,1465,2717,2718,2721,3640,3636,3633,3630,3637,2237,2719,2720,2244,3369,2676,3262,2264,3275,3322,3267,3268,3269,3317,3318,3321,3276,1216,1239,1240,1248,1249,3364,1245,1274,1275,3393] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [2651,2650,2652,2622,3180,3138,3139,3176,3177,3178,3179,3273,3341,3347,3348,3350,3376,3346,3374,3274,3270,3340,3250,3251,3175,3200,3204,3202,898,3384,3410,3407,2620,2621,2567,2565,2534,2536,919,3214,3216,3217,3280,3243] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3643,2987,2989,3072,2702,2706,2326,3605,2317,3579,3585,3591,3599,3604,3576,3582,3586,3603,3610,3632,2691,2695,3068,3083,3075,3078,3081,2345,2354,2344,2313,3574,2356,2953,273,238,213,234,246,247,3624,223,220] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1399,1430,1431,1432,1324,1325,1353,1355,1433,1356,1223,1226,1326,2218,2220,1160,1167,1169,1170,1172,1334,1193,1194,1196,1197,1200,1329,2222,1457,1458,1163,1165] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [674,677,681,682,683,684,685,686,687,1677,1678,1680,1728,1679,1652,688,695,669,1694,1656,2107,1786,1789,2110,1753,693] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [2154,2155,1780,1813,1777,2188,2162,1251,1253,1273,1274,1275,1389,1391] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [3637,3649,3652,3659,3660,3657,2228,2229,1162,1163,2231,1466,2257,1463,2251,2718,2721,2253,2256,3640,2719,2277,2278,3680,1164,1161] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [987,1305,1302,963,985,1942,1943,1945,1260,1288,1290,965,966,967] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3035,3037,3039,3203,3040,3041,3042,3046,3047,3126,3191,3198,3193,3194,3196,3171,3167,3170,3121,3125,3192,3019,3017] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [161,186,255,256,183,207,282,317,278,289,279,314,159,109,325,103,164,100,106] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [539,3282,3285,3287,3288,3289,3290,538,510,3216,3217,3219,3227,3231,3280,3291,3296,3316] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1542,1527,1528,1532,1533,1471,1479,1540,1480,1698,1485,1515,1481,1454,1455,1719,1462] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3612,3653,3608,3611,3667,3613,3657,3664,3615,3616,3617,3621,3622,203,1488,1502,1503,1504] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1282,1284,1286,1871,1928,1937,1990,1933,1867,1868,1870,1872,1877,1878,1881,1287,1288,1290,1942,1943,1944,1921] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,201,3616,3622,203,204,1503,1504,200,177,175,178,181,1551,169,171,192] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1007,1009,1033,1034,1012,3448,3482,2497,2498,2500,3742,3753,3479,3480,3481,3478,2495,2496,1032,1036,1037,1067,1068,1069,1070,1071,3489,3737,3738,3759,3761,1010,1011] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1296,1311,1390,1387,1768,1770,1374,1804,1805,1806,1829,1831,1286,1838,1840,1297,1802] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3107,2371,2378,2402,3106,3108,2377,2401,3115,2405,2605,3117,2403] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1986,1931,1989,2022,909,911,1954,1998,1949,2017,2018,2019,2023,1992,1994] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1847,1849,1857,1859,1848,2010,2014,2042,2043,2045,2034,2036,2037,2103,1845,1892,1883,1880,2021] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [892,3351,887,890,893,898,3349,891,3348,897,899,900] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [3064,2961,2983,2984,3005,3006,268,271,272,274,2993,301,304,305,307,298,300,270,3073] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1557,1558,1564,1614,1616,1589,1530,1531,1646,1647,1648,1617] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1577,1608,1587,1590,1591,1609,144,145,409,1579] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3150,2593,3116,2440,2606,3117,2602,2604,3146,3144] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2505,2509,2476,2465,2482,2548,2552,2467,2468,2573,2575] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [297,458,459,460,461,3013,339,340,341,2999,3023,3025] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3212,475,477,3229,507,484] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,85,442,2881] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1021,1022,1335,1019,1054,1234,1177] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
