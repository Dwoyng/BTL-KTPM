using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class CoSo
    {
        public string MoHinh => (LoaiCoSoID == 1) ? "Mô hình chăn nuôi" : "Không phải mô hình chăn nuôi";
        public string CoSoGietMo;
        public string ChiCucThuY;
        public string DaiLyBanThuoc;
        public string KhuTamGiu;
        public string LoaiCoSo
        {
            get
            {
                return Provider.GetTable<LoaiCoSo>().Find<LoaiCoSo>(LoaiCoSoID).TenLoaiCoSo;
            }
        }
        public string DonViHanhChinh
        {
            get
            {
                return Provider.GetTable<DonViHanhChinh>().Find<DonViHanhChinh>(DonViHanhChinhID).TenDonVi;
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
