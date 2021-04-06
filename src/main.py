import argparse
import os
from automate_schrodinger import *
from CmdUtil import *

parser = argparse.ArgumentParser()
parser.add_argument('-s_file', action='store', help='scwrl file path')
parser.add_argument('-pdb', action='store', help='pdb folder for scwrl')
parser.add_argument('-het', action='store', help='het_atm folder path for scwrl')
parser.add_argument('-seq', action='store', help='seq_folder path for scwrl')
parser.add_argument('-exe', action='store', help='scwrl exe path')
parser.add_argument('-m', action='store', help='mutation file for schrodinger')

args = parser.parse_args()

if not args.pdb:
    print('You forgot to provide a pdb folder.')

elif not args.s_file:
    print('You forgot to provide a scwrl text file.')

elif not args.exe:
    print('You forgot to provide a scwrl exe file.')

elif not args.het and not args.seq:
    out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')
    batch_scwrl(scwrl_file=args.s_file, pdb_folder=args.pdb,
                het_atm_folder=None, seq_folder=None,
                out_folder=out_folder_path, scwrl_exe=args.exe)

elif args.het and not args.seq:
    out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')
    batch_scwrl(scwrl_file=args.s_file, pdb_folder=args.pdb,
                het_atm_folder=args.het, seq_folder=None,
                out_folder=out_folder_path, scwrl_exe=args.exe)

elif args.het and args.seq:
    out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')
    batch_scwrl(scwrl_file=args.s_file, pdb_folder=args.pdb,
                het_atm_folder=args.het, seq_folder=args.seq,
                out_folder=out_folder_path, scwrl_exe=args.exe)
"""

if args.sc:
    if args.sc_pdb and args.sc_m and args.sc_out:
        sch_routine(pdb_path=args.pdb,
                    mutation_file=args.m,
                    out_dir=args.sc_out)
"""
