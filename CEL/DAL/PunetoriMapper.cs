using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using BLL;

namespace DAL
{
    public class PunetoriMapper
    {
        
        private Punetori p=new Punetori();

        public PunetoriMapper()
        {
            
        }

        
        
        public void Insert()
        {
            p.Insert(p);
        }
       

        public void SelectByID(int ID)
        {
            p.SelectByID(p.IDPunetori);
        }

       
        public void update()
        {
            p.update(p);
        }

        public void delete()
        {
            p.delete(p.IDPunetori);
        }
       
    }
}