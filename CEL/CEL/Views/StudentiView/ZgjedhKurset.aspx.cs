using DAL;
using System;
using System.Collections.Generic;

namespace CEL.Views.Studenti
{
    public partial class ZgjedhKurset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Personi_ID"] == null) Response.Redirect("~/Views/login.aspx");

            //StudentiMapper sm = new StudentiMapper(Convert.ToInt32(Session["Personi_ID"]));
            //List <String> listaEKerkesaveTeProfesoreve = sm.GetRequest();

            //List<String> listaELendeve = new List<String>();
            //List<String> listaEProfesoreve = new List<String>();

            //for (int i = 0; i < listaEKerkesaveTeProfesoreve.Count-2; i+=2)
            //{
            //    listaEProfesoreve.Add(listaEKerkesaveTeProfesoreve[i]);
            //    listaELendeve.Add(listaEKerkesaveTeProfesoreve[i+1]);
            //}

            //Profesori.DataSource = listaEProfesoreve;
            //Profesori.DataBind();
            //Lenda.DataSource = listaELendeve;
            //Lenda.DataBind();
        }

        protected void Apliko_Click(object sender, EventArgs e)
        {
            //int lendazgjedhur = Convert.ToInt32(Lenda.SelectedValue);
            //int Profesorizgjedhur = Convert.ToInt32(Profesori.SelectedValue);
            //int Personi_ID = Convert.ToInt32(Session["Personi_ID"]);

            //StudentiMapper sm = new StudentiMapper(Personi_ID);
            //sm.makeRequest(Personi_ID, Profesorizgjedhur, lendazgjedhur);
        }
    }
}