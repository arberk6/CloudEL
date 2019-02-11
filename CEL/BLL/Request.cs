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
        string aprovuarNgaAdministratori { get; set; }
        string aprovuarNgaProfesori { get; set; }

        public List<Request> readAllRequest()
        {
            SqlConnection con = Generals.GetNewConnection();
            List<Request> requestlist = new List<Request>();
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
                    request.aprovuarNgaAdministratori = rdr["aprovuarNgaAdministratori"].ToString();
                    request.aprovuarNgaProfesori = rdr["aprovuarNgaProfesori"].ToString();
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

        public DataTable readRequests()
        {
            SqlConnection con = Generals.GetNewConnection();

            DataTable dt = null;
            try
            {
                SqlCommand cmd = new SqlCommand("readRequests", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();
                dt = new DataTable();
                dt.Columns.Add("ProfesoriKursiID");
                dt.Columns.Add("Profesori");
                dt.Columns.Add("Kursi");
                dt.Columns.Add("Numri");
                while (rdr.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["ProfesoriKursiID"] = (int)rdr["ProfesoriKursiID"];
                    dr["Profesori"] = rdr["Profesori"].ToString();
                    dr["Kursi"] = rdr["Kursi"].ToString();
                    dr["Numri"] = rdr["Numri"].ToString();
                    dt.Rows.Add(dr);
                }
            }
            finally
            {
                con.Close();
            }
            return dt;
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

        public void denyRequest(int ProfesoriKursiid) {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("denyRequestsByAdministratoriOnAll", con);
                cmd.Parameters.AddWithValue("@ProfesoriKursiid", ProfesoriKursiid);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }
        public DataTable getRequestsByProfesoriKursi(int ProfesoriKursiid)
        {
            SqlConnection con = Generals.GetNewConnection();
            DataTable dt = null;
            try
            {
                SqlCommand cmd = new SqlCommand("getRequestsByProfesoriKursi", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProfesoriKursiid", ProfesoriKursiid);

                SqlDataReader rdr = cmd.ExecuteReader();
                dt = new DataTable();
                dt.Columns.Add("RequestID");
                dt.Columns.Add("StudentiID");
                dt.Columns.Add("Emri");
                dt.Columns.Add("Mbiemri");
                dt.Columns.Add("Programi");
                while (rdr.Read())
                {
                    DataRow dr = dt.NewRow();
                    dr["RequestID"] = (int)rdr["RequestID"];
                    dr["StudentiID"] = (int)rdr["StudentiID"];
                    dr["Emri"] = rdr["Emri"].ToString();
                    dr["Mbiemri"] = rdr["Mbiemri"].ToString();
                    dr["Programi"] = rdr["Programi"].ToString();
                    dt.Rows.Add(dr);
                }
            }
            finally
            {
                con.Close();
            }
            return dt;
        }

        public void aproveRequestForStudent(int studentiID, int profesoriKursi) {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("aproveRequestForStudent", con);
                cmd.Parameters.AddWithValue("@studentiID", studentiID);
                cmd.Parameters.AddWithValue("@profesoriKursi", profesoriKursi);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }
        public void denyRequestForStudent(int studentiID, int profesoriKursi)
        {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("denyRequestForStudent", con);
                cmd.Parameters.AddWithValue("@studentiID", studentiID);
                cmd.Parameters.AddWithValue("@profesoriKursi", profesoriKursi);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }
    }
}
