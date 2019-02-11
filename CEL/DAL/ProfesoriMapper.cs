using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;

namespace DAL
{
    public class ProfesoriMapper
    {
        public List<StudentiKerkesa> showKerkesat(int profesori)
        {
            ProfesoriKursi pk = new ProfesoriKursi();
            List<Kursi> kurset = pk.GetKursetByProfesoriID(profesori);
            Request r = new Request();
            List<StudentiKerkesa> studentet = null;
            foreach (Kursi k in kurset)
            {
                studentet.AddRange(r.GetStudentsByProfesoriIDKursiID(profesori, k.KursiID, k.Emri));
            }

            return studentet;
        }
    }
}
