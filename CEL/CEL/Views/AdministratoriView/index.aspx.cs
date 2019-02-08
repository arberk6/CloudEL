using System;
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

        public void postData() {
            ListGridView.DataSource=new AdministratoriMapper().getAllRequest();
            ListGridView.DataBind();
        }

        protected void ListGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Session["idPuna"] = Int32.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Aprovo") {
                new AdministratoriMapper().aproveRequest(Int32.Parse(e.CommandArgument.ToString()));
            }
            
        }
    }
}