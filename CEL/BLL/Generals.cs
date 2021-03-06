﻿using System;
using System.Data.SqlClient;
using System.Configuration;

namespace BLL
{
    public static class Generals
    {
        static public SqlConnection GetNewConnection()
        {//simple factory pattern
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
