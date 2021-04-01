from unittest import TestCase
from src.OrderedResidueNumbers import OrderedResidueNumbers
from src.ResidueNumber import ResidueNumber


class TestOrderedResidueNumbers(TestCase):

    def test_get_next_get_lst_residue(self):
        ordered_residues = OrderedResidueNumbers()
        ordered_residues.add_res_num(ResidueNumber(1))
        res = ordered_residues.get_next()

        self.assertEqual(1, res.get_res_num(int))

    def test_get_next_exceed_max_residues(self):
        ordered_residues = OrderedResidueNumbers()
        ordered_residues.add_res_num(ResidueNumber(1))
        ordered_residues.get_next()

        self.assertRaises(IndexError, ordered_residues.get_next)

