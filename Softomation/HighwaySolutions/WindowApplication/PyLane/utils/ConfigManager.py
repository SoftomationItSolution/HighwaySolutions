import configparser
from utils.constants import get_absolute_file_path

class ConfigManager:
    def __init__(self, config_file):
        self.config = configparser.ConfigParser()
        self.config.read(config_file)

    def get_path(self, section, option):
        return get_absolute_file_path(self.config.get(section, option))

    def get_setting(self, section, option):
        return self.config.get(section, option)