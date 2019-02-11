using DAL;
using BLL;
using System;
using System.Collections.Generic;

namespace CEL.Views.StudentiView
{
    public partial class ZgjedhKurset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || !Convert.ToString(Session["Privilegji"]).Equals("Student")) Response.Redirect("~/Views/login.aspx");
            else Kurset_List();
        }

        protected void Kurset_List()
        {
            //Shfaq requests qe ka bere studenti
            BLL.Studenti s = new BLL.Studenti();
            ListGridView.DataSource = s.GetRequestsForStudenti(Convert.ToInt32(Session["UserID"]));
            ListGridView.DataBind();
        }

        protected void Apliko_Click(object sender, EventArgs e)
        {
            Response.Redirect("AplikoPerKurse.aspx");
        }
    }
}