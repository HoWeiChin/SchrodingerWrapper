
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

a = '1gog.pdb,,het_atm_3a4.txt,272|OH|F|F'
print(file_ordering(a.strip().split(',')))
print('#################################')
a = '1goh.pdb,,'
print(file_ordering(a.strip().split(',')))
print('#################################')
a = '1og2.pdb,,'
print(file_ordering(a.strip().split(',')))