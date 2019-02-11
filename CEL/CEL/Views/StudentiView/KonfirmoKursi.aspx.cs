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
            if (Session["UserID"] == null || !Convert.ToString(Session["Privilegji"]).Equals("Student")) Response.Redirect("~/Views/login.aspx");
        }

        protected void AplikoButton_Click(object sender, EventArgs e)
        {
            int KursiID = Convert.ToInt32(Session["Kursi_ID_Per_Aplikim"]);
            .......
        }

        protected void AnuloButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/StudentiView/ZgjedhKurset.aspx");
        }
    }
}