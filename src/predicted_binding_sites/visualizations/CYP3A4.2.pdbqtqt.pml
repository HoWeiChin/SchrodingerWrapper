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

load "data/CYP3A4.2.pdbqtqt", protein
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

load "data/CYP3A4.2.pdbqtqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [1468,2196,2199,2200,654,1472,1475,1493,1497,1541,620,727,728,3310,3317,3329,621,623,789,3300,3311,826,3293,3298,2722,2725,2737,1494,1495,2716,2724,2732,1496,1471,1491,1492,3635,3266,3267,3268,3276,3277,3316,2746,2749,2752,3261,3280,3283,2169,725,729,731,736,719,785,718,721,722,723,825,1707,650,619,2761,629,643,2770,645,647,648,653,640,641,632,1622,1535,1565,419,631,1567,1561,1569,1595,1597,2753,2758,2759,2760,2757,2921,2740,2742,396,398,634,2739,374,232,1490,1550,1571,229,233,1505,532,412,413,416,394,395,1572,403,2204,1246,2202,2205,2207,2174,2175,2188,1247,879,883,3322,3327,3328,3330,3331,3332,2178,1972,3362,3363,1971,1272,1273,2152,2180,1966,2235,2236,2237,2718,1461,1462,1464,2719,2209,2233,2238,2243,3274,3275,3321,3368,3320,3333,2675,2263,3392,1214,1237,1238,1266,1243] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.388,0.702]
select surf_pocket2, protein and id [3272,2650,3249,3250,2649,2651,2618,2619,2620,2621,3201,3138,3137,3174,3175,3176,3179,3269,3339,3340,3346,3347,3349,3375,3345,3373,3273,896,916,3279,3242,3213,3215,3216,3199,3203,2558,3381,3384,2557,3382,3409,3406,2592,2563,2529,2560,2564,2566,2533,2534,2535,2561] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.420,0.902]
select surf_pocket3, protein and id [3071,3067,3584,2690,2701,2705,3603,3604,3602,3590,3598,3601,2322,2324,2325,2353,2355,2312,2316,3575,3578,3581,3585,3573,2694,3082,3074,3077,3080,2986,2988,245,246,247,3619,2344,2343] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.294,0.278,0.702]
select surf_pocket4, protein and id [688,674,676,1752,2110,675,677,681,682,683,684,685,686,687,1788,1727,2106,2104,693,695,669,1693,1656,1677,1678,2132,2133,1785,1787] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.455,0.361,0.902]
select surf_pocket5, protein and id [1158,1165,1167,1168,1170,1332,1327,1192,1194,1195,1198,1191,1224,1324,1323,1351,1353,1354,1397,1431,1322,1221,2217,2219,2221,1428,1429,1430,1456,1161,1162] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.416,0.278,0.702]
select surf_pocket6, protein and id [1272,1273,1812,2153,2154,2187,2161,1776,1779,1249,1251,1271,1387,1389] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.612,0.361,0.902]
select surf_pocket7, protein and id [1163,1160,1161,1162,2252,2255,2276,3658,1159,3679,3684,3682,3659,3648,3649,3651,3656,2230] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.537,0.278,0.702]
select surf_pocket8, protein and id [1483,1486,1511,1512,1513,1500,1501,1519,1502,3612,3614,3615,3616,3620,3621,203,3611,3610,3652,3634,3607,3663,3666] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.765,0.361,0.902]
select surf_pocket9, protein and id [103,164,317,106,109,159,161,325,314,100,282,207,186,255,256,183,251,278,289,279] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.655,0.278,0.702]
select surf_pocket10, protein and id [985,1303,1300,961,983,1941,1942,1944,1258,963,964,965,1286,1288] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.878]
select surf_pocket11, protein and id [3018,3192,3193,3046,3016,3190,3191,3197,3034,3036,3041,3038,3202,3039,3040,3045,3124,3120,3170,3195,3166,3169,3125] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.624]
select surf_pocket12, protein and id [3279,539,3281,3284,3286,3287,3288,3289,3315,510,3215,3216,3218,3226,3230,3290,3295,538] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.722]
select surf_pocket13, protein and id [1031,1032,3447,2496,2497,2499,3478,3479,3480,3481,3752,1005,1007,1008,1009,1010,2494,2495,1065,1067,1068,3488,3736,3737,3758,3760,1030,1034,1035,1066,1069] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.502]
select surf_pocket14, protein and id [1285,1286,1282,1936,1989,1927,1284,1288,1280,1866,1867,1869,1870,1871,1876,1877,1880,1932,1920,1941,1942,1943] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.569]
select surf_pocket15, protein and id [3623,3631,223,213,220,3609,245,247,3619,3642,238,234,3602,3601,3604] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.380]
select surf_pocket16, protein and id [1284,1385,1388,1295,1839,1830,1837,1294,1309,1372,1801,1804,1805,1803,1828,1767,1769] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.412]
select surf_pocket17, protein and id [885,888,890,891,895,896,897,889,901,3350,898,899,935] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.302,0.278]
select surf_pocket18, protein and id [1538,1540,1478,1530,1469,1477,1513,1460,1479,1697,1531,1452,1453,1718] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.463,0.361]
select surf_pocket19, protein and id [1985,1988,1930,2021,1948,1953,2018,2022,2016,2017,907,909,1993,1997,1991] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.420,0.278]
select surf_pocket20, protein and id [2009,2013,1891,2020,2041,2042,2044,1846,1848,1856,1858,1844,2102,1847,2033,2035,2036,1879,1882] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.620,0.361]
select surf_pocket21, protein and id [191,200,201,204,177,175,1549,169,178,180,181,203] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.541,0.278]
select surf_pocket22, protein and id [3116,2604,2605,2400,2401,2404,2377,2376,3105,3113,3114,3107] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.776,0.361]
select surf_pocket23, protein and id [2998,3022,458,459,460,461,3011,3012,3014,297,299,339,341,3024] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.663,0.278]
select surf_pocket24, protein and id [484,507,475,477,485,3211,3228] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.871,0.902,0.361]
select surf_pocket25, protein and id [2880,85,49,442] 
set surface_color,  pcol25, surf_pocket25 


deselect

orient
