using System;
using System.Collections.Generic;
using System.Linq;
using BLL;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UseriMapper
    {
        public string[] Validate(string email,string password) {
            InternalUser user = new Useri().UseriSelectByEmail(email);
            
            if (user == null && !user.password.Equals(password))
                return null;
            string[] varg = { user.id.ToString(), user.email, user.password, user.role };
            return varg;
        }
    }
}
