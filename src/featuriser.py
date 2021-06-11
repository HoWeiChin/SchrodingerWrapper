
def is_matching_coord(atom, coord):
    """

    :param atom (structureAtom): a structureAtom object
    :param coord: an iterable of x,y,z coordinates
    :return: boolean
    """

    return atom.xyz == list(coord)

def get_atom_info_from_coord(complex_pdb_file,
                             coord,
                             coord_tag_name):
    # coord is an iterable of float in [x,y,z] or (x,y,z)
    # complex_pdb_file is eg: /path/to/pdb.pdb which contains ligand and receptor coords and must be an absolute path
    from schrodinger import structure

    """

    from pdb, we can get info about element, atom id,
    residue (if applicable) and if entry belongs to a lig, het or protein

    """

    atom_info = {'element_type': None, 'residue_type': None, 'hydrophobic_interactions': 0,
                 'hydrogen_bonds': 0, 'water_bridges': 0, 'pi_stacks': 0,
                 'pi_cation_interactions': 0, 'halogen_bonds': 0, 'salt_bridges': 0,
                 'metal_complexes': 0

                 }

    atom_id = ''
    st = structure.StructureReader.read(complex_pdb_file)

    atoms = st.atom

    for atom in atoms:
        atom_index = atom.index

        if is_matching_coord(atom, coord):
            atom_info['element_type'] = atom.element

            if coord_tag_name == 'protcoo':
                atom_info['residue_type'] = atom.pdbres
                atom_id = f'prot_atm_{atom_index}'

            elif coord_tag_name == 'ligcoo':
                atom_id = f'lig_atm_{atom_index}'

            elif coord_tag_name == 'watercoo':
                atom_id = f'het_atm_{atom_index}'

    return (atom_id , atom_info)

def get_coord_given_tag(tag, coord_tag_name):
    if len(tag.findall(coord_tag_name)) == 0:
        return None
    x = tag.findall(coord_tag_name)[0].findall('x')[0].text
    y = tag.findall(coord_tag_name)[0].findall('y')[0].text
    z = tag.findall(coord_tag_name)[0].findall('z')[0].text
    return (float(x), float(y), float(z))

def get_feature_vectors_for_a_complex(xml_file_path,
                                      complex_pdb_folder='protein_ligand_pdb',
                                      x_path="./bindingsite/[@id='2']/interactions"):
    # xml_file must a full path, for eg: protein_ligand_pdb/xml/CYP3A4-S119A_4192_complex/report.xml
    # x_path, for eg, ./bindingsite/[@id='2']/interactions

    import xml.etree.ElementTree as ET
    import os

    xml_tree = ET.parse(xml_file_path)
    root = xml_tree.getroot()

    non_covalent_interaction_subtree = root.findall(x_path)
    path_tokens = xml_file_path.split('/')

    complex_pdb_file_name = f'{path_tokens[2]}.pdb'
    full_complex_pdb_file_path = os.path.join(complex_pdb_folder, complex_pdb_file_name)

    # non_covalent subtree must have 1 child tag, otherwise sth is wrong
    if len(non_covalent_interaction_subtree) > 1 or len(non_covalent_interaction_subtree) < 1:
        print(f'sth is wrong with {xml_file_path}')
        return

    non_covalent_interaction_tag_names = ['hydrophobic_interactions', 'hydrogen_bonds', 'water_bridges',
                                          'salt_bridges', 'pi_stacks', 'pi_cation_interactions',
                                          'halogen_bonds', 'metal_complexes'
                                          ]

    coord_tag_names = ['ligcoo', 'protcoo', 'watercoo']

    atoms_and_features_map = {}  # key atom id from pdb, value: {'atom_type': 'H', .. etc}

    for non_covalent_interaction_tag_name in non_covalent_interaction_tag_names:

        # for eg:for ele in lig_non_covalent_subtree[0].findall('hydrogen_bonds')[0]
        for individual_interaction_tag in \
        non_covalent_interaction_subtree[0].findall(non_covalent_interaction_tag_name)[0]:

            for coord_tag_name in coord_tag_names:

                coord = get_coord_given_tag(individual_interaction_tag, coord_tag_name)

                if coord == None:
                    continue

                atom_id, atom_info_map = get_atom_info_from_coord(full_complex_pdb_file_path, coord, coord_tag_name)

                # if the atom_id reppear, origin_type will stay the same
                # but there is a new non-covalent interactions
                if atom_id in atoms_and_features_map:
                    atoms_and_features_map[atom_id][non_covalent_interaction_tag_name] = 1
                    continue

                if coord_tag_name == 'ligcoo':
                    atom_info_map['origin_type'] = 'lig'

                elif coord_tag_name == 'protcoo':
                    atom_info_map['origin_type'] = 'prot'

                elif coord_tag_name == 'watercoo':
                    atom_info_map['origin_type'] = 'het'

                atom_info_map[non_covalent_interaction_tag_name] = 1
                atoms_and_features_map[atom_id] = atom_info_map

    return atoms_and_features_map

#data_map = get_feature_vectors_for_a_complex(xml_file_path='protein_ligand_pdb/xml/CYP3A4-A370F_3035604_complex/report.xml')

