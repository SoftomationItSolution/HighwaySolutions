import pypyodbc as odbc

DRIVER_NAME = 'SQL SERVER'
SERVER_NAME = '93.127.198.13'
DATABASE_NAME = 'TMSv1'

Connection_String = f"""
    DRIVER={DRIVER_NAME};
    SERVER={SERVER_NAME};
    DATABASE={DATABASE_NAME};
    Trust_Connection=yes;
    uid={"softo"};
    pwd={"Softo@7890"};
"""

Connection = odbc.connect(Connection_String)
print("Connection established:", Connection)

Cursor = Connection.cursor()


def select_transactions():
    try:
        query = """SELECT TOP(50) FastagTransactionId, TransactionDateTime, LaneNumber,
                           LaneStatusId, LaneModeId, TagID, TID, PlateNumber, TagVehicleClassification
                   FROM tbl_FasTagTransactionProcess"""

        Cursor.execute(query)
        rows = Cursor.fetchall()
        return rows
        # transaction = {
        #         'FastagTransactionId': row[0],
        #         'TransactionDateTime': row[1],
        #         'LaneNumber': row[2],
        #         'LaneStatusId': row[3],
        #         'LaneModeId': row[4],
        #         'TagID': row[5],
        #         'TID': row[6],
        #         'PlateNumber': row[7],
        #         'TagVehicleClassification': row[8]
        #     }

    except odbc.Error as e:
        print("Error:", e)
        return None

    finally:
        Cursor.close()
        Connection.close()
