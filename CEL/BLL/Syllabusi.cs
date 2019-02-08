using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Syllabusi : Default
    {
        public int SyllabusiID { get; set; }
        public double Kreditet { get; set; }
        public String Pershkrimi { get; set; }
        public String Literatura { get; set; }
        public String MetodaVleresimit { get; set; }
        public int NumriUshtrimeve { get; set; }
        public int NumriLigjeratave { get; set; }

        public Syllabusi() { }
        public Syllabusi SyllabusiSelectByID(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            Syllabusi syllabusi= null;
            try
            {
                SqlCommand cmd = new SqlCommand("SyllabusiSelectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@syllabusiid", id);

                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    syllabusi = new Syllabusi();
                    syllabusi.SyllabusiID = (int)rdr["SyllabusiID"];
                    syllabusi.Kreditet = (double)rdr["Kreditet"];
                    syllabusi.Pershkrimi = rdr["Pershkrimi"].ToString();
                    syllabusi.Literatura = rdr["Literatura"].ToString();
                    syllabusi.MetodaVleresimit = rdr["MetodaVleresimit"].ToString();
                    syllabusi.NumriUshtrimeve = (int)rdr["NumriUshtrimeve"];
                    syllabusi.NumriLigjeratave = (int)rdr["NumriLigjeratave"];
                    if (rdr["CreatedBy"] != DBNull.Value)
                        syllabusi.CreatedBy = (int)rdr["CreatedBy"];
                    if (rdr["CreatedDate"] != DBNull.Value)
                        syllabusi.CreatedDate = rdr["CreatedDate"].ToString();
                    if (rdr["ModifiedBy"] != DBNull.Value)
                        syllabusi.ModifiedBy = (int)rdr["ModifiedBy"];
                    if (rdr["ModifiedDate"] != DBNull.Value)
                        syllabusi.ModifiedDate = rdr["ModifiedDate"].ToString();
                }
            }
            finally
            {
                con.Close();
            }
            return syllabusi;

        }
    }
