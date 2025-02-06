import os
import logging
from logging.handlers import RotatingFileHandler
from datetime import datetime, timedelta

class CustomLogger:
    def __init__(self, log_dir, log_file_name, log_file_size=10 * 1024 * 1024, backup_duration_days=7):
        self.log_folder = "logs"
        self.log_dir = log_dir
        self.log_file_folder = log_file_name
        self.log_file_name = log_file_name + '.log'
        self.log_file_size = log_file_size
        self.backup_duration_days = backup_duration_days
        self.logger = logging.getLogger(log_file_name)
        self.logger.setLevel(logging.INFO)
        self.current_date = datetime.now().strftime("%Y-%m-%d")
        self.setup_logger()

    def setup_logger(self):
        try:
            log_formatter = logging.Formatter('%(asctime)s %(message)s')
            log_directory = self.get_log_directory()
            os.makedirs(log_directory, exist_ok=True)
            log_file_path = os.path.join(log_directory, self.log_file_name)

            file_handler = RotatingFileHandler(log_file_path, mode='a', maxBytes=self.log_file_size,
                                               backupCount=0, encoding=None, delay=0)
            file_handler.setFormatter(log_formatter)
            file_handler.setLevel(logging.INFO)
            self.logger.addHandler(file_handler)

            self.remove_old_log_files(log_directory)

        except Exception as e:
            self.logger.error(f"Error setting up logger: {e}")

    def get_log_directory(self):
        today_date = datetime.now().strftime("%Y-%m-%d")
        return os.path.join(self.log_dir, self.log_folder, today_date, self.log_file_folder)

    def should_rotate_log(self):
        return self.current_date != datetime.now().strftime("%Y-%m-%d")

    def rotate_log(self):
        self.current_date = datetime.now().strftime("%Y-%m-%d")
        for handler in self.logger.handlers[:]:
            self.logger.removeHandler(handler)
            handler.close()
        self.setup_logger()

    def remove_old_log_files(self, log_directory):
        try:
            today = datetime.today()
            for filename in os.listdir(log_directory):
                file_path = os.path.join(log_directory, filename)
                if os.path.isfile(file_path):
                    file_date = datetime.fromtimestamp(os.path.getctime(file_path))
                    if (today - file_date) > timedelta(days=self.backup_duration_days):
                        os.remove(file_path)
        except Exception as e:
            self.logger.error(f"Error removing old log files: {e}")

    def logInfo(self, message):
        if self.should_rotate_log():
            self.rotate_log()
        self.logger.info(message)

    def logError(self, message):
        if self.should_rotate_log():
            self.rotate_log()
        self.logger.error(message)
