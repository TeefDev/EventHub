using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EventHub
{
    public class CRUD
    {
        string cs = ConfigurationManager.ConnectionStrings["EventHubConnection"].ConnectionString;

        public DataTable getDataPassSql(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(mySql, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }

        public SqlDataReader getDrPassSql(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(mySql, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;
        }

        public int executeQuery(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(mySql, con);
            con.Open();
            int result = cmd.ExecuteNonQuery();
            con.Close();
            return result;
        }

        public object getSingleValue(string mySql)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(mySql, con);
            con.Open();
            object result = cmd.ExecuteScalar();
            con.Close();
            return result;
        }
    }
}