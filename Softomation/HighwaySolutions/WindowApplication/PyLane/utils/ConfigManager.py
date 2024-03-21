import configparser
from utils.constants import get_absolute_file_path

class ConfigManager:
    def __init__(self, config_file,script_dir):
        self.config = configparser.ConfigParser()
        self.config.read(config_file)
        self.script_dir=script_dir

    def get_path(self, section, option):
        return get_absolute_file_path(self.script_dir,self.config.get(section, option))

    def get_setting(self, section, option):
        return self.config.get(section, option)