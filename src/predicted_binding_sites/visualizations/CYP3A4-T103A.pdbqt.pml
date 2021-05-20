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

load "data/CYP3A4-T103A.pdbqt", protein
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

load "data/CYP3A4-T103A.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [618,723,725,726,727,734,729,619,716,621,717,783,787,3308,719,720,721,1473,1704,648,651,652,1470,1539,620,617,627,640,641,638,639,643,646,645,1619,1592,1562,1558,1594,2201,2166,2171,2199,2197,2202,2172,2175,3319,3325,3326,3327,3328,3329,877,881,3324,2204,1244,1245,2185,1241,1967,3359,3360,1966,2149,2177,1270,1271,1963,1212,1235,1236,1469,1493,3632,1463,1466,2713,2721,2729,3626,2234,1459,1461,1462,2253,3629,2714,2717,3633,3636,2719,2722,2734,2749,3264,3265,3273,3274,3307,3313,3277,3297,2232,2233,2715,2716,2672,3258,3271,3272,3318,3263,3314,3317,2750,2754,2755,2756,2757,2758,630,2743,2735,632,1490,1492,1494,1491,1488,1489,228,229,230,231,233,1503,1533,1548,532,2746,2767,3280,631,394,396,398,418,629,412,413,416,419,403,1564,1568,1569,1566,173,2206,2230,2235,2240,3389,2260,3365,3330] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3269,3266,3336,3337,3270,3246,3247,3171,3198,3200,3134,3135,3172,3175,3210,3213,3196,3239,3212,3276,3406,2616,2617,2618,3173,3176,3174,3343,3344,3346,3380,2561,2563,2530,2532,2647,2646,2648,3403,3372,3342,3370,894,915] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3639,3068,2698,2702,3600,3601,3581,3587,3595,3599,2949,2983,2985,238,273,3620,3628,213,246,247,3606,2691,3064,3071,3074,3077,2687,223,220,234,3575,2309,2313,3570,3572,3578,3582,2340,3079,2352,2322,2341,2350] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2214,2218,1454,1426,1427,1428,1429,2216,1453,1395,1349,1351,1320,1321,1352,1219,1222,1193,1322,1325,1189,1190,1192,1156,1163,1165,1166,1168,1159,1161,1196,1330] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [679,680,681,682,683,684,685,2106,1673,1676,1724,672,1690,691,693,667,686,675,1652,1674,1675,1648,1782,1785,1749,2103] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1270,1269,1271,1809,2151,2184,1385,1387,1773,1776,2150,2158,1247,1249] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2253,2714,2717,3633,3636,3645,3648,3653,1459,1462,2224,2225,2227,2715,2247,2249,2252,2273,3655,3656,1158,1159,1160,1157,3676,2274] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [983,1298,1301,981,959,1938,1939,1941,1256,1284,1286,963,961,962] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3189,3190,3192,3117,3167,3163,3166,3036,3037,3042,3043,3122,3121,3035,3199,3187,3188,3194,3031,3033,3015,3038,3013] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3276,3278,3281,3283,3285,3286,3312,3213,3215,3212,539,3284,538,3287,3292,510,3223,3227] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1475,1536,1538,1523,1476,1694,1524,1528,1529,1450,1715,1451,1467,1477,1481,1511,1458] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3609,3611,3612,3613,3617,3618,1484,3608,3649,3607,3653,3604,3663,3660,1500,203,1498,1499] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1278,1280,1282,1866,1867,1933,1986,1924,1929,1917,1863,1864,1868,1873,1874,1877,1283,1284,1286,1938,1939,1940] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1500,203,204,1499,1547,192,177,175,178,181,169,171,3612,3618] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1003,1005,1007,1029,1030,1008,3444,2493,2494,2496,3475,3476,3477,3478,3474,3738,3749,2491,2492,1063,1064,1065,1066,1067,3733,3734,3755,3757,1028,1032,1033,3485,1006] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1834,1282,1293,1292,1307,1383,1370,1386,1798,1800,1801,1802,1764,1766,1836,1825,1827] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3102,3103,3104,3111,2367,2373,2374,2401,2601,3113,2397,2398,2399] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1982,905,907,1988,1990,1994,2015,2018,2019,2013,2014,1985,1927,1945,1950] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1844,2006,2010,1888,2017,2038,2039,2041,1843,1845,1853,1855,1841,2099,2030,2032,2033,1879,1876] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [888,883,886,889,893,894,3345,895,896,887,3347,3344] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3060,2957,2979,2980,2989,3001,3002,3069,272] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1526,1527,1553,1554,1560,1610,1612,1642,1643,1644,1613,1585] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1604,1583,1586,1587,1605,144,145,409,1573,1575] 
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
select surf_pocket30, protein and id [1173,1018,1331,1017,1050,1230,1015] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
