using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEL.Views.Studenti
{
    public partial class ZgjedhKurset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Personi_ID"] == null) Response.Redirect("~/Views/login.aspx");
        }

        protected void Apliko_Click(object sender, EventArgs e)
        {
            StudentiMapper sm = new StudentiMapper();

        }
    }
}