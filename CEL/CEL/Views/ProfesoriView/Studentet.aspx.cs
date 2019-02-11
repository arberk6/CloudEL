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
    public partial class Studentet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mbushDropDownList();
            showStudentet();
        }

        private void mbushDropDownList()
        {
            ProfesoriKursi pk = new ProfesoriKursi();
            List<Kursi> kurset = pk.GetKursetByProfesoriID(Convert.ToInt32(Session["UserID"]));

            foreach (Kursi kursi in kurset)
            {
                FilterKerkimiDropDown.Items.Add(kursi.Emri);
            }

        }

        private void showStudentet()
        {
            ProfesoriMapper pm = new ProfesoriMapper();

            ListGridView.DataSource = pm.ShowStudentet(Convert.ToInt32(Session["UserID"]));
            ListGridView.DataBind();
        }

        protected void ListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ListGridView.PageIndex = e.NewPageIndex;
        }
        
        protected void ListGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListGridView.DataSource = null;
            ListGridView.DataBind();

            String selectedValue = FilterKerkimiDropDown.SelectedValue;
            if (selectedValue.Equals("Te gjitha"))
            {
                showStudentet();
                return;
            }

            ProfesoriMapper pm = new ProfesoriMapper();

            ListGridView.DataSource = pm.ShowStudentetPerKurs(Convert.ToInt32(Session["UserID"]), selectedValue);
            ListGridView.DataBind();
        }
    }
}