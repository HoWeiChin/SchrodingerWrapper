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

load "data/1gog_1_out.pdbqt", protein
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

load "data/1gog_1_out.pdbqt_points.pdb.gz", points
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
select surf_pocket1, protein and id [990,1585,1797,1798,1809,986,996,1047,1009,1011,1027,1008,1576,1026,1033,1052,1055,1061,2,5,1044,1040,1025,1034,1022,1030,1035,976,4774,4783,1,9,4838,4844,4845,4841,13,4835,4839,4840,4842,4843,14,1081,4854,1808,4773,1779] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.408,0.702]
select surf_pocket2, protein and id [2275,2479,2688,2689,2690,2691,2693,2694,2254,2283,2284,2285,1824,1830,2670,2671,2673,3037,2252,2255,2256,2257,2667,2681,2684,2675,1825,1839,1842,1820,1834,2659,2704,2698] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.467,0.902]
select surf_pocket3, protein and id [367,368,215,403,675,214,337,341,206,205,703,316,700,328,190,399,401,739,740,400,717,1307,440,1305,407,1282] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.322,0.702]
select surf_pocket4, protein and id [4530,4539,4348,4350,4523,4524,4525,4526,4529,1443,1444,1445,1456,1459,1461,1112,4543,1111,1408,1440,1421,1423,35,1101,1104,4542,4541,1395,1405,1410,1414,1415,33,40,44,616,1110] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.361,0.361,0.902]
select surf_pocket5, protein and id [934,953,954,957,924,925,931,933,799,816,1958,1959,1966,1968,785,786,787,1944,1559,1927,4879,4680,1543,1544,4881,4692,4695,1943,1945] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.322,0.278,0.702]
select surf_pocket6, protein and id [4145,4148,5801,4144,4931,4933,4929,4408,4425,4434,4918,4155,4159,4387,4409,4474,4475,4480,4477,4481,4416,4385,4917,1484,1493,4487,4505,5297,5826,5830] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.467,0.361,0.902]
select surf_pocket7, protein and id [1666,5879,5882,5883,5884,5885,4668,4669,4670,4673,5861,5863,5868,5872,1681,1683,1947,1675,1674,1659,4672,5069,5875,5876,5073,5105,5106,5132,5134,5135,5078,5101] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.408,0.278,0.702]
select surf_pocket8, protein and id [81,83,1366,1367,1368,285,72,98,1035,308,306,655,658,1346,1348,79,61,67,68,75,76,77,78,92,639,277,278,638,56,1386,1390,1036,1059] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.576,0.361,0.902]
select surf_pocket9, protein and id [2675,2677,4595,3760,3039,3050,4276,4285,1823,1825,4287,4599,4611] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.490,0.278,0.702]
select surf_pocket10, protein and id [1988,1995,1999,2000,2001,1256,994,1266,1992,779,783,1238,1239,775,1254,1246,1982,1588,1586,966,967,973,998,1002,993,987,784,1977,1240] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.682,0.361,0.902]
select surf_pocket11, protein and id [4949,4948,4961,4962,4971,4915,4918,4914,4932,4933,4929,1482,5825,5826,5827,5830,4970,4975,5018,4960,4963,5818] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.573,0.278,0.702]
select surf_pocket12, protein and id [4426,4418,4424,5513,3617,3619,3640,3641,3643,5312,4137,4142,4145,5800,4143,4144,5489,5511,3616,3607,4417,4415,5293,5294,5297,5304,5305] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.792,0.361,0.902]
select surf_pocket13, protein and id [3839,3822,3525,3821,3963,3492,3489,3829,3841,3470,3503,3504,3509,3488,3487,3816,3811,3826,3997,3974,3996,3987,3988] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.659,0.278,0.702]
select surf_pocket14, protein and id [4285,1823,1825,1827,4287,4769,4286,1830,1815,4773,1817,1832,1829,1831,4766,4767,4765] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.902]
select surf_pocket15, protein and id [4830,37,26,31,33,34,4541,4797,21,4561,4308,4304,4305,4555,4348] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.659]
select surf_pocket16, protein and id [4017,4021,3988,4004,4011,4020,3999,3811,3812,4013,3992,3989] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.792]
select surf_pocket17, protein and id [2185,2809,2186,2802,2794,2175,2176,2177,5719,2589,2579,2580,2587,2588,5721,2598,5926,5936,5931,5935] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.573]
select surf_pocket18, protein and id [3658,3867,3659,3661,3849,3851,4444,4445,4446,3957,4412,4413,4414,4415,3660,3605,3607] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.682]
select surf_pocket19, protein and id [1999,2000,2001,2002,1894,992,994,1888,2004,2006,2007,1889,2026,993,987,998,1002,1588,1586,973,1886] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.490]
select surf_pocket20, protein and id [1110,1460,1540,1534,1545,1520,1550,1097,1101,1103,1104,1100,940,1121,1092,1461,1505,1521,4523] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.576]
select surf_pocket21, protein and id [4949,4950,4955,4956,4989,4990,4962,4915,4973,4980,4981,4953,4912,4992,1506,1508,1481,1482,1495,1475,1478] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.278,0.408]
select surf_pocket22, protein and id [3256,3260,3265,3532,3533,3264,3266,3269,3429,2974,2978,3534,2943,3273,2959] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.361,0.467]
select surf_pocket23, protein and id [3708,3540,3819,3802,3118,3818,3248,3523,3822,3518,3444,3441] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.278,0.322]
select surf_pocket24, protein and id [2671,2673,3035,3037,2667,2681,2675,2677,3039,3036,2659,2704] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.361,0.361]
select surf_pocket25, protein and id [2574,2584,3176,3178,5687,2583,5684,5939,3177,3169,3183,5671,5674,5675,5676,5679,5665] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.322,0.278]
select surf_pocket26, protein and id [1767,1771,1869,1889,2026,2027,994,1888,1763,1769,1871] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.467,0.361]
select surf_pocket27, protein and id [5281,5282,5285,5815,5269,5274,5275,5819,5536,5538,5611,5612,5532,5535,5554,5557,5284] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.408,0.278]
select surf_pocket28, protein and id [815,833,834,835,837,918,903,904,831,836,933,1193,1217,905] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.576,0.361]
select surf_pocket29, protein and id [1939,1693,1992,2383,2010,2012,2009,1991,1974,1975,1977,1961,1936,1690,1912,1913] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.490,0.278]
select surf_pocket30, protein and id [149,150,906,877,875,515,517,1173,1174,516] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.902,0.682,0.361]
select surf_pocket31, protein and id [1830,1823,1825,1832,1831,1834,1835] 
set surface_color,  pcol31, surf_pocket31 
set_color pcol32 = [0.702,0.573,0.278]
select surf_pocket32, protein and id [65,121,67,70,71,96,107,110,72,99,585,541,565,566] 
set surface_color,  pcol32, surf_pocket32 
set_color pcol33 = [0.902,0.792,0.361]
select surf_pocket33, protein and id [3007,3009,3032,3033,3036,3038,3005,3006,2704,3035,3037,3039] 
set surface_color,  pcol33, surf_pocket33 
set_color pcol34 = [0.702,0.659,0.278]
select surf_pocket34, protein and id [5257,5260,5261,5264,5267,5815,5269,5820,5268,5808,5809,5811,5023] 
set surface_color,  pcol34, surf_pocket34 
set_color pcol35 = [0.902,0.902,0.361]
select surf_pocket35, protein and id [5407,5409,5423,5406,4098,3571,4101,4104,5427,5460,4106,4634,4617,4623,5383,3578] 
set surface_color,  pcol35, surf_pocket35 
set_color pcol36 = [0.659,0.702,0.278]
select surf_pocket36, protein and id [2202,2828,2203,2826,2326,2185,2800,2414,2416] 
set surface_color,  pcol36, surf_pocket36 


deselect

orient
