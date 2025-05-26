using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class DonViHanhChinh
    {
        public string DonVi_Huyen;
        public string DonVi_Phuong;
        public string DonVi_Xa;
        public string CapDoHanhChinh
        {
            get
            {
                return Provider.GetTable<CapDoHanhChinh>().Find<CapDoHanhChinh>(CapDoHanhChinhID).TenCapDo;
            }
        }
        public string TrucThuoc
        {
            get
            {
                if (TrucThuocID == null)
                    return null;
                return Provider.GetTable<DonViHanhChinh>().Find<DonViHanhChinh>(TrucThuocID).TenDonVi;
            }
        }

    }
}
