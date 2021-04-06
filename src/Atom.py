

class Atom:
    def __init__(self, atom):
        self.__atom = atom

    @property
    def atom(self):
        return self.__atom