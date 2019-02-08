using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Studenti : Personi
    {
        public String VitiAkademik { get; set; }

        public Studenti()
        {
        
        }

        public Studenti StudentiSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Studenti studenti = null;
            try
            {
                SqlCommand cmd = new SqlCommand("StudentiSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@StudentiID", id);

                SqlDataReader rdr = cmd.ExecuteReader();

                SqlCommand cmdpersoni = new SqlCommand("PersoniSelectByID", con);
                cmdpersoni.CommandType = CommandType.StoredProcedure;
                cmdpersoni.Parameters.AddWithValue("@personiID", id);
                SqlDataReader rdrpersoni = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    studenti = new Studenti();
                    string vitiakademik= rdr["VitiAkademik"].ToString();
                    studenti.PersoniID = (int)rdrpersoni["PersoniID"];
                    studenti.Emri = rdrpersoni["Emri"].ToString();
                    studenti.Mbiemri = rdrpersoni["Mbiemri"].ToString();
                    studenti.Email = rdrpersoni["Email"].ToString();
                    studenti.Mosha = (int)rdrpersoni["Mosha"];
                    studenti.NrTelefonit = rdrpersoni["NrTelefonit"].ToString();
                    studenti.Gjinia = (char)rdrpersoni["Gjinia"];
                    if (rdrpersoni["CreatedBy"] != DBNull.Value)
                        studenti.CreatedBy = (int)rdrpersoni["CreatedBy"];
                    if (rdrpersoni["CreatedDate"] != DBNull.Value)
                        studenti.CreatedDate = rdrpersoni["CreatedDate"].ToString();
                    if (rdrpersoni["ModifiedBy"] != DBNull.Value)
                        studenti.ModifiedBy = (int)rdrpersoni["ModifiedBy"];
                    if (rdrpersoni["ModifiedDate"] != DBNull.Value)
                        studenti.ModifiedDate = rdrpersoni["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return studenti;
        }

        public List<ProfesoriKursi> StudentiGetRequests(int id)
        {
            SqlConnection con = Generals.GetNewConnection();

            List<ProfesoriKursi> kurset = new List<ProfesoriKursi>();
            try
            {
                SqlCommand cmd = new SqlCommand("MakeRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                SqlCommand cmdpersoni = new SqlCommand("getKurset", con);
                cmdpersoni.CommandType = CommandType.StoredProcedure;
                SqlDataReader rdrpersoni = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    ProfesoriKursi ProfesoriKursi = new ProfesoriKursi();
                    ProfesoriKursi.ProfesoriKursiID = (int)rdrpersoni["ProfesoriKursiID"];
                    ProfesoriKursi.ProfesoriID = (int)rdrpersoni["ProfesoriID"];
                    ProfesoriKursi.KursiID = (int)rdrpersoni["KursiID"];

                    kurset.Add(ProfesoriKursi);
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
