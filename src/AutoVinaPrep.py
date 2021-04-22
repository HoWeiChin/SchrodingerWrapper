import pandas as pd
import os


BINDING_COORDS_DIR = 'predicted_binding_sites'
DOCKING_OUT_DIR = 'docking_out'
BEST_ROW_INDEX = 0 # get first row of the csv file
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
    pdb_code = pdb_f.split('.')[0]
    x_text, y_text, z_text = get_3d_coords(pdb_code)
    receptor_text = get_receptor_text(pdb_f)

    ligand = ligand_f.split('.')[0]
    file_name = f'{pdb_code}_{ligand}_dock.'
    out_path = os.path.join(DOCKING_OUT_DIR, file_name)


    with open(out_path, 'w+') as f:
        f.write(receptor_text + '/n')

        f.write('/n')

        f.write(x_text + '/n')
        f.write(y_text + '/n')
        f.write(z_text + '/n')

        f.write('/n')

        f.write('size_x = 25' + '/n')
        f.write('size_y = 25' + '/n')
        f.write('size_z = 25' + '/n')

        f.write('/n')

        f.write('num_modes = 9')


if __name__ == '__main__':
    print(get_3d_coords('1gog'))
    print(get_receptor_text('1gog.pdb'))
    generate_config('1.pdbqt', '1gog.pdbqt')