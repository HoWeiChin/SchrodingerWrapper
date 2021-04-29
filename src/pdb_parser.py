import re

pdb_file = 'pdb_f/4ny4.pdb'

residue_set = set()

with open(pdb_file, 'r') as pdb_f:
    lines = pdb_f.readlines()

    for line in lines:

        if re.match('^ATOM', line):
            line_tokens = re.split("\s{1,}", line)

            try:
                residue_set.add(int(line_tokens[5]))
            except ValueError:
                residue_set.add(int(line_tokens[4]))

residue_index = sorted(list(residue_set))
prev_index_pos = residue_index[0]
print(residue_index)
for i in range(1, len(residue_index)):
    curr_index = residue_index[i]
    if curr_index != prev_index_pos + 1:
        print(curr_index)
    prev_index_pos = curr_index

print(f'residue count {len(residue_set)}')




