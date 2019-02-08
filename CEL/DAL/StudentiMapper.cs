using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BLL;

namespace DAL
  
{
    public class StudentiMapper
    {
        private Studenti s = new Studenti();

        public void StudentiMakeRequest()
        {
            Studenti s = new Studenti();
            s.StudentiSelectByID();
        }

    }
}