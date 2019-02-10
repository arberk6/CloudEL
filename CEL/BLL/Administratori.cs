using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Administratori : Personi
    {

        public Administratori() { }

        public Administratori AdministratoriSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Administratori administratori = null;
            try
            {
                SqlCommand cmd = new SqlCommand("AdministratoriSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@AdministratoriID", id);

                SqlDataReader rdr = cmd.ExecuteReader();

                SqlCommand cmdpersoni = new SqlCommand("PersoniSelectByID", con);
                cmdpersoni.CommandType = CommandType.StoredProcedure;
                cmdpersoni.Parameters.AddWithValue("@personiID", id);
                SqlDataReader rdrpersoni = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    administratori = new Administratori();
                    administratori.PersoniID = (int)rdrpersoni["PersoniID"];
                    administratori.Emri = rdrpersoni["Emri"].ToString();
                    administratori.Mbiemri = rdrpersoni["Mbiemri"].ToString();
                    administratori.Email = rdrpersoni["Email"].ToString();
                    administratori.Mosha= (int)rdrpersoni["Mosha"];
                    administratori.NrTelefonit= rdrpersoni["NrTelefonit"].ToString();
                    administratori.Aktiv= (bool)rdrpersoni["Aktiv"];
                    administratori.Mbiemri = rdrpersoni["Mbiemri"].ToString();
                    if (rdrpersoni["CreatedBy"] != DBNull.Value)
                        administratori.CreatedBy = (int)rdrpersoni["CreatedBy"];
                    if (rdrpersoni["CreatedDate"] != DBNull.Value)
                        administratori.CreatedDate = rdrpersoni["CreatedDate"].ToString();
                    if (rdrpersoni["ModifiedBy"] != DBNull.Value)
                        administratori.ModifiedBy = (int)rdrpersoni["ModifiedBy"];
                    if (rdrpersoni["ModifiedDate"] != DBNull.Value)
                        administratori.ModifiedDate = rdrpersoni["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return administratori;
        }
        public void Aprovo(int idkerkesa)
        {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("requestUpdateByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@requestid", idkerkesa);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
            
        }
    }
}
