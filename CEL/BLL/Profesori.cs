using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Profesori : Personi
    {
        public String TitulliAkademik { get; set; }

        public Profesori()
        {
            
        }

        public Profesori ProfesoriSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Profesori profesori = null;
            try
            {
                SqlCommand cmd = new SqlCommand("ProfesoriSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProfesoriID", id);
                SqlDataReader rdr = cmd.ExecuteReader();

                SqlCommand cmdpersoni = new SqlCommand("PersoniSelectByID", con);
                cmdpersoni.CommandType = CommandType.StoredProcedure;
                cmdpersoni.Parameters.AddWithValue("@personiID", id);
                SqlDataReader rdrpersoni = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    profesori = new Profesori();
                    profesori.TitulliAkademik= rdr["TitulliAkademik"].ToString();
                    profesori.PersoniID = (int)rdrpersoni["PersoniID"];
                    profesori.Emri = rdrpersoni["Emri"].ToString();
                    profesori.Mbiemri = rdrpersoni["Mbiemri"].ToString();
                    profesori.Email = rdrpersoni["Email"].ToString();
                    profesori.Mosha = (int)rdrpersoni["Mosha"];
                    profesori.NrTelefonit = rdrpersoni["NrTelefonit"].ToString();
                    profesori.Gjinia = (char)rdrpersoni["Gjinia"];
                    if (rdrpersoni["CreatedBy"] != DBNull.Value)
                        profesori.CreatedBy = (int)rdrpersoni["CreatedBy"];
                    if (rdrpersoni["CreatedDate"] != DBNull.Value)
                        profesori.CreatedDate = rdrpersoni["CreatedDate"].ToString();
                    if (rdrpersoni["ModifiedBy"] != DBNull.Value)
                        profesori.ModifiedBy = (int)rdrpersoni["ModifiedBy"];
                    if (rdrpersoni["ModifiedDate"] != DBNull.Value)
                        profesori.ModifiedDate = rdrpersoni["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return profesori;
        }
    }
}
