import os
from PatternHunter import PatternHunter


class PDBMut:
    def __init__(self, pdb_f_obj, mutations):
        """

        :param pdb_file (PDBFile object): a representation of a pdb_file
        :param num_mut (int): number of mutations
        :param mutations (list): list of AtomToChange objects.
        :return:
        """
        self.__pdb_f = pdb_f_obj
        self.__mutations = mutations

    def mutate_line(self, line, line_tokens, atm_to_be_replaced, new_atm, new_ele):
        """
        :param line (str): a pdb line
        :param line_tokens (list of str): a line which has been splitted into constituents words after line has been removed of trailing characters
        :param atm_to_be_replaced (str):
        :param new_atm (str):
        :param new_ele (str):
        :return: a modiflied line of a pdb file

        """
        if len(new_atm) == 1:
            new_line = line.replace(atm_to_be_replaced, new_atm + " ")
        elif len(new_atm) > 1:
            new_line = line.replace(atm_to_be_replaced, new_atm)

        new_line = new_line[::-1].replace(line_tokens[-1], new_ele, 1)[::-1]
        return new_line

    def mutate_pdb(self):

        pdb_folder = self.__pdb_f.folder
        pdb_file = self.__pdb_f.file
        abs_pdb_file_path = os.path.join(pdb_folder, pdb_file)

        new_pdb_content = ''
        residue_num_index = 5
        atm_to_be_replaced_index = 2
        lines = open(abs_pdb_file_path, 'r').readlines()

        print(f'pdb_file: {abs_pdb_file_path}')
        for atm_to_chg in self.__mutations:
            atm_to_be_replaced = atm_to_chg.atom
            res_num = atm_to_chg.res_num  # str
            new_atm = atm_to_chg.new_atm  # str
            new_ele = atm_to_chg.new_ele
            count = 0
            print(f'atm to change:{atm_to_be_replaced} residue num:{res_num} new atom:{new_atm} new element:{new_ele}')

            for line in lines:
                count += 1

                if not PatternHunter().is_pattern_in_line(row=line, pattern='^ATOM'):
                    new_pdb_content = new_pdb_content + line
                    continue

                line_tokens = line.strip().split()
                curr_residue_num = line_tokens[residue_num_index]  # a str
                curr_atm_to_be_changed = line_tokens[atm_to_be_replaced_index]  # a str

                if curr_residue_num == res_num and atm_to_be_replaced == curr_atm_to_be_changed:
                    print(f'old line: {line}')
                    new_line = self.mutate_line(line, line_tokens, atm_to_be_replaced,
                                                new_atm, new_ele
                                                )
                    new_pdb_content = new_pdb_content + new_line

                elif curr_residue_num != res_num or atm_to_be_replaced != curr_atm_to_be_changed:
                    new_pdb_content = new_pdb_content + line

        return new_pdb_content

    def save_pdb(self, out_dir, new_content):
        """

        :param out_dir: path to folder to store pdb file which has been changed.
        :param new_content: content of modified pdb, to be written out and saved.
        :return:
        """
        if not os.path.exists(out_dir):
            os.makedirs(out_dir)

        pdb_file = self.__pdb_f.file

        with open(os.path.join(out_dir, pdb_file), "w+") as output:
            output.write(new_content)
