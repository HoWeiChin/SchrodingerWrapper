import pandas as pd
import os
from MaeToPDB import *
from MaeFile import *
from PubChemUtils import *
from CmdUtil import *

BINDING_COORDS_DIR = 'predicted_binding_sites'
DOCKING_OUT_DIR = 'docking_out'
MAE_DIR = os.getcwd()
BEST_ROW_INDEX = 0 # get first row of the csv file
#DB_PATH = os.path.join(os.getcwd(), 'test_db/test_db_subset_CYP3A4_1tqn.csv')
LIG_DIR = os.path.join(os.getcwd(), 'Ligands')
X_COORD_COL = 6
Y_COORD_COL = 7
Z_COORD_COL = 8

def get_3d_coords(pdb_code):
    """

    :param pdb_code (str): a pdb code, for example: 1gog, without the .pdb extension
    :return: (tuple of str of 3d coords). for example: ('center_x =  2', 'center_y =  6', 'center_z = -7')
    """

    target_file = list(filter(lambda file: pdb_code in file and 'predictions' in file, os.listdir(BINDING_COORDS_DIR)))
    print('inside get_3d_coords()')
    print(f'pdb code: {pdb_code}')
    print(target_file)
    if len(target_file) == 0:
        raise FileNotFoundError(f'{pdb_code} pdb file not present.')

    target_file_path = os.path.join(os.getcwd() +'/' + BINDING_COORDS_DIR, target_file[0])
    df = pd.read_csv(target_file_path)

    if df.empty:
        raise Exception(f'{pdb_code} pdb file is empty, pls ensure it contains protein.')

    x = df.iloc[BEST_ROW_INDEX, X_COORD_COL]
    y = df.iloc[BEST_ROW_INDEX, Y_COORD_COL]
    z = df.iloc[BEST_ROW_INDEX, Z_COORD_COL]

    x_coord_text = " ".join(['center_x', '=', str(x)])
    y_coord_text = " ".join(['center_y', '=', str(y)])
    z_coord_text = " ".join(['center_z', '=', str(z)])

    return (x_coord_text, y_coord_text, z_coord_text)

def get_receptor_text(file_name):
    """

    :param file_name (str): eg: receptor.pdbqt
    :return: str for eg: 'receptor = receptor.pdbqt'
    """
    return " ".join(['receptor', '=', file_name])

def generate_config(ligand_f, pdb_f):
    """

    :param ligand_f: in .pdbqt format
    :param pdb_f:  in .pdbqt format
    :return:
    """

    pdb_code = pdb_f.split('/')[-1].replace('.pdbqt', '')

    x_text, y_text, z_text = get_3d_coords(pdb_code)
    receptor_text = get_receptor_text(pdb_f)

    ligand = ligand_f.split('.')[0].split('/')[-1]

    file_name = f'{pdb_code}_{ligand}_dock.txt'
    out_path = os.path.join(DOCKING_OUT_DIR, file_name)

    print('inside generate_config()')
    print(out_path)

    with open(out_path, 'w+') as f:
        f.write(receptor_text + '\n')

        f.write('\n')

        f.write(x_text + '\n')
        f.write(y_text + '\n')
        f.write(z_text + '\n')

        f.write('\n')

        f.write('size_x = 25' + '\n')
        f.write('size_y = 25' + '\n')
        f.write('size_z = 25' + '\n')

        f.write('\n')

        f.write('num_modes = 9')
    return out_path

def get_ligand_sdfs(db_path):
    db_df = pd.read_csv(db_path)
    CID_COL_INDEX = 14
    cids = db_df.iloc[:, CID_COL_INDEX].unique()

    for cid in cids:
        str_cid = str(int(cid))
        get_sdf_from_pubchem(int(cid), LIG_DIR, str_cid+'.sdf')

def prep_ligands(db_path):
    get_ligand_sdfs(db_path)
    for lig_sdf in os.listdir(LIG_DIR):
        sdf_path = os.path.join(LIG_DIR, lig_sdf)
        lig_pdb_out = sdf_to_pdb(sdf_path)

        os.system(f"rm {sdf_path}")

        pdb_path = os.path.join(LIG_DIR, lig_pdb_out)
        ligand_pdb_to_pdbqt(os.path.join(LIG_DIR, lig_pdb_out), LIG_DIR)

        os.system(f"rm {pdb_path}")

def prep_proteins(path, pdbqt_out_folder):
    file_dir = path

    for protein_pdb in os.listdir(file_dir):
        protein_pdb_path = os.path.join(file_dir, protein_pdb)
        protein_pdb_to_pdbqt(protein_pdb_path, pdbqt_out_folder)

def pred_binding_site(pdb_f):
    """

    :param pdb_f: abs path to pdb
    :return:
    """
    cmd = " ".join([PRANK, 'predict', '-f', pdb_f, '-o', 'predicted_binding_sites'])
    os.system(cmd)

def bulk_pred_binding_sites(path):
    for pdbqt in os.listdir(path):
        abs_pdb_path = os.path.join(path, pdbqt)
        pred_binding_site(abs_pdb_path)


def bulk_docking(path, db_path):
    file_dir = path

    db_df = pd.read_csv(db_path)
    CID_INDEX = 14
    PDB_CODE_INDEX = 1

    for index, row in db_df.iterrows():
        pdb_code = row[PDB_CODE_INDEX]

        ligand_cid = row[CID_INDEX]
        print(f'pdb code: {pdb_code} ligand cid: {ligand_cid} in docking')


        ligand_pdbqt = list(filter(lambda lig_pdbqt: str(int(ligand_cid)) in lig_pdbqt, os.listdir(LIG_DIR)))[0]
        protein_pdbqt = list(filter(lambda prot_pdbqt: pdb_code in prot_pdbqt, os.listdir(file_dir)))[0]

        ligand_pdbqt_path = os.path.join(LIG_DIR, ligand_pdbqt)
        protein_pdbqt_path = os.path.join(file_dir, protein_pdbqt)

        config_txt_path = generate_config(ligand_pdbqt_path, protein_pdbqt_path)
        print(config_txt_path)
        docking(ligand_pdbqt_path, config_txt_path, protein_pdbqt_path)

if __name__ == '__main__':
    # print(get_3d_coords('1gog'))
    #print(get_receptor_text('1gog.pdb'))
    #generate_config('1.pdbqt', '1gog.pdbqt')
    #get_ligand_sdfs()
    #prep_ligands()
    #out_folder_path = os.path.join(os.getcwd(), 'pdb_f/scwrl_out')
    prep_ligands(db_path='test_db/single_near_mutant_CYP3A4_db.csv')
    bulk_docking(path='pdb_f/pdbqt', db_path='test_db/single_near_mutant_CYP3A4_db.csv')
