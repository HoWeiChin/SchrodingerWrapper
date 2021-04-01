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
<<<<<<< HEAD
        if self.__index < len(self.__residue_nums):
=======
        try:
>>>>>>> 8290c2933a268a6770e7d3c51f3a649a57068eab
            residue = self.__residue_nums[self.__index]
            self.__index += 1
            return residue

<<<<<<< HEAD
        else:
            logging.debug('No more residues to query.')
            raise IndexError('No more residues to query.')
=======
        except IndexError:
            logging.debug('No more residues to query.')
>>>>>>> 8290c2933a268a6770e7d3c51f3a649a57068eab
