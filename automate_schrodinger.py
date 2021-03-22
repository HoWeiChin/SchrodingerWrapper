from schrodinger import structure
from schrodinger import strucutils


def get_atom_of_residue(atoms,
                        target_pdb_res,
                        pdb_atom_index):
    """

    :param atoms: list of StructureAtom objects
    :param target_pdb_res: pdb code of an amino acid residue
    :param pdb_atom_index: position of an atom of a residue as seen in a pdb file
    for eg:
    ATOM   4824  O   GLN A
    Position of oxygen atom of GLN in a pdb fifle is 4824
    :return:
    """