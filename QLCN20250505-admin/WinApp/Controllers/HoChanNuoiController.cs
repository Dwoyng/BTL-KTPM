using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class HoChanNuoiController : DataController<HoChanNuoi>
    {
        public object ThongKe()
        {
            // Lấy toàn bộ dữ liệu hộ chăn nuôi từ Provider
            var all = Provider.Select<HoChanNuoi>();

            // Thống kê số lượng từng loại kiểm định dựa trên property KiemDinh trong HoChanNuoi
            var thongKe = all
                .GroupBy(h => h.KiemDinh)
                .Select(g => new ThongKeHoChanNuoi
                {
                    KiemDinh = g.Key,
                    SL = g.Count()
                })
                .ToList();

            return View(thongKe);
        }
        
    }
}
