using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Useri : Default
    {
        public int UseriID { get; set; }
        public int PersoniID { get; set; }
        public string Username { get; set; }
        public string Passwordi { get; set; }
        public int Prioriteti { get; set; }

        public Useri() { }

        public Useri UseriSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Useri useri = null;
            try
            {
                SqlCommand cmd = new SqlCommand("UseriSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UseriID", id);

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    useri = new Useri();
                    useri.UseriID = (int)rdr["UseriID"];
                    useri.Username = rdr["Username"].ToString();
                    useri.Passwordi = rdr["Passwordi"].ToString();
                    useri.Prioriteti = (int)rdr["Prioriteti"];
                    useri.PersoniID = (int)rdr["PersoniID"];
                    if (rdr["CreatedBy"] != DBNull.Value)
                        useri.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        useri.CreatedDate = rdr["CreatedDate"].ToString();
                    if (rdr["ModifiedBy"] != DBNull.Value)
                        useri.ModifiedBy = (int)rdr["ModifiedBy"];
                    if (rdr["ModifiedDate"] != DBNull.Value)
                        useri.ModifiedDate = rdr["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return useri;
        }

        public InternalUser UseriSelectByEmail(string email)
        {
            SqlConnection con = Generals.GetNewConnection();
            InternalUser user = null;
            try
            {
                SqlCommand cmd = new SqlCommand("UseriSelectByEmail", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UseriID", email);

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    user.email=rdr["email"].ToString();
                    user.password = rdr["Passwordi"].ToString();
                    user.id=(int)rdr["personiid"];
                    user.role= rdr["Roli"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return user;
        }
    }

    public class InternalUser {
        public string email { get; set; }
        public string password { get; set; }
        public int id{ get; set; }
        public string role{ get; set; }

        public InternalUser() { }
    }
}
