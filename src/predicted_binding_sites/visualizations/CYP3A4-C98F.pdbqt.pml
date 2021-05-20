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

load "data/CYP3A4-C98F.pdbqt", protein
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

load "data/CYP3A4-C98F.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [625,730,732,733,734,741,736,626,628,723,724,726,727,728,790,794,3315,1480,1711,655,658,659,1477,1546,627,624,634,647,648,645,646,650,653,652,1626,1599,1569,1565,1601,2208,2173,2206,2204,2178,2209,2179,2182,3326,3332,3334,3335,3336,3333,3331,884,888,2211,1251,1252,2192,1248,3366,3367,1973,1974,2156,2184,1277,1278,1970,1219,1242,1243,2726,1500,1470,2720,2728,2736,1476,3639,1473,3633,2239,2240,2241,2722,2723,1466,1468,1469,2260,3636,2721,2724,3640,3643,2729,2741,3324,3325,3270,3278,3279,2756,2679,3265,3304,3314,3320,3271,3272,3280,3281,3284,3321,2757,2761,2762,2763,2764,2765,637,2750,2742,639,1497,1499,1501,1498,1495,1496,228,229,230,231,233,1510,1540,1555,2774,532,2753,3287,638,394,396,398,418,636,412,413,416,419,403,1571,1575,1576,1573,173,2213,2237,2242,2247,2267,3396,3337,3372] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3273,3276,3343,3344,3277,3253,3254,3205,3207,3141,3142,3178,3179,3182,3246,3217,3219,3220,3203,3283,2570,2653,3413,3410,2623,2624,2625,2655,3183,3180,3181,3349,3350,3351,3353,2537,2539,3379,3387,2568,3377,2654,901,922] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3075,2705,3071,3588,3594,3602,3646,2694,2709,3606,3607,3608,2956,2990,2992,238,273,3627,3635,213,246,247,3613,2698,3078,3081,3084,223,220,234,2359,2329,2348,2357,2347,2316,2320,3589,3582,3577,3579,3585,3086] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2221,2225,1461,1433,1434,1435,1436,2223,1460,1402,1356,1358,1327,1328,1359,1226,1229,1200,1329,1332,1196,1197,1199,1163,1166,1168,1170,1172,1173,1175,1203,1337] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [686,687,688,689,690,691,692,2113,1680,1683,1731,679,1697,698,700,674,693,682,1659,1681,1682,1655,1789,1792,1756,2110] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1277,1276,1278,1816,2158,2191,1392,1394,1780,1783,2157,2165,1254,1256] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2722,1466,1469,2231,2232,2260,2234,2721,3655,3640,3643,3652,3660,2724,3662,1164,2281,3663,3683,1165,1166,1167,2254,2256,2259,2280] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [990,1305,1308,988,966,1945,1946,1948,1263,1291,1293,970,968,969] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3043,3045,3049,3050,3128,3174,3040,3042,3206,3044,3124,3201,3196,3197,3199,3170,3173,3038,3194,3195,3022,3020,3129] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3292,3293,3283,3285,3288,3290,3319,3219,3220,3222,3294,3299,3291,538,539,510,3230,3234] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1482,1543,1545,1530,1483,1701,1531,1535,1536,1457,1722,1458,1474,1484,1488,1518,1465] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3616,3618,3619,3620,3624,3625,1491,3615,3611,3614,3660,3670,3667,3656,1507,203,1505,1506] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1285,1287,1289,1873,1874,1936,1993,1940,1924,1931,1871,1880,1881,1884,1870,1875,1290,1291,1293,1945,1946,1947] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1507,203,204,1506,1554,192,177,175,178,181,169,171,3619,3625] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1037,2501,2503,3482,3483,3484,3485,3745,3481,3756,2498,2500,2499,1010,1012,1014,1036,1015,3451,1070,1071,1072,1073,1074,3740,3741,3762,3764,1035,1039,1040,3492,1013] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1841,1289,1300,1299,1314,1390,1377,1393,1805,1807,1808,1809,1771,1773,1843,1832,1834] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3109,3110,3111,2374,2380,2381,3118,2408,2608,3120,2404,2405,2406] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1989,1997,2026,912,914,1995,2001,2020,2022,2025,2021,1992,1934,1952,1957] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1851,2013,2017,1895,2024,2045,2046,2048,1850,1852,1860,1862,1848,2106,2039,2040,2037,1883,1886] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [890,896,900,901,3352,902,903,893,895,894,3354,3351] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3076,272,3067,2964,2986,2987,2996,3008,3009] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1533,1534,1560,1561,1567,1617,1619,1649,1650,1651,1620,1592] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1611,1590,1593,1594,1612,144,145,409,1580,1582] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3149,3153,2596,3119,3147,2609,3120,2605,2443,2607] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2508,2512,2479,2468,2485,2551,2576,2578,2470,2471,2555] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3002,3026,3028,297,459,3016,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3232,484,507,3215,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2884,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1180,1025,1338,1024,1057,1237,1022] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
