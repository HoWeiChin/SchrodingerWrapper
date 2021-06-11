
class ResidueTypeEncoder:
    def __init__(self):
        self.map = {None: 0, 'Ala': 1,
          'Arg': 2,
          'Asn': 3,
          'Asp': 4,
          'Cys': 5,
          'Glu': 6,
          'Gln': 7,
          'Gly': 8,
          'His': 9,
          'Ile': 10,
          'Leu': 11,
          'Lys': 12,
          'Met': 13,
          'Phe': 14,
          'Pro': 15,
          'Ser': 16,
          'Thr': 17,
          'Trp': 18,
          'Tyr': 19,
          'Val': 20}

    def get_encoding(self, value):
        return self.map[value]