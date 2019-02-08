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
        private Studenti s = null;

        public void makeRequest(int studentiid, int profesorikursiid) {
            s = new Studenti();
            s.PersoniID = studentiid;

            //s.MakeRequest(profesorikursiid, s.PersoniID);
        }
    }
}
