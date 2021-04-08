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
            print(residue.__len__())
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
    with open(final_out_path,'w+') as out_f:
        out_f.write(result)

    return result, final_out_path


if __name__ == "__main__":
    # mutate('1a3n.pdb', 146, 'A', 'E')
    #result = mutate('1a3n.pdb', 1, 'Y', 'a')
    #print(result + '\n')
    #assert result == 'YLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGKKVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFTPAVHASLDKFLASVSTVLTSKYR'

    #result = mutate('1d66.pdb', 1, 'Y', 'A')
    #print(result + '\n')
    #assert result == 'YQACDICRLKKLKCSKEKPKCAKCLKNNWECRYSPKTKRSPLTRAHLTEVESRLERL'

    result, _ = mutate('seq_f', '1og2.pdb', 31, 'E', 'A')
    print(result + '\n')
    assert result == 'PEGPTPLPVIGNILQIGIKDISKSLTNLSKVYGPVFTLYFGLKPIVVLHGYEAVKEALIDLGEEFSGRGIFPLAERANRGFGIVFSNGKKWKEIRRFSLMTLRNFGMGKRSIEDRVQEEARCLVEELRKTKASPCDPTFILGCAPCNVICSIIFHKRFDYKDQQFLNLMEKLNENIEILSSPWIQVYNNFPALLDYFPGTHNKLLKNVAFMKSYILEKVKEHQESMDMNNPQDFIDCFLMKMEKEKHNQPSEFTIESLENTAVDLFGAGTETTSTTLRYALLLLLKHPEVTAKVQEEIERVIGRNRSPCMQDRSHMPYTDAVVHEVQRYIDLLPTSLPHAVTCDIKFRNYLIPKGTTILISLTSVLHDNKEFPNPEMFDPHHFLDEGGNFKKSKYFMPFSAGKRICVGEALAGMELFLFLTSILQNFNLKSLVDPKNLDTTPVVNGFASVPPFYQLCFIPV'