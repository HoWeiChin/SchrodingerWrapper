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

load "data/CYP3A4-I120W.pdbqt", protein
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

load "data/CYP3A4-I120W.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,725,727,728,729,735,736,731,734,621,718,623,719,791,795,3316,721,722,723,737,741,1481,650,654,1478,622,619,629,642,643,640,641,645,648,653,647,1627,1547,1570,1566,1600,1602,2209,2174,2179,2207,2205,2210,885,889,3327,3332,3333,3334,3335,3336,3337,2212,1252,1253,3367,3368,2157,2180,2183,2185,1249,1278,2193,1279,1975,1971,1974,1220,1243,1244,1477,1501,3640,1471,1474,2721,2729,2737,3634,2242,1467,1469,1470,2261,3637,2722,2725,3641,3644,2727,2730,2742,2757,3272,3273,3281,3282,3315,3321,3285,3305,2240,2241,2723,2724,2680,3266,3279,3280,3326,3271,3322,3325,2758,2762,2763,2764,2765,2766,632,2751,2743,634,1498,1500,1502,1499,1496,1497,228,229,230,231,233,1511,1541,1556,532,2754,2775,3288,633,394,396,398,418,631,412,413,416,419,403,1572,1576,1577,1574,173,2214,2238,2243,2248,3397,2268,3373,3338] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.400,0.702]
select surf_pocket2, protein and id [3277,3274,3344,3345,3278,3254,3255,3179,3206,3208,3142,3143,3180,3183,3218,3221,3204,3247,3220,3284,3414,2624,2625,2626,3181,3184,3182,3351,3352,3354,3388,2569,2571,2538,2540,2655,2654,2656,3411,3380,3350,3378,902,923] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.451,0.902]
select surf_pocket3, protein and id [3647,3076,2706,2710,3608,3609,3589,3595,3603,3607,2957,2991,2993,238,273,3628,3636,213,246,247,3614,2699,3072,3079,3082,3085,2695,223,220,234,3583,2317,2321,3578,3580,3586,3590,2348,3087,2360,2330,2349,2358] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.302,0.702]
select surf_pocket4, protein and id [2222,2224,2226,1462,1434,1435,1436,1437,1461,1403,1357,1359,1328,1329,1360,1227,1230,1201,1330,1333,1197,1198,1200,1164,1171,1173,1174,1176,1167,1169,1204,1338] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.396,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,2114,1732,669,674,677,1698,688,693,695,1660,1681,1682,1683,1684,1656,2111,1790,1793,1757] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.357,0.278,0.702]
select surf_pocket6, protein and id [1278,1277,1279,2159,1393,1395,1781,1784,2192,2158,2166,1817,1255,1257] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.522,0.361,0.902]
select surf_pocket7, protein and id [2261,2722,2725,3641,3644,3653,3656,3661,1467,1470,2232,2233,2235,2723,2255,2257,2260,2281,3663,3664,1166,1167,1168,1165,3684,2282] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.455,0.278,0.702]
select surf_pocket8, protein and id [991,1306,1309,989,967,1946,1947,1949,1264,1292,1294,971,969,970] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.647,0.361,0.902]
select surf_pocket9, protein and id [3197,3198,3200,3125,3175,3171,3174,3044,3045,3050,3051,3130,3129,3043,3207,3195,3196,3202,3039,3041,3023,3046,3021] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.549,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.773,0.361,0.902]
select surf_pocket11, protein and id [1483,1544,1546,1531,1484,1702,1532,1533,1534,1535,1536,1537,1458,1459,1723,1475,1519,1466] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.647,0.278,0.702]
select surf_pocket12, protein and id [3284,3286,3289,3291,3293,3294,3320,3221,3223,3220,539,3292,538,3295,3300,510,3231,3235] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.898,0.361,0.902]
select surf_pocket13, protein and id [3617,3619,3620,3621,3625,3626,1492,3616,3657,3615,3661,3612,3671,3668,1508,203,1506,1507] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.655]
select surf_pocket14, protein and id [1286,1288,1290,1874,1875,1941,1994,1932,1937,1925,1871,1872,1876,1881,1882,1885,1291,1292,1294,1946,1947,1948] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.776]
select surf_pocket15, protein and id [191,200,201,1508,203,204,1507,1555,192,177,175,178,181,169,171,3620,3626] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.557]
select surf_pocket16, protein and id [1011,1013,1015,1037,1038,1016,3452,2501,2502,2504,3483,3484,3485,3486,3482,3746,3757,2499,2500,1071,1072,1073,1074,1075,3741,3742,3763,3765,1036,1040,1041,3493,1014] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.651]
select surf_pocket17, protein and id [1842,1290,1301,1300,1315,1391,1378,1806,1808,1809,1810,1844,1772,1774,1833,1835,1394] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.459]
select surf_pocket18, protein and id [3110,3111,3112,3119,2375,2381,2382,2409,2609,3121,2405,2406,2407] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.525]
select surf_pocket19, protein and id [1990,1998,2023,2026,2027,2021,2022,913,915,1996,2002,1993,1935,1953,1958] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.361]
select surf_pocket20, protein and id [1853,1861,1863,1849,1852,1896,2046,2047,2049,2014,2018,2025,1851,2107,2040,2041,2038,1887,1884] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.400]
select surf_pocket21, protein and id [702,703,658,671,672,1629,733,754,638,641,653,618,629,757,654,727,735,736,731,734] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.298,0.278]
select surf_pocket22, protein and id [891,894,897,901,902,3353,903,904,3355,895,896,3352] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.443,0.361]
select surf_pocket23, protein and id [268,271,274,298,270,304,305,307,300,301,3068,2965,2987,2988,2997,3009,3010,3077,272] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.392,0.278]
select surf_pocket24, protein and id [1562,1618,1620,1534,1535,1561,1568,1621,1650,1651,1652,1593] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.569,0.361]
select surf_pocket25, protein and id [1591,1594,1595,1613,1612,144,145,409,1581,1583] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.490,0.278]
select surf_pocket26, protein and id [3150,3120,3148,2610,3121,2606,3154,2597,2444,2608] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.694,0.361]
select surf_pocket27, protein and id [2469,2480,2486,2552,2577,2579,2471,2472,2556,2509,2513] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.588,0.278]
select surf_pocket28, protein and id [3003,3027,3029,297,459,3017,458,460,461,339,340,341] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.820,0.361]
select surf_pocket29, protein and id [3233,484,507,3216,475,477] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.686,0.278]
select surf_pocket30, protein and id [49,442,2885,85] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.855,0.902,0.361]
select surf_pocket31, protein and id [1181,1026,1339,1025,1058,1238,1023] 
set surface_color,  pcol31, surf_pocket31 


deselect

orient
