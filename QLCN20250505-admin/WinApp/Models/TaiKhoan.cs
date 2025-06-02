using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class TaiKhoan
    {
    public string Quyen 
        { 
        get
            {
                return Provider.GetTable<Quyen>().Find<Quyen>(Quyen).Ten;
            }
        }
    }
}