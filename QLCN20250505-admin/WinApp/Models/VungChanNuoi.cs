using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class VungChanNuoi
    {
        public string DonViHanhChinh
        {
            get
            {
                return Provider.GetTable<DonViHanhChinh>().Find<DonViHanhChinh>(DonViHanhChinhID).TenDonVi;
            }
        }
    }
}
