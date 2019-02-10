using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BLL;

namespace CEL.Views.ProfesoriView
{
    public partial class Kerkesat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            showKerkesat();
        }

        private void showKerkesat()
        {
            

            ProfesoriMapper pm = new ProfesoriMapper();
            
            ListGridView.DataSource = pm.showKerkesat(Convert.ToInt32(Session["UserID"]));
            ListGridView.DataBind();
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