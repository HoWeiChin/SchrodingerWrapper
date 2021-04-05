from unittest import TestCase
from src.PDBMut import PDBMut
from src.PDBFile import PDBFile
from src.AtomToChange import AtomToChange
import os


class TestPDBMut(TestCase):
    def test_mutate_line(self):
        line = 'ATOM   4801  CG  ARG A 636       6.549  20.778  14.672  1.00 22.66           C  \n'
        line_tokens = line.strip().split()
        atm_to_chng = 'CG'
        new_atm = 'F'
        new_ele = 'F'
        new_line = PDBMut(None, None).mutate_line(line, line_tokens, atm_to_chng, new_atm, new_ele)
        expected_result = 'ATOM   4801  F   ARG A 636       6.549  20.778  14.672  1.00 22.66           F  \n'
        self.assertEqual(expected_result, new_line)

    def test_save_pdb(self):
        pdb_folder = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'saved_output')
        PDBMut(PDBFile(None, 'test.pdb'), None).save_pdb(pdb_folder, 'test')
        self.assertTrue('modified_test.pdb' in os.listdir(pdb_folder))

    def test_mutate_and_save_pdb(self):
        pdb_folder = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'test_files')
        pdb_file = '1gog.pdb'
        mutations = [AtomToChange('CG', '636', 'F', 'F')]
        pdb_mut = PDBMut(PDBFile(pdb_folder, pdb_file), mutations)
        new_content = pdb_mut.mutate_pdb()
        pdb_mut.save_pdb(pdb_folder, new_content)

        result = open(os.path.join(pdb_folder, 'modified_1gog.pdb')).read()[5393]
        expected_result = open(os.path.join(pdb_folder, 'expected_modified_1gog.pdb')).read()[5393]
        self.assertEqual(expected_result, result)
