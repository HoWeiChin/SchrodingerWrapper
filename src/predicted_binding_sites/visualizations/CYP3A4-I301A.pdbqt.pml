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

load "data/CYP3A4-I301A.pdbqt", protein
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

load "data/CYP3A4-I301A.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [620,622,725,727,728,729,736,619,715,731,621,718,623,719,785,789,721,722,1475,1706,648,650,653,654,735,1472,1541,629,642,643,640,641,645,647,1560,1564,1621,1594,1596,2200,2165,2170,2198,2201,2203,2151,2171,2184,3318,3323,3324,3325,3307,2174,723,879,883,3326,3327,3328,2176,1965,2195,2196,1214,1237,1238,1246,1247,1969,3358,3359,1243,1272,1273,1968,1471,1495,3631,1465,1468,2712,2720,2728,3625,2233,1461,1463,1464,2252,3628,2713,2716,3632,3635,2718,2721,2733,2748,3263,3264,3272,3273,3306,3312,3276,3296,2231,2232,2714,2715,2671,3257,3270,3271,3317,3262,3313,3316,2749,2753,2754,2755,2756,2757,632,2742,2734,634,1492,1494,1496,1493,1490,1491,228,229,230,231,233,1505,1535,1550,532,2745,2766,3279,633,394,396,398,418,631,412,413,416,419,403,1566,1570,1571,1568,173,2205,2229,2234,2239,3388,2259,3364,3329] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [3268,3265,3335,3336,3269,3245,3246,3170,3197,3199,3133,3134,3171,3174,3209,3212,3195,3238,3211,3275,3405,2615,2616,2617,3172,3175,3173,3342,3343,3345,3379,2560,2562,2529,2531,2646,2645,2647,3402,3371,3341,3369,896,917] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [3638,3067,2697,2701,3599,3600,3580,3586,3594,3598,2948,2982,2984,238,273,3619,3627,213,246,247,3605,2690,3063,3070,3073,3076,2686,223,220,234,3574,2308,2312,3569,3571,3577,3581,2339,3078,2351,2321,2340,2349] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [1428,1429,1430,1351,1353,1431,1354,1221,1224,2213,2215,2217,1195,1324,1397,1322,1323,1327,1455,1456,1191,1192,1194,1158,1165,1167,1168,1170,1161,1163,1198,1332] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [681,682,683,684,685,686,687,1675,1676,1677,1678,1726,695,669,674,688,677,1692,1654,1650,1784,1787,2108,2105,1751,693] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [1272,1249,1251,1271,1273,1387,1389,1811,2152,2153,2160,1775,1778,2183] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [2252,2713,2716,3632,3635,3644,3647,3652,1461,1464,2223,2224,2226,2714,2246,2248,2251,2272,3654,3655,1160,1161,1162,1159,3675,2273] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [1300,1303,1286,1288,965,964,1943,985,961,983,1940,1941,1258,963] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [3188,3189,3191,3116,3166,3162,3165,3035,3036,3041,3042,3121,3120,3034,3198,3186,3187,3193,3030,3032,3014,3037,3012] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [159,161,164,186,183,278,289,325,103,255,256,314,317,100,106,109,279,282,207] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [3275,3277,3280,3282,3284,3285,3311,3212,3214,3211,539,3283,538,3286,3291,510,3222,3226] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [1477,1538,1540,1525,1478,1696,1526,1530,1531,1452,1453,1717,1469,1479,1483,1513,1460] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [3608,3610,3611,3612,3616,3617,1486,3607,3648,3606,3652,3603,3662,3659,1502,203,1500,1501] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [1940,1941,1942,1926,1919,1870,1286,1288,1282,1868,1875,1879,1931,1280,1869,1865,1866,1876,1284,1285,1935,1988] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [191,200,201,1502,203,204,1501,1549,192,177,175,178,181,169,171,3611,3617] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [1005,1007,1009,1031,1032,1010,3443,2492,2493,2495,3474,3475,3476,3477,3473,3737,3748,2490,2491,1065,1066,1067,1068,1069,3732,3733,3754,3756,1030,1034,1035,3484,1008] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [1388,1294,1295,1803,1804,1838,1766,1385,1372,1768,1284,1836,1800,1802,1827,1829,1309] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3101,3102,3103,3110,2366,2372,2373,2400,2600,3112,2396,2397,2398] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [907,909,1952,1996,1984,1947,1987,1990,1929,2017,2020,2021,2015,2016,1992] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [1855,1843,1890,2043,1878,1881,2012,2019,1846,2032,2034,2035,2008,2040,2041,1845,1847,1857,2101] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [890,3346,885,888,3344,889,891,895,896,897,898,3343] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [268,271,274,298,270,304,305,307,300,301,3059,2956,2978,2979,2988,3000,3001,3068,272] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [1555,1556,1562,1612,1614,1644,1645,1646,1615,1528,1529,1587] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [1606,1585,1588,1589,1607,144,145,409,1575,1577] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3141,3111,3139,2601,3112,2597,3145,2588,2435,2599] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [2460,2471,2477,2543,2568,2570,2462,2463,2547,2500,2504] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [2994,3018,3020,297,459,3008,458,460,461,339,340,341] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [3224,484,507,3207,475,477] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [49,442,2876,85] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [1175,1020,1333,1019,1052,1232,1017] 
set surface_color,  pcol30, surf_pocket30 


deselect

orient
