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

        public DataTable GetRequestsForStudenti(int StudentiID)
        {
            SqlConnection con = Generals.GetNewConnection();

            try
            {
                SqlCommand cmd = new SqlCommand("SelectAllRequestsByStudentiID", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@StudentiID", StudentiID);

                SqlDataReader rdr = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Columns.Add("RequestCreatedDate");
                dt.Columns.Add("EmriProfes");
                dt.Columns.Add("EmriKursit");
                dt.Columns.Add("aprovuarNgaProfesori");
                dt.Columns.Add("aprovuarNgaAdministratori");

                while (rdr.Read())
                {
                    DataRow dr = dt.NewRow();

                    dr["RequestCreatedDate"] = rdr["RequestCreatedDate"]).ToString();
                    dr["EmriProfes"] = rdr["EmriProfes"].ToString() + " " + rdr["MbiemriProfes"].ToString();
                    dr["EmriKursit"] = rdr["EmriKursit"].ToString();
                    dr["aprovuarNgaProfesori"] = rdr["aprovuarNgaProfesori"].ToString();
                    dr["aprovuarNgaAdministratori"] = rdr["aprovuarNgaAdministratori"].ToString();

                    dt.Rows.Add(dr);
                }

                return dt;
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable GetAllKursetForStudenti(int StudentiID)
        {
            SqlConnection con = Generals.GetNewConnection();

            try
            {
                SqlCommand cmd = new SqlCommand("SelectAllKurset", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader rdr = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Columns.Add("EmriKursit");
                dt.Columns.Add("EmriProfes");
                dt.Columns.Add("Kreditet");
                dt.Columns.Add("NumriLigjeratave");
                dt.Columns.Add("NumriUshtrimeve");

                while (rdr.Read())
                {
                    DataRow dr = dt.NewRow();

                    dr["EmriKursit"] = rdr["EmriKursit"].ToString();
                    dr["EmriProfes"] = rdr["Emri"].ToString() + " " + rdr["Mbiemri"].ToString();
                    dr["Kreditet"] = (int)rdr["Kreditet"];
                    dr["NumriLigjeratave"] = (int)rdr["NumriLigjeratave"];
                    dr["NumriUshtrimeve"] = (int)rdr["NumriUshtrimeve"];

                    dt.Rows.Add(dr);
                }

                return dt;
            }
            finally
            {
                con.Close();
            }
        }

        public DataTable GetAllKursetByEmriKursit(String Emri)
        {
            SqlConnection con = Generals.GetNewConnection();

            try
            {
                SqlCommand cmd = new SqlCommand("selectProfesoriKursiByEmriKursit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Emri", Emri);

                SqlDataReader rdr = cmd.ExecuteReader();

                DataTable dt = new DataTable();
                dt.Columns.Add("EmriKursit");
                dt.Columns.Add("EmriProfes");
                dt.Columns.Add("Kreditet");
                dt.Columns.Add("NumriLigjeratave");
                dt.Columns.Add("NumriUshtrimeve");
                dt.Columns.Add("KursiID");

                while (rdr.Read())
                {
                    DataRow dr = dt.NewRow();

                    dr["EmriKursit"] = rdr["EmriKursit"].ToString();
                    dr["EmriProfes"] = rdr["Emri"].ToString() + " " + rdr["Mbiemri"].ToString();
                    dr["Kreditet"] = (int)rdr["Kreditet"];
                    dr["NumriLigjeratave"] = (int)rdr["NumriLigjeratave"];
                    dr["KursiID"] = (int)rdr["KursiID"];

                    dt.Rows.Add(dr);
                }

                return dt;
            }
            finally
            {
                con.Close();
            }
        }
    }
}
