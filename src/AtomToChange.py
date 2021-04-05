from src.Atom import Atom

class AtomForChange(Atom):
    def __init__(self, old_atom, res_number, new_atom):
        # an atom belonging to a residue number, which is targeted for change
        """

        :param old_atom (str): an old_atom of a residue number, target for change
        :param new_atom (str): an new_atom of a residue number, to replace old_atom
        :param res_number: residue number which has old_atom
        """
        super().__init__(old_atom)
        self.__res_num = int(res_number)
        self.__new_atm = new_atom

    @property
    def res_num(self):
        return self.__res_num

    @property
    def new_atm(self):
        return self.__new_atm

