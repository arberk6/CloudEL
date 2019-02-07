using System;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public static class Generals
    {
        static public SqlConnection GetNewConnection()
        {
            string conStr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

            SqlConnection con = new SqlConnection(conStr);
            try
            {
                con.Open();
                return con;
            }
            catch (Exception ex)
            {
                con.Close();
                throw new Exception("Lidhja me Databazen nuk mund te realizohet");
            }
        }
    }
}
