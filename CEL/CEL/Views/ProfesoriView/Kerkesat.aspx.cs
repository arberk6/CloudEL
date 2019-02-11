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
            mbushDropDownList();
            ShowKerkesat();
        }

        private void mbushDropDownList()
        {
            ProfesoriKursi pk = new ProfesoriKursi();
            List<Kursi> kurset = pk.GetKursetByProfesoriID(Convert.ToInt32(Session["UserID"]));

            foreach(Kursi kursi in kurset)
            {
                FilterKerkimiDropDown.Items.Add(kursi.Emri);
            }

        }

        private void ShowKerkesat()
        {
            ProfesoriMapper pm = new ProfesoriMapper();
            
            ListGridView.DataSource = pm.ShowKerkesat(Convert.ToInt32(Session["UserID"]));
            ListGridView.DataBind();
        }

        protected void ListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ListGridView.PageIndex = e.NewPageIndex;
        }

        protected void ListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Request r = new Request();

            if (e.CommandName == "Prano") r.UpdateStatusByProfesori("approved", Convert.ToInt32(e.CommandArgument.ToString()));
            else if (e.CommandName == "Fshij") r.UpdateStatusByProfesori("approved", Convert.ToInt32(e.CommandArgument.ToString()));

        }

        protected void ListGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListGridView.DataSource = null;
            ListGridView.DataBind();

            String selectedValue = FilterKerkimiDropDown.SelectedValue;
            if(selectedValue.Equals("Te gjitha"))
            {
                ShowKerkesat();
                return;
            }

            ProfesoriMapper pm = new ProfesoriMapper();

            ListGridView.DataSource = pm.ShowKerkesatPerKurs(Convert.ToInt32(Session["UserID"]), selectedValue);
            ListGridView.DataBind();
        }

    }
}