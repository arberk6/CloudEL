using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Personi : Default
    {
        public int PersoniID { get; set; }
        public String Emri { get; set; }
        public String Mbiemri { get; set; }
        public Char Gjinia { get; set; }
        public String Email { get; set; }
        public int Mosha { get; set; }
        public String NrTelefonit { get; set; }
        public bool Aktiv { get; set; }

        public Personi()
        {

        }

        public Personi PersoniSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Personi personi = null;
            try
            {
                SqlCommand cmd = new SqlCommand("PersoniSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@personiid", id);

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    personi = new Personi();
                    personi.PersoniID = (int)rdr["PersoniID"];
                    personi.Emri = rdr["Emri"].ToString();
                    personi.Mbiemri = rdr["Mbiemri"].ToString();
                    personi.Email = rdr["Email"].ToString();
                    personi.Mosha = (int)rdr["Mosha"];
                    personi.NrTelefonit = rdr["NrTelefonit"].ToString();
                    personi.Gjinia = (char)rdr["Gjinia"];
                    if (rdr["CreatedBy"] != DBNull.Value)
                        personi.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        personi.CreatedDate = rdr["CreatedDate"].ToString();
                    if (rdr["ModifiedBy"] != DBNull.Value)
                        personi.ModifiedBy = (int)rdr["ModifiedBy"];
                    if (rdr["ModifiedDate"] != DBNull.Value)
                        personi.ModifiedDate = rdr["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return personi;
        }
    }
}
