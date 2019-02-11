using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{//objekt per me bashku tdhanat e studen qe pom duhet per ni list
    public class StudentiKerkesa : Studenti
    {
        public String kursi { get; set; }
        public int kerkesaID { get; set; }
    }
}
