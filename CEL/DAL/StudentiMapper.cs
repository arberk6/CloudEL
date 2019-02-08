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

        public StudentiMapper(int Studenti_ID)
        {
            this.s.PersoniID = Studenti_ID;
        }

        public void makeRequest(int studentiid, int profesoriId, int lendaID) {
            ProfesoriKursi pk = new ProfesoriKursi();
            pk.Insert(studentiid, profesoriId, lendaID);
        }

        public List<String> GetRequest()
        {
            Studenti s = Studenti();
            return s.GetRequestsForStudenti(s.PersoniID);
        }
    }
}
