import pypyodbc
import config
connection = None
# Return the sql connection 
def getConnection():
     connection = pypyodbc.connect("Driver= {"+config.DATABASE_CONFIG["Driver"]+"} ;Server=" + config.DATABASE_CONFIG["Server"] + ";Database=" + config.DATABASE_CONFIG["Database"] + ";uid=" + config.DATABASE_CONFIG["UID"] + ";pwd=" + config.DATABASE_CONFIG["Password"])
     return connection

def get_database_connection():
     conn = getConnection.connection
     if not conn:
          conn = getConnection.connection = getConnection.create_connection()
     return conn