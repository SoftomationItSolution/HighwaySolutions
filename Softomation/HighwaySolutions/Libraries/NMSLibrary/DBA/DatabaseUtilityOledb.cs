using System;
using System.Data;
using System.Data.OleDb;

namespace HighwaySoluations.Softomation.NMSSystemLibrary.DBA
{
    public class DatabaseUtilityOledb
    {
        public OleDbConnection con;
        DataTable dt;
        OleDbCommand comm;
        OleDbDataReader rd;
        OleDbDataAdapter da;

        public DatabaseUtilityOledb()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public OleDbConnection CreateConnection(string path)
        {
            string str = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + "; Extended Properties=\'Text;HDR=YES;\'";
            con = new OleDbConnection(str);
            return (con);
        }

        public OleDbConnection OpenConnection()
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            return (con);
        }
        public void CloseConnection()
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
        public OleDbDataReader GetDatareader(string Query, string filepath)
        {
            CreateConnection(filepath);
            OpenConnection();
            comm = new OleDbCommand(Query, con);
            rd = comm.ExecuteReader();
            return (rd);
        }
        public DataTable GetDatatable(string Query, string filepath)
        {
            CreateConnection(filepath);
            OpenConnection();
            dt = new DataTable();
            dt.Clear();
            da = new OleDbDataAdapter(Query, con);
            da.Fill(dt);
            CloseConnection();
            return (dt);
        }
        public int executeQuery(string Query, string filepath)
        {
            int result = 0;
            CreateConnection(filepath);
            OpenConnection();
            comm = new OleDbCommand(Query, con);
            result = comm.ExecuteNonQuery();
            CloseConnection();
            return (result);
        }
        public bool executeQuery(string Query, OleDbTransaction myTrans, OleDbConnection lcon, bool commit)
        {
            bool error = false;
            comm = new OleDbCommand();
            comm.Connection = lcon;
            comm.Transaction = myTrans;
            try
            {
                comm.CommandText = Query;
                comm.ExecuteNonQuery();
                if (commit)
                {
                    myTrans.Commit();
                    CloseConnection();
                }
            }
            catch (Exception ex)
            {
                error = true;
                myTrans.Rollback();
            }
            return (error);
        }
        public DataSet GetDataset(string Query, string table, string filepath)
        {
            DataSet ds = new DataSet();
            CreateConnection(filepath);
            OpenConnection();
            da = new OleDbDataAdapter(Query, con);
            int i = da.Fill(ds, table);
            return (ds);
        }
    }
}
