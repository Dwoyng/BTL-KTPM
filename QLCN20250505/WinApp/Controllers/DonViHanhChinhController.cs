using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WinApp.Controllers
{
    internal class DonViHanhChinhController : DataController<DonViHanhChinh>
    {
        public object ThongKeHuyen()
        {
            object data = Provider.Select<DonVi_Huyen>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
        public object ThongKePhuong()
        {
            object data = Provider.Select<DonVi_Phuong>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
        public object ThongKeXa()
        {
            object data = Provider.Select<DonVi_Xa>();
            // Xử lý dữ liệu thống kê

            return View(data);
        }
    }
}
