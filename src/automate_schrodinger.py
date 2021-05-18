from schrodinger import structure
from CmdUtil import run_prepwizard
from progress.spinner import MoonSpinner
from time import sleep
from Process import Process
import os

# get atom with index
def get_atom(atoms,pdb_atom_index):
    """

    :param atoms (list): list of StructureAtom objects
    :param pdb_atom_index (int): position of an atom of a residue as seen in a pdb file
    for eg:
    ATOM   4824  O   GLN A
    Position of oxygen atom of GLN in a pdb fifle is 4824
    :return: a StructureAtom object
    """
    try:
        target_atm = list(filter(lambda atom: atom.index == pdb_atom_index, atoms))[0]
        return target_atm
    except IndexError:
        print(f'Unable to find atom at {pdb_atom_index}')

def get_residue(st, pdb_res_code=None, res_num=None):

    if pdb_res_code and res_num:
        return list(filter(lambda residue: residue.pdbres.replace(' ', '') == pdb_res_code and residue.resnum == res_num, st.residue))[0]

    if pdb_res_code:
        return list(
            filter(lambda residue: residue.pdbres.replace(' ', '') == pdb_res_code,
                   st.residue))[0]

    if res_num:
        return list(
            filter(lambda residue: residue.resnum == res_num,
                   st.residue))[0]

def add_atom(target_atm, element_to_add, bond_order,
             coords, existing_st):
    """

    :param target_atm (StructureAtom): atm which you want atm to be bonded to
    :param element_to_add (String): element name, for eg F for fluorine
    :param coords (tuple of float): x, y, z coords for atm_to_add
    :param bond order (int): bond order between target_atm and element_to_add
    :param existing_st (Structure):
    :return: Structure object
    """
    x, y ,z = coords
    atm_to_add = existing_st.addAtom(element_to_add, x, y, z)
    atm_to_add.pdbname = f' {element_to_add} '
    existing_st.addBond(target_atm.index, atm_to_add.index, bond_order)
    return atm_to_add

#get atom with a pdbname in mind
def get_atom_from_residue(atoms, atm_pdbname):

    atom = list(filter(lambda atom: atom.pdbname.replace(' ', '') == atm_pdbname, atoms))[0]
    return atom

def print_atoms(atoms):
    """

    :param atoms (list): a list of StructureAtom objects
    :return:
    """

    for atm in atoms:
        print(f'Atom:{atm.pdbname} Atom Position:{atm.index}')

def print_bonds(bonds):
    """

    :param bonds (list): a list of StructureBond objects
    :return:
    """
    for bond in bonds:
        print(f'Bond type:{bond.type} Bond Order:{bond.order} '
              f'Bond from:{bond.from_style} Bond to:{bond.to_style}')

def is_equal_formal_charge(atm, charge):
    """

    :param atm (StructureAtom):
    :param charge (float/int):
    :return:
    """
    return atm.formal_charge == charge

def bonding(struc, center_atm, partners):
    """

    :param struc (Structure):
    :param center_atm (StructureAtom): will be boneded to partners
    :param partners (Dict of StructureAtom) : key: StructureAtom object, value: bond order
    :return:
    """
    for partner_atm in partners:
        bond_order = partners[partner_atm]
        struc.addBond(center_atm.index, partner_atm.index, bond_order)

def sch_routine(is_cross_link, is_zero_order_bonding, is_check_cu_charge, out_dir):
    """

    :param pdb_path: path to folder containing pdb files (usually after scwrl has been applied)
    :param scwrl_file: path to scwrl file
    :param pdb_path: path to folder containing pdb files (usually after scwrl has been applied)
    :param mutation_file: path to mutation file
    :param out_dir: to save pdb files which atoms of some residues have been changed.
    :return:
    """

    #
    #p.process()
    with open('scwrl.txt', 'r') as scwrl_f:
        scwrl_txt_rows = scwrl_f.readlines()


    for mutant in os.listdir(out_dir):
        print(f'Processing pdb {mutant}')

        file_name_tokens = mutant.split('_') #for eg: '2EIE_0_out.mae' to ['2EIE', '0', '_out.mae']
        row_index = int(file_name_tokens[1]) #for eg '0' from above
        target_row = scwrl_txt_rows[row_index].strip()
        mut_file_token = target_row.split(',')[2] #mut:mut2.txt
        mut_filename = mut_file_token.split(':')[-1].split('.')[0] #mut2

        full_mutant = os.path.join(out_dir, mutant)
        protein_strucs = list(structure.StructureReader(full_mutant))
        protein_struc = protein_strucs[0]

        if is_cross_link:
            print('cross linking')
            ############## Crosslink ####################
            res_228 = get_residue(protein_struc, res_num=228)
            res_228_atms = list(res_228.atom)
            SG_atm = get_atom_from_residue(res_228_atms, 'SG')

            tyr_272 = get_residue(protein_struc, res_num=272)
            tyr_272_atms = list(tyr_272.atom)
            ce1_atm = get_atom_from_residue(tyr_272_atms, 'CE1')
            partners = {SG_atm: 1}

            bonding(protein_struc, ce1_atm, partners)

        if is_zero_order_bonding:
            print('forming 0 order bonds')
            ############## Make 0 order bonds with Cu ####################
            # note that schrodinger skips TER, hence CU starts at 4831 instead pf 4832
            cu_res = get_residue(protein_struc, pdb_res_code='CU')
            cu_atm = get_atom_from_residue(list(cu_res.atom), 'CU')

            #print("cu_res:", cu_res)
            #print("cu_atm:", cu_atm)
            tyr_495 = get_residue(protein_struc, res_num=495)
            res_495_atms = list(tyr_495.atom)
            OH_tyr_495_atm = get_atom_from_residue(res_495_atms, 'OH')

            his_496 = get_residue(protein_struc, res_num=496)
            his_496_atms = list(his_496.atom)
            NE2_his_496_atm = get_atom_from_residue(his_496_atms, 'NE2')

            his_581 = get_residue(protein_struc, res_num=581)
            his_581_atms = list(his_581.atom)
            NE2_his_581_atm = get_atom_from_residue(his_581_atms, 'NE2')

            F_tyr_272_atm = get_atom_from_residue(tyr_272_atms, 'F')

            #partners = {OH_tyr_495_atm: 0, NE2_his_496_atm: 0,
            #            NE2_his_581_atm: 0, F_tyr_272_atm: 0
            #            }
            partners = {NE2_his_496_atm: 0,
                        NE2_his_581_atm: 0, F_tyr_272_atm: 0
                        }

            bonding(protein_struc, cu_atm, partners)
        
            if not is_equal_formal_charge(cu_atm, 2):
                cu_atm.formal_charge = 2

        pdb_mae_in = mutant.split('.')[0] + '_sch.mae'
        with structure.StructureWriter(pdb_mae_in) as writer:
            writer.append(protein_struc)

        pdb_mae_out = file_name_tokens[0] + f'_{mut_filename}.mae'
        print(f'{pdb_mae_in} {pdb_mae_out}')
        run_prepwizard(prepwiz_exe_path='$SCHRODINGER/utilities/prepwizard',
                       mae_in=pdb_mae_in,
                       mae_out=pdb_mae_out
                       )

        with MoonSpinner('Optimising structure...') as bar:
            while pdb_mae_out not in os.listdir(os.getcwd()):
                sleep(1)
                bar.next()

        os.remove(pdb_mae_in)
        os.remove(mutant.split('.')[0] + '_sch.log')

        if is_check_cu_charge:
            opt_protein_strucs = list(structure.StructureReader(pdb_mae_out))
            opt_protein_struc = opt_protein_strucs[0]
            cu_res = get_residue(opt_protein_struc, pdb_res_code='CU')
            cu_atm = get_atom_from_residue(list(cu_res.atom), 'CU')

            if not is_equal_formal_charge(cu_atm, 2):
                cu_atm.formal_charge = 2
                with structure.StructureWriter(pdb_mae_out) as writer:
                    writer.append(opt_protein_struc)

if __name__ == "__main__":


    gog_input_f = '1gog.pdb'
    gog_strucs = list(structure.StructureReader(gog_input_f))
    gog_struc = gog_strucs[0]
    atoms = list(gog_struc.atom)
    cu = get_residue(gog_struc,pdb_res_code='CU')
    print(f'cu: {cu.pdbres}')
    ############## Crosslink ####################
    res_228 = get_residue(gog_struc, res_num=228)
    res_228_atms = list(res_228.atom)
    SG_atm = get_atom_from_residue(res_228_atms, 'SG')
    tyr_272 = get_residue(gog_struc, res_num=272)
    print(tyr_272.pdbres)
    print_atoms(list(tyr_272.atom))
    print('#####################################')
    ce1_atm = get_atom_from_residue(tyr_272.atom, 'CE1')
    partners = {SG_atm: 1}

    bonding(gog_struc, ce1_atm, partners)

    atms_bonded_to_ce1_atm = list(ce1_atm.bonded_atoms) #returns StructureAtom list
    print_atoms(atms_bonded_to_ce1_atm)
    print('#####################################')

    ############## Make 0 order bonds with Cu ####################
    # note that schrodinger skips TER, hence CU starts at 4831 instead pf 4832
    cu_atm = get_atom(atoms, 4831)
    OH_tyr_495_atm = get_atom(atoms, 3751)
    NE2_his_495_atm = get_atom(atoms, 3761)
    NE2_his_581_atm = get_atom(atoms, 4393)
    F_tyr_272_atm = get_atom(atoms, 2051)

   # partners = {OH_tyr_495_atm: 0, NE2_his_495_atm: 0,
   #             NE2_his_581_atm: 0, F_tyr_272_atm: 0
   #             }
    partners = {NE2_his_496_atm: 0,
                NE2_his_581_atm: 0, F_tyr_272_atm: 0
                }

    bonding(gog_struc, cu_atm, partners)

    print_atoms(list(cu_atm.bonded_atoms))
    print('###### OH #########')
    print_atoms(list(OH_tyr_495_atm.bonded_atoms))
    OH_tyr_495_atm.formal_charge = -1

    if is_equal_formal_charge(cu_atm, 2):
        print('Cu charge is 2.')

    with structure.StructureWriter('1gog_processed_deprotonated.mae') as writer:
        writer.append(gog_struc)

    with structure.StructureWriter('1gog_processed.pdb') as writer:
        writer.append(gog_struc)

    ### prepwizard component

    
    run_prepwizard(prepwiz_exe_path='$SCHRODINGER/utilities/prepwizard',
                   mae_in='1gog_processed.mae',
                   mae_out='1gog_processed_out.mae'
                   )
    with MoonSpinner('Optimising structure...') as bar:
        while '1gog_processed_out.mae' not in os.listdir():
            sleep(1)
            bar.next()

    opt_gog_strucs = list(structure.StructureReader('1gog_processed_out.mae'))
    opt_gog_struc = opt_gog_strucs[0]
    opt_atoms = list(opt_gog_struc.atom)
    cu_atm = get_atom(opt_atoms, 4831)

    if is_equal_formal_charge(cu_atm, 2):
        print('Cu charge is still 2 after prepwizard run.')
    else:
        wrong_charge = cu_atm.formal_charge
        cu_atm.formal_charge = 2
        print(f'Cu charge was {wrong_charge}, it as been rectified to {cu_atm.formal_charge}.')

