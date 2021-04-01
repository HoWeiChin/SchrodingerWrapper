import logging
from src.WrongResidueTypeError import WrongResidueTypeError
from src.NullValueError import NullValueError


class ResidueNumber:
    def __init__(self, res_number):
        """

        :param res_number (int or str): position of a residue in a protein
        """
        if res_number is not None:
            if isinstance(res_number, int) and res_number > 0:
                self.__res_num = res_number

            elif isinstance(res_number, str) and res_number.isdigit() and int(res_number) > 0:
                self.__res_num = res_number
            else:
                raise WrongResidueTypeError(res_number)
        else:
            raise NullValueError('ResidueNumber', 'res_number')

    def get_res_num(self, data_type):
        """

        :param data_type (higher order function):
        :return:
        """
        if data_type == int or data_type == str:
            return data_type(self.__res_num)
        else:
            logging.debug('Residue number can only be of type int or str.')
            raise TypeError('Residue number can only be of type int or str.')
