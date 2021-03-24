from schrodinger import structure

class ProteinStructure:
    def __init__(self, pdb_file):
        self._pdb_file = pdb_file
        self._protein_st = structure.StructureReader(self._pdb_file) # a structure obj
        self._protein_sts = list(self._protein_st)

    @property
    def pdb_file(self):
        return self._pdb_file

    @property
    def protein_sts(self):
        return self._protein_sts

    def error_handling(func):
        def error_handler(*args, **kwargs):
            try:
                obj = func(*args, **kwargs)
                return obj
            except IndexError:
                print(f"Class:ProteinStructure function:{func.__name__} failed to return anything, "
                      f"maybe check your index.")
        return error_handler

    @error_handling
    def get_ith_struc(self, index):
        """

        :param index (int):
        :return: a schrodinger Structure object at ith index
        """
        return self._protein_sts[index]

    @error_handling
    def get_atoms_of_ith_struc(self, index):
        """

        :param index (int): index of ith Structure object
        :return: a list of StructureAtom objects
        """
        try:
            ith_st = self.get_ith_struc(index)
            return list(ith_st.atom)

        except Exception:
            print(f'Class:ProteinStructure function:get_atoms_of_ith '
                  f'failed because struc at {index} index not retrieved.')

    @error_handling
    def get_residue(self, st, res_num):
        """

        :param st: Structure Object
        :param res_num: residue number of a target Residue object
        :return: a Residue object with residue number of res_num in st.
        """
        return list(
            filter(lambda residue: residue.resnum == res_num,
                   st.residue))[0]

    def get_residue_of_ith_struc(self, index, res_num):
        """

        :param index (int): index of ith Structure object
        :param res_num (int): residue number of the ith Structure
        :return:
        """
        try:
            ith_st = self.get_ith_struc(index)

        except Exception:
            print('Class:ProteinStructure function:get_residue_of_ith_struc '
                            'failed to return anything, check index')
        try:
            residue = self.get_residue(ith_st, res_num)
            return residue

        except Exception:
            print('Class:ProteinStructure function:get_residue_of_ith_struc '
                            'failed to return anything, check res_num' )

if __name__ == "__main__":
    protein_st = ProteinStructure('1gog.pdb')
    print(protein_st.get_ith_struc(0))
    a = protein_st.get_residue_of_ith_struc(0, 228)

    print(a.pdbres)