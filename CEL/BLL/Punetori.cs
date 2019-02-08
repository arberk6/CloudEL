using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace BLL
{
    public class Punetori
    {
        public int IDPunetori { get; set; }
        public string Emri { get; set; }
        public string Mbiemri { get; set; }
        public string Email { get; set; }
        public char Gjinia { get; set; }
        public int KrijuarNga { get; set; }
        public int ModifikuarNga { get; set; }
        public int Departamenti { get; set; }
        public string EmriDepartamentit { get; set; }
        public long IDLeternjoftimi { get; set; }
        public string Datlindja { get; set; }
        public int Mosha { get; set; }
        public int Adresa { get; set; }
        

        public Punetori() { }

        public override string ToString()
        {
            return Emri + " " + Mbiemri;
        }
        public override bool Equals(object obj)
        {
            return obj is Punetori && ((Punetori)obj).IDLeternjoftimi == IDLeternjoftimi;
        }

        public void Insert(Punetori p)
        {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("Punetoriinsert", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Emri", (p.Emri));
                cmd.Parameters.AddWithValue("@Mbiemri", (p.Mbiemri));
                cmd.Parameters.AddWithValue("@Email", (p.Email));
                cmd.Parameters.AddWithValue("@Gjinia", p.Gjinia);
                cmd.Parameters.AddWithValue("@adresa", p.Adresa);

                cmd.Parameters.AddWithValue("@Departamenti", p.Departamenti);
                cmd.Parameters.AddWithValue("@KrijuarNga", p.KrijuarNga);

                cmd.Parameters.AddWithValue("@IDLeternjoftimi", p.IDLeternjoftimi);
                cmd.Parameters.AddWithValue("@Datlindja", p.Datlindja);

                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void SelectByID(int ID)
        {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("PunetoriselectByID", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IDPunetori", ID);
                Punetori p = new Punetori();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    p.IDPunetori = (int)rdr["IDPunetori"];
                    p.Emri = ((string)rdr["Emri"]).ToString();
                    p.Mbiemri = ((string)rdr["Mbiemri"]).ToString();
                    p.Email = ((string)rdr["Email"]).ToString();
                    p.Gjinia = ((String)rdr["Gjinia"])[0];

                    if (rdr["KrijuarNga"] != DBNull.Value)
                        p.KrijuarNga = (int)rdr["KrijuarNga"];
                    if (rdr["ModifikuarNga"] != DBNull.Value)
                        p.ModifikuarNga = (int)rdr["ModifikuarNga"];
                    if (rdr["Departamenti"] != DBNull.Value)
                        p.Departamenti = (int)rdr["Departamenti"];
                    p.IDLeternjoftimi = (long)rdr["IDLeternjoftimi"];
                    p.Datlindja = rdr["Datlindja"].ToString().Split(' ')[0];
                    p.Mosha = DateTime.Now.Year - Convert.ToInt32(p.Datlindja.Split('/')[0]);
                    p.Adresa = (int)rdr["Adresa"];

                }
            }
            finally
            {
                con.Close();
            }
        }

        public void update(Punetori p )
        {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("Punetoriupdate", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@IDPunetori", p.IDPunetori);
                cmd.Parameters.AddWithValue("@Emri", (p.Emri));
                cmd.Parameters.AddWithValue("@Mbiemri", (p.Mbiemri));
                cmd.Parameters.AddWithValue("@Email", (p.Email));
                cmd.Parameters.AddWithValue("@Gjinia", p.Gjinia);
                cmd.Parameters.AddWithValue("@Adresa", p.Adresa);
                cmd.Parameters.AddWithValue("@IDLeternjoftimi", p.IDLeternjoftimi);
                cmd.Parameters.AddWithValue("@ModifikuarNga", p.ModifikuarNga);
                cmd.ExecuteNonQuery();
            }
            finally { con.Close(); }
        }
        public void delete(int id)
        {
            SqlConnection con = Generals.GetNewConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("PunetoriUpdateOnDelete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDPunetori", IDPunetori);
                cmd.ExecuteNonQuery();

                
            }
            finally
            {
                con.Close();
            }
        }
    }
}