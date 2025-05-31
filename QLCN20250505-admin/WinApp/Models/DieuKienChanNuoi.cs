using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    partial class DieuKienChanNuoi
    {
        public string TenVungChanNuoi
        {
            get
            {
                var ho = Provider.GetTable<HoChanNuoi>().Find<HoChanNuoi>(HoChanNuoiID);
                if (ho == null) return null;
                var vung = Provider.GetTable<VungChanNuoi>().Find<VungChanNuoi>(ho.VungChanNuoiID);
                return vung?.TenVungChanNuoi;
            }
        }

    }
}