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
            object data = Provider.Select<MoHinhChanNuoi>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
        public object GietMo()
        {
            object data = Provider.Select<CoSoGietMo>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
        public object ChiCucThuY()
        {
            object data = Provider.Select<ChiCucThuY>();
            return View(data);
        }
        public object DaiLyBanThuoc()
        {
            object data = Provider.Select<DaiLyBanThuoc>();
            return View(data);
        }
        public object KhuTamGiu()
        {
            object data = Provider.Select<KhuTamGiu>();
            return View(data);
        }
    }
}
