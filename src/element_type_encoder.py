
class ElementTypeEncoder:
    def __init__(self):
        self.map = {'O': 1, 'N': 2, 'C': 3, 'S': 4, 'P':5, 'Cl': 6, 'F':7}

    def get_encoding(self, value):
        return self.map[value]
