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

load "data/CYP3A4-C98W.pdbqt", protein
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

load "data/CYP3A4-C98W.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [628,733,735,736,737,744,739,629,631,726,727,729,730,731,793,797,3318,1483,1714,658,661,662,1480,1549,630,627,637,650,651,648,649,653,656,655,1629,1602,1572,1568,1604,2211,2176,2209,2207,2181,2212,2182,2185,3329,3335,3337,3338,3339,3336,3334,887,891,2214,1254,1255,2195,1251,3369,3370,1976,1977,2159,2187,1280,1281,1973,1222,1245,1246,2729,1503,1473,2723,2731,2739,1479,3642,1476,3636,2242,2243,2244,2725,2726,1469,1471,1472,2263,3639,2724,2727,3643,3646,2732,2744,3327,3328,3273,3281,3282,2759,2682,3268,3307,3317,3323,3274,3275,3283,3284,3287,3324,2760,2764,2765,2766,2767,2768,640,2753,2745,642,1500,1502,1504,1501,1498,1499,228,229,230,231,233,1513,1543,1558,2777,532,2756,3290,641,394,396,398,418,639,412,413,416,419,403,1574,1578,1579,1576,173,2216,2240,2245,2250,2270,3399,3340,3375] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3276,3279,3346,3347,3280,3256,3257,3208,3210,3144,3145,3181,3182,3185,3249,3220,3222,3223,3206,3286,2573,2656,3416,3413,2626,2627,2628,2658,3186,3183,3184,3352,3353,3354,3356,3390,2540,2542,3382,2571,3380,2657,904,925] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3078,2708,3074,3591,3597,3605,3649,2697,2712,3609,3610,3611,2959,2993,2995,238,273,3630,3638,213,246,247,3616,2701,3081,3084,3087,223,220,234,2362,2332,2351,2360,2350,2319,2323,3592,3585,3580,3582,3588,3089] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [2224,2228,1464,1436,1437,1438,1439,2226,1463,1405,1359,1361,1330,1331,1362,1229,1232,1203,1332,1335,1199,1200,1202,1166,1169,1171,1173,1175,1176,1178,1206,1340] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [689,690,691,692,693,694,695,2116,1683,1686,1734,682,1700,701,703,677,696,685,1662,1684,1685,1658,1792,1795,1759,2113] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1280,1279,1281,1819,2161,2194,1395,1397,1783,1786,2160,2168,1257,1259] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2725,1469,1472,2234,2235,2263,2237,2724,3658,3643,3646,3655,3663,2727,3665,1167,2284,3666,3686,1168,1169,1170,2257,2259,2262,2283] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [993,1308,1311,991,969,1948,1949,1951,1266,1294,1296,973,971,972] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3046,3048,3052,3053,3131,3177,3043,3045,3209,3047,3127,3204,3199,3200,3202,3173,3176,3041,3197,3198,3025,3023,3132] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3295,3296,3286,3288,3291,3293,3322,3222,3223,3225,3297,3302,3294,538,539,510,3233,3237] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1485,1546,1548,1533,1486,1704,1534,1538,1539,1460,1725,1461,1477,1487,1491,1521,1468] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3619,3621,3622,3623,3627,3628,1494,3618,3614,3617,3663,3673,3670,3659,1510,203,1508,1509] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1288,1290,1292,1876,1877,1939,1996,1943,1927,1934,1874,1883,1884,1887,1873,1878,1293,1294,1296,1948,1949,1950] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1510,203,204,1509,1557,192,177,175,178,181,169,171,3622,3628] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1040,2504,2506,3485,3486,3487,3488,3748,3484,3759,2501,2503,2502,1013,1015,1017,1039,1018,3454,1073,1074,1075,1076,1077,3743,3744,3765,3767,1038,1042,1043,3495,1016] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1844,1292,1303,1302,1317,1393,1380,1396,1808,1810,1811,1812,1774,1776,1846,1835,1837] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3112,3113,3114,2377,2383,2384,3121,2411,2611,3123,2407,2408,2409] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1992,2029,915,917,1998,2000,2004,2025,2028,2023,2024,1995,1937,1955,1960] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1854,2016,2020,1898,2027,2048,2049,2051,1853,1855,1863,1865,1851,2109,2042,2043,2040,1886,1889] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [893,899,903,904,905,3355,906,896,898,897,3357,3354] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3079,272,3070,2967,2989,2990,2999,3011,3012] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1536,1537,1563,1564,1570,1620,1622,1652,1653,1654,1623,1595] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1614,1593,1596,1597,1615,144,145,409,1583,1585] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3152,3156,2599,3122,3150,2612,3123,2608,2446,2610] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2511,2515,2482,2471,2488,2554,2579,2581,2473,2474,2558] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [3005,3029,3031,297,459,3019,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3235,484,507,3218,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2887,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1183,1028,1341,1027,1060,1240,1025] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
