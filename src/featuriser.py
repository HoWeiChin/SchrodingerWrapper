from origin_type_encoder import OriginTypeEncoder
from residue_type_encoder import ResidueTypeEncoder
from element_type_encoder import ElementTypeEncoder

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
    atomid_coord_map = {} #key: atom id, value: coord (tuple of float)

    for non_covalent_interaction_tag_name in non_covalent_interaction_tag_names:

        # for eg:for ele in lig_non_covalent_subtree[0].findall('hydrogen_bonds')[0]
        for individual_interaction_tag in \
        non_covalent_interaction_subtree[0].findall(non_covalent_interaction_tag_name)[0]:

            for coord_tag_name in coord_tag_names:

                coord = get_coord_given_tag(individual_interaction_tag, coord_tag_name)

                if coord == None:
                    continue

                atom_id, atom_info_map = get_atom_info_from_coord(full_complex_pdb_file_path, coord, coord_tag_name)

                if atom_id not in atomid_coord_map:
                    atomid_coord_map[atom_id] = coord
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

    return atoms_and_features_map, atomid_coord_map

def encoding(data_map):
    """

    :param data_map (dict): key (str): atom_string, value (dict): atom features
    eg: {'lig_atm_11': {'element_type': 'OA',
                        'residue_type': None,
                        'hydrophobic_interactions': 0,
                        'hydrogen_bonds': 1,
                        'water_bridges': 0,
                        'pi_stacks': 0,
                        'pi_cation_interactions': 0,
                        'halogen_bonds': 0,
                        'salt_bridges': 0,
                        'metal_complexes': 0,
                        'origin_type': 'lig'
                        },
        'prot_atm_1466': {'element_type': 'N',
                          'residue_type': 'ARG',
                          'hydrophobic_interactions': 0,
                          'hydrogen_bonds': 1,
                          'water_bridges': 0,
                          'pi_stacks': 0,
                          'pi_cation_interactions': 0,
                          'halogen_bonds': 0,
                          'salt_bridges': 0,
                          'metal_complexes': 0,
                          'origin_type': 'prot'}
        }
    :return:
    """
    import numpy as np

    feature_matrix = [] # note: component of each row vector == feature
    atom_row_index_map = {}
    row = 0

    origin_encoder = OriginTypeEncoder()
    residue_type_encoder = ResidueTypeEncoder()
    element_type_enconder = ElementTypeEncoder()

    for vertex in data_map:
        features_map = data_map[vertex]
        feature_vector = []

        for feature in sorted(features_map.keys()):

            feature_value = features_map[feature]
            value_to_append = feature_value

            #override value_to_append if the following conditions hold
            if feature == 'origin_type':
                origin_type_encoding = origin_encoder.get_encoding(feature_value.strip())
                value_to_append = origin_type_encoding

            elif feature == 'residue_type':
                if feature_value is not None:
                    feature_value = feature_value.capitalize().strip()

                residue_type_encoding = residue_type_encoder.get_encoding(feature_value)
                value_to_append = residue_type_encoding

            elif feature == 'element_type':
                element_type_encoding = element_type_enconder.get_encoding(feature_value.strip())
                value_to_append = element_type_encoding

            feature_vector.append(value_to_append)

        atom_row_index_map[row] = vertex
        row += 1
        feature_matrix.append(feature_vector)

    return np.array(feature_matrix), atom_row_index_map

def create_vanilla_adj_mat(atom_id_coord_map):
    """

    :param atom_id_coord_map: key: string data for atom_id, value: tuple of float.
    eg:
    {'lig_atm_4016': (-21.041, -20.304, -14.444),
    'prot_atm_1466': (-22.494, -19.499, -11.466),
    'lig_atm_4006': (-23.823, -24.061, -15.347),
    'prot_atm_2255': (-23.343, -27.451, -17.477),
    'prot_atm_2715': (-22.393, -20.498, -18.287)}

    :return:
    """
    import numpy as np
    dim = len(atom_id_coord_map)
    adj_mat = np.zeros((dim, dim))  #because dim of adj mat is dim * dim, a square matrix.
    atom_component_map = {} #key: atom id, value: ith component, for example is atom_id 1 in the first dim, 2nd dim or 3rd dim etc

    for index, atom_id in enumerate(atom_id_coord_map):
        atom_component_map[atom_id] = index

    visited_i_j_pair = set()
    for atom_id in atom_id_coord_map:
        for neighbour in atom_id_coord_map:
            if atom_id == neighbour or (atom_id, neighbour) in visited_i_j_pair:
                continue

            if (atom_id, neighbour) not in visited_i_j_pair:
                visited_i_j_pair.add((atom_id, neighbour))
                visited_i_j_pair.add((neighbour, atom_id))

            i = atom_component_map[atom_id]
            j = atom_component_map[neighbour]
            i_coord_vec = np.array(atom_id_coord_map[atom_id]) #vectorise the coords for i,j vertices
            j_coord_vec = np.array(atom_id_coord_map[neighbour])
            adj_mat[i, j] = np.linalg.norm(i_coord_vec - j_coord_vec)
            adj_mat[j, i] = np.linalg.norm(i_coord_vec - j_coord_vec)
    return adj_mat, atom_component_map


data_map, atom_id_coord_map = get_feature_vectors_for_a_complex(xml_file_path='protein_ligand_pdb/xml/CYP3A4-A370F_3035604_complex/report.xml')

feature_mat, _ = encoding(data_map)
adj_mat, atom_component_map = create_vanilla_adj_mat(atom_id_coord_map)
print(adj_mat)
print(atom_component_map)
print(atom_id_coord_map)