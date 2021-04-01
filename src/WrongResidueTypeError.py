import logging


class WrongResidueTypeError(TypeError):
    def __init__(self, res_num, message=None):
        if not message:
            self.message = f"Check your residue {res_num} value, it must be either positive int or string only;" \
                           f" string value must be a positive digit."
        logging.debug(self.message)
        super().__init__(self.message)
