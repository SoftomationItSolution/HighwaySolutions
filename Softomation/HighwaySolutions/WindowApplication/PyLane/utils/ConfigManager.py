import configparser

from utils.constants import Utilities


class ConfigManager:
    def __init__(self, config_file,script_dir):
        self.config = configparser.ConfigParser()
        self.config.read(config_file)
        self.script_dir=script_dir

    def get_path(self, section, option):
        return Utilities.get_absolute_file_path(self.script_dir,self.config.get(section, option))

    def get_setting(self, section, option):
        return self.config.get(section, option)