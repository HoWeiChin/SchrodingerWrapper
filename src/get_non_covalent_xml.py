import os

#must cd within a protein ligand complex dir to use

def get_xml(dir):
    #dir must be abs path
    os.chdir(dir)

    for complex_file in os.listdir():

        cmd = ['docker', 'run', '-v', '${PWD}:/results', '-w', '/results', '-u', '$(id -u ${USER}):$(id -g ${USER})',
               'pharmai/plip:latest', '-f']

        xml_sub_folder_name = complex_file.replace('.pdb', '')
        cmd.append(complex_file)
        cmd.append('-x')
        cmd.append('-o')
        cmd.append(f'xml/{xml_sub_folder_name}')
        proper_cmd = ' '.join(cmd)

        os.system(proper_cmd)

if __name__ == '__main__':
    dir = 'protein_ligand_pdb'
    get_xml(dir)