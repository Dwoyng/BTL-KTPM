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
            object data = Provider.Select<ThongKeHoChanNuoi>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
        
    }
}
