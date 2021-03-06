﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace CEL.Views.AdministratoriView
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                postData();
        }

        public void postData()
        {
            ListGridView.DataSource = new AdministratoriMapper().getRequests();
            ListGridView.DataBind();
        }

        protected void ListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Session["idPuna"] = Int32.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Aprovo")
            {
                Session["ProfesoriKursiID"] = Int32.Parse((e.CommandArgument.ToString()));
                new AdministratoriMapper().aproveRequest(Int32.Parse((e.CommandArgument.ToString())));
            }
            else if (e.CommandName == "Detajet")
            {
                Session["ProfesoriKursiID"] = Int32.Parse((e.CommandArgument.ToString()));
                Response.Redirect("KerkesaDetails.aspx");
            }
            else if (e.CommandName == "Refuzo")
            {
                new AdministratoriMapper().denyRequest(Int32.Parse((e.CommandArgument.ToString())));
                Response.Redirect("index.aspx");
            }

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