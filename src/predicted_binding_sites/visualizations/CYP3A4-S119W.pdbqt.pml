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

load "data/CYP3A4-S119W.pdbqt", protein
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

load "data/CYP3A4-S119W.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [2177,725,728,729,730,731,732,733,736,737,3336,623,793,797,3318,719,718,721,722,723,1483,2206,2207,1480,735,1714,620,727,619,622,629,621,645,648,650,653,654,647,1549,642,643,640,641,1568,1572,1629,1602,1604,743,2211,2216,2181,2209,2214,2159,2195,2212,3329,3335,3337,3338,3339,2182,887,891,3334,2185,2187,1222,1246,1254,3369,3370,1255,1251,1280,1976,1977,1973,1281,1245,2729,1479,1500,1502,1503,1504,1501,1499,2731,2739,2745,229,230,231,233,228,1498,1513,2732,2744,2760,3283,3284,2753,2756,2759,2777,3307,3317,532,3287,3290,633,2764,2765,2766,2767,2768,398,631,632,634,396,1574,1578,1579,173,1543,1558,394,418,412,413,416,419,403,1576,2244,2725,2726,1471,1473,2723,2724,2727,1469,1472,3642,1476,3639,3636,3643,3646,3281,3328,3273,3274,3275,3323,3324,3327,3268,2240,2242,2243,2245,2250,2263,2270,3282,3375,3340,2682,3399] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3353,3354,3356,2658,3186,3144,3182,3183,3184,3185,3382,3380,2657,3280,2656,3181,3206,3208,3210,3256,3257,3145,3279,3276,3346,3347,3249,3220,3222,3223,3286,3416,2626,2627,2628,3390,2571,2573,2540,2542,3352,3413,904,925] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3649,3597,3605,3609,3610,3611,3616,3638,2697,2993,2995,3078,2701,3074,2708,2712,3081,3084,3087,3089,2332,3585,3591,3582,3588,3592,2959,238,273,247,223,234,213,220,246,3630,2362,2351,2360,2350,2319,2323,3580] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1229,1232,2224,2226,2228,1436,1437,1438,1439,1463,1464,1359,1361,1331,1335,1362,1203,1206,1332,1405,1330,1199,1200,1202,1166,1173,1175,1176,1178,1340,1169,1171] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [688,1759,1795,677,681,682,683,684,685,686,2116,1700,1734,2113,693,695,669,674,687,1662,1683,1684,1685,1686,1658,1792] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1279,1281,1395,1397,1786,1257,1259,1280,1819,2161,2168,1783,2160,2194] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2234,2235,1168,1169,2237,3658,3665,3666,3663,2257,2263,2259,2262,3643,3646,3655,1469,1472,2725,2724,2727,2283,1167,2284,1170,3686] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [1266,1294,971,1948,1949,1951,1308,1296,993,1311,991,969,973,972] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3197,3204,3209,3199,3200,3202,3173,3041,3043,3045,3046,3047,3132,3048,3052,3053,3127,3177,3176,3131,3198,3025,3023] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [282,317,207,161,186,255,256,183,278,289,279,314,159,109,325,103,164,100,106] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3286,539,3288,3291,3293,3294,3295,3296,538,3297,3302,510,3222,3223,3225,3233,3237,3322] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1485,1546,1548,1486,1704,1533,1534,1538,1539,1460,1725,1461,1521,1477,1487,1491,1468] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3618,3659,3617,3614,3673,3619,3663,3670,1508,1509,3623,203,1494,1510,3628,3621,3622,3627] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1288,1290,1873,1874,1876,1877,1878,1883,1884,1887,1934,1939,1927,1293,1294,1943,1948,1949,1950,1996,1292,1296] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [1509,201,203,204,191,3622,1510,3628,200,169,177,175,178,181,192,1557,171] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1013,1015,1017,1039,1040,1018,3454,2503,2504,2506,3485,3486,3487,3488,3484,3748,3759,2501,2502,1038,1042,1043,1073,1074,1075,1076,1077,3495,3743,3744,3765,3767,1016] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1292,1302,1303,1317,1380,1396,1811,1812,1774,1776,1393,1844,1808,1810,1846,1835,1837] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3112,3113,3114,3121,2377,2383,2384,2411,2408,2409,2611,3123,2407] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [1992,915,917,1998,2004,2025,2028,2000,2029,2023,2024,1955,1960,1995,1937] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1851,1889,2020,1898,2027,2051,1863,2040,2042,2043,2016,2048,2049,2109,1853,1855,1865,1854,1886] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [3357,3355,898,893,896,899,903,904,905,906,897,3354] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,272,274,3070,2990,2999,3011,3012,2967,2989,301,304,305,307,298,300,270,3079] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1563,1564,1570,1622,1595,1536,1537,1620,1623,1652,1653,1654] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1614,1593,1596,1597,1615,1583,409,1585,144,145] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3152,3122,3150,2612,3123,2608,2610,2446,3156,2599] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2554,2558,2579,2581,2473,2474,2471,2488,2511,2515,2482] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [297,458,459,460,461,3019,339,340,341,3029,3031,3005] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3235,507,3218,475,477,484] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,85,442,2887] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1028,1060,1341,1027,1183,1240,1025] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
