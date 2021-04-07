from unittest import TestCase
from src.Process import Process
import os


class TestProcess(TestCase):

    def test_process_1gog_1_mutation(self):
        test_folder = os.path.dirname(os.path.abspath(__file__))

        test_pdb_folder = os.path.join(test_folder, 'Process_test_folder/1_pdb_folder')
        mut_file = os.path.join(test_folder, 'mutation_txt_files/mutation_OH_to_F.txt')
        out_dir = os.path.join(test_folder, 'Process_test_folder/1_pdb_folder/out_folder')

        p = Process(pdb_folder=test_pdb_folder, mut_file=mut_file, out_dir=out_dir)
        p.process()
        self.assertTrue('modified_1gog.pdb' in os.listdir(out_dir))

    def test_process_1goh_1_mutation(self):
        test_folder = os.path.dirname(os.path.abspath(__file__))

        test_pdb_folder = os.path.join(test_folder, 'Process_test_folder/2_pdb_folder')
        mut_file = os.path.join(test_folder, 'mutation_txt_files/mutation_OH_to_F.txt')
        out_dir = os.path.join(test_folder, 'Process_test_folder/2_pdb_folder/out_folder')

        p = Process(pdb_folder=test_pdb_folder, mut_file=mut_file, out_dir=out_dir)
        p.process()
        self.assertTrue('modified_1goh.pdb' in os.listdir(out_dir))

    def test_process_1ubq_no_bar(self):
        test_folder = os.path.dirname(os.path.abspath(__file__))

        test_pdb_folder = os.path.join(test_folder, 'Process_test_folder/3_pdb_folder')
        mut_file = os.path.join(test_folder, 'mutation_txt_files/mutation_no_bar.txt')
        out_dir = os.path.join(test_folder, 'Process_test_folder/3_pdb_folder/out_folder')

        p = Process(pdb_folder=test_pdb_folder, mut_file=mut_file, out_dir=out_dir)

        with self.assertRaises(ValueError) as cm:
            p.process()

        self.assertEqual('must provide | inside mutation text file.', str(cm.exception))

    def test_process_1ubq_1_mutation(self):
        test_folder = os.path.dirname(os.path.abspath(__file__))

        test_pdb_folder = os.path.join(test_folder, 'Process_test_folder/3_pdb_folder')
        mut_file = os.path.join(test_folder, 'mutation_txt_files/mutation_CB_to_CA.txt')
        out_dir = os.path.join(test_folder, 'Process_test_folder/3_pdb_folder/out_folder')

        p = Process(pdb_folder=test_pdb_folder, mut_file=mut_file, out_dir=out_dir)
        p.process()
        self.assertTrue('modified_1ubq.pdb' in os.listdir(out_dir))

    def test_process_1ubq_3_mutations(self):
        test_folder = os.path.dirname(os.path.abspath(__file__))

        test_pdb_folder = os.path.join(test_folder, 'Process_test_folder/4_pdb_folder')
        mut_file = os.path.join(test_folder, 'mutation_txt_files/2_mutations.txt')
        out_dir = os.path.join(test_folder, 'Process_test_folder/4_pdb_folder/out_folder')

        p = Process(pdb_folder=test_pdb_folder, mut_file=mut_file, out_dir=out_dir)
        p.process()
        self.assertTrue('modified_1ubq.pdb' in os.listdir(out_dir))

    def test_process_1ubq_1gog(self):
        test_folder = os.path.dirname(os.path.abspath(__file__))

        test_pdb_folder = os.path.join(test_folder, 'Process_test_folder/5_pdb_folder')
        mut_file = os.path.join(test_folder, 'mutation_txt_files/mutation_1gog_1ubq.txt')
        out_dir = os.path.join(test_folder, 'Process_test_folder/5_pdb_folder/out_folder')

        p = Process(pdb_folder=test_pdb_folder, mut_file=mut_file, out_dir=out_dir)
        p.process()
        self.assertTrue('modified_1ubq.pdb' in os.listdir(out_dir) and 'modified_1gog.pdb' in os.listdir(out_dir))


