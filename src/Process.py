import os
from PDBFile import PDBFile
from PDBMut import PDBMut
from AtomToChange import AtomToChange
from progress.spinner import MoonSpinner


class Process:
    def __init__(self, pdb_folder, mut_file, out_dir):
        """

        :param pdb_folder: abs path to folder containing pdb files (needs to make sure ordering of pdb files correspond to those in mut.txt)
        :param mut_file: full mutation file path with the following file format: 272,OH,F,F|272,OH,F,F
        where 272,OH,F,F means to induce a change of OH atom to F atom for residue 272.
        When there is more than 1 mutation, we delimit the mutations with |.

        :param out_dir: abs path to folder to store mutated pdb files.
        """
        self.__pdb_folder = pdb_folder
        self.__mut_file = mut_file
        self.__out_dir = out_dir

    def process(self):

        if not os.path.exists(self.__out_dir):
            try:
                os.makedirs(self.__out_dir)

            except OSError:
                print(f'Check if {self.__out_dir} is in correct format.')

        if not os.path.exists(self.__pdb_folder):
            raise OSError(f'Folder {self.__pdb_folder} is not found.')

        if not os.path.exists(self.__mut_file):
            raise OSError(f'File {self.__mut_file} is not found.')

        files = os.listdir(self.__pdb_folder)
        pdbs = []

        for file in files:
            if '.pdb' in file:
                pdbs.append(
                    PDBFile(pdb_folder=self.__pdb_folder, pdb_file=file)
                )

        with open(self.__mut_file) as file:
            mutations = file.readlines()

        if len(pdbs) != len(mutations):
            raise Exception(f'Rows in file {self.__mut_file} not the same as pdb files in {self.__pdb_folder}')

        with MoonSpinner('Mutating PDBs') as bar:
            for i in range(len(pdbs)):
                curr_pdb = pdbs[i]
                print(mutations[1])
                print(i)
                if '|' in mutations[i]:
                    curr_mutations = mutations[i].strip('\n').split('|')

                elif '|' not in mutations[i]:
                    raise ValueError('must provide | inside mutation text file.')

                atms_to_chg = []

                for mutation in curr_mutations:
                    if mutation != '':
                        residue_num, old_atm, new_atm, new_ele = mutation.split(',')
                        atms_to_chg.append(AtomToChange(old_atom=old_atm,
                                                      res_number=residue_num,
                                                      new_atom=new_atm, new_atm_ele=new_ele)
                                         )
                pdb_mutator = PDBMut(curr_pdb, atms_to_chg)
                mutated_pdb_content = pdb_mutator.mutate_pdb()
                pdb_mutator.save_pdb(self.__out_dir, mutated_pdb_content)

                bar.next()






