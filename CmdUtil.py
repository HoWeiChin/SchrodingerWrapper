import os

def run_scwrl(full_pdb_path,
              hetatm_pdb_path,
              out_pdb,
              scwrl_exe_path):
    """
    :param full_pdb_path: path of <pdb_code>.pdb
    :param hetatm_pdb_path: path of hetatm.pdb
    :param out_pdb: name of output pdb file
    :param scwrl_exe_path: path to scwrl exe file
    :param scwrl_bash_alias: scwrl programme alias, eg: swrl instead of scwrl
    :return:

    """
    bash_cmd = " ".join([scwrl_exe_path, '-i', full_pdb_path,
                         '-f', hetatm_pdb_path, '-o', out_pdb])
    os.system(bash_cmd)

    bash_cmd = " ".join(['mv', '-f', out_pdb, out_pdb + '.old'])
    os.system(bash_cmd)

    bash_cmd = " ".join(['grep', '^ATOM', out_pdb + '.old', '>', out_pdb])
    os.system(bash_cmd)

    bash_cmd = " ".join(['echo', "TER", ">>", out_pdb])
    os.system(bash_cmd)

    bash_cmd = " ".join(['cat', hetatm_pdb_path, '>>', out_pdb])
    os.system(bash_cmd)


run_scwrl('sample_files/5z62_2.pdb',
          'sample_files/hetatm_coord.pdb',
          'sample_files/out.pdb',
          scwrl_exe_path='/home/howc/Desktop/SWRL/Scwrl4'
          )

# lst = ['Scwrl4', "-i", '5z62_2.pdb', "-f",'hetatm_coord.pdb',"-o", 'out.pdb', ">", "scwrl.out"]
