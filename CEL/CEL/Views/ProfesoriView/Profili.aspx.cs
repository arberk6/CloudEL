using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using DAL;

namespace CEL.Views.ProfesoriView
{
    public partial class Profili : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void mbushTeDhenat()
        {
            ProfesoriMapper pm = new ProfesoriMapper();
            List<String> lendet = pm.Profili(Convert.ToInt32(Session["UserID"]));

            foreach (String s in lendet)
            {
                HtmlGenericControl li = new HtmlGenericControl("li");
                li.InnerText = s;
                li.Attributes.Add("class", "list-group-item");
                list.Controls.Add(li);
            }
        }
    }
}