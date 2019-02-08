using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Views
{
    public partial class Login : System.Web.UI.Page
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
            Session["User_Id"] = username.Text;
            //UseriMapper um = new UseriMapper(new Useri());
            return false;//um.Validate(email.Text, password.Text);
        }
    }
}