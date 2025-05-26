using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class GiayChungNhan
    {
        public string ToChucChungNhan
        {
            get
            {
                return Provider.GetTable<ToChucChungNhan>().Find<ToChucChungNhan>(ToChucChungNhanID).Ten;
            }
        }
        public string ToChuc_or_CaNhan
        {
            get
            {
                return Provider.GetTable<ToChuc_or_CaNhan>().Find<ToChuc_or_CaNhan>(ToChuc_or_CaNhanID).Ten;
            }
        }
    }
}
