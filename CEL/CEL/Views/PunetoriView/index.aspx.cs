using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Management_V1._3.Views.PunetoriView
{
    public partial class index1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) placeShenimet();
        }

        private void placeShenimet()
        {
            new PunetoriMapper().SelectByID(5);

        }


    }
}