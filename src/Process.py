import os
import shutil
from PDBFile import PDBFile
from PDBMut import PDBMut
from AtomToChange import AtomToChange
from progress.spinner import MoonSpinner


class Process:
    def __init__(self, pdb_folder: str, scwrl_file: str, out_dir: str):
        """

        :param pdb_folder: abs path to folder containing pdb files (needs to make sure ordering of pdb files correspond to those in mut.txt)
        :param scwrl_file: full mutation file path with the following file format: 272,OH,F,F|272,OH,F,F
        where 272,OH,F,F means to induce a change of OH atom to F atom for residue 272.
        When there is more than 1 mutation, we delimit the mutations with |.

        :param out_dir: abs path to folder to store mutated pdb files.
        """
        self.__pdb_folder = pdb_folder
        self.__scwrl_file = scwrl_file
        self.__out_dir = out_dir

    def process(self):

        if not os.path.exists(self.__out_dir):
            try:
                os.makedirs(self.__out_dir)

            except OSError:
                print(f'Check if {self.__out_dir} is in correct format.')

        if not os.path.exists(self.__pdb_folder):
            raise OSError(f'Folder {self.__pdb_folder} is not found.')

        if not os.path.exists(self.__scwrl_file):
            raise OSError(f'File {self.__scwrl_file} is not found.')

        with open(self.__scwrl_file) as file:
            mutations = file.readlines()

        count = 1
        with MoonSpinner('Mutating PDBs') as bar:

            for i in range(len(mutations)):
                mut_line = mutations[i]
                pdb_indicator_token = mut_line.split(',')[0]    #for eg: pdb:2EIE.pdb
                pdb_token = pdb_indicator_token.split(':')[-1]  #for eg: 2EIE.pdb
                pdb_code = pdb_token.split('.')[0]  #for eg: 2EIE
                pdb_file_name = f'{pdb_code}_{i}_out.pdb'

                if not pdb_file_name in os.listdir(self.__pdb_folder):
                    count += 1
                    continue

                if '|' in mut_line:
                    curr_mutations = list(filter(lambda token: '|' in token, mut_line.strip('\n').split(',')))

                elif '|' not in mut_line:
                    src_path = os.path.join(self.__pdb_folder, pdb_file_name)
                    dest_path = os.path.join(self.__out_dir, pdb_file_name)
                    shutil.move(src_path, dest_path)
                    count += 1
                    continue

                atms_to_chg = []

                for mutation in curr_mutations:
                    if mutation != '':
                        residue_num, old_atm, new_atm, new_ele = mutation.split('|')
                        atms_to_chg.append(AtomToChange(old_atom=old_atm,
                                                        res_number=residue_num,
                                                        new_atom=new_atm, new_atm_ele=new_ele)
                                           )

                print(f'processing: {pdb_file_name} {curr_mutations}')
                curr_pdb = PDBFile(pdb_folder=self.__pdb_folder, pdb_file=pdb_file_name)
                pdb_mutator = PDBMut(curr_pdb, atms_to_chg)
                mutated_pdb_content = pdb_mutator.mutate_pdb()
                pdb_mutator.save_pdb(self.__out_dir, mutated_pdb_content)
                count += 1
                bar.next()