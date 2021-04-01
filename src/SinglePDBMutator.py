import re
import os

class SinglePDBMutator:
    def mutate_pdb(self, pdb_file, target_res_nums,
                   atms_to_change, new_atms,
                   new_elements, out_dir, pattern_hunter
                   ):
        """

        :param pdb_file (PDBFile object):
        :param residue_nums (ResidueNumbers object):
        :param atms_to_change:
        :param new_atms:
        :param new_elements:
        :param out_dir:
        :param pattern_hunter:
        :return:
        """
        pdb_folder = pdb_file.folder
        pdb_file = pdb_file.file
        full_pdb_file_path = os.path.join(pdb_folder, pdb_file)

        out_file = ""
        res_num_indx = 5
        target_atm_indx = 2

        # becase file can only be opened with a full path
        with open(full_pdb_file_path) as file:
            for i in range(len(target_res_nums)):
                target_res_num = target_res_nums[i]
                atm_to_change = atms_to_change[i]
                new_element = new_elements[i]
                new_atm = new_atms[i]

                for line in file:
                    new_content = line
                    if pattern_hunter.is_pattern_in_line():
                        elementised_line = re.split(' +', line)
                        if target_res_num == int(elementised_line[res_num_indx]) and atm_to_change == elementised_line[
                            target_atm_indx]:
                            new_line = line.replace(atm_to_change, new_atm + " ")
                            new_line = new_line[::-1].replace(elementised_line[-2], new_element, 1)[::-1]
                            new_content = new_line

                    out_file = out_file + new_content

        pdb_file_name = os.path.join(out_dir, pdb_file.split('.pdb')[0] + '_mutant.pdb')

        with open(pdb_file_name, "w+") as output:
            output.write(out_file)