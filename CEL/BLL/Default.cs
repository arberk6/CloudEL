﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Default
    {
        public int CreatedBy { get; set; }
        public int ModifiedBy { get; set; }
        public String CreatedDate { get; set; }
        public String ModifiedDate { get; set; }

    }
}
