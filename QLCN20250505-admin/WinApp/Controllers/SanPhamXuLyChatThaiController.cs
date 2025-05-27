using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class SanPhamXuLyChatThaiController : DataController<SanPhamXuLyChatThai>
    {
        public object SanPhamConHan()
        {
            object data = Provider.Select<SanPhamConHan>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
    }
}
