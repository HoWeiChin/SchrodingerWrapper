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

load "data/CYP3A4-R212A.pdbqt", protein
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

load "data/CYP3A4-R212A.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [2715,1489,2709,2717,2725,1465,3628,1462,3622,2228,2229,2230,2711,1461,2220,2221,2223,2712,2249,3625,2710,2713,3629,3632,3641,3644,3649,2718,2730,2745,3260,3261,3269,3270,3303,3309,3273,3293,3267,3268,3314,3259,3310,3313,2668,3254,2746,2750,2751,2752,2753,2754,632,2739,2731,634,1486,1488,1490,1487,1484,1485,228,229,230,231,233,1499,1529,1544,532,2742,2763,3276,633,394,396,398,418,631,412,413,416,419,403,1560,1564,1565,1562,173,2202,2226,2231,2236,3385,2256,2245,2248,2243,1161,1160,1162,2269,1159,2270,3651,3652,3672,3361,3326,620,725,727,728,729,736,731,621,718,623,719,785,789,3304,721,722,723,1469,1700,650,653,654,1466,1535,622,619,629,642,643,640,641,645,648,647,1615,1588,1558,1554,1590,2197,2167,2195,2186,2189,2192,2193,2198,3315,3320,3321,3322,3323,3324,3325,2162,2145,2168,2171,2173,879,883,2200,1246,1247,2181,1243,1272,1963,3355,3356,1959,1962,1273,1214,1237,1238] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3194,3196,3130,3131,3167,3168,3171,3242,3243,3266,3265,3262,3332,3333,3235,3206,3208,3209,3192,3272,2559,2643,2642,3402,3399,2612,2613,2614,2644,3172,3169,3170,3339,3340,3342,3368,3338,3376,2557,2526,2528,3366,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.443,0.902]
select surf_pocket3, protein and id [3064,3060,3577,3635,2683,2694,2698,3595,3596,3597,3583,3591,2945,2979,2981,238,273,3616,3624,213,246,247,3602,2687,3067,3070,3073,223,220,234,3075,2348,2318,2337,2346,2336,3571,2309,3568,3574,3578,2305,3566] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.290,0.702]
select surf_pocket4, protein and id [2210,2214,1456,1428,1429,1430,1431,2212,1455,1397,1351,1353,1322,1323,1354,1221,1224,1195,1324,1327,1191,1192,1194,1158,1161,1163,1165,1167,1168,1170,1198,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.412,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2102,1669,1672,1720,674,1686,693,695,669,688,677,1648,1670,1671,1644,2099,1745,1778,1781] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.373,0.278,0.702]
select surf_pocket6, protein and id [1805,2147,1387,1389,1769,1772,1271,1273,2180,1272,2146,2154,1249,1251] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.545,0.361,0.902]
select surf_pocket7, protein and id [985,1300,1303,983,961,1934,1935,1937,1258,1286,1288,965,963,964] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.478,0.278,0.702]
select surf_pocket8, protein and id [3195,3113,3163,3162,3185,3186,3188,3159,3029,3031,3032,3033,3118,3117,3034,3038,3039,3027,3183,3184,3011,3009,3190] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.678,0.361,0.902]
select surf_pocket9, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.580,0.278,0.702]
select surf_pocket10, protein and id [1471,1532,1534,1519,1472,1690,1520,1524,1525,1452,1453,1455,1435,1710,1711,1463,1507,1460] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.816,0.361,0.902]
select surf_pocket11, protein and id [3272,3274,3277,3279,3281,3282,3308,3208,3209,3211,539,3280,538,3283,3288,510,3219,3223] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.686,0.278,0.702]
select surf_pocket12, protein and id [3605,3607,3608,3609,3613,3614,1480,3604,3645,3603,3649,3600,3659,3656,1496,203,1494,1495] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.851]
select surf_pocket13, protein and id [1280,1282,1284,1862,1863,1929,1982,1920,1925,1913,1859,1860,1864,1869,1870,1873,1285,1286,1288,1934,1935,1936] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.612]
select surf_pocket14, protein and id [191,200,201,1496,203,204,1495,1543,192,177,175,178,181,169,171,3608,3614] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.718]
select surf_pocket15, protein and id [1005,1007,1009,1031,1032,1010,3440,2489,2490,2492,3471,3472,3473,3474,3470,3734,3745,2487,2488,1065,1066,1067,1068,1069,3729,3730,3751,3753,1030,1034,1035,3481,1008] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.506]
select surf_pocket16, protein and id [1830,1284,1295,1294,1309,1385,1372,1388,1798,1760,1762,1794,1796,1797,1832,1821,1823] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.584]
select surf_pocket17, protein and id [3098,3099,3100,2363,2369,2370,3107,2397,2597,3109,2393,2394,2395] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.400]
select surf_pocket18, protein and id [1978,907,909,1984,1986,1990,2011,2014,2015,2009,2010,1981,1923,1941,1946] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.451]
select surf_pocket19, protein and id [2002,2006,1884,2013,2034,2035,2037,1839,1841,1849,1851,1837,1840,2095,2026,2028,2029,1875,1872] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.298]
select surf_pocket20, protein and id [891,895,896,3341,890,885,888,897,898,889,3343,3340] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.404,0.361]
select surf_pocket21, protein and id [268,271,274,298,270,304,305,307,300,301,3065,272,3056,2953,2975,2976,2985,2997,2998] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.369,0.278]
select surf_pocket22, protein and id [1522,1523,1549,1550,1556,1606,1608,1638,1639,1640,1609,1581] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.537,0.361]
select surf_pocket23, protein and id [1600,1579,1582,1583,1601,144,145,409,1569,1571] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.471,0.278]
select surf_pocket24, protein and id [3138,3142,2585,3108,3136,2598,3109,2432,2594,2596] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.675,0.361]
select surf_pocket25, protein and id [2457,2468,2474,2540,2565,2567,2459,2460,2544,2497,2501] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.576,0.278]
select surf_pocket26, protein and id [2991,3015,3017,297,459,3005,458,460,461,339,340,341] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.808,0.361]
select surf_pocket27, protein and id [3221,484,507,3204,475,477] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.678,0.278]
select surf_pocket28, protein and id [49,442,2873,85] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.859,0.902,0.361]
select surf_pocket29, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol29, surf_pocket29 


deselect

orient
