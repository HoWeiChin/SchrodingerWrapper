import argparse
from automate_schrodinger import *
from CmdUtil import *

parser = argparse.ArgumentParser()
parser.add_argument('-s', action='store_true', help='use scwrl only')
parser.add_argument('-s_file', action='store', help='scwrl file path')
parser.add_argument('-s_pdb', action='store', help='pdb_folder path for scwrl')
parser.add_argument('-s_het', action='store', help='het_atm_folder path for scwrl')
parser.add_argument('-s_seq', action='store', help='seq_folder path for scwrl')
parser.add_argument('-s_out', action='store', help='out_folder path for scwrl')
parser.add_argument('-s_exe', action='store', help='scwrl exe path for scwrl')
parser.add_argument('-sc', action='store_true', help='use schrodinger only')
parser.add_argument('-sc_pdb', action='store', help='pdb_folder/pdb_file path for schrodinger')
parser.add_argument('-sc_m', action='store', help='mutation file for schrodinger')
parser.add_argument('-sc_out', action='store', help='out_folder for schrodinger')

args = parser.parse_args()

if args.s:
    if args.s_file and args.s_pdb and args.s_het and args.s_seq and args.s_out and args.s_exe:
        batch_scwrl(scwrl_file=args.s_file, pdb_folder=args.s_pdb,
                    het_atm_folder=args.s_het, seq_folder=args.s_seq,
                    out_folder=args.s_out, scwrl_exe=args.s_exe)
    else:
        print('You forgot some flags when invoking -s. All flags are needed: [-s_file, -s_pdb, -s_het, -s_seq, -s_out, '
              '-s_exe]')

if args.sc:
    if args.sc_pdb and args.sc_m and args.sc_out:
        sch_routine(pdb_path=args.sc_pdb,
                    mutation_file=args.sc_m,
                    out_dir=args.sc_out)
    else:
        print('You forgot some flags when invoking -sc. All flags are needed: [-sc_pdb, -sc_m, -sc_out, -s_seq, -s_out]')

if args.s and args.sc:
    print("can't use schrodinger and SCWRL option together.")
