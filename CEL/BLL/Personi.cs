using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Personi : Default
    {
        public int PersoniID { get; set; }
        public String Emri { get; set; }
        public String Mbiemri { get; set; }
        public Char Gjinia { get; set; }
        public String Email { get; set; }
        public int Mosha { get; set; }
        public String Nr_Telefonit { get; set; }
        public bool Aktiv { get; set; }
    }
}
