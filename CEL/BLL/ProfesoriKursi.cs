using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProfesoriKursi : Default
    {
        public int ProfesoriKursiID { get; set; }
        public int ProfesoriID { get; set; }
        public int KursiID { get; set; }
        public int SyllabusiID { get; set; }

        public List<Kursi> GetKursetByProfesoriID(int profesori)
        {
            SqlConnection con = Generals.GetNewConnection();
            List<Kursi> kurset = new List<Kursi>();
            try
            {
                SqlCommand cmd = new SqlCommand("GetKursiByProfesoriID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProfesoriID", profesori);
                SqlDataReader rdr = cmd.ExecuteReader();
                
                while (rdr.Read())
                {
                    Kursi kursi = new Kursi();
                    kursi.KursiID = (int)rdr["KursiID"];
                    kursi.Emri = rdr["Emri"].ToString();
                    kursi.Aktiv = rdr["Aktiv"].ToString().Equals("1");
                    if (rdr["CreatedBy"] != DBNull.Value)
                        kursi.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        kursi.CreatedDate = rdr["CreatedDate"].ToString();
                    if (rdr["ModifiedBy"] != DBNull.Value)
                        kursi.ModifiedBy = (int)rdr["ModifiedBy"];
                    if (rdr["ModifiedDate"] != DBNull.Value)
                        kursi.ModifiedDate = rdr["ModifiedDate"].ToString();
                    kurset.Add(kursi);
                }
            }
            finally
            {
                con.Close();
            }
            return kurset;
        }
    }
}
