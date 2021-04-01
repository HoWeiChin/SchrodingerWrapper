import logging


# a container to iterate through a collection of residue numbers
class OrderedResidueNumbers:
    def __init__(self):
        self.__residue_nums = []
        self.__index = 0

    def add_res_num(self, res_num):
        """
        :param res_num (ResidueNumber): a ResidueNumber object
        :return:
        """
        self.__residue_nums.append(res_num)

    def get_next(self):
        """
        get the next residue number at the ith index
        :return: ResidueNumber
        """
        if self.__index < len(self.__residue_nums):
            residue = self.__residue_nums[self.__index]
            self.__index += 1
            return residue

        else:
            logging.debug('No more residues to query.')
            raise IndexError('No more residues to query.')
