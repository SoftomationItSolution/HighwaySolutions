def UserDetailsGetByLoginId(LoginId,db):
    params=[LoginId]
    return db.execute_procedure('USP_UsersGetByLoginId', params)

def getShiftDetails(db):
    return db.execute_procedure('USP_ShiftTiminingGetAll', None)