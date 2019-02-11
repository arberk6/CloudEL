using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;
using System.Data;

namespace DAL
{
    public class AdministratoriMapper
    {
        private Administratori a = null;

        public DataTable getRequests() {
            return new Request().readRequests();
        }

        public void aproveRequest(int kerkesaid) {
            new Administratori().Aprovo(kerkesaid);
        }

        public void denyRequest(int ProfesoriKursiid) {
            new Request().denyRequest(ProfesoriKursiid);
        }
        public DataTable getRequestsByProfesoriKursi(int profesoriKursi) {
            return new Request().getRequestsByProfesoriKursi(profesoriKursi);
        }
        public void aproveRequestForStudent(int studentID, int profesoriKursi) {
            new Request().aproveRequestForStudent(studentID, profesoriKursi);
        }
        public void denyRequestForStudent(int studentID, int profesoriKursi)
        {
            new Request().denyRequestForStudent(studentID, profesoriKursi);
        }
    }
}
