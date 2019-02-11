using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace CEL.Views.AdministratoriView
{
    public partial class KerkesaDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                placeShenimet();
        }

        private void placeShenimet()
        {
            ListGridView.DataSource = new AdministratoriMapper().getRequestsByProfesoriKursi(Int32.Parse(Session["ProfesoriKursiID"].ToString()));
            ListGridView.DataBind();
        }

        protected void ListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Aprovo")
            {
                new AdministratoriMapper().aproveRequestForStudent(Int32.Parse(e.CommandArgument.ToString()), Int32.Parse(Session["ProfesoriKursiID"].ToString()));

            }
            else if (e.CommandName == "Refuzo")
            {
                new AdministratoriMapper().denyRequestForStudent(Int32.Parse(e.CommandArgument.ToString()), Int32.Parse(Session["ProfesoriKursiID"].ToString()));
            }
            Response.Redirect("KerkesaDetails.aspx");
        }

        protected void ListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ListGridView.PageIndex = e.NewPageIndex;
        }
        protected void ListGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
        }
    }
}