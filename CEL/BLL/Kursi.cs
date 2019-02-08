using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    class Kursi : Default
    {
        public int KursiID { get; set; }
        public int ProgramiID { get; set; }
        public String Emri { get; set; }
        public bool Aktiv { get; set; }
    }
}
