﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace CEL.Views.StudentiView
{
    public partial class Student : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Profili_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Profili.aspx");
        }

        protected void Kurset_Click(object sender, EventArgs e)
        {
            Response.Redirect("/ZgjedhKurset.aspx");
        }
    }
}