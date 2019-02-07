using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class ProfesoriKursi : Default
    {
        public int ProfesoriKursiID { get; set; }
        public int ProfesoriID { get; set; }
        public int KursiID { get; set; }
        public int SyllabusiID { get; set; }
    }
}
