using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace AzureConn
{

    public partial class Default : System.Web.UI.Page
    {
        public string fullAddress = "";
        public string cNameAddress = "";
        public string databaseName = "";
        public string userId = "";
        public string password = "";
        public string query = "SELECT so.name FROM sysobjects so WHERE so.xtype = 'U' ";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFullAddress.Text = fullAddress;
                txtCNameAddress.Text = cNameAddress;
                txtDatabaseName.Text = databaseName;
                txtUserId.Text = userId;
                txtPassword.Text = password;
                txtQuery.Text = query;
            }
        }

        protected void btnFullAddress_Click(object sender, EventArgs e)
        {
            Label1.Text = txtFullAddress.Text;
            txtResults.Text = Get_SQL_Data(Label1.Text, txtQuery.Text);
        }

        protected void btnCNameAddress_Click(object sender, EventArgs e)
        {
            Label1.Text = txtCNameAddress.Text;
            txtResults.Text = Get_SQL_Data(Label1.Text, txtQuery.Text);
        }



        private string Get_SQL_Data(string serverName, string queryString)
        {
            string outString = string.Empty;
            string sqlString = string.Empty;
            string query = queryString;

            if (txtPassword.Text.Length < 1) txtPassword.Text = "web";
            string password = ConfigurationManager.AppSettings[txtPassword.Text];
            bool contains = ("web,prod").IndexOf(txtPassword.Text, StringComparison.OrdinalIgnoreCase) >= 0;

            SqlConnectionStringBuilder sb = new SqlConnectionStringBuilder();
            sb.DataSource = serverName;
            sb.UserID = txtUserId.Text;
            sb.Password = contains ? password : txtPassword.Text;
            sb.InitialCatalog = txtDatabaseName.Text;
            SqlConnection cn = new SqlConnection(sb.ConnectionString);

            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = query;
            cmd.Connection = cn;

            try
            {
                SqlDataAdapter sqlda = new SqlDataAdapter(cmd);
                DataSet  ds = new DataSet();
                sqlda.Fill(ds, "author");
                DataTable dt = ds.Tables["author"];
                int r1 = dt.Rows.Count;

                bool isGood = (dt != null && dt.Rows.Count > 0) ? true : false;
                if (isGood)
                {
                    if (rdoTrue.Checked)
                        outString = Newtonsoft.Json.JsonConvert.SerializeObject(dt, Newtonsoft.Json.Formatting.Indented);
                    else
                        outString = Newtonsoft.Json.JsonConvert.SerializeObject(dt);
                }

                dt.Dispose();
            }
            catch (Exception ex)
            {
                outString = ex.Message;
            }
            return outString;
        }

    }

}