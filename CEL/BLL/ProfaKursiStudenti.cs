using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProfaKursiStudenti
    {
        public int profaKursiStudentiID { get; set; }
        public int profakursiID { get; set; }
        public int studentiID { get; set; }
        public int createdby { get; set; }
        public String createddate { get; set; }

        public List<StudentiKerkesa> GetStudentsByProfesoriKursi(int profesori, int kursi)
        {
            SqlConnection con = Generals.GetNewConnection();
            List<StudentiKerkesa> studentet = new List<StudentiKerkesa>();

            try
            {
                SqlCommand cmd = new SqlCommand("GetStudentsByProfesoriKursi", con);
                cmd.Parameters.AddWithValue("@Profesoriid", profesori);
                cmd.Parameters.AddWithValue("@kursiid", kursi);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    StudentiKerkesa studenti = new StudentiKerkesa();
                    string vitiakademik = rdr["VitiAkademik"].ToString();
                    studenti.kerkesaID = (int)rdr["requestid"];
                    studenti.PersoniID = (int)rdr["PersoniID"];
                    studenti.Emri = rdr["Emri"].ToString();
                    studenti.Mbiemri = rdr["Mbiemri"].ToString();
                    studenti.Email = rdr["Email"].ToString();
                    studenti.Mosha = (int)rdr["Mosha"];
                    studenti.NrTelefonit = rdr["NrTelefonit"].ToString();
                    studenti.Gjinia = (char)rdr["Gjinia"];
                    if (rdr["CreatedBy"] != DBNull.Value)
                        studenti.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        studenti.CreatedDate = rdr["CreatedDate"].ToString();
                    if (rdr["ModifiedBy"] != DBNull.Value)
                        studenti.ModifiedBy = (int)rdr["ModifiedBy"];
                    if (rdr["ModifiedDate"] != DBNull.Value)
                        studenti.ModifiedDate = rdr["ModifiedDate"].ToString();
                    studenti.kursi = rdr["EmriKursit"].ToString();
                    studentet.Add(studenti);
                }
            }
            finally
            {
                con.Close();
            }
            return studentet;
        }
    }
}
