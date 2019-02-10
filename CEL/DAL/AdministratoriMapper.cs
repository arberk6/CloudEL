using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;

namespace DAL
{
    public class AdministratoriMapper
    {
        private Administratori a = null;

        public List<Request> getAllRequest() {
            return new Request().readAllRequest();
        }

        public void aproveRequest(int kerkesaid) {
            new Administratori().Aprovo(kerkesaid);
        }
    }
}
