
import os


def insert_data(self,file_path,file_type,file_name):
        try:
            table_name='tbl_VehicleStatusLog'
            file_name = os.path.basename(file_path)
            if self.engine:
                data = pd.read_csv(file_path, header=None, names=self.columns)
                data['FileName'] = file_name
                for chunk in pd.read_csv(file_path, header=None, names=self.columns, chunksize=self.chunk_size):
                    chunk.to_sql(table_name, con=self.engine, if_exists='append', index=False)
                    self.logger.logInfo(f"Inserted {len(chunk)} rows into {table_name}.")
                self.logger.logInfo("Data insertion completed successfully!")
                try:
                    self.dbConnectionObj.execute_stored_procedure("USP_ProcessBLTData",params=[file_type])
                    self.logger.logInfo("Data moved to main is successfully!")
                    os.remove(file_path)
                except Exception as e:
                    self.logger.logError(f"Error send update_request {file_name}: {e}")
                return True
            else:
                self.logger.logError("Data base not working!")
                return False
        except Exception as e:
            self.logger.logError(f"Error occurred during data insertion: {e}")
            return False    