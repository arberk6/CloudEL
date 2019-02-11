using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEL.Views.ProfesoriView
{
    public partial class Profesori : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserID"] == null) Response.Redirect("~/Views/login.aspx");
        }
    }
}