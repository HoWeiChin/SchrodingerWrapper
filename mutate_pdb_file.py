import re

pattern_hunter = re.compile('^ATOM')
out_file = ""
new_atom = "F"
new_element = 'F'
target_residue = 'TYR'
target_res_num = 272
atm_to_change = 'OH'

with open('1gog.pdb') as file:
    count = 1
    for line in file:
        new_content = line
        if pattern_hunter.match(line):
            elementised_line = re.split(' +', line)
            if target_residue == elementised_line[3] and target_res_num == int(elementised_line[5]) and atm_to_change == \
                    elementised_line[2]:
                new_line = line.replace(atm_to_change, new_atom + " ")
                new_line = new_line[::-1].replace(elementised_line[-2], new_element, 1)[::-1]
                new_content = new_line
        out_file = out_file + new_content

write_file = open("1gog_modified.pdb", "w+")
write_file.write(out_file)
# close the file
write_file.close()
