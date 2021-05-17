from progress.spinner import MoonSpinner
from ScwrlMutant import mutate, mutateV2
import os
import re
from Process import Process

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

    print(f'cmd in run_scwrl() {bash_cmd}')
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

def run_scwrl_v2(
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

    print(f'cmd in run_scwrl() {bash_cmd}')
    os.system(bash_cmd)

    if is_add_het:

        with open(out_pdb, 'r') as scwrl_out_pdb:
            scwrl_out_pdb_lines = scwrl_out_pdb.readlines()

        with open(hetatm_pdb_path, 'r') as het_file:
            het_lines = het_file.readlines()

        regex_matcher = re.compile('^ATOM')

        for het_line in het_lines:
            het_line_tokens = re.split('\s+', het_line)
            atom_type = het_line_tokens[0]
            element = het_line_tokens[2]
            res_number = het_line_tokens[5]

            if atom_type == 'HETATM':
                scwrl_out_pdb_lines.append(het_line)
                continue

            for i in range(len(scwrl_out_pdb_lines)):

                if not regex_matcher.match(scwrl_out_pdb_lines[i]):
                    continue

                scwrl_line = scwrl_out_pdb_lines[i]
                scwrl_out_tokens = re.split('\s+', scwrl_line)
                atom_type_scwrl = scwrl_out_tokens[0]
                element_scwrl = scwrl_out_tokens[2]
                res_number_scwrl = scwrl_out_tokens[5]

                if atom_type == atom_type_scwrl and element == element_scwrl and res_number == res_number_scwrl:
                    scwrl_out_pdb_lines[i] = het_line

        os.system(''.join(['rm', f'{out_pdb}']))

        with open(f'{out_pdb}', 'w+') as f:
            for line in scwrl_out_pdb_lines:
                f.write(line)

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
                out_folder: str, scwrl_exe: str,
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

        for line in lines:

            if line.count(',') < 2 or line.count(',') > 3 :
                row_index += 1

                continue

            # correct it, if users give wrong file ordering
            pdb_file, het_file, seq_file = file_ordering(line.strip().split(','))
            print(f'{pdb_file} {het_file} {seq_file}')

            if pdb_file == 0 or (het_file != 0 and het_atm_folder is None) or (seq_file != 0 and seq_folder is None):
                row_index += 1

                continue

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


def batch_scwrl_v2(scwrl_file: str, pdb_folder: str,
                het_atm_folder: str, seq_folder: str,
                out_folder: str, scwrl_exe: str,
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

        for line in lines:
            #an eg for line is [pdb:test.pdb,fix:fix.txt,mut:mut.txt,het:het.txt]
            file_tokens = line.split(',')

            #eg pdb:test.pdb

            pdb_token = list(filter(lambda file_token: 'pdb:' in file_token, file_tokens))[0]
            pdb_file = pdb_token.split(':')[-1] #get test.pdb from pdb:test.pdb
            full_pdb_path = os.path.join(pdb_folder, pdb_file)

            pdb_code = pdb_file.split('.')[0] #get test from test.pdb, where test == pdb code

            out_file = f'{pdb_code}_out.pdb'
            out_file = os.path.join(out_folder, out_file)

            if len(list(filter(lambda file_token: 'het:' in file_token, file_tokens))) > 0 and \
                    len(list(filter(lambda file_token: 'mut:' in file_token, file_tokens))) > 0 and \
                    len(list(filter(lambda file_token: 'fix:' in file_token, file_tokens))) > 0:

                #eg: het:het.txt
                het_token = list(filter(lambda file_token: 'het:' in file_token, file_tokens))[0]
                #eg: mut:mut.txt
                mut_token = list(filter(lambda file_token: 'mut:' in file_token, file_tokens))[0]
                #eg: fix:fix.txt
                fix_token = list(filter(lambda file_token: 'fix:' in file_token, file_tokens))[0]

                mut_file = 'files/' + mut_token.split(':')[-1] #get mut.txt from mut:mut.txt
                fix_file = 'files/' + fix_token.split(':')[-1] #get fix.txt from fix:fix.txt
                het_file = het_atm_folder + '/' + het_token.split(':')[-1]

                mutated_seq_path = mutateV2(mut_file, full_pdb_path, fix_file)

                run_scwrl_v2(full_pdb_path=full_pdb_path,
                          out_pdb=out_file,
                          scwrl_exe_path=scwrl_exe,
                          seq_file_path=mutated_seq_path,
                          hetatm_pdb_path=het_file
                          )

if __name__ == '__main__':
    """
    batch_scwrl(scwrl_file='scwrl.txt', pdb_folder='pdb_folder',
                het_atm_folder='het_atm_folder', seq_folder='seq_folder',
                out_folder='out_folder', scwrl_exe='/home/howc/Desktop/SWRL/Scwrl4')
    """
    batch_scwrl_v2(scwrl_file='scwrl.txt', pdb_folder='pdb_f', het_atm_folder='het_atm',
                   seq_folder='seq_f', out_folder='pdb_f/scwrl_out',
                   scwrl_exe='/home/howc/Desktop/SWRL/Scwrl4'
                   )