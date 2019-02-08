using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace CEL.Views
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            if (!ValidateData())
            {
                alert.Style.Add("display", "block");
                return;
            }
            else
            {
                Response.Redirect("Studenti/Profili.aspx");
            }
        }

        public Boolean ValidateData()
        {
            //UseriMapper um = new UseriMapper(new Useri());
            return false;//um.Validate(email.Text, password.Text);
        }
    }
}