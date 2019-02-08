using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Syllabusi : Default
    {
        public int SyllabusiID { get; set; }
        public double Kreditet { get; set; }
        public String Pershkrimi { get; set; }
        public String Literatura { get; set; }
        public String MetodaVleresimit { get; set; }
        public int NumriUshtrimeve { get; set; }
        public int NumriLigjeratave { get; set; }
    }
}
