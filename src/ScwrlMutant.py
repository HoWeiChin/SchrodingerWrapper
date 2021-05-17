from schrodinger import structure
import os


def mutate(
        seq_f, pdb, residue_num,
        mutant_aa,
        chain=None
):
    """
    :param seq_f (str): path to folder which store mutant sequence info for scwrl mutations
    :param pdb (str): path to pdb file
    :param residue_num: residue number of chain to mutate, if chain is absent, just search entire protein structure of residue num
    :param mutant_aa (str): new single letter aa to replace aa at residue_num
    :param chain (optional, str): name of amino acid chain in pdb

    :return: a tuple of a sequence of single lettered mutant a.a seq and path to txt file containing the mutant seq
    """
    AA = {'Ala': 'A',
          'Arg': 'R',
          'Asn': 'N',
          'Asp': 'D',
          'Cys': 'C',
          'Glu': 'E',
          'Gln': 'Q',
          'Gly': 'G',
          'His': 'H',
          'Hid': 'H',
          'Ile': 'I',
          'Leu': 'L',
          'Lys': 'K',
          'Met': 'M',
          'Phe': 'F',
          'Pro': 'P',
          'Ser': 'S',
          'Thr': 'T',
          'Trp': 'W',
          'Tyr': 'Y',
          'Val': 'V'}

    st = structure.StructureReader.read(pdb)

    residue_list = st.residue
    if not mutant_aa in AA.values():
        raise ValueError(f'{mutant_aa} is not a valid amino acid.')

    if chain:
        chains = list(st.chain)
        protein_chains = list(filter(lambda p_chain: p_chain.name == chain.capitalize(), chains))

        if len(protein_chains) == 0:
            raise ValueError(f'chain {chain} dont exist in {pdb}.')

        residue_list = protein_chains[0].residue

    mutant_seq = []

    repeated_res = set()

    for residue in residue_list:
        if residue.resnum in repeated_res or not residue.isStandardResidue() or residue.__len__() <= 1:
            continue

        three_letter_res = residue.pdbres.capitalize().strip()
        one_letter_res = AA[three_letter_res]

        if residue.resnum == residue_num:
            one_letter_res = mutant_aa

        mutant_seq.append(one_letter_res)
        repeated_res.add(residue.resnum)

    result = ''.join(mutant_seq)

    out_f_name = pdb.split('/')[-1] + '_scwrl_mut.txt'
    final_out_path = os.path.join(seq_f, out_f_name)
    with open(final_out_path, 'w+') as out_f:
        out_f.write(result)

    return result, final_out_path


def mutateV2(mut_file, pdb_file, fix_file=None):
    """

    :param mut_file (str): path to mutation file, contains which chain, res number to mutate
    :param fix_file (str): path to fix file, which contains which aa to fix (small letter)
    :param pdb_file (str): path to pdb_file
    :return:
    """

    AA = {'Ala': 'A',
          'Arg': 'R',
          'Asn': 'N',
          'Asp': 'D',
          'Cys': 'C',
          'Glu': 'E',
          'Gln': 'Q',
          'Gly': 'G',
          'His': 'H',
          'Hid': 'H',
          'Ile': 'I',
          'Leu': 'L',
          'Lys': 'K',
          'Met': 'M',
          'Phe': 'F',
          'Pro': 'P',
          'Ser': 'S',
          'Thr': 'T',
          'Trp': 'W',
          'Tyr': 'Y',
          'Val': 'V'}
    print(pdb_file)
    st = structure.StructureReader.read(pdb_file)

    with open(mut_file, 'r') as file:
        mutations = file.readlines()[0]  # eg: chain1:ResidueNumber1:newResidue1, chain2:ResidueNumber2:newResidue2
        mutations_tokens = mutations.split(',')

    if not fix_file is None:
        with open(fix_file, 'r') as file:
            residues_to_fix = file.readlines()[0].strip()  # eg: 272,495,496,581
            residues_to_fix_tokens = residues_to_fix.split(',')
            print(residues_to_fix_tokens)

    chains = list(st.chain)  # all the polypeptide chains in a list

    # do mutation

    chain_map = {} # chain letter : chain sequence

    for mutation in mutations_tokens:

        if mutation == '':
            continue

        chain, residue_num, new_residue = mutation.split(':') #for eg, A:31:E -> A, 31, E

        # just gonna get the first chain which has letter == chain
        protein_chain = list(filter(lambda p_chain: p_chain.name == chain.capitalize(), chains))[0]

        #construct a brand new map representation of a sequence if it has not been constructed, then do the mutation
        if chain not in chain_map:

            residue_position_map = {}
            residues = protein_chain.residue

            for residue in residues:

                if residue.resnum in residue_position_map or not residue.isStandardResidue() or residue.__len__() <= 1:
                    continue

                three_letter_res = residue.pdbres.capitalize().strip()
                one_letter_res = AA[three_letter_res]

                if residue.resnum == int(residue_num):
                    one_letter_res = new_residue

                if not fix_file is None and str(residue.resnum) in residues_to_fix_tokens:
                    one_letter_res = one_letter_res.lower()
                    print(str(residue.resnum), one_letter_res)

                residue_position_map[residue.resnum] = one_letter_res

            chain_map[chain] = residue_position_map

        #just perform the mutation
        map_representation_of_seq = chain_map[chain]

        if map_representation_of_seq[int(residue_num)].islower():
            map_representation_of_seq[int(residue_num)] = new_residue.lower()

        elif map_representation_of_seq[int(residue_num)].isupper():
            map_representation_of_seq[int(residue_num)] = new_residue.upper()

    full_protein = []

    for chain_letter in sorted(chain_map.keys()):
        subunit = []
        for residue_num in sorted(chain_map[chain_letter]):
            subunit.append(chain_map[chain_letter][residue_num])
        full_protein.append(''.join(subunit))

    out_f_name = pdb_file.split('/')[-1] + '_scwrl_mut.txt'
    final_out_path = os.path.join('seq_f', out_f_name)

    with open(final_out_path, 'w+') as out_f:
        out_f.write(''.join(full_protein))

    return final_out_path

if __name__ == "__main__":
    # mutate('1a3n.pdb', 146, 'A', 'E')
    # result = mutate('1a3n.pdb', 1, 'Y', 'a')
    # print(result + '\n')
    # assert result == 'YLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFTPAVHASLDKFLASVSTVLTSKYR'

    # result = mutate('1d66.pdb', 1, 'Y', 'A')
    # print(result + '\n')
    # assert result == 'YQACDICRLKKLKCSKEKPKCAKCLKNNWECRYSPKTKRSPLTRAHLTEVESRLERL'

    # result_, _ = mutate('seq_f', '1og2.pdb', 31, 'E', 'A')
    # print(result_ + '\n')

    result = mutateV2(mut_file='files/mut.txt', pdb_file='pdb_f/1og2.pdb', fix_file='files/fix.txt')
    print(result)
    #assert result == 'PEGPTPLPVIGNILQIGIKDISKSLTNLSKVYGPVFTLYFGLKPIVVLHGYEAVKEALIDLGEEFSGRGIFPLAERANRGFGIVFSNGKKWKEIRRFSLMTLRNFGMGKRSIEDRVQEEARCLVEELRKTKASPCDPTFILGCAPCNVICSIIFHKRFDYKDQQFLNLMEKLNENIEILSSPWIQVYNNFPALLDYFPGTHNKLLKNVAFMKSYILEKVKEHQESMDMNNPQDFIDCFLMKMEKEKHNQPSEFTIESLENTAVDLFGAGTETTSTTLRYALLLLLKHPEVTAKVQEEIERVIGRNRSPCMQDRSHMPYTDAVVHEVQRYIDLLPTSLPHAVTCDIKFRNYLIPKGTTILISLTSVLHDNKEFPNPEMFDPHHFLDEGGNFKKSKYFMPFSAGKRICVGEALAGMELFLFLTSILQNFNLKSLVDPKNLDTTPVVNGFASVPPFYQLCFIPV'
