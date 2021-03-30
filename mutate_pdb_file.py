import re
import os
from progress.bar import Bar

def mutate_pdb(pdb_file, target_res_nums,
               atms_to_change, new_atms,
               new_elements, out_dir
               ):

    pattern_hunter = re.compile('^ATOM')
    out_file = ""
    res_num_indx = 5
    target_atm_indx = 2


    with open(pdb_file) as file:
        for i in range(len(target_res_nums)):
            target_res_num = target_res_nums[i]
            atm_to_change = atms_to_change[i]
            new_element = new_elements[i]
            new_atm = new_atms[i]

            for line in file:
                new_content = line
                if pattern_hunter.match(line):
                    elementised_line = re.split(' +', line)
                    if target_res_num == int(elementised_line[res_num_indx]) and atm_to_change == elementised_line[target_atm_indx]:
                        new_line = line.replace(atm_to_change, new_atm + " ")
                        new_line = new_line[::-1].replace(elementised_line[-2], new_element, 1)[::-1]
                        new_content = new_line


                out_file = out_file + new_content

    pdb_file_name = os.path.join(out_dir, pdb_file.split('.pdb')[0] + '_mutant.pdb')

    with open(pdb_file_name, "w+") as output:
        output.write(out_file)

# generalises to bulk mutation
def mutate(pdb_path, mutation_file, outdir):
    """

    :param pdb_path (str): absolute path to folder of pdb files or just absolute path to file
    :param mutation_file (str): file containing mutations
    :param outdir (str): dir to save mutated pdb file(s)
    :return:
    """
    # mutation file is first comma-separated then separated.
    # if a line in mutation file has '|', it means there is multiple mutation.
    # note that the ith line of the mutation file is the mutation for the ith pdb file.
    if not os.path.exists(outdir):
        try:
            os.makedirs(outdir)

        except OSError:
            print(f'Check if {outdir} is in correct format.')
    pdb_files = None
    if os.path.isdir(pdb_path):
        pdb_files = os.listdir(pdb_path)

    if os.path.isfile(pdb_path):
        pdb_files = [pdb_path]

    if pdb_files is None:
        raise(f'Please check if {pdb_path} is valid.')

    lines = None

    try:
        with open(mutation_file) as mutation_recipe:
            lines = mutation_recipe.readlines()

    except FileNotFoundError:
        print(f"{mutation_file} don't exist, change again.")

    if len(lines) != len(pdb_files):
        raise Exception(f'Number of lines in {mutation_file} '
                        f'must be equal the number of pdb files in {pdb_path}')

    ith_line = 0

    #one-to-one correspondence between each line of mutation_recipe and each pdb_file in pdb_files folder
    with Bar('Changing pdb file(s) in process...') as bar:
        for pdb_file in pdb_files:
            mutation_line = lines[ith_line]
            mutation_line = mutation_line.strip('\n')

            # multiple mutations for a pdb file

            mutation_list = mutation_line.split('|')

            res_nums = []
            atms_to_change = []
            new_atms = []
            new_atm_elements = []

            for mutation in mutation_list:
                res_num, atm_to_change, new_atm, new_atm_element = mutation.split(',')
                res_nums.append(int(res_num))
                atms_to_change.append(atm_to_change)
                new_atms.append(new_atm)
                new_atm_elements.append(new_atm_element)

            mutate_pdb(pdb_file=pdb_file, target_res_nums=res_nums, atms_to_change=atms_to_change,
                       new_atms=new_atms, new_elements=new_atm_elements, out_dir=outdir)
            bar.next()
            ith_line += 1

    return pdb_path.split('.')[0] + '_modified.pdb'

if __name__ == '__main__':
    mutate('1gog.pdb', 'mutation.txt', 'test_folder')





