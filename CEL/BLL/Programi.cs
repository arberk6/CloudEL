using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Programi : Default
    {
        public int ProgramiID { get; set; }
        public String Emri { get; set; }
        public bool Aktiv { get; set; }

        public Programi() { }

        public Programi ProgramiSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Programi programi = null;
            try
            {
                SqlCommand cmd = new SqlCommand("ProgramiSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ProgramiID", id);

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    programi = new Programi();
                    programi.ProgramiID = (int)rdr["ProgramiID"];
                    programi.Emri = rdr["Emri"].ToString();
                    programi.Aktiv = rdr["Mbiemri"].ToString();
                    if (rdr["CreatedBy"] != DBNull.Value)
                        programi.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        programi.CreatedDate = rdr["CreatedDate"].ToString();
                    if (rdr["ModifiedBy"] != DBNull.Value)
                        programi.ModifiedBy = (int)rdr["ModifiedBy"];
                    if (rdr["ModifiedDate"] != DBNull.Value)
                        programi.ModifiedDate = rdr["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return studenti;
        }
    }
}
