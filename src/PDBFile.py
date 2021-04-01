

class PDBFile:
    def __init__(self, pdb_folder, pdb_file):
        """
        :param pdb_folder (str): absolute path to folder containing pdb_file
        :param pdb_file (str): name of pdb_file
        """
        self.pdb_folder = pdb_folder
        self.pdb_file = pdb_file

    @property
    def folder(self):
        return self.pdb_folder

    @property
    def file(self):
        return self.pdb_file
