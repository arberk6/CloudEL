using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;

namespace DAL
{
    class KursiMapper
    {
        public Kursi GetKursiByProfesoriID(int profesori)
        {
            ProfesoriKursi k = new ProfesoriKursi();
            return k.GetKursiByProfesoriID(profesori);
        }
    }
}
