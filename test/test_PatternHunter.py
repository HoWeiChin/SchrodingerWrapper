from unittest import TestCase

from src.PatternHunter import PatternHunter


class TestPatternHunter(TestCase):

    def test_is_pattern_in_line_empty_str(self):
        row = ''
        pattern = '^ATOM'
        result = PatternHunter().is_pattern_in_line(row, pattern)
        self.assertFalse(result)

    def test_is_pattern_in_line_null_str(self):
        row = None
        pattern = '^ATOM'
        result = PatternHunter().is_pattern_in_line(row, pattern)
        self.assertFalse(result)

    def test_is_pattern_in_line_null_pattern(self):
        row = 'ATOM   4535  CB  ASN A 600     -12.858   3.434  14.452  1.00 34.81           C'
        pattern = None
        result = PatternHunter().is_pattern_in_line(row, pattern)
        self.assertEqual(result, f'pattern: {pattern} is not a valid string.')

    def test_is_pattern_in_line_not_str_pattern(self):
        row = 'ATOM   4535  CB  ASN A 600     -12.858   3.434  14.452  1.00 34.81           C'
        pattern = 1
        result = PatternHunter().is_pattern_in_line(row, pattern)
        self.assertEqual(result, f'pattern: {pattern} is not a valid string.')

    def test_is_pattern_in_line_pattern_matched_1(self):
        row = 'ATOM   4535  CB  ASN A 600     -12.858   3.434  14.452  1.00 34.81           C'
        pattern = '^ATOM'
        result = PatternHunter().is_pattern_in_line(row, pattern)
        self.assertTrue(result)

    def test_is_pattern_in_line_pattern_not_matched_1(self):
        row = 'HETATM 5143  O   HOH A1012      33.314  30.998  29.022  1.00 43.25           O'
        pattern = '^ATOM'
        result = PatternHunter().is_pattern_in_line(row, pattern)
        self.assertFalse(result)

    def test_is_pattern_in_line_pattern_matched_2(self):
        row = 'C  4535  CB  ASN A 600     -12.858   3.434  14.452  1.00 34.81           ATOM'
        pattern = '^ATOM'
        result = PatternHunter().is_pattern_in_line(row, pattern)
        self.assertFalse(result)