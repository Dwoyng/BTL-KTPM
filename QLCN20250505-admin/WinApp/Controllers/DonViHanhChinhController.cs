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
            //Lấy các ID cấp Huyện, Thành phố(trực thuộc tỉnh)
            var capDoHuyenIds = Provider.GetTable<CapDoHanhChinh>()
                .ToList<CapDoHanhChinh>(null, "TenCapDo IN (N'Huyện', N'Thành phố')")
                .Select(x => x.ID)
                .ToList();

            if (capDoHuyenIds.Count == 0)
                return View(new List<DonViHanhChinh>());

            // Sinh chuỗi IDs cho SQL filter
            string ids = string.Join(",", capDoHuyenIds);

            var dsHuyen = Provider.GetTable<DonViHanhChinh>()
                .ToList<DonViHanhChinh>(null, $"CapDoHanhChinhID IN ({ids})");

            return View(dsHuyen);
        }
        public object ThongKePhuong()
        {
            var capDoPhuongIds = Provider.GetTable<CapDoHanhChinh>()
                .ToList<CapDoHanhChinh>(null, "TenCapDo IN (N'Phường', N'Thị trấn')")
                .Select(x => x.ID)
                .ToList();

            if (capDoPhuongIds.Count == 0)
                return View(new List<DonViHanhChinh>());

            string ids = string.Join(",", capDoPhuongIds);

            var dsPhuong = Provider.GetTable<DonViHanhChinh>()
                .ToList<DonViHanhChinh>(null, $"CapDoHanhChinhID IN ({ids})");

            return View(dsPhuong);
        }
        public object ThongKeXa()
        {
            var capDoXaIds = Provider.GetTable<CapDoHanhChinh>()
                .ToList<CapDoHanhChinh>(null, "TenCapDo = N'Xã'")
                .Select(x => x.ID)
                .ToList();

            if (capDoXaIds.Count == 0)
                return View(new List<DonViHanhChinh>());

            string ids = string.Join(",", capDoXaIds);

            var dsXa = Provider.GetTable<DonViHanhChinh>()
                .ToList<DonViHanhChinh>(null, $"CapDoHanhChinhID IN ({ids})");

            return View(dsXa);
        }
    }
}
