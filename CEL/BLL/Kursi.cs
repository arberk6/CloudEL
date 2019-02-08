using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Kursi : Default
    {
        public int KursiID { get; set; }
        public int ProgramiID { get; set; }
        public String Emri { get; set; }
        public bool Aktiv { get; set; }

        public Kursi() { }

        public Kursi KursiSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Kursi kursi= null;
            try
            {
                SqlCommand cmd = new SqlCommand("KursiSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@KursiID", id);

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    kursi = new Kursi();
                    kursi.KursiID = (int)rdr["KursiID"];
                    kursi.ProgramiID = (int)rdr["ProgramiID"];
                    kursi.Emri = rdr["Emri"].ToString();
                    kursi.Aktiv = (bool)rdr["Emri"];
                    if (rdr["CreatedBy"] != DBNull.Value)
                        kursi.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        kursi.CreatedDate = rdr["CreatedDate"].ToString();
                    if (rdr["ModifiedBy"] != DBNull.Value)
                        kursi.ModifiedBy = (int)rdr["ModifiedBy"];
                    if (rdr["ModifiedDate"] != DBNull.Value)
                        kursi.ModifiedDate = rdr["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return kursi;
        }
    }
}
