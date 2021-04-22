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

load "data/1gog.pdb", protein
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

load "data/1gog.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [1485,1487,1488,3760,1478,1491,1492,1486,1489,1490,3761,3887,3888,3889,3890,3488,3490,3491,2177,2180,2475,2476,3749,3750,3047,2486,3058,3478,3059,2453,1477,3893] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.369,0.702]
select surf_pocket2, protein and id [1279,802,1464,833,798,821,849,832,834,790,792,854,838,851,843,848,839,857,859,1463,3949,3951,3952,10,3946,3947,3948,3950,6,3902,1,2,5,3945,1454,1472] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.373,0.902]
select surf_pocket3, protein and id [3377,3389,3376,3375,3388,3611,3576,3595,3596,3620,3621,3653,3654,3655,3656,3657,3658,3379,4023,3577,4005,4008,4016,4017,4020,3676,1204,3677,4012,4015,3574,3652,3610,3608,3612,4308,4309,4740,4717] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.349,0.278,0.702]
select surf_pocket4, protein and id [748,755,1597,1598,1603,772,773,774,643,754,752,753,658,1605,636,637,1585,1252,1251,1571,3980,3833] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.553,0.361,0.902]
select surf_pocket5, protein and id [550,569,580,270,172,271,272,164,262,250,296,1056,294,322,354,324,325,598,171,328] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.510,0.278,0.702]
select surf_pocket6, protein and id [518,841,860,861,1126,1127,46,839,840,1107,1108,1109,68,69,531,534,1089,1090,227,1088,23,22] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.757,0.361,0.902]
select surf_pocket7, protein and id [3705,3540,3541,3542,3702,3544,3545,3546,3704,3543,1151,1153,1147,1166,1169,1170,895,3706,3689,3691,3695,3696,902,500,901,1141,1138,27,28] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.671,0.278,0.702]
select surf_pocket8, protein and id [1633,1634,804,806,813,1015,1024,1617,809,1013,787,799,782,783,634,626,629,1001] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.839]
select surf_pocket9, protein and id [3504,3505,3508,3941,3715,3721,3546,3704,30,20,25,27,28,3913,16] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.573]
select surf_pocket10, protein and id [2973,2974,2930,2932,3601,3598,3627,3600,3129,3130,3131,3587,3588,3628,2975,3206,3219,3220] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.631]
select surf_pocket11, protein and id [1497,1500,1501,1841,1842,1843,1481,1484,1486,1490,1493,2180,2172,2187] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.412]
select surf_pocket12, protein and id [1852,1856,2184,2187,2189,2190,2191,2192,2193,2024,2194,2172,1839] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.427]
select surf_pocket13, protein and id [1372,1373,1371,3810,3811,3812,4786,3808,3809,3813,3814,3818,3820,3817,1353,1360,1586,1587,1588,1589,1593,1367,1366,4767,4773] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.306,0.278]
select surf_pocket14, protein and id [2658,2661,2793,2794,2665,2659,2660,2396,2423,2427,2870,2411,2652,2654,2869,2868] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.498,0.361]
select surf_pocket15, protein and id [10,3942,3946,3948,11,876,3945,3960,3933,3939,854,851,857,855] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.467,0.278]
select surf_pocket16, protein and id [1382,1940,1941,1398,1546,1642,1554,1559,1549,1550,1626,1639,1624] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.702,0.361]
select surf_pocket17, protein and id [965,419,420,119,120,434,424,707,945,947,430,421,709,733] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.624,0.278]
select surf_pocket18, protein and id [2999,2802,2997,3120,3122,3103,3104,3105,3013,3107,2859,2875,3093] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.894,0.902,0.361]
select surf_pocket19, protein and id [4388,2046,2055,2517,2519,4389,4390,1729,1736,4383] 
set surface_color,  pcol19, surf_pocket19 


deselect

orient
