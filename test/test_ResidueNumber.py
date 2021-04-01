from unittest import TestCase
from src.NullValueError import NullValueError
from src.ResidueNumber import ResidueNumber
from src.WrongResidueTypeError import WrongResidueTypeError


class TestResidueNumber(TestCase):
    def test_init_0_res_num(self):
        res_num = 0
        with self.assertRaises(WrongResidueTypeError) as context_m:
            ResidueNumber(res_num)

        error_msg = f"Check your residue {res_num} value, it must be either positive int or string only;" \
                           f" string value must be a positive digit."
        self.assertEqual(context_m.exception.message, error_msg)

    def test_init_negative_res_num(self):
        res_num = -1
        with self.assertRaises(WrongResidueTypeError) as context_m:
            ResidueNumber(res_num)

        error_msg = f"Check your residue {res_num} value, it must be either positive int or string only;" \
                           f" string value must be a positive digit."
        self.assertEqual(context_m.exception.message, error_msg)

    def test_init_null_res_num(self):
        res_num = None
        class_name = 'ResidueNumber'
        param_name = 'res_number'
        with self.assertRaises(NullValueError) as context_m:
            ResidueNumber(res_num)

        error_msg = f"Class {class_name}'s parameter {param_name} cannot be None"
        self.assertEqual(context_m.exception.message, error_msg)

    def test_init_neg_str_res_num(self):
        res_num = '-1'
        with self.assertRaises(WrongResidueTypeError) as context_m:
            ResidueNumber(res_num)

        error_msg = f"Check your residue {res_num} value, it must be either positive int or string only;" \
                           f" string value must be a positive digit."
        self.assertEqual(context_m.exception.message, error_msg)

    def test_init_1_res_num(self):
        res_num = 1
        self.assertTrue(isinstance(ResidueNumber(res_num), ResidueNumber))

    def test_init_str_res_num(self):
        res_num = '1'
        self.assertTrue(isinstance(ResidueNumber(res_num), ResidueNumber))

