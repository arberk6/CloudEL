using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEL.Views.StudentiView
{
    public partial class AplikoPerKurse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserID"] == null || !Convert.ToString(Session["Privilegji"]).Equals("Student")) Response.Redirect("~/Views/login.aspx");
            //else
                ShfaqKurset();
        }

        protected void ShfaqKurset()
        {
            //Shfaq te gjitha kurset e vlefshme
            BLL.Studenti s = new BLL.Studenti();
            ListGridView.DataSource = s.GetAllKursetForStudenti(Convert.ToInt32(Session["UserID"]));
            ListGridView.DataBind();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            //Shfaq te gjitha kurset e vlefshme ne baze te emrit
            BLL.Studenti s = new BLL.Studenti();
            ListGridView.DataSource = s.GetAllKursetByEmriKursit(SearchTextBox.Text);
            ListGridView.DataBind();
        }

        protected void ListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            int indexIRreshtit = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = ListGridView.Rows[indexIRreshtit];

            Session["Kursi_ID_Per_Aplikim"] = Convert.ToInt32(e.CommandArgument.ToString());
            Session["Emri_Lendes"] = selectedRow.Cells[0].Text; //Emri i lendes
            Session["Emri_Profes"] = selectedRow.Cells[1].Text; //Emri i profes

            Response.Redirect("KonfirmoKursi.aspx");
        }
    }
}