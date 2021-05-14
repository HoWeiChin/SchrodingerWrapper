import argparse
import os
from CmdUtil import batch_scwrl
from automate_schrodinger import sch_routine
from Process import Process

parser = argparse.ArgumentParser()
parser.add_argument('-s', action='store', help='scwrl file path')
parser.add_argument('-pdb', action='store', help='pdb folder for scwrl')
parser.add_argument('-exe', action='store', help='scwrl exe path')
parser.add_argument('-check_cu', action='store_true', help='check charge of Cu')
parser.add_argument('-cross_link', action='store_true', help='Cross Linking')
parser.add_argument('-zero_bond', action='store_true', help='Zero Bonding with CU')

args = parser.parse_args()

fix_residues = None
if not args.fix is None:
    fixed_residues = [int(res_position) for res_position in args.fix[0].split(',')]

if args.pdb == None:
    print('You forgot to provide a pdb folder.')

out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')

if not args.het and args.check_cu and args.zero_bond:
    raise Exception('het atom folder must be given, to enable checking for CU charge and zero order boding with CU.')

elif args.s is None:
    print('You forgot to provide a scwrl text file.')

elif args.exe is None:
    print('You forgot to provide a scwrl exe file.')

if not args.het is None:
    batch_scwrl(scwrl_file=args.s, pdb_folder=args.pdb,
                het_atm_folder=args.het, seq_folder='seq_f',
                out_folder=out_folder_path, scwrl_exe=args.exe)

"""
elif args.het is None:
    batch_scwrl(scwrl_file=args.s, pdb_folder=args.pdb,
                het_atm_folder=None, seq_folder='seq_f',
                out_folder=out_folder_path, scwrl_exe=args.exe, fixed_residues=fixed_residues)
"""



"""
p = Process(out_folder_path, args.s, out_dir=out_folder_path)
p.process()
sch_routine(is_cross_link=args.cross_link,
                is_zero_order_bonding=args.zero_bond, is_check_cu_charge=args.check_cu,
                out_dir=out_folder_path)
"""