from progress.spinner import MoonSpinner
from ScwrlMutant import mutate
from pathlib import Path
import os
import pandas as pd

MGL_PY = '/home/howc/Downloads/mgltools_x86_64Linux2_1.5.6/bin/python'
MGL_PRO_PREP = '/home/howc/Downloads/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_receptor4.py'
MGL_FLEX_PRO_PREP = '/home/howc/Downloads/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_flexreceptor4.py'
MGL_LIG_PREP = '/home/howc/Downloads/mgltools_x86_64Linux2_1.5.6/MGLToolsPckgs/AutoDockTools/Utilities24/prepare_ligand4.py'
PRANK = str(Path.cwd().parent / 'p2rank_2.2/prank')
VINA = str(Path.cwd().parent / 'vina/vina')
GNINA = '/home/howc/PycharmProjects/pythonProject2/gnina'


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
        print('adding het atm')
    # mutation and don't add het atoms
    elif seq_file_path and hetatm_pdb_path is None:
        print('scwrl')
        bash_cmd = " ".join([scwrl_exe_path, '-i', full_pdb_path, '-h', '-s', seq_file_path,
                             '-o', out_pdb, '> log.txt'])

    # plain side-chain modelling
    else:
        bash_cmd = " ".join([scwrl_exe_path, '-i', full_pdb_path, '-h',
                             '-o', out_pdb, '> log.txt'])
    print(bash_cmd)
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

    :param scwrl_file (str): file containing, pdb file, het_atm_3a4.txt (to store scwrl output)
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

                if line.count(',') != 2:
                    row_index += 1
                    # bar.next()
                    continue

                # correct it, if users give wrong file ordering
                pdb_file, het_file, seq_file = file_ordering(line.strip().split(','))
                print(f'{pdb_file} {het_file} {seq_file}')
                if pdb_file == 0 or (het_file != 0 and het_atm_folder is None) or (
                        seq_file != 0 and seq_folder is None):
                    row_index += 1
                    # bar.next()
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
                # bar.next()


def get_correct_wt_pdb(mt_code):
    if 'CYP102A1' in mt_code:
        return '4KPA.pdb'
    elif 'CYP3A4' in mt_code:
        return '1tqn.pdb'
    elif 'CYP2D6' in mt_code:
        return '3TBG.pdb'

    return None


def get_correct_het_atm(mt_code):
    if 'CYP102A1' in mt_code:
        return 'het_atm_102a1.txt'

    elif 'CYP3A4' in mt_code:
        return 'het_atm_3a4.txt'

    elif 'CYP2D6' in mt_code:
        return 'het_atm_2d6.txt'

    return None


def water_removal(scwrl_generated_pdb):
    import re

    lines_to_keep = []
    with open(scwrl_generated_pdb, 'r') as f:
        original_lines = f.readlines()

        for original_line in original_lines:
            if 'TER' in original_line:
                lines_to_keep.append(original_line)
                continue

            original_tokens = re.split(' +', original_line)
            atm_type = original_tokens[0]
            atm_origin = original_tokens[3]

            if atm_origin != 'HOH':
                lines_to_keep.append(original_line)

    with open(scwrl_generated_pdb, 'w+') as f:
        for line in lines_to_keep:
            print(line)
            f.write(line)


def batch_scwrl_v2(db_file: str, pdb_folder: str,
                   het_atm_folder: str, seq_folder: str,
                   out_folder: str, scwrl_exe: str
                   ):
    """

    :param db_file (str): path of file containing data scrapped from mutein db
    :param pdb_folder (str): folder containing pdb file(s)
    :param het_atm_folder (str): folder containing het atm txt file(s)
    :param seq_folder (str): folder containing seq.txt file(s)
    :param out_folder (str):
    :return:
    """
    db_file_path = os.getcwd() + '/test_db/' + db_file
    try:

        file = open(db_file_path, 'r')
        file.close()

    except FileNotFoundError:
        print(f'{db_file} not present, pls check.')

    if not os.path.exists(out_folder):
        os.makedirs(out_folder)

    if het_atm_folder:
        check_folder(het_atm_folder)

    if seq_folder:
        if not os.path.exists(seq_folder):
            os.mkdirs(seq_folder)

    check_folder(pdb_folder)

    pd_db_df = pd.read_csv(db_file_path)
    cache = set()

    for index, row in pd_db_df.iterrows():
        mt_code = row['mt_code']

        if mt_code in cache:
            continue

        elif mt_code not in cache:
            cache.add(mt_code)

        mt_seq = row['mt_seq']
        correct_pdb = get_correct_wt_pdb(mt_code)

        if correct_pdb is None:
            continue

        full_pdb_path = os.path.join(pdb_folder, correct_pdb)

        if seq_folder is not None and het_atm_folder is None:
            if '/' in mt_code:
                mt_code = mt_code.replace('/', '_')

            seq_file_name = f'{mt_code}_seq.txt'

            seq_file_path = os.path.join(seq_folder, seq_file_name)

            with open(seq_file_path, 'w+') as seq_f:
                seq_f.write(mt_seq)

            out_file_path = os.path.join(out_folder, f'{mt_code}.pdb')

            run_scwrl(full_pdb_path=full_pdb_path,
                      out_pdb=out_file_path,
                      scwrl_exe_path=scwrl_exe,
                      seq_file_path=seq_file_path,
                      hetatm_pdb_path=None
                      )
            water_removal(scwrl_generated_pdb=out_file_path)
        if seq_folder is not None and not het_atm_folder is None:
            if '/' in mt_code:
                mt_code = mt_code.replace('/', '_')

            seq_file_name = f'{mt_code}_seq.txt'

            seq_file_path = os.path.join(seq_folder, seq_file_name)

            with open(seq_file_path, 'w+') as seq_f:
                seq_f.write(mt_seq)

            out_file_path = os.path.join(out_folder, f'{mt_code}.pdb')
            het_atm_file = get_correct_het_atm(mt_code)
            run_scwrl(full_pdb_path=full_pdb_path,
                      out_pdb=out_file_path,
                      scwrl_exe_path=scwrl_exe,
                      seq_file_path=seq_file_path,
                      hetatm_pdb_path='het_atm/' + het_atm_file
                      )
            water_removal(scwrl_generated_pdb=out_file_path)


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
    return pdb_out


def protein_pdb_to_pdbqt(pdb_f, out_dir):
    """

    :param pdb_f (str): abs path to a pdb file
    :param out_dir (str): abs path to a folder which stores pdbqt version of pdb_f
    :return:
    """
    pdb_filename = pdb_f.split('/')[-1]
    out_file = os.path.join(out_dir, pdb_filename.replace('.pdb', '.pdbqt'))

    cmd = " ".join([MGL_PY, MGL_PRO_PREP, '-r', pdb_f, '-o', out_file])
    os.system(cmd)

    return out_file


def ligand_pdb_to_pdbqt(pdb_f, out_dir):
    """

    :param pdb_f (str): abs path to a pdb file
    :param out_dir (str): abs path to a folder which stores pdbqt version of pdb_f
    :return:
    """
    out_file = os.path.join(out_dir, pdb_f.split('.')[0] + '.pdbqt')
    cmd = " ".join([MGL_PY, MGL_LIG_PREP, '-l', pdb_f, '-o', out_file])
    os.system(cmd)
    return out_file


def get_best_pose(docking_result_file):
    """

    :param docking_result_file: abs path to a docking result txt file
    eg: docking_out/CYP3A4.3_15634941_dock.txt
    :return:
    """
    new_content = ''

    # get the first and best model
    with open(docking_result_file, 'r') as file:
        lines = file.readlines()
        for line in lines:
            if 'MODEL 2' in line:
                break
            new_content = new_content + line

    with open(docking_result_file, 'w') as file:
        file.write(new_content)


def docking(ligand_pdbqt, config_txt, pdbqt):
    print('docking....')
    pdbqt = pdbqt.split('/')[-1]
    lig_id = ligand_pdbqt.split('/')[-1].split('.')[0]
    out = os.path.join(os.getcwd() + '/docking_result',
                       pdbqt.replace('.pdbqt', '') + f'_{lig_id}exhaust_16_docking_result.pdbqt')
    out_log = os.path.join(os.getcwd() + '/docking_result',
                           pdbqt.replace('.pdbqt', '') + '_vina_flex.log')

    print(f' out is {out}')
    cmd = " ".join(
        [VINA, '--config', config_txt, '--exhaustiveness', '16', '--ligand', ligand_pdbqt, '--out', out, '>', out_log,
         '2>&1'])
    os.system(cmd)
    get_best_pose(docking_result_file=out)


def protein_pdb_to_flex_pdbqt(pdb_f, out_dir='pdb_f/pdbqt_flex'):
    pdb_filename = pdb_f.split('/')[-1]
    flex_out_file = os.path.join(out_dir, pdb_filename.replace('.pdbqt', '_flex.pdbqt'))
    flex_residues = 'LYS209_LEU210_LEU211_ARG212_PHE213_ASP214_PHE215_LEU216_ASP217'

    cmd_flex = " ".join([MGL_PY, MGL_FLEX_PRO_PREP, '-r', pdb_f, '-s', flex_residues, '-x', flex_out_file])
    os.system(cmd_flex)

    return flex_out_file


def flexible_docking(ligand_pdbqt, config_txt, rigid_prot_pdbqt, flex_prot_pdbqt):
    print('flexible docking....')
    pdbqt = rigid_prot_pdbqt.split('/')[-1]
    lig_id = ligand_pdbqt.split('/')[-1].split('.')[0]
    out = os.path.join(os.getcwd() + '/docking_result',
                       pdbqt.replace('.pdbqt', '') + f'_{lig_id}_32_size_30_flex_docking_result.pdbqt')
    out_log = os.path.join(os.getcwd() + '/vina_logs',
                           pdbqt.replace('.pdbqt', '') + '_vina_flex.log')
    print(f' out is {out}')
    # vina forcefield
    cmd = " ".join([VINA, '--config', config_txt, '--ligand', ligand_pdbqt, '--exhaustiveness', '32', '--receptor',
                    rigid_prot_pdbqt, '--flex',
                    flex_prot_pdbqt, '--out', out, '>', out_log, '2>&1'])
    os.system(cmd)
    get_best_pose(docking_result_file=out)


def gnina_docking(prot_pdbqt, ligand_pdbqt, center_x, center_y, center_z, size_x, size_y, size_z, flex_res=None):
    print('gnina docking....')
    pdbqt = prot_pdbqt.split('/')[-1]
    lig_id = ligand_pdbqt.split('/')[-1].split('.')[0]

    out = os.path.join(os.getcwd() + '/docking_result',
                       pdbqt.replace('.pdbqt',
                                     '') + f'_{lig_id}_cnn_size_25_exhaust_32_gnina_docking_result_nonflex.pdbqt')

    out_log = os.path.join(os.getcwd(),
                           pdbqt.replace('.pdbqt', '') + '_gnina_flex_exhaust_autobox_32_nonflex.log')

    if flex_res:
        out_flex = os.path.join(os.getcwd() + '/gnina_flexres',
                                pdbqt.replace('.pdbqt', '') + '_flexres_32_size_25_gnina_result_autobox.pdbqt')

        cmd = " ".join([GNINA, '-r', prot_pdbqt, '-l',
                        ligand_pdbqt, '--autobox_ligand', ligand_pdbqt, '--flexres', flex_res,
                        '--flex_limit', '9', '--cnn_scoring', 'refinement', '--cnn', 'dense_ensemble',
                        '--center_x', center_x, '--center_y', center_y, '--center_z', center_z,
                        '--size_x', size_x, '--size_y', size_y, '--size_z', size_z, '--exhaustiveness', '32',
                        '--cnn_verbose', '-o', out,
                        '--out_flex', out_flex, '>', out_log, '2>&1'])
    else:
        cmd = " ".join([GNINA, '-r', prot_pdbqt, '-l',
                        ligand_pdbqt, '--autobox_ligand', ligand_pdbqt,
                        '--cnn_scoring', 'refinement', '--cnn', 'dense_ensemble',
                        '--center_x', center_x, '--center_y', center_y, '--center_z', center_z,
                        '--size_x', size_x, '--size_y', size_y, '--size_z', size_z, '--exhaustiveness', '32',
                        '--cnn_verbose', '-o', out,
                        '>', out_log, '2>&1'])

    os.system(cmd)
    get_best_pose(docking_result_file=out)


if __name__ == '__main__':
    """
        batch_scwrl(scwrl_file='scwrl.txt', pdb_folder='pdb_folder',
                het_atm_folder='het_atm_folder', seq_folder='seq_folder',
                out_folder='out_folder', scwrl_exe='/home/howc/Desktop/SWRL/Scwrl4') 
    """
    # sdf_to_pdb('Ligands/3365.sdf')
    # ligand_pdb_to_pdbqt('Ligands/3365.pdb', os.getcwd())
    # pred_binding_site('pdb_f/1gog.pdb')
    # protein_pdb_to_pdbqt('pdb_f/scwrl_out/CYP3A4.12.pdb', 'pdb_f/pdbqt')
    # docking('Ligands/5994.pdbqt', 'docking_out/CYP3A4.12_5994_dock.txt', 'pdb_f/pdbqt/CYP3A4.12.pdbqt')
    # get_best_pose('docking_result/CYP3A4.12_Fluconazole_docking_result.pdbqt')
    # protein_pdb_to_flex_pdbqt('pdb_f/pdbqt/CYP3A4.12.pdbqt', 'pdb_f/pdbqt')
    # flexible_docking('Ligands/5994.pdbqt', 'docking_out/CYP3A4.12_5994_dock.txt',
    #                'pdb_f/pdbqt/CYP3A4.12.pdbqt', 'pdb_f/pdbqt/CYP3A4.12_flex.pdbqt')
    """
    
    gnina_docking(prot_pdbqt='pdb_f/pdbqt/CYP3A4.12.pdbqt', ligand_pdbqt='Ligands/5994.pdbqt',
                  center_x='-19.9455', center_y='-19.3636', center_z='-11.2229',
                  size_x='25', size_y='25', size_z='25',
                  flex_res='A:209,A:210,A:211,A:212,A:213,A:214,A:215,A:216,A:217')
    """
    gnina_docking(prot_pdbqt='pdb_f/pdbqt/CYP3A4.12.pdbqt', ligand_pdbqt='Ligands/5994.pdbqt',
                  center_x='-19.9455', center_y='-19.3636', center_z='-11.2229',
                  size_x='25', size_y='25', size_z='25')