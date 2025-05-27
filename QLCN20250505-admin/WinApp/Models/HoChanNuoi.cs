using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class HoChanNuoi
    {
        public string KiemDinh => KQ ? "Đạt chuẩn" : "Chưa đạt chuẩn";
        public string VungChanNuoi
        {
            get
            {
                return Provider.GetTable<VungChanNuoi>().Find<VungChanNuoi>(VungChanNuoiID).TenVungChanNuoi;
            }
        }
    }
}
