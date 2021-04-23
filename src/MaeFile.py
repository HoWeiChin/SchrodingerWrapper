

class MaeFile:
    def __init__(self, mae_file, mae_folder):
        """
        :param mae_folder (str): absolute path to folder containing mae_file
        :param mae_file (str): name of mae_file
        """
        self.mae_folder = mae_folder
        self.mae_file = mae_file

    @property
    def folder(self):
        return self.mae_folder

    @property
    def file(self):
        return self.mae_file
