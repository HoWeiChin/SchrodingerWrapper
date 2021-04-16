from unittest import TestCase
from src.PubChemUtils import get_compound, get_smiles


class Test(TestCase):

    def test_get_compound_not_int(self):
        id = '5090'
        with self.assertRaises(TypeError) as cm:
            get_compound(id=id)
        expected_msg = f'compound id {id} must be of type int and must not be None.'
        self.assertEqual(expected_msg, str(cm.exception))

    def test_get_compound_undefined_value(self):
        id = None
        with self.assertRaises(TypeError) as cm:
            get_compound(id=id)
        expected_msg = f'compound id {id} must be of type int and must not be None.'
        self.assertEqual(expected_msg, str(cm.exception))

    def test_get_compound_undefined_value(self):
        id = None
        with self.assertRaises(TypeError) as cm:
            get_compound(id=id)
        expected_msg = f'compound id {id} must be of type int and must not be None.'
        self.assertEqual(expected_msg, str(cm.exception))

    def test_get_compound_invalid_id(self):
        id = 0
        with self.assertRaises(ValueError) as cm:
            get_compound(id=id)
        expected_msg = f'compound id {id} is invalid, pls check again.'
        self.assertEqual(expected_msg, str(cm.exception))

    def test_get_compound_valid_id(self):
        id = 1
        result_c = get_compound(id=id)
        self.assertEqual(result_c.iupac_name, '3-acetyloxy-4-(trimethylazaniumyl)butanoate')

    def test_get_smiles_invalid_input_type(self):
        compound_obj = 1
        with self.assertRaises(TypeError) as cm:
            get_smiles(compound=compound_obj)
        expected_msg = 'Input is not a pubchempy Compound object or is None.'
        self.assertEqual(expected_msg, str(cm.exception))

    def test_get_smiles_none_input(self):
        compound_obj = None
        with self.assertRaises(TypeError) as cm:
            get_smiles(compound=compound_obj)
        expected_msg = 'Input is not a pubchempy Compound object or is None.'
        self.assertEqual(expected_msg, str(cm.exception))

    def test_get_smiles_valid_input(self):
        compound_obj = get_compound(1)
        smiles = get_smiles(compound=compound_obj)
        expected_smiles = compound_obj.isomeric_smiles

        self.assertEqual(expected_smiles, smiles)