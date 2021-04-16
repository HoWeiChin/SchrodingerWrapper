import pubchempy as pcp


def get_compound(id):
    """

    :param id: integer, compound id to look up PubChem
    :return: a Compound object
    """
    if type(id) != int or id is None:
        raise TypeError(f'compound id {id} must be of type int and must not be None.')

    try:
        compound = pcp.Compound.from_cid(id)
        return compound

    except ValueError:
        raise ValueError(f'compound id {id} is invalid, pls check again.')


def get_smiles(compound):
    """

    :param compound: Compound object
    :return: a string representation of smiles
    """
    if type(compound) != pcp.Compound or compound is None:
        raise TypeError(f'Input is not a pubchempy Compound object or is None.')

    return compound.isomeric_smiles
