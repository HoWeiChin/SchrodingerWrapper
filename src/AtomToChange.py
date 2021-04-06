from Atom import Atom

class AtomToChange(Atom):
    def __init__(self, old_atom, res_number, new_atom, new_atm_ele):
        # an atom belonging to a residue number, which is targeted for change
        """

        :param old_atom (str): an old_atom of a residue number, target for change eg: CD, CB, CG
        :param new_atom (str): an new_atom of a residue number, to replace old_atom
        :param new_atm_ele (str): element type for new atom
        :param res_number (str): residue number which has old_atom
        """
        super().__init__(old_atom)
        self.__res_num = res_number
        self.__new_atm = new_atom
        self.__new_ele = new_atm_ele

    @property
    def res_num(self):
        return self.__res_num

    @property
    def new_atm(self):
        return self.__new_atm

    @property
    def new_ele(self):
        return self.__new_ele

