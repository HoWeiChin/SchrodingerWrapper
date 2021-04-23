import pandas as pd
import os
from MaeToPDB import *
from MaeFile import *
from PubChemUtils import *
from CmdUtil import *

BINDING_COORDS_DIR = 'predicted_binding_sites'
DOCKING_OUT_DIR = 'docking_out'
MAE_DIR = os.getcwd()
MAE_TO_PDB_DIR = os.path.join(os.getcwd(), 'mae_to_pdb')
BEST_ROW_INDEX = 0 # get first row of the csv file
DB_PATH = os.path.join(os.getcwd(), 'test_db/test_db.csv')
LIG_DIR = os.path.join(os.getcwd(), 'Ligands')
X_COORD_COL = 6
Y_COORD_COL = 7
Z_COORD_COL = 8

def get_3d_coords(pdb_code):
    """

    :param pdb_code (str): a pdb code, for example: 1gog, without the .pdb extension
    :return: (tuple of str of 3d coords). for example: ('center_x =  2', 'center_y =  6', 'center_z = -7')
    """
    target_file = list(filter(lambda file: pdb_code in file, os.listdir(BINDING_COORDS_DIR)))

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

    pdb_code = pdb_f.split('.')[0].split('/')[-1].split('_')[0]

    x_text, y_text, z_text = get_3d_coords(pdb_code)
    receptor_text = get_receptor_text(pdb_f)

    ligand = ligand_f.split('.')[0].split('/')[-1]
    print(f'{pdb_code} {ligand}')
    file_name = f'{pdb_code}_{ligand}_dock.txt'
    out_path = os.path.join(DOCKING_OUT_DIR, file_name)

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

def convert_mae_to_pdb():
    files = os.listdir(MAE_DIR)
    mae_files = list(filter(lambda file: '.mae' in file, files))

    mae_file_objects = []
    for mae_file in mae_files:
        mae_file_objects.append(MaeFile(mae_file=mae_file, mae_folder=MAE_DIR))

    for mae_file_obj in mae_file_objects:
        MaeToPDB(mae_file_obj, MAE_TO_PDB_DIR)

def get_ligand_sdfs():
    db_df = pd.read_csv(DB_PATH)
    CID_COL_INDEX = 12
    cids = db_df.iloc[:, CID_COL_INDEX].unique()
    for cid in cids:
        str_cid = str(int(cid))
        get_sdf_from_pubchem(int(cid), LIG_DIR, str_cid+'.sdf')

def prep_ligands():
    get_ligand_sdfs()
    for lig_sdf in os.listdir(LIG_DIR):
        sdf_path = os.path.join(LIG_DIR, lig_sdf)
        lig_pdb_out = sdf_to_pdb(sdf_path)

        os.system(f"rm {sdf_path}")

        pdb_path = os.path.join(LIG_DIR, lig_pdb_out)
        ligand_pdb_to_pdbqt(os.path.join(LIG_DIR, lig_pdb_out), LIG_DIR)

        os.system(f"rm {pdb_path}")

def prep_proteins():
    for protein_pdb in os.listdir(MAE_TO_PDB_DIR):
        protein_pdb_path = os.path.join(MAE_TO_PDB_DIR, protein_pdb)
        protein_pdb_to_pdbqt(protein_pdb_path, MAE_TO_PDB_DIR)
        os.system(f"rm {protein_pdb_path}")

def pred_binding_site(pdb_f):
    """

    :param pdb_f: abs path to pdb
    :return:
    """
    cmd = " ".join([PRANK, 'predict', '-f', pdb_f, '-o', 'predicted_binding_sites'])
    os.system(cmd)

def bulk_pred_binding_sites():
    for pdb in os.listdir(MAE_TO_PDB_DIR):
        abs_pdb_path = os.path.join(MAE_TO_PDB_DIR, pdb)
        pred_binding_site(abs_pdb_path)
        pdb_code = pdb.split('.')[0]
        print(get_3d_coords(pdb_code))

def bulk_docking():
    db_df = pd.read_csv(DB_PATH)
    CID_INDEX = 12
    PDB_CODE_INDEX = 0

    for index, row in db_df.iterrows():
        pdb_code = row[PDB_CODE_INDEX]
        ligand_cid = row[CID_INDEX]

        ligand_pdbqt = list(filter(lambda lig_pdbqt: str(int(ligand_cid)) in lig_pdbqt, os.listdir(LIG_DIR)))[0]
        protein_pdbqt = list(filter(lambda prot_pdbqt: pdb_code in prot_pdbqt, os.listdir(MAE_TO_PDB_DIR)))[0]

        ligand_pdbqt_path = os.path.join(LIG_DIR, ligand_pdbqt)
        protein_pdbqt_path = os.path.join(MAE_TO_PDB_DIR, protein_pdbqt)

        config_txt_path = generate_config(ligand_pdbqt_path, protein_pdbqt_path)
        docking(ligand_pdbqt_path, config_txt_path)

if __name__ == '__main__':
    # print(get_3d_coords('1gog'))
    #print(get_receptor_text('1gog.pdb'))
    #generate_config('1.pdbqt', '1gog.pdbqt')
    #convert_mae_to_pdb()
    #get_ligand_sdfs()
    prep_ligands()
