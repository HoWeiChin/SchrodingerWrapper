
class OriginTypeEncoder:
    def __init__(self):
        self.map = {'het': 0, 'prot': 1, 'lig': 2}

    def get_encoding(self, value):
        return self.map[value]
