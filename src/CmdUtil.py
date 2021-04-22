from progress.spinner import MoonSpinner
from ScwrlMutant import mutate
from pathlib import Path
import os

MGL_PY = '/home/howc/Downloads/mgltools_x86_64Linux2_1.5.6/bin/python'
MGL_PRO_PREP = '/home/howc/Downloads/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py'
MGL_LIG_PREP = '/home/howc/Downloads/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py'
PRANK = str(Path.cwd().parent / 'p2rank_2.2/prank')

def run_scwrl(
        full_pdb_path,
        out_pdb,
        scwrl_exe_path,
        seq_file_path=None,
        hetatm_pdb_path=None):
    """
    :param full_pdb_path: path of <pdb_code>.pdb
    :param out_pdb: name of output pdb file
    :param scwrl_exe_path: path to scwrl exe file
    :param scwrl_bash_alias: scwrl programme alias, eg: swrl instead of scwrl
    :param seq_file_path: path to a .txt file telling scwrl how to do mutation
    :param hetatm_pdb_path: path of hetatm.pdb
    :return:

    """
    is_add_het = False

    # no mutation, just add het atoms
    if seq_file_path is None and hetatm_pdb_path:
        bash_cmd = " ".join([scwrl_exe_path, '-i', full_pdb_path, '-h',
                             '-f', hetatm_pdb_path, '-o', out_pdb, '> log.txt'])
        is_add_het = True

    # mutation and add het atoms
    elif seq_file_path and hetatm_pdb_path:
        bash_cmd = " ".join([scwrl_exe_path, '-i', full_pdb_path, '-h', '-s', seq_file_path,
                             '-f', hetatm_pdb_path, '-o', out_pdb, '> log.txt'])
        is_add_het = True

    # mutation and don't add het atoms
    elif seq_file_path and hetatm_pdb_path is None:
        bash_cmd = " ".join([scwrl_exe_path, '-i', full_pdb_path, '-h', '-s', seq_file_path,
                             '-o', out_pdb, '> log.txt'])

    # plain side-chain modelling
    else:
        bash_cmd = " ".join([scwrl_exe_path, '-i', full_pdb_path, '-h',
                             '-o', out_pdb, '> log.txt'])

    os.system(bash_cmd)

    if is_add_het:
        bash_cmd = " ".join(['mv', '-f', out_pdb, out_pdb + '.old'])
        os.system(bash_cmd)

        bash_cmd = " ".join(['grep', '^ATOM', out_pdb + '.old', '>', out_pdb])
        os.system(bash_cmd)

        bash_cmd = " ".join(['echo', "TER", ">>", out_pdb])
        os.system(bash_cmd)

        bash_cmd = " ".join(['cat', hetatm_pdb_path, '>>', out_pdb])
        os.system(bash_cmd)

        bash_cmd = f'rm {out_pdb}.old'

        os.system(bash_cmd)


def run_prepwizard(prepwiz_exe_path, mae_in, mae_out):
    bash_cmd = " ".join([prepwiz_exe_path, '-nobondorders', '-noccd', '-watdist', '0', '-nometaltreat', '-propka_pH',
                         '7', '-minimize_adj_h', '-fix', '-f', '3', mae_in, mae_out])

    os.system(bash_cmd)


def check_folder(folder_path: str):
    if not os.path.exists(folder_path):
        raise Exception(f'{folder_path} is absent, pls create it first.')


def file_ordering(files):
    # files is of type list
    result = [0, 0, 0]

    for file in files:
        if '.pdb' in file:
            result[0] = file.strip()

        if 'het' in file:
            result[1] = file.strip()

        if file.count(':') == 2:
            result[2] = file.strip()

    return result


def batch_scwrl(scwrl_file: str, pdb_folder: str,
                het_atm_folder: str, seq_folder: str,
                out_folder: str, scwrl_exe: str
                ):
    """

    :param scwrl_file (str): file containing, pdb file, het_atm.txt (to store scwrl output)
    :param pdb_folder (str): folder containing pdb file(s)
    :param het_atm_folder (str): folder containing het atm txt file(s)
    :param seq_folder (str): folder containing seq.txt file(s)
    :param out_folder (str):
    :return:
    """
    try:
        """
        note that scwrl_file should be comma-separated in the following manner:
        a.pdb, het_atm_file_for_a.txt, seq_file.txt
        
        """
        file = open(scwrl_file, 'r')
        file.close()

    except FileNotFoundError:
        print(f'{scwrl_file} not present, pls check.')

    if not os.path.exists(out_folder):
        os.makedirs(out_folder)

    if het_atm_folder:
        check_folder(het_atm_folder)

    if seq_folder:
        if not os.path.exists(seq_folder):
            os.mkdirs(seq_folder)

    check_folder(pdb_folder)

    with open(scwrl_file, 'r') as file:
        lines = file.readlines()
        row_index = 1
        print(lines)
        with MoonSpinner('SCWRL in progress') as bar:
            for line in lines:

                if line.count(',') < 2 or line.count(',') > 3 :
                    row_index += 1
                    #bar.next()
                    continue

                # correct it, if users give wrong file ordering
                pdb_file, het_file, seq_file = file_ordering(line.strip().split(','))
                print(f'{pdb_file} {het_file} {seq_file}')
                if pdb_file == 0 or (het_file != 0 and het_atm_folder is None) or (seq_file != 0 and seq_folder is None):
                    row_index += 1
                    #bar.next()
                    continue

                print(f'Processing {pdb_file} with scwrl')
                full_pdb_path = os.path.join(pdb_folder, pdb_file)
                pdb_name = pdb_file.split('.')[0]
                out_file = f'{pdb_name}_{row_index}_out.pdb'
                out_file = os.path.join(out_folder, out_file)


                if het_file == 0:

                    if seq_file == 0:
                        run_scwrl(full_pdb_path=full_pdb_path,
                                  out_pdb=out_file,
                                  scwrl_exe_path=scwrl_exe
                                  )

                    elif seq_file != 0:
                        residue_num, mutant_aa, chain = seq_file.split(':')

                        if chain == '':
                            chain = None

                        _, seq_file_path = mutate(seq_folder, full_pdb_path, int(residue_num), mutant_aa, chain)
                        run_scwrl(full_pdb_path=full_pdb_path,
                                  out_pdb=out_file,
                                  scwrl_exe_path=scwrl_exe,
                                  seq_file_path=seq_file_path
                                  )

                if het_file != 0:
                    het_atm_pdb_file = os.path.join(het_atm_folder, het_file)

                    if seq_file == 0:
                        run_scwrl(full_pdb_path=full_pdb_path,
                                  out_pdb=out_file,
                                  scwrl_exe_path=scwrl_exe,
                                  hetatm_pdb_path=het_atm_pdb_file
                                  )

                    if seq_file != 0:

                        residue_num, mutant_aa, chain = seq_file.split(':')
                        if chain == '':
                            chain = None

                        _, seq_file_path = mutate(seq_folder, full_pdb_path, int(residue_num), mutant_aa, chain)

                        run_scwrl(full_pdb_path=full_pdb_path,
                                  out_pdb=out_file,
                                  scwrl_exe_path=scwrl_exe,
                                  seq_file_path=seq_file_path,
                                  hetatm_pdb_path=het_atm_pdb_file
                                  )

                row_index += 1
                #bar.next()

def sdf_to_pdb(sdf_in):
    """

    :param sdf_in (str): full path to a .sdf file
    :return:
    """
    if type(sdf_in) != str:
        raise TypeError(f'sdf file: {sdf_in} is not of type string')

    if type(sdf_in) == type(None):
        raise TypeError(f'sdf file: {sdf_in} is of type None.')

    if '.sdf' in sdf_in:
        pdb_out = sdf_in.split('.')[0] + '.pdb'

    elif '.sdf' not in sdf_in:
        pdb_out = sdf_in + '.pdb'

    sdf_to_pdb_cmd = " ".join(['babel', sdf_in, pdb_out])
    os.system(sdf_to_pdb_cmd)

def protein_pdb_to_pdbqt(pdb_f, out_dir):
    """

    :param pdb_f (str): abs path to a pdb file
    :param out_dir (str): abs path to a folder which stores pdbqt version of pdb_f
    :return:
    """
    out_file = os.path.join(out_dir, pdb_f.split('.')[0] + '.pdbqt')
    cmd = " ".join([MGL_PY, MGL_PRO_PREP, '-r', pdb_f, '-o', out_file])
    os.system(cmd)

def ligand_pdb_to_pdbqt(pdb_f, out_dir):
    """

    :param pdb_f (str): abs path to a pdb file
    :param out_dir (str): abs path to a folder which stores pdbqt version of pdb_f
    :return:
    """
    out_file = os.path.join(out_dir, pdb_f.split('.')[0] + '.pdbqt')
    cmd = " ".join([MGL_PY, MGL_LIG_PREP, '-l', pdb_f, '-o', out_file])
    os.system(cmd)

def pred_binding_site(pdb_f):
    """

    :param pdb_f: abs path to pdb
    :return:
    """
    cmd = " ".join([PRANK, 'predict', '-f', pdb_f, '-o', 'predicted_binding_sites'])
    os.system(cmd)
if __name__ == '__main__':
    """
        batch_scwrl(scwrl_file='scwrl.txt', pdb_folder='pdb_folder',
                het_atm_folder='het_atm_folder', seq_folder='seq_folder',
                out_folder='out_folder', scwrl_exe='/home/howc/Desktop/SWRL/Scwrl4') 
    """
    #sdf_to_pdb('1.sdf')
    #ligand_pdb_to_pdbqt('1.pdb', os.getcwd())
    pred_binding_site('pdb_f/1gog.pdb')


"""

run_scwrl('sample_files/5z62_2.pdb',
          'sample_files/hetatm_coord.pdb',
          'sample_files/out.pdb',
          scwrl_exe_path='/home/howc/Desktop/SWRL/Scwrl4'
          )
"""
