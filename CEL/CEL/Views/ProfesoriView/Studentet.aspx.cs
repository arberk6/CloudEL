using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace CEL.Views.ProfesoriView
{
    public partial class Studentet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showStudentet();
        }

        private void showStudentet()
        {
            //...
        }

        protected void ListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ListGridView.PageIndex = e.NewPageIndex;
        }

        protected void ListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Ndrysho") Response.Redirect("Ndrysho/NdryshoPunetori.aspx");
            else if (e.CommandName == "Fshij") Response.Redirect("Fshij/FshijPunetore.aspx");

        }

        protected void ListGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}