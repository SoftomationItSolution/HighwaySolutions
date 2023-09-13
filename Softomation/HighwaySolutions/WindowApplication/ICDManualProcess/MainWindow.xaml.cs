using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Windows;


namespace ICDManualProcess
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private string Excel03ConString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        private string Excel07ConString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 8.0;HDR={1}'";
        public MainWindow()
        {
            InitializeComponent();
        }
        string conString, sheetName;
        private void BrowseButton_Click(Object sender, RoutedEventArgs e)
        {
            // Create OpenFileDialog
            Microsoft.Win32.OpenFileDialog openFileDlg = new Microsoft.Win32.OpenFileDialog();
            openFileDlg.DefaultExt = ".xlsx";
            openFileDlg.Filter = "Text documents (.xls)|*.xlsx";
            // Launch OpenFileDialog by calling ShowDialog method
            Nullable<bool> result = openFileDlg.ShowDialog();
            // Get the selected file name and display in a TextBox.
            // Load content of file in a TextBlock
            if (result == true)
            {
                FileNameTextBox.Text = openFileDlg.FileName;
                string extension = Path.GetExtension(openFileDlg.FileName);
                switch (extension)
                {
                    case ".xls":
                        conString = string.Format(Excel03ConString, openFileDlg.FileName, "YES");
                        break;
                    case ".xlsx":
                        conString = string.Format(Excel07ConString, openFileDlg.FileName, "YES");
                        break;
                }

                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    using (OleDbCommand cmd = new OleDbCommand())
                    {
                        try
                        {
                            cmd.Connection = con;
                            con.Open();
                            DataTable dt = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                            sheetName = dt.Rows[0]["Table_Name"].ToString();
                            con.Close();
                        }
                        catch (Exception ex)
                        {

                            MessageBox.Show(ex.Message.ToString());
                        }
                    }
                }
                using (OleDbConnection con = new OleDbConnection(conString))
                {
                    using (OleDbCommand cmd = new OleDbCommand())
                    {
                        OleDbDataAdapter oda = new OleDbDataAdapter();
                        cmd.CommandText = "SELECT * FROM [" + sheetName + "]";
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        oda.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        oda.Fill(dt);
                        con.Close();
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            if (dt.Columns.Count != 4)
                            {
                                MessageBox.Show("Column count is not corrent, please check file");
                                BrowseButton.IsEnabled = false;
                            }
                            else
                            {
                                if (dt.Columns[0].ToString() == "TagID" && dt.Columns[1].ToString() == "LaneID" && dt.Columns[2].ToString() == "Transactiondatetime" && dt.Columns[3].ToString() == "Tag Vehicle Classification")
                                {
                                    //dttagdata.DataSource = dt;
                                    //txtfilename.Text = filePath;
                                    //btninsert.Enabled = true;
                                    //lblstatus.Text = "Total records are -  " + Convert.ToString(dt.Rows.Count);
                                }
                                else
                                {
                                    MessageBox.Show("File is not proper, please check");
                                    BrowseButton.IsEnabled = false;
                                }
                            }

                        }
                        else
                        {
                            MessageBox.Show("No records, please check file");
                            BrowseButton.IsEnabled = false;
                        }

                    }
                }
            }
        }
    }
}
