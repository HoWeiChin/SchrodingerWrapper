from schrodinger import structure
import os

def MaeToPDB(mae_obj, out_dir):
    """

    :param mae_file (MaestroFile): maestro file object
    :param out_dir (str): full_path to out_dir which will store pdb file after changing from mae format
    :return: full path of pdb file, after conversion from mae to pdb format
    """
    mae_file = mae_obj.file
    mae_dir = mae_obj.mae_folder

    if not os.path.isdir(mae_dir):
        raise NotADirectoryError(f'check if {mae_dir} is an existing/valid dir.')

    if mae_file is None or not os.path.isfile(os.path.join(mae_dir, mae_file)):
        raise FileNotFoundError(f'{mae_file} is not found')

    if '.mae' not in mae_file:
        raise ValueError(f'{mae_file} does not contain .mae extension.')

    if not os.path.isdir(out_dir):
        raise NotADirectoryError(f'check if {out_dir} is an existing/valid dir.')

    full_mae_file_path = os.path.join(mae_dir, mae_file)

    for st in structure.StructureReader(full_mae_file_path):
        pdb_file = os.path.join(out_dir, mae_file.replace('.mae', '.pdb'))
        print(f'pdb_path {pdb_file}')
        with structure.StructureWriter(pdb_file) as writer:
            writer.append(st)

    return pdb_file
