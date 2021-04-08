import argparse
import os
from CmdUtil import batch_scwrl

parser = argparse.ArgumentParser()
parser.add_argument('-s', action='store', help='scwrl file path')
parser.add_argument('-pdb', action='store', help='pdb folder for scwrl')
parser.add_argument('-het', action='store', help='het_atm folder path for scwrl')
parser.add_argument('-mut', action='store_true', help='enable mutation for scwrl')
parser.add_argument('-exe', action='store', help='scwrl exe path')
parser.add_argument('-m', action='store', help='mutation file for schrodinger')

args = parser.parse_args()

print(args.mut)

if not args.pdb:
    print('You forgot to provide a pdb folder.')

elif not args.s:
    print('You forgot to provide a scwrl text file.')

elif not args.exe:
    print('You forgot to provide a scwrl exe file.')

elif not args.het and not args.mut:
    out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')
    batch_scwrl(scwrl_file=args.s, pdb_folder=args.pdb,
                het_atm_folder=None, seq_folder=None,
                out_folder=out_folder_path, scwrl_exe=args.exe)

elif args.het and not args.mut:
    out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')
    batch_scwrl(scwrl_file=args.s, pdb_folder=args.pdb,
                het_atm_folder=args.het, seq_folder=None,
                out_folder=out_folder_path, scwrl_exe=args.exe)

elif not args.het and args.mut:
    out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')
    batch_scwrl(scwrl_file=args.s, pdb_folder=args.pdb,
                het_atm_folder=args.het, seq_folder='seq_f',
                out_folder=out_folder_path, scwrl_exe=args.exe)

elif args.het and args.mut:
    out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')
    batch_scwrl(scwrl_file=args.s, pdb_folder=args.pdb,
                het_atm_folder=args.het, seq_folder='seq_f',
                out_folder=out_folder_path, scwrl_exe=args.exe)
"""

if args.sc:
    if args.sc_pdb and args.sc_m and args.sc_out:
        sch_routine(pdb_path=args.pdb,
                    mutation_file=args.m,
                    out_dir=args.sc_out)
"""
