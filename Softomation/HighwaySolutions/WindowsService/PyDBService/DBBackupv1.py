import os
import platform
import sys
import time
from database.ms_sql import MSSQLConnectionManager
from utils.backup_scheduler import BackupScheduler
from utils.constants import Utilities
from utils.log_master import CustomLogger

class DBBackupv1:
    def __init__(self):
        self.PID_FILE = "DBBackupv1.pid"
        self.default_directory = self.check_default_dir()
        self.script_dir=os.path.dirname(os.path.abspath(__file__))
        self.logger = CustomLogger(self.default_directory, 'db_backup_app')
        self.bg_handler=None

    
    def check_default_dir(self):
        try:
            if platform.system() == 'Linux':
                default_directory = '/home/ProjectConfig/TMSv1/'
            else:
                default_directory = 'C:\\ProjectConfig\\TMSv1\\'
            if not os.path.exists(default_directory):
                os.makedirs(default_directory)
            return default_directory
        except Exception as e:
            print(str(e))

    def check_duplicate_instance(self):
        try:
            final_path = os.path.join(self.default_directory, self.PID_FILE)
            if os.path.isfile(final_path):
                with open(final_path, "r") as f:
                    pid = int(f.read().strip())
                    f.close()
                    if Utilities.pid_exists(pid):
                        Utilities.kill_process(pid)
                        with open(final_path, "w") as f:
                            f.write(str(os.getpid()))
                            f.close()
                    else:
                        with open(final_path, "w") as f:
                            f.write(str(os.getpid()))
                            f.close()
            else:
                with open(final_path, "w") as f:
                    f.write(str(os.getpid()))
                    f.close()
        except Exception as e:
            self.logger.logError(f"Exception check_duplicate_instance: {str(e)}")
    
    def start(self):
        try:
            db_path = os.path.join(self.default_directory, 'MasterConfig', 'NodeDBConfiguration.json')
            db_json_data = Utilities.read_json_file(db_path)
            dbConnectionObj = MSSQLConnectionManager(self.default_directory, server=db_json_data['server'],database=db_json_data['database'], username=db_json_data['user'], password=db_json_data['password'])
            self.bg_handler = BackupScheduler(self.default_directory, dbConnectionObj,self.logger)
            self.bg_handler.daemon = True
            self.bg_handler.start()
        except Exception as e:
            self.logger.logError(f"Exception in start: {str(e)}")

    def cleanup(self):
        try:
            if os.path.isfile(self.PID_FILE):
                os.remove(self.PID_FILE)
            if self.bg_handler is not None:
                self.bg_handler.on_stop()
                self.bg_handler.join()
        except Exception as e:
            self.logger.logError(f"Exception cleanup: {str(e)}")
        finally:
            sys.exit(0)

if __name__ == "__main__":
    backup_scheduler = DBBackupv1()
    backup_scheduler.start()
    while True:
        try:
            time.sleep(0.1)
        except KeyboardInterrupt:
            print('closed While')
            backup_scheduler.cleanup()
            sys.exit(0)