using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEL.Views.StudentiView
{
    public partial class KonfirmoKursi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserID"] == null || !Convert.ToString(Session["Privilegji"]).Equals("Student")) Response.Redirect("~/Views/login.aspx");
        }

        protected void AplikoButton_Click(object sender, EventArgs e)
        {
            int KursiID = Convert.ToInt32(Session["Kursi_ID_Per_Aplikim"]);
            String lenda = Session["Emri_Lendes"].ToString();
            String profesori = Session["Emri_Profes"].ToString();

            String EmriProfes = profesori.Split(' ')[0];
            String MbiemriProfes = profesori.Split(' ')[1];

            //Merre ID e profesorit ne baze te emrit
            BLL.Profesori p = new BLL.Profesori();
            BLL.Profesori p1 = p.ProfesoriSelectByEmriAndMbiemri(EmriProfes, MbiemriProfes);
            int ProfesoriID = p1.PersoniID;

            //Merre ID e lendes ne baze te emrit
            BLL.Kursi k = new BLL.Kursi();
            BLL.Kursi k1 = k.KursiSelectByEmri(lenda);
            int LendaID = k1.KursiID;

            //Merre tabelen profesori-kursi
            BLL.ProfesoriKursi pk = new BLL.ProfesoriKursi();
            BLL.ProfesoriKursi pk1 = pk.GetProfKursiIDByProfesoriIDAndKursiID(ProfesoriID, LendaID);
            int ProfesoriKursiID = pk1.ProfesoriKursiID;

            //Shto kerkesen ne tabelen Requests
            BLL.Request r = new BLL.Request();
            r.insertRequest(ProfesoriKursiID, Convert.ToInt32(Session["UserID"]));
        }

        protected void AnuloButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/StudentiView/ZgjedhKurset.aspx");
        }
    }
}