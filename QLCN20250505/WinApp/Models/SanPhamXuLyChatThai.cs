using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class SanPhamXuLyChatThai
    {
        public string SanPhamConHan;
        public string CoSo
        {
            get
            {
                return Provider.GetTable<CoSo>().Find<CoSo>(CoSoID).TenCoSo;
            }
        }
    }
}
