using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Management_V1._3.Views.HrPunetore
{
    public partial class index1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) placeShenimet();
        }

        private void placeShenimet()
        {
            //Merr nr e punetoreve
            List<Punetori> Punetoret = new List<Punetori>();
            PunetoretMapper pm = new PunetoretMapper(Punetoret);
            pm.SelectAllPunetoretBySearch("");
            PunetoretNrLabel.Text = Convert.ToString(Punetoret.Count());

            //Merr nr e departamenteve
            List<Departamenti> Departamentet = new List<Departamenti>();
            DepartamentetMapper dm = new DepartamentetMapper(Departamentet);
            dm.SelectAllDepartamentetBySearch("");
            DepartamentetNrLabel.Text = Convert.ToString(Departamentet.Count());

            //Merr nr e filialeve
            List<Filiali> Filialet = new List<Filiali>();
            FilialetMapper fm = new FilialetMapper(Filialet);
            fm.selectBySearch("");
            FilialetNrLabel.Text = Convert.ToString(Filialet.Count());
        }
    }
}