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
    }
}
