import logging


class NullValueError(TypeError):
    def __init__(self, class_name, param_name, message=None):
        if not message:
            self.message = f"Class {class_name}'s parameter {param_name} cannot be None"
        logging.debug(self.message)
        super().__init__(self.message)