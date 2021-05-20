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

load "data/CYP3A4-S119T.pdbqt", protein
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

load "data/CYP3A4-S119T.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [2168,620,727,729,730,737,732,621,718,623,719,786,790,3311,721,722,723,1476,1707,650,654,1473,622,619,629,642,643,640,641,645,648,653,647,1622,1542,1565,1561,1595,1597,2204,2169,2174,2202,2200,2205,2175,2178,3322,3328,3329,3330,3331,3332,880,884,3327,2207,1247,1248,2188,1244,1970,3362,3363,1969,2152,2180,1273,1274,1966,1215,1238,1239,2719,2722,1462,1464,1465,1466,2716,2717,2724,2732,3636,1472,3635,1469,3632,3629,2725,3321,3320,2752,3261,3266,3267,3268,3276,3277,3310,3316,3317,3280,3300,2233,2235,2236,2237,2238,2718,2256,2720,2263,3639,3274,3275,3368,3333,2675,2758,2760,2761,632,1493,1495,1496,1497,1494,1492,2738,228,229,230,231,233,1491,1536,1551,1506,2737,2753,2757,2759,2746,2749,2770,532,3283,633,394,396,398,418,631,634,412,413,416,419,1567,1571,1572,1569,173,403,2209,2243,3392] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3272,3339,3340,3346,3347,3349,3375,3273,2650,2649,2651,3201,3137,3138,3175,3176,3177,3178,3242,3249,3250,3213,3215,3203,3216,3174,3199,3269,3279,3409,2619,2620,2621,3179,3383,2564,2566,2533,2535,3345,3373,3406,897,918] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [2694,2701,2705,3584,3590,3585,3067,3074,3080,3082,3578,3575,3581,3077,2952,2986,2988,3071,273,3642,2690,238,3603,3604,3598,3602,246,3609,3623,3631,234,247,223,213,220,2355,2325,2344,2353,2343,2312,2316,3573] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2217,2221,1457,1429,1430,1431,1432,2219,1456,1398,1352,1354,1323,1324,1355,1222,1225,1196,1325,1328,1192,1193,1195,1159,1162,1166,1168,1169,1171,1199,1333,1164] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2109,1727,669,674,1693,693,695,688,677,1655,1676,1677,1678,1679,1651,1785,1788,1752,2106] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1273,1272,1274,1812,2154,2187,1388,1390,1776,1779,2153,2161,1250,1252] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2718,2227,2228,2256,2230,2720,2255,3639,3648,3651,3658,3659,3656,1462,1465,2717,3636,1161,1162,1163,1160,3679,2250,2252,2276,2277] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [986,1301,1304,984,962,1941,1942,1944,1259,1287,1289,966,964,965] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3034,3036,3038,3202,3018,3039,3040,3041,3045,3046,3016,3190,3191,3197,3192,3193,3195,3125,3124,3170,3169,3120,3166] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,207,282,279] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3279,3281,3284,3289,3315,3216,3218,3215,539,3286,3287,3288,538,3290,3295,510,3226,3230] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1478,1539,1541,1526,1479,1697,1527,1531,1532,1453,1718,1454,1461,1470,1480,1484,1514] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [1487,3611,3652,3610,3615,3620,3621,3607,3612,3614,3616,3656,3666,3663,1501,1502,1503,203] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1281,1283,1285,1869,1870,1936,1989,1927,1932,1920,1866,1867,1871,1876,1877,1880,1286,1287,1289,1941,1942,1943] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1550,204,191,200,201,203,192,1502,1503,177,175,178,181,169,171,3615,3621] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1006,1008,1010,1032,1033,1011,3447,2496,2497,2499,3478,3479,3480,3481,3477,3741,3752,2494,2495,1066,1067,1068,1069,1070,3736,3737,3758,3760,1031,1035,1036,3488,1009] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1837,1285,1296,1295,1310,1386,1373,1389,1801,1803,1804,1805,1767,1769,1839,1828,1830] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3105,3106,3107,2370,2376,2377,2404,3114,2604,3116,2400,2401,2402] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1985,908,910,1991,1993,1997,2018,2021,2022,2016,2017,1988,1930,1948,1953] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1847,2009,2013,1891,2020,2041,2042,2044,1846,1848,1856,1858,1844,2102,2033,2035,2036,1882,1879] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [891,886,889,892,896,897,3348,898,899,890,3350,3347] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [270,305,268,271,274,2992,3004,3005,2960,298,300,301,304,307,3072,272,3063,2982,2983] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1557,1613,1615,1529,1530,1556,1563,1616,1645,1646,1647,1588] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1586,1589,1590,1608,1607,144,145,409,1576,1578] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3115,3143,2605,3116,2601,3145,3149,2592,2439,2603] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2464,2475,2481,2547,2572,2574,2466,2467,2551,2504,2508] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3022,3024,459,2998,297,3012,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3228,484,507,3211,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2880,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1020,1021,1053,1334,1176,1233,1018] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
