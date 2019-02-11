using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Request
    {
        int requestid { get; set; }
        int ProfesoriKursi { get; set; }
        int studenti { get; set; }
        int CreatedBy { get; set; }
        String CreatedDate { get; set; }
        bool Aprovuar { get; set; }

        public List<Request> readAllRequest()
        {
            SqlConnection con = Generals.GetNewConnection();
            List<Request>requestlist= new List<Request>();
            try
            {
                SqlCommand cmd = new SqlCommand("readAllRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    Request request = new Request();
                    request.requestid = (int)rdr["requestid"];
                    request.ProfesoriKursi = (int)rdr["ProfesoriKursi"];
                    request.studenti = (int)rdr["studenti"];
                    request.Aprovuar = (bool)rdr["Aprovuar"];
                     if (rdr["CreatedBy"] != DBNull.Value)
                        request.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        request.CreatedDate = rdr["CreatedDate"].ToString();
                    requestlist.Add(request);
                }
            }
            finally
            {
                con.Close();
            }
            return requestlist;
        }

        public List<StudentiKerkesa> GetStudentsByProfesoriIDKursiID(int profesori, int kursi, String emriKursit)
        {
            SqlConnection con = Generals.GetNewConnection();
            List<StudentiKerkesa> studentet = new List<StudentiKerkesa>();
            
            try
            {
                SqlCommand cmd = new SqlCommand("GetStudentsByProfesoriID", con);
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
                    studenti.kursi = emriKursit;
                    studentet.Add(studenti);
                }
            }
            finally
            {
                con.Close();
            }
            return studentet;
        }

        public void UpdateStatusByProfesori(String status, int RequestID)
        {
            String procedure = "requestDeniedByProfesori";
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                if (status.Equals("approved")) procedure = "requestAprovedByProfesori";
                SqlCommand cmd = new SqlCommand(procedure, con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@requestid", RequestID);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void insertRequest(int ProfesoriKursiID, int StudentiID)
        {
            SqlConnection con = Generals.GetNewConnection();

            try
            {
                SqlCommand cmd = new SqlCommand("InsertRequest", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ProfesoriKursiID", ProfesoriKursiID);
                cmd.Parameters.AddWithValue("@StudentiID", StudentiID);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }
    }
}
