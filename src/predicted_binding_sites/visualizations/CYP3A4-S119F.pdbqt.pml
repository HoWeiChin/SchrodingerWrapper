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

load "data/CYP3A4-S119F.pdbqt", protein
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

load "data/CYP3A4-S119F.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [725,728,729,731,732,733,2172,2173,718,723,721,722,3304,3315,3333,622,730,734,619,741,719,790,620,3307,3309,794,1470,1473,1480,1711,2204,1477,648,650,653,654,1498,1546,629,642,643,640,641,645,647,1565,1569,1626,419,1599,1601,2726,1476,1497,1499,1500,1501,3639,1496,2720,2728,2736,2742,3633,229,230,231,233,228,1495,1510,621,623,2729,3271,3280,3281,3320,2756,2774,2741,2753,3272,3314,532,3284,3287,2762,2763,2764,2765,633,398,631,632,634,396,1571,1575,1576,173,1540,1555,394,418,412,413,416,403,1573,2178,2206,2208,2211,2156,2209,3326,3332,3334,3335,3336,3337,2179,884,3331,2182,2184,888,2213,1219,1243,1251,1248,1252,2192,3366,3367,1973,1974,1277,1278,1970,1242,2239,2240,2241,2722,2723,1466,1468,1469,2260,2721,2724,2267,3636,3640,3643,3278,3279,3325,3270,3321,3324,2679,3265,2237,2242,2247,3396,3372] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3205,3207,3141,3179,3178,3182,3253,3254,3277,3142,3276,3273,3343,3344,3350,3351,3353,3387,2570,3413,2623,2624,2625,3180,3183,3181,3379,3349,3377,2654,3410,2653,2655,2568,901,922,2537,2539,3246,3217,3219,3220,3203,3283] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [2694,3075,2705,2709,3071,3582,3607,3608,3588,3594,3602,3646,3606,2698,3078,3081,3084,3086,2359,2329,2348,2357,2347,2316,3577,3579,3585,2320,3589,2956,2990,2992,273,247,238,3635,223,234,246,3627,213,220,3613] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1226,1229,2221,2223,2225,1433,1434,1435,1436,1460,1461,1402,1356,1358,1327,1328,1332,1359,1200,1203,1329,1196,1197,1163,1166,1168,1175,1199,1170,1172,1173,1337] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [2110,681,682,683,684,685,686,687,2113,1680,1681,1682,1683,1731,693,695,669,674,688,677,1697,1659,1655,1756,1789,1792] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1254,1816,1392,1394,1783,2191,1256,1276,1277,1278,2157,2158,2165,1780] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [3640,3643,3652,3662,3655,3660,2721,2724,2259,2722,1466,1469,2231,2232,2260,2234,2254,1165,1166,1167,2280,1164,2281,3663,3683,2256] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [990,1305,1308,1946,1948,988,1263,1291,968,969,970,1945,1293,966] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3206,3124,3174,3170,3173,3196,3197,3199,3042,3043,3044,3129,3128,3049,3050,3040,3022,3020,3194,3195,3201,3045,3038] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [161,186,255,256,183,207,282,317,278,289,279,314,159,109,325,103,164,100,106] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3283,539,3285,3288,3290,3291,3292,3293,3319,538,510,3219,3220,3222,3230,3234,3294,3299] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1474,1482,1483,1701,1543,1545,1530,1531,1535,1536,1484,1488,1518,1457,1722,1458,1465] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [1506,203,3616,3618,3619,3620,3624,3625,1491,1505,1507,3615,3656,3611,3614,3660,3670,3667] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1285,1287,1289,1873,1874,1875,1884,1936,1993,1940,1947,1924,1931,1870,1871,1880,1881,1290,1291,1945,1293,1946] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1506,201,203,204,191,3619,3625,1507,200,177,175,178,181,1554,169,171,192] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1010,1012,1036,1037,1015,3451,2500,2501,3745,3756,2499,2503,3482,3483,3484,3485,3481,2498,1070,1071,1072,1073,1074,3740,3741,3762,3764,1035,1039,1040,3492,1013,1014] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1289,1299,1300,1314,1377,1393,1808,1809,1843,1390,1771,1773,1841,1805,1807,1832,1834] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3109,3110,3111,3118,3120,2380,2381,2408,2608,2404,2405,2406,2374] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1989,912,914,1995,2001,2020,2022,2025,1997,2021,2026,1992,1934,1952,1957] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1848,1895,2045,2046,2048,1860,1862,1852,2017,1886,2024,2013,2037,2039,2040,2106,1850,1851,1883] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [900,901,890,893,896,902,903,894,3354,3352,895,3351] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [3076,268,271,272,274,3067,2987,2996,3008,3009,2964,2986,301,304,305,307,298,300,270] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1560,1561,1567,1617,1619,1592,1649,1650,1651,1620,1533,1534] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1580,1611,1590,1593,1594,1612,144,145,409,1582] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [2443,2596,2609,2605,2607,3149,3119,3147,3120,3153] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2555,2508,2512,2479,2470,2471,2468,2485,2551,2576,2578] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [297,458,459,460,461,3016,339,340,341,3026,3028,3002] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3215,475,477,3232,507,484] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,85,442,2884] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1180,1025,1338,1024,1237,1022,1057] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
