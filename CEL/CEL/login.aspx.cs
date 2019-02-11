using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DAL;
using System.Web.UI.WebControls;


namespace CEL.Views
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Personi_ID"] == null) Response.Redirect("~/Views/login.aspx");
            else MbushTeDhenat();
        }

        protected void Login(object sender, EventArgs e)
        {
            string[] validate = ValidateData();
            if (validate == null)
            {
                alert.Style.Add("display", "block");
                return;
            }

            Session["UserID"] = validate[0];
            Session["Privilegji"] = validate[3];

            if (validate[3] == "Student")
            {
                Response.Redirect("StudentiView/Profili.aspx");
            }
            else if (validate[3] == "Profesor")
            {
                Response.Redirect("ProfesoriView/Profili.aspx");
            }
            else if (validate[3] == "Admin")
            {
                Response.Redirect("~/Views/AdministratoriView/index.aspx");
            }
        }

        /// <summary>
        /// check database for username and match with the password
        /// and fill Session id user logs in
        /// </summary>
        /// <returns>
        /// if they dont match:  -1
        /// if they match: int userid
        /// </returns>
        public string[] ValidateData()
        {
            return new UseriMapper().Validate(email.Text, password.Text);
        }
    }
}