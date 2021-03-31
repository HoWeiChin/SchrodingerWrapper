import re
import logging


class PatternHunter:
    def __init__(self):
        pass

    def is_pattern_in_line(self, row, pattern):
        """

        :param row (str): a row of strings
        :param pattern (str):a pattern to look for in row
        :return: boolean
        """
        if row is None or row == '':
            return False

        try:
            pattern_hunter = re.compile(pattern)
            is_match = pattern_hunter.match(row)
            return is_match

        except TypeError:
            msg = f'pattern: {pattern} is not a valid string.'
            logging.debug(msg)
            return msg
