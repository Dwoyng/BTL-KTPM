using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class CoSoController : DataController<CoSo>
    {
        public object MoHinhChanNuoi()
        {
            // Lấy tất cả cơ sở
            var allCoSo = Provider.GetTable<CoSo>().ToList<CoSo>(null, null);

            // Nhóm, đếm theo từng loại mô hình (dựa vào property MoHinh)
            var dsMoHinh = allCoSo
                .GroupBy(cs => cs.MoHinh)
                .Select(g => new
                {
                    MoHinh = g.Key,
                    SoLuong = g.Count()
                })
                .ToList();

            return View(dsMoHinh);
        }
        public object GietMo()
        {
            var data = Provider.GetTable<CoSo>().ToList<CoSo>(null, null)
        .Where(c => c.LoaiCoSoID == 2)
        .ToList();
            return View(data);
        }
        public object ChiCucThuY()
        {
            var data = Provider.GetTable<CoSo>().ToList<CoSo>(null, null)
         .Where(c => c.LoaiCoSoID == 5) // điều chỉnh số ID đúng với DB của bạn
         .ToList();
            return View(data);
        }
        public object DaiLyBanThuoc()
        {
            var data = Provider.GetTable<CoSo>().ToList<CoSo>(null, null)
        .Where(c => c.LoaiCoSoID == 6) // điều chỉnh số ID đúng với DB của bạn
        .ToList();
            return View(data);
        }
        public object KhuTamGiu()
        {
            var data = Provider.GetTable<CoSo>().ToList<CoSo>(null, null)
         .Where(c => c.LoaiCoSoID == 7) // điều chỉnh số ID đúng với DB của bạn
         .ToList();
            return View(data);
        }
    }
}
