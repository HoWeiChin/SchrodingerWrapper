import argparse
import os
from CmdUtil import batch_scwrl_v2
from automate_schrodinger import sch_routine
#from AutoVinaPrep import *

parser = argparse.ArgumentParser()
parser.add_argument('-db', action='store', help='db file path')
parser.add_argument('-pdb', action='store', help='pdb folder for scwrl')
parser.add_argument('-het', action='store', help='het_atm folder path for scwrl')
parser.add_argument('-mut', action='store_true', help='enable mutation for scwrl')
parser.add_argument('-exe', action='store', help='scwrl exe path')
parser.add_argument('-check_cu', action='store_true', help='check charge of Cu')
parser.add_argument('-cross_link', action='store_true', help='Cross Linking')
parser.add_argument('-zero_bond', action='store_true', help='Zero Bonding with CU')

args = parser.parse_args()

if args.pdb == None:
    print('You forgot to provide a pdb folder.')

out_folder_path = os.path.join(os.getcwd(), args.pdb + '/scwrl_out')

if not args.het and args.check_cu and args.zero_bond:
    raise Exception('het atom folder must be given, to enable checking for CU charge and zero order boding with CU.')

elif args.db is None:
    print('You forgot to provide a db csv file.')

elif args.exe is None:
    print('You forgot to provide a scwrl exe file.')

elif args.het is None and not args.mut:
    batch_scwrl_v2(db_file=args.db, pdb_folder=args.pdb,
                het_atm_folder=None, seq_folder=None,
                out_folder=out_folder_path, scwrl_exe=args.exe)

elif args.het and not args.mut:
    batch_scwrl_v2(db_file=args.db, pdb_folder=args.pdb,
               het_atm_folder=args.het, seq_folder=None,
               out_folder=out_folder_path, scwrl_exe=args.exe)

elif args.het is None and args.mut:
    batch_scwrl_v2(db_file=args.db, pdb_folder=args.pdb,
               het_atm_folder=args.het, seq_folder='seq_f',
               out_folder=out_folder_path, scwrl_exe=args.exe)

elif args.het and args.mut:
    batch_scwrl_v2(db_file=args.db, pdb_folder=args.pdb,
               het_atm_folder=args.het, seq_folder='seq_f',
               out_folder=out_folder_path, scwrl_exe=args.exe)

"""
sch_routine(pdb_path=out_folder_path, scwrl_file=args.s, is_cross_link=args.cross_link,
                is_zero_order_bonding=args.zero_bond, is_check_cu_charge=args.check_cu,
                out_dir=os.path.join(os.getcwd(), args.pdb + '/for_sch_opt')
                )

convert_mae_to_pdb()
prep_ligands()
prep_proteins()
bulk_pred_binding_sites()
bulk_docking()
"""